import os
from dotenv import load_dotenv
import spotipy
from spotipy.oauth2 import SpotifyOAuth

load_dotenv()

sp = spotipy.Spotify(
    auth_manager=SpotifyOAuth(
        client_id=os.getenv("SPOTIFY_CLIENT_ID"),
        client_secret=os.getenv("SPOTIFY_CLIENT_SECRET"),
        redirect_uri=os.getenv("SPOTIFY_REDIRECT_URI"),
        scope="playlist-read-private playlist-read-collaborative",
        open_browser=True
    )
)

playlist_id = "37i9dQZF1DXcBWIGoYBM5M"

try:
    resultado = sp.playlist_tracks(
        playlist_id,
        limit=10
    )

    itens = resultado.get("items", [])

    print(f"Total retornado: {len(itens)}")

    for item in itens:
        track = item.get("track")

        if not track:
            continue

        nome = track.get("name")
        artista = track.get("artists", [{}])[0].get("name")

        print(f"{nome} - {artista}")

except Exception as erro:
    print("ERRO:")
    print(erro)