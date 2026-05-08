import os
import json
import requests
from datetime import datetime
from dotenv import load_dotenv

load_dotenv()

YOUTUBE_API_KEY = os.getenv("YOUTUBE_API_KEY")

if not YOUTUBE_API_KEY:
    raise ValueError("YOUTUBE_API_KEY não encontrada no .env")


def buscar_categorias(region_code="BR"):
    url = "https://www.googleapis.com/youtube/v3/videoCategories"

    params = {
        "part": "snippet",
        "regionCode": region_code,
        "hl": "pt_BR",
        "key": YOUTUBE_API_KEY
    }

    resposta = requests.get(url, params=params)
    resposta.raise_for_status()

    return resposta.json()


def buscar_videos_populares(region_code="BR", limite=50):
    url = "https://www.googleapis.com/youtube/v3/videos"

    params = {
        "part": "snippet,statistics",
        "chart": "mostPopular",
        "regionCode": region_code,
        "maxResults": limite,
        "key": YOUTUBE_API_KEY
    }

    resposta = requests.get(url, params=params)
    resposta.raise_for_status()

    return resposta.json()


def extrair_youtube(regioes):
    dados = {
        "data_coleta": datetime.now().isoformat(),
        "regioes": regioes,
        "categorias": {},
        "canais": {},
        "videos": {},
        "estatisticas": []
    }

    for regiao in regioes:
        print(f"Extraindo YouTube para região: {regiao}")

        categorias_raw = buscar_categorias(region_code=regiao)

        for categoria in categorias_raw.get("items", []):
            categoria_id = categoria.get("id")
            snippet = categoria.get("snippet", {})

            dados["categorias"][categoria_id] = {
                "id": categoria_id,
                "nome": snippet.get("title")
            }

        videos_raw = buscar_videos_populares(region_code=regiao, limite=50)

        for video in videos_raw.get("items", []):
            video_id = video.get("id")
            snippet = video.get("snippet", {})
            statistics = video.get("statistics", {})

            canal_id = snippet.get("channelId")
            categoria_id = snippet.get("categoryId")

            dados["canais"][canal_id] = {
                "id": canal_id,
                "nome": snippet.get("channelTitle")
            }

            dados["videos"][video_id] = {
                "id": video_id,
                "titulo": snippet.get("title"),
                "data_publicacao": snippet.get("publishedAt"),
                "canal_id": canal_id,
                "categoria_id": categoria_id,
                "regiao": regiao
            }

            dados["estatisticas"].append({
                "video_id": video_id,
                "views": int(statistics.get("viewCount", 0)),
                "likes": int(statistics.get("likeCount", 0)),
                "comentarios": int(statistics.get("commentCount", 0)),
                "data_coleta": dados["data_coleta"],
                "regiao": regiao
            })

    dados["categorias"] = list(dados["categorias"].values())
    dados["canais"] = list(dados["canais"].values())
    dados["videos"] = list(dados["videos"].values())

    return dados


if __name__ == "__main__":
    regioes = ["BR"]

    dados = extrair_youtube(regioes)

    with open("data/raw/youtube_raw.json", "w", encoding="utf-8") as arquivo:
        json.dump(dados, arquivo, indent=4, ensure_ascii=False)

    print("Dados brutos do YouTube salvos em data/raw/youtube_raw.json")
    print(f"Total de canais: {len(dados['canais'])}")
    print(f"Total de categorias: {len(dados['categorias'])}")
    print(f"Total de vídeos: {len(dados['videos'])}")
    print(f"Total de estatísticas: {len(dados['estatisticas'])}")