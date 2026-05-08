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

DATABASE_URL = (
    f"postgresql+psycopg2://{DB_USER}:{DB_PASSWORD}"
    f"@{DB_HOST}:{DB_PORT}/{DB_NAME}"
    f"?sslmode={DB_SSLMODE}"
)

engine = create_engine(DATABASE_URL)

PROCESSED_DIR = "data/processed"


def carregar_csv(nome_arquivo):
    caminho = os.path.join(PROCESSED_DIR, nome_arquivo)
    return pd.read_csv(caminho)


def load_youtube():
    df_canais = carregar_csv("youtube_canais.csv")
    df_categorias = carregar_csv("youtube_categorias.csv")
    df_videos = carregar_csv("youtube_videos.csv")
    df_estatisticas = carregar_csv("youtube_video_estatisticas.csv")

    print("Inserindo canais...")
    df_canais.to_sql("youtube_canais", engine, if_exists="append", index=False)

    print("Inserindo categorias...")
    df_categorias.to_sql("youtube_categorias", engine, if_exists="append", index=False)

    print("Inserindo vídeos...")
    df_videos.to_sql("youtube_videos", engine, if_exists="append", index=False)

    print("Inserindo estatísticas...")
    df_estatisticas.to_sql("youtube_video_estatisticas", engine, if_exists="append", index=False)

    print("LOAD YouTube finalizado com sucesso!")


if __name__ == "__main__":
    load_youtube()