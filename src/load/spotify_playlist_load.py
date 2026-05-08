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


def load_playlists():
    df_playlists = carregar_csv("spotify_playlists.csv")
    df_playlist_musicas = carregar_csv("spotify_playlist_musicas.csv")

    print("Inserindo playlists...")
    df_playlists.to_sql(
        "spotify_playlists",
        engine,
        if_exists="append",
        index=False
    )

    print("Inserindo relações playlist-música...")
    df_playlist_musicas.to_sql(
        "spotify_playlist_musicas",
        engine,
        if_exists="append",
        index=False
    )

    print("LOAD de playlists finalizado com sucesso!")


if __name__ == "__main__":
    load_playlists()