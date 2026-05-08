import json
import os
import pandas as pd

RAW_PATH = "data/raw/youtube_music_raw.json"
OUTPUT_PATH = "data/processed/engajamento_regional.csv"

MAPA_REGIOES = {
    "BR": 1,
    "US": 2,
    "MX": 3,
    "AR": 4,
    "PT": 5
}

os.makedirs("data/processed", exist_ok=True)

with open(RAW_PATH, "r", encoding="utf-8") as arquivo:
    dados = json.load(arquivo)

estatisticas = dados["estatisticas"]

linhas = []

for item in estatisticas:
    video_id = item.get("video_id")
    regiao = item.get("regiao")
    views = int(item.get("views", 0))
    likes = int(item.get("likes", 0))
    comentarios = int(item.get("comentarios", 0))
    data_coleta = item.get("data_coleta")

    regiao_id = MAPA_REGIOES.get(regiao)

    if not video_id or not regiao_id:
        continue

    if views > 0:
        taxa_engajamento = ((likes + comentarios) / views) * 100
    else:
        taxa_engajamento = 0

    linhas.append({
        "video_id": video_id,
        "regiao_id": regiao_id,
        "views": views,
        "likes": likes,
        "comentarios": comentarios,
        "taxa_engajamento": round(taxa_engajamento, 4),
        "data_coleta": data_coleta
    })

df = pd.DataFrame(linhas)

df = df.drop_duplicates(subset=["video_id", "regiao_id", "data_coleta"])

df.to_csv(OUTPUT_PATH, index=False)

print("Transformação de engajamento regional concluída.")
print(f"Registros gerados: {len(df)}")
print(f"Arquivo gerado: {OUTPUT_PATH}")