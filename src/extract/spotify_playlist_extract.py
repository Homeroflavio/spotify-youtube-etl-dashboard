import os
import json
from dotenv import load_dotenv
import spotipy
from spotipy.oauth2 import SpotifyOAuth

load_dotenv()

SPOTIFY_CLIENT_ID = os.getenv("SPOTIFY_CLIENT_ID")
SPOTIFY_CLIENT_SECRET = os.getenv("SPOTIFY_CLIENT_SECRET")
SPOTIFY_REDIRECT_URI = os.getenv("SPOTIFY_REDIRECT_URI")

auth_manager = SpotifyOAuth(
    client_id=SPOTIFY_CLIENT_ID,
    client_secret=SPOTIFY_CLIENT_SECRET,
    redirect_uri=SPOTIFY_REDIRECT_URI,
    scope="playlist-read-private playlist-read-collaborative",
    open_browser=True
)

sp = spotipy.Spotify(auth_manager=auth_manager)


def buscar_playlists_por_termo(termo, limite=5):
    resultado = sp.search(
        q=termo,
        type="playlist",
        limit=limite,
        market="BR"
    )

    playlists = []

    for playlist in resultado.get("playlists", {}).get("items", []):
        if playlist is None:
            continue

        playlists.append({
            "id": playlist.get("id"),
            "nome": playlist.get("name"),
            "url": playlist.get("external_urls", {}).get("spotify"),
            "termo_busca": termo
        })

    return playlists


def extrair_playlist(playlist_id, nome_playlist=None, url_playlist=None, termo_busca=None):
    try:
        playlist = sp.playlist(playlist_id)
    except Exception as erro:
        print(f"Erro ao acessar playlist {playlist_id}: {erro}")
        return None

    dados_playlist = {
        "id": playlist.get("id"),
        "nome": playlist.get("name") or nome_playlist,
        "total_musicas": playlist.get("items", {}).get("total"),
        "url": playlist.get("external_urls", {}).get("spotify") or url_playlist,
        "termo_busca": termo_busca
    }

    relacoes_playlist_musica = []

    itens = playlist.get("items", {}).get("items", [])

    for item in itens:
        if item is None:
            continue

        track = item.get("item")

        if track is None:
            continue

        if track.get("type") != "track":
            continue

        relacoes_playlist_musica.append({
            "playlist_id": playlist.get("id"),
            "musica_id": track.get("id"),
            "added_at": item.get("added_at")
        })

    return {
        "playlist": dados_playlist,
        "playlist_musicas": relacoes_playlist_musica
    }


def extrair_playlists_spotify(termos_busca, limite_playlists_por_termo=3):
    playlists_dict = {}
    playlist_musicas = []

    for termo in termos_busca:
        print(f"Buscando playlists para: {termo}")

        playlists_encontradas = buscar_playlists_por_termo(
            termo,
            limite=limite_playlists_por_termo
        )

        for playlist_info in playlists_encontradas:
            playlist_id = playlist_info["id"]

            if playlist_id in playlists_dict:
                continue

            dados = extrair_playlist(
                playlist_id=playlist_id,
                nome_playlist=playlist_info["nome"],
                url_playlist=playlist_info["url"],
                termo_busca=termo
            )

            if dados is None:
                continue

            playlists_dict[playlist_id] = dados["playlist"]
            playlist_musicas.extend(dados["playlist_musicas"])

    return {
        "playlists": list(playlists_dict.values()),
        "playlist_musicas": playlist_musicas
    }


if __name__ == "__main__":
    termos = [
        "funk",
        "trap",
        "rap",
        "sertanejo",
        "forro",
        "pagode",
        "pop",
        "rock",
        "indie",
        "hip hop",
        "samba",
        "kpop",
        "latin",
        "electronic"
    ]

    dados = extrair_playlists_spotify(
        termos_busca=termos,
        limite_playlists_por_termo=3
    )

    with open("data/raw/spotify_playlists_raw.json", "w", encoding="utf-8") as arquivo:
        json.dump(dados, arquivo, indent=4, ensure_ascii=False)

    print("Dados brutos de playlists salvos em data/raw/spotify_playlists_raw.json")
    print(f"Total de playlists: {len(dados['playlists'])}")
    print(f"Total de relações playlist-música: {len(dados['playlist_musicas'])}")