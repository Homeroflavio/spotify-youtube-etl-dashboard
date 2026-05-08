import json
import os
import pandas as pd


RAW_PATH = "data/raw/spotify_raw.json"
PROCESSED_DIR = "data/processed"


def carregar_raw():
    with open(RAW_PATH, "r", encoding="utf-8") as arquivo:
        return json.load(arquivo)


def salvar_csv(df, nome_arquivo):
    os.makedirs(PROCESSED_DIR, exist_ok=True)

    caminho = os.path.join(PROCESSED_DIR, nome_arquivo)
    df.to_csv(caminho, index=False, encoding="utf-8")

    print(f"Arquivo salvo: {caminho}")


def transformar_artistas(dados):
    artistas = dados.get("artistas", [])

    df = pd.DataFrame(artistas)

    if df.empty:
        return df

    df["popularidade"] = df["popularidade"].fillna(0).astype(int)
    df["generos"] = df["generos"].apply(lambda x: ", ".join(x) if isinstance(x, list) else "")

    df = df.drop_duplicates(subset=["id"])

    return df


def transformar_albuns(dados):
    albuns = dados.get("albuns", [])

    df = pd.DataFrame(albuns)

    if df.empty:
        return df

    df["data_lancamento"] = df["data_lancamento"].fillna("desconhecido")
    df = df.drop_duplicates(subset=["id"])

    return df


def transformar_generos(dados):
    generos = dados.get("generos", [])

    df = pd.DataFrame(generos)

    if df.empty:
        return df

    df["nome"] = df["nome"].str.lower().str.strip()
    df = df.drop_duplicates(subset=["nome"])

    return df


def transformar_musicas(dados):
    musicas = dados.get("musicas", [])

    df = pd.DataFrame(musicas)

    if df.empty:
        return df

    df["duracao_ms"] = df["duracao_ms"].fillna(0).astype(int)
    df["duracao_min"] = (df["duracao_ms"] / 60000).round(2)
    df["explicit"] = df["explicit"].fillna(False).astype(bool)
    df["termo_busca"] = df["termo_busca"].str.lower().str.strip()

    df = df.drop_duplicates(subset=["id"])

    return df


def transformar_spotify():
    dados = carregar_raw()

    df_artistas = transformar_artistas(dados)
    df_albuns = transformar_albuns(dados)
    df_generos = transformar_generos(dados)
    df_musicas = transformar_musicas(dados)

    salvar_csv(df_artistas, "spotify_artistas.csv")
    salvar_csv(df_albuns, "spotify_albuns.csv")
    salvar_csv(df_generos, "spotify_generos.csv")
    salvar_csv(df_musicas, "spotify_musicas.csv")

    print("Transformação do Spotify finalizada com sucesso!")


if __name__ == "__main__":
    transformar_spotify()