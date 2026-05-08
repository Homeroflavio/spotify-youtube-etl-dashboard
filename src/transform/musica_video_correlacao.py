import os
import re
import unicodedata
import pandas as pd
from difflib import SequenceMatcher

SPOTIFY_PATH = "data/processed/spotify_musicas.csv"
YOUTUBE_PATH = "data/processed/youtube_music_videos.csv"

OUTPUT_PATH = "data/processed/musica_video_correlacao.csv"
DEBUG_PATH = "data/processed/debug_correlacao_candidatos.csv"


def remover_acentos(texto):
    texto = str(texto)
    texto = unicodedata.normalize("NFKD", texto)
    texto = texto.encode("ASCII", "ignore").decode("utf-8")
    return texto


def limpar_texto(texto):
    texto = remover_acentos(str(texto).lower())

    texto = re.sub(r"\(.*?\)", " ", texto)
    texto = re.sub(r"\[.*?\]", " ", texto)

    palavras_remover = [
        "official music video", "official video", "official audio",
        "video oficial", "clipe oficial", "audio oficial",
        "lyrics", "lyric video", "letra", "legendado",
        "prod", "producer", "ft", "feat", "featuring",
        "ao vivo", "live", "visualizer", "performance",
        "remix", "speed up", "sped up", "slowed", "reverb",
        "tik tok", "tiktok", "shorts",
        "hd", "4k", "dvd", "show", "session", "explicit"
    ]

    for palavra in palavras_remover:
        texto = texto.replace(palavra, " ")

    texto = re.sub(r"[^a-z0-9 ]", " ", texto)
    texto = re.sub(r"\s+", " ", texto).strip()

    return texto


def similaridade(texto1, texto2):
    return SequenceMatcher(None, texto1, texto2).ratio()


def proporcao_palavras(nome_musica, titulo_video):
    palavras_musica = set(nome_musica.split())
    palavras_video = set(titulo_video.split())

    palavras_ignoradas = {
        "a", "o", "e", "de", "da", "do", "das", "dos",
        "the", "is", "you", "me", "my", "i", "to", "in",
        "um", "uma", "pra", "para"
    }

    palavras_musica = palavras_musica - palavras_ignoradas

    if not palavras_musica:
        return 0

    intersecao = palavras_musica.intersection(palavras_video)
    return len(intersecao) / len(palavras_musica)


df_spotify = pd.read_csv(SPOTIFY_PATH)
df_youtube = pd.read_csv(YOUTUBE_PATH)

correlacoes = []
debug_candidatos = []

for _, musica in df_spotify.iterrows():
    musica_id = musica["id"]
    nome_musica_original = str(musica["nome"])
    nome_musica_limpo = limpar_texto(nome_musica_original)

    if len(nome_musica_limpo) < 3:
        continue

    melhores = []

    for _, video in df_youtube.iterrows():
        video_id = video["id"]
        titulo_video_original = str(video["titulo"])
        titulo_video_limpo = limpar_texto(titulo_video_original)

        if len(titulo_video_limpo) < 3:
            continue

        score_similaridade = similaridade(nome_musica_limpo, titulo_video_limpo)
        proporcao = proporcao_palavras(nome_musica_limpo, titulo_video_limpo)

        score = score_similaridade
        criterio = "similaridade_titulo_limpo"

        if nome_musica_limpo in titulo_video_limpo:
            score = max(score, 0.95)
            criterio = "nome_musica_contido_no_titulo"

        elif proporcao >= 0.60:
            score = max(score, 0.80)
            criterio = "palavras_musica_no_titulo"

        elif score_similaridade >= 0.55:
            score = score_similaridade
            criterio = "similaridade_forte"

        melhores.append({
            "musica_id": musica_id,
            "nome_musica": nome_musica_original,
            "video_id": video_id,
            "titulo_video": titulo_video_original,
            "score": round(score, 2),
            "criterio": criterio
        })

    melhores = sorted(melhores, key=lambda x: x["score"], reverse=True)

    if melhores:
        melhor = melhores[0]
        debug_candidatos.append(melhor)

        if (
            melhor["criterio"] in [
                "nome_musica_contido_no_titulo",
                "palavras_musica_no_titulo",
                "similaridade_forte"
            ]
            and melhor["score"] >= 0.55
        ):
            correlacoes.append({
                "musica_id": melhor["musica_id"],
                "video_id": melhor["video_id"],
                "score_correlacao": melhor["score"],
                "criterio_match": melhor["criterio"]
            })

df_correlacao = pd.DataFrame(correlacoes)
df_debug = pd.DataFrame(debug_candidatos)

os.makedirs("data/processed", exist_ok=True)

df_correlacao.to_csv(OUTPUT_PATH, index=False)

if not df_debug.empty:
    df_debug = df_debug.sort_values(by="score", ascending=False)
    df_debug.to_csv(DEBUG_PATH, index=False)

print("Correlação música-vídeo gerada.")
print(f"Total de correlações confiáveis: {len(df_correlacao)}")
print(f"Arquivo principal: {OUTPUT_PATH}")
print(f"Arquivo de diagnóstico: {DEBUG_PATH}")