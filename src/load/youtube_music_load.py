import os
import pandas as pd
from dotenv import load_dotenv
from sqlalchemy import create_engine, text

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


def executar_sql(sql):
    with engine.begin() as conn:
        conn.execute(text(sql))


def load_youtube_music():
    df_canais = carregar_csv("youtube_music_canais.csv")
    df_categorias = carregar_csv("youtube_music_categorias.csv")
    df_videos = carregar_csv("youtube_music_videos.csv")
    df_estatisticas = carregar_csv("youtube_music_video_estatisticas.csv")

    df_canais["id"] = df_canais["id"].astype(str)
    df_categorias["id"] = df_categorias["id"].astype(str)
    df_videos["id"] = df_videos["id"].astype(str)
    df_videos["canal_id"] = df_videos["canal_id"].astype(str)
    df_videos["categoria_id"] = df_videos["categoria_id"].astype(str)
    df_estatisticas["video_id"] = df_estatisticas["video_id"].astype(str)

    df_canais = df_canais.drop_duplicates(subset=["id"])
    df_categorias = df_categorias.drop_duplicates(subset=["id"])
    df_videos = df_videos.drop_duplicates(subset=["id"])
    df_estatisticas = df_estatisticas.drop_duplicates(
        subset=["video_id", "data_coleta"]
    )

    print("Criando tabelas temporárias...")

    df_canais.to_sql(
        "temp_youtube_canais",
        engine,
        if_exists="replace",
        index=False
    )

    df_categorias.to_sql(
        "temp_youtube_categorias",
        engine,
        if_exists="replace",
        index=False
    )

    df_videos.to_sql(
        "temp_youtube_videos",
        engine,
        if_exists="replace",
        index=False
    )

    df_estatisticas.to_sql(
        "temp_youtube_video_estatisticas",
        engine,
        if_exists="replace",
        index=False
    )

    print("Inserindo canais sem duplicar...")
    executar_sql("""
        INSERT INTO youtube_canais (id, nome)
        SELECT id, nome
        FROM temp_youtube_canais
        ON CONFLICT (id) DO NOTHING;
    """)

    print("Inserindo categorias sem duplicar...")
    executar_sql("""
        INSERT INTO youtube_categorias (id, nome)
        SELECT id, nome
        FROM temp_youtube_categorias
        ON CONFLICT (id) DO NOTHING;
    """)

    print("Inserindo vídeos sem duplicar...")
    executar_sql("""
        INSERT INTO youtube_videos (
            id,
            titulo,
            data_publicacao,
            canal_id,
            categoria_id
        )
        SELECT
            id,
            titulo,
            data_publicacao::timestamp,
            canal_id,
            categoria_id
        FROM temp_youtube_videos
        ON CONFLICT (id) DO NOTHING;
    """)

    print("Inserindo estatísticas...")
    executar_sql("""
        INSERT INTO youtube_video_estatisticas (
            video_id,
            views,
            likes,
            comentarios,
            data_coleta
        )
        SELECT
            video_id,
            views::bigint,
            likes::bigint,
            comentarios::bigint,
            data_coleta::timestamp
        FROM temp_youtube_video_estatisticas;
    """)

    print("Removendo tabelas temporárias...")
    executar_sql("""
        DROP TABLE IF EXISTS temp_youtube_canais;
        DROP TABLE IF EXISTS temp_youtube_categorias;
        DROP TABLE IF EXISTS temp_youtube_videos;
        DROP TABLE IF EXISTS temp_youtube_video_estatisticas;
    """)

    print("LOAD YouTube Musical finalizado com sucesso!")


if __name__ == "__main__":
    load_youtube_music()