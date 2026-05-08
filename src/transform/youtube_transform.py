import json
import os
import pandas as pd

RAW_PATH = "data/raw/youtube_raw.json"
PROCESSED_PATH = "data/processed"

os.makedirs(PROCESSED_PATH, exist_ok=True)

with open(RAW_PATH, "r", encoding="utf-8") as arquivo:
    dados = json.load(arquivo)

# =========================
# CANAIS
# =========================

df_canais = pd.DataFrame(dados["canais"])

df_canais = df_canais.rename(columns={
    "id": "id",
    "nome": "nome"
})

# =========================
# CATEGORIAS
# =========================

df_categorias = pd.DataFrame(dados["categorias"])

df_categorias = df_categorias.rename(columns={
    "id": "id",
    "nome": "nome"
})

# =========================
# VIDEOS
# =========================

df_videos = pd.DataFrame(dados["videos"])

df_videos = df_videos.rename(columns={
    "id": "id",
    "titulo": "titulo",
    "data_publicacao": "data_publicacao",
    "canal_id": "canal_id",
    "categoria_id": "categoria_id"
})

df_videos = df_videos[
    [
        "id",
        "titulo",
        "data_publicacao",
        "canal_id",
        "categoria_id"
    ]
]

# =========================
# ESTATISTICAS
# =========================

df_estatisticas = pd.DataFrame(dados["estatisticas"])

df_estatisticas = df_estatisticas.rename(columns={
    "video_id": "video_id",
    "views": "views",
    "likes": "likes",
    "comentarios": "comentarios",
    "data_coleta": "data_coleta"
})

df_estatisticas = df_estatisticas[
    [
        "video_id",
        "views",
        "likes",
        "comentarios",
        "data_coleta"
    ]
]

# =========================
# EXPORTAR CSV
# =========================

df_canais.to_csv(
    f"{PROCESSED_PATH}/youtube_canais.csv",
    index=False
)

df_categorias.to_csv(
    f"{PROCESSED_PATH}/youtube_categorias.csv",
    index=False
)

df_videos.to_csv(
    f"{PROCESSED_PATH}/youtube_videos.csv",
    index=False
)

df_estatisticas.to_csv(
    f"{PROCESSED_PATH}/youtube_video_estatisticas.csv",
    index=False
)

print("Transformação YouTube concluída.")
print(f"Canais: {len(df_canais)}")
print(f"Categorias: {len(df_categorias)}")
print(f"Vídeos: {len(df_videos)}")
print(f"Estatísticas: {len(df_estatisticas)}")