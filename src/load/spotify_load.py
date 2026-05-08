import pandas as pd
from sqlalchemy import create_engine
import os
from dotenv import load_dotenv

load_dotenv()

# Conexão com o banco
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


def load_spotify():
    df_artistas = carregar_csv("spotify_artistas.csv")
    df_albuns = carregar_csv("spotify_albuns.csv")
    df_generos = carregar_csv("spotify_generos.csv")
    df_musicas = carregar_csv("spotify_musicas.csv")

    # remove coluna que não existe no banco
    if "generos" in df_artistas.columns:
        df_artistas = df_artistas.drop(columns=["generos"])

    print("Inserindo artistas...")
    df_artistas.to_sql(
        "spotify_artistas",
        engine,
        if_exists="append",
        index=False
    )

    print("Inserindo albuns...")
    df_albuns.to_sql(
        "spotify_albuns",
        engine,
        if_exists="append",
        index=False
    )

    print("Inserindo generos...")

    df_generos["id"] = range(1, len(df_generos) + 1)
    df_generos = df_generos[["id", "nome"]]

    df_generos.to_sql(
            "spotify_generos",
            engine,
            if_exists="append",
            index=False
) 

    print("Inserindo musicas...")
    df_musicas.to_sql(
        "spotify_musicas",
        engine,
        if_exists="append",
        index=False
    )

    print("LOAD finalizado com sucesso!")


if __name__ == "__main__":
    load_spotify()