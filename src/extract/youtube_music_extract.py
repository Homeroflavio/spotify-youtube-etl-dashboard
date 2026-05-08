import os
import json
import requests
from datetime import datetime
from dotenv import load_dotenv

load_dotenv()

YOUTUBE_API_KEY = os.getenv("YOUTUBE_API_KEY")

if not YOUTUBE_API_KEY:
    raise ValueError("YOUTUBE_API_KEY não encontrada no .env")


def buscar_videos_musicais(
    termo_busca,
    regiao="BR",
    max_results=25
):
    url = "https://www.googleapis.com/youtube/v3/search"

    params = {
        "part": "snippet",
        "q": termo_busca,
        "type": "video",
        "videoCategoryId": "10",  # Música
        "regionCode": regiao,
        "maxResults": max_results,
        "key": YOUTUBE_API_KEY
    }

    resposta = requests.get(url, params=params)
    resposta.raise_for_status()

    return resposta.json()


def buscar_detalhes_videos(video_ids):
    url = "https://www.googleapis.com/youtube/v3/videos"

    params = {
        "part": "snippet,statistics",
        "id": ",".join(video_ids),
        "key": YOUTUBE_API_KEY
    }

    resposta = requests.get(url, params=params)
    resposta.raise_for_status()

    return resposta.json()


def extrair_youtube_musical(regioes, termos_busca):
    dados = {
        "data_coleta": datetime.now().isoformat(),
        "regioes": regioes,
        "canais": {},
        "videos": {},
        "estatisticas": []
    }

    for regiao in regioes:
        print(f"\n========== REGIÃO: {regiao} ==========")

        for termo in termos_busca:
            print(f"Buscando: {termo}")

            try:
                busca_raw = buscar_videos_musicais(
                    termo_busca=termo,
                    regiao=regiao,
                    max_results=25
                )

                video_ids = []

                for item in busca_raw.get("items", []):
                    video_id = item.get("id", {}).get("videoId")

                    if video_id:
                        video_ids.append(video_id)

                if not video_ids:
                    continue

                detalhes_raw = buscar_detalhes_videos(video_ids)

                for video in detalhes_raw.get("items", []):
                    video_id = video.get("id")

                    snippet = video.get("snippet", {})
                    statistics = video.get("statistics", {})

                    canal_id = snippet.get("channelId")

                    dados["canais"][canal_id] = {
                        "id": canal_id,
                        "nome": snippet.get("channelTitle")
                    }

                    dados["videos"][video_id] = {
                        "id": video_id,
                        "titulo": snippet.get("title"),
                        "data_publicacao": snippet.get("publishedAt"),
                        "canal_id": canal_id,
                        "categoria_id": "10",
                        "regiao": regiao,
                        "termo_busca": termo
                    }

                    dados["estatisticas"].append({
                        "video_id": video_id,
                        "views": int(statistics.get("viewCount", 0)),
                        "likes": int(statistics.get("likeCount", 0)),
                        "comentarios": int(statistics.get("commentCount", 0)),
                        "data_coleta": dados["data_coleta"],
                        "regiao": regiao
                    })

            except Exception as erro:
                print(f"Erro em '{termo}' ({regiao}): {erro}")

    dados["canais"] = list(dados["canais"].values())
    dados["videos"] = list(dados["videos"].values())

    return dados


if __name__ == "__main__":

    regioes = [
        "BR",
        "US",
        "MX",
        "AR",
        "PT"
    ]

    termos = [
        "official music video",
        "official audio",
        "clipe oficial",
        "funk brasil",
        "trap brasil",
        "rap brasil",
        "sertanejo",
        "pagode",
        "forro",
        "kpop",
        "latin music",
        "viral songs",
        "pop music",
        "electronic music",
        "tiktok songs"
    ]

    dados = extrair_youtube_musical(
        regioes=regioes,
        termos_busca=termos
    )

    os.makedirs("data/raw", exist_ok=True)

    with open(
        "data/raw/youtube_music_raw.json",
        "w",
        encoding="utf-8"
    ) as arquivo:
        json.dump(dados, arquivo, indent=4, ensure_ascii=False)

    print("\n========== EXTRAÇÃO FINALIZADA ==========")
    print(f"Canais: {len(dados['canais'])}")
    print(f"Vídeos: {len(dados['videos'])}")
    print(f"Estatísticas: {len(dados['estatisticas'])}")