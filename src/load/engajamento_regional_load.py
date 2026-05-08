import os
import pandas as pd
from dotenv import load_dotenv
from sqlalchemy import create_engine

load_dotenv()

DB_USER = os.getenv("DB_USER")
DB_PASSWORD = os.getenv("DB_PASSWORD")
DB_HOST = os.getenv("DB_HOST")
DB_PORT = os.getenv("DB_PORT")
DB_NAME = os.getenv("DB_NAME")

DB_SSLMODE = os.getenv("DB_SSLMODE")

DB_SSLMODE = os.getenv("DB_SSLMODE")

DATABASE_URL = (
    f"postgresql+psycopg2://{DB_USER}:{DB_PASSWORD}"
    f"@{DB_HOST}:{DB_PORT}/{DB_NAME}"
    f"?sslmode={DB_SSLMODE}"
)

engine = create_engine(DATABASE_URL)

CSV_PATH = "data/processed/musica_video_correlacao.csv"

df = pd.read_csv(CSV_PATH)

df["musica_id"] = df["musica_id"].astype(str)
df["video_id"] = df["video_id"].astype(str)
df["score_correlacao"] = df["score_correlacao"].astype(float)

df.to_sql(
    "musica_video_correlacao",
    engine,
    if_exists="append",
    index=False
)

print("LOAD música-vídeo concluído.")
print(f"Registros inseridos: {len(df)}")