import os
import pandas as pd



MUSICAS_PATH = "data/processed/spotify_musicas.csv"
PROCESSED_DIR = "data/processed"


def carregar_musicas():
    return pd.read_csv(MUSICAS_PATH)


def gerar_playlists_logicas(df_musicas):
    termos = df_musicas["termo_busca"].dropna().unique()

    playlists = []

    for termo in termos:
        playlists.append({
            "id": termo,
            "nome": termo,
            "total_musicas": len(df_musicas[df_musicas["termo_busca"] == termo]),
            "url": None
        })

    return pd.DataFrame(playlists)


def gerar_relacao_playlist_musicas(df_musicas):
    relacoes = []

    for _, musica in df_musicas.iterrows():
        relacoes.append({
            "playlist_id": musica["termo_busca"],
            "musica_id": musica["id"],
            "added_at": None
        })

    return pd.DataFrame(relacoes)


def salvar_csv(df, nome_arquivo):
    os.makedirs(PROCESSED_DIR, exist_ok=True)

    caminho = os.path.join(PROCESSED_DIR, nome_arquivo)
    df.to_csv(caminho, index=False, encoding="utf-8")

    print(f"Arquivo salvo: {caminho}")


def transformar_playlists_logicas():
    df_musicas = carregar_musicas()

    df_playlists = gerar_playlists_logicas(df_musicas)
    df_playlist_musicas = gerar_relacao_playlist_musicas(df_musicas)

    salvar_csv(df_playlists, "spotify_playlists.csv")
    salvar_csv(df_playlist_musicas, "spotify_playlist_musicas.csv")

    print("Playlists lógicas geradas com sucesso!")


if __name__ == "__main__":
    transformar_playlists_logicas()