import json
import os
import pandas as pd

RAW_PATH = "data/raw/youtube_music_raw.json"
PROCESSED_PATH = "data/processed"

os.makedirs(PROCESSED_PATH, exist_ok=True)

with open(RAW_PATH, "r", encoding="utf-8") as arquivo:
    dados = json.load(arquivo)

df_canais = pd.DataFrame(dados["canais"])

df_categorias = pd.DataFrame([
    {
        "id": "10",
        "nome": "Music"
    }
])

df_videos = pd.DataFrame(dados["videos"])

df_videos = df_videos[
    [
        "id",
        "titulo",
        "data_publicacao",
        "canal_id",
        "categoria_id"
    ]
]

df_estatisticas = pd.DataFrame(dados["estatisticas"])

df_estatisticas = df_estatisticas[
    [
        "video_id",
        "views",
        "likes",
        "comentarios",
        "data_coleta"
    ]
]

df_canais = df_canais.drop_duplicates(subset=["id"])
df_categorias = df_categorias.drop_duplicates(subset=["id"])
df_videos = df_videos.drop_duplicates(subset=["id"])
df_estatisticas = df_estatisticas.drop_duplicates(subset=["video_id", "data_coleta"])

df_canais.to_csv(f"{PROCESSED_PATH}/youtube_music_canais.csv", index=False)
df_categorias.to_csv(f"{PROCESSED_PATH}/youtube_music_categorias.csv", index=False)
df_videos.to_csv(f"{PROCESSED_PATH}/youtube_music_videos.csv", index=False)
df_estatisticas.to_csv(f"{PROCESSED_PATH}/youtube_music_video_estatisticas.csv", index=False)

print("Transformação YouTube Musical concluída.")
print(f"Canais: {len(df_canais)}")
print(f"Categorias: {len(df_categorias)}")
print(f"Vídeos: {len(df_videos)}")
print(f"Estatísticas: {len(df_estatisticas)}")