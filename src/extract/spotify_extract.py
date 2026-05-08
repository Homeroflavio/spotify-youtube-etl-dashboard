import os
import json
from dotenv import load_dotenv
import spotipy
from spotipy.oauth2 import SpotifyClientCredentials

load_dotenv()

# Carregar credenciais do Spotify a partir do .env
SPOTIFY_CLIENT_ID = os.getenv("SPOTIFY_CLIENT_ID")
SPOTIFY_CLIENT_SECRET = os.getenv("SPOTIFY_CLIENT_SECRET")

# Verificar se as credenciais foram carregadas corretamente,para    evitar erros de autenticação
if not all([SPOTIFY_CLIENT_ID, SPOTIFY_CLIENT_SECRET]):
    raise ValueError("Credenciais do Spotify não encontradas no .env")

# Cria um gerenciador de autenticação usando as credenciais do Spotify
auth_manager = SpotifyClientCredentials(
    client_id=SPOTIFY_CLIENT_ID,
    client_secret=SPOTIFY_CLIENT_SECRET
)

# cria o cliente da API do Spotify usando o gerenciador de autenticação
sp = spotipy.Spotify(auth_manager=auth_manager)


def extrair_dados_spotify(termos_busca, limite_por_termo=10):
    artistas = {}
    albuns = {}
    generos = {}
    musicas = {}

    for termo in termos_busca:
        resultado = sp.search(
            q=termo,
            type="track",
            limit=limite_por_termo,
            market="BR"
        )

        for item in resultado.get("tracks", {}).get("items", []):
            if item is None:
                continue

            musica_id = item.get("id")
            nome_musica = item.get("name")
            duracao_ms = item.get("duration_ms")
            url_musica = item.get("external_urls", {}).get("spotify")
            explicito = item.get("explicit")
            isrc = item.get("external_ids", {}).get("isrc")

            album = item.get("album", {})
            album_id = album.get("id")
            album_nome = album.get("name")
            album_data_lancamento = album.get("release_date")

            artistas_musica = item.get("artists", [])

            if not musica_id or not artistas_musica:
                continue

            artista_principal = artistas_musica[0]
            artista_id = artista_principal.get("id")
            artista_nome = artista_principal.get("name")

            detalhes_artista = sp.artist(artista_id)

            artista_popularidade = detalhes_artista.get("popularity")
            lista_generos = detalhes_artista.get("genres", [])

            artistas[artista_id] = {
                "id": artista_id,
                "nome": artista_nome,
                "popularidade": artista_popularidade,
                "generos": lista_generos
            }

            albuns[album_id] = {
                "id": album_id,
                "nome": album_nome,
                "data_lancamento": album_data_lancamento
            }

            if lista_generos:
                for genero in lista_generos:
                    generos[genero] = {
                        "nome": genero
            }
            else:
                    generos[termo] = {
                        "nome": termo
            }

            musicas[musica_id] = {
                "id": musica_id,
                "nome": nome_musica,
                "artista_id": artista_id,
                "album_id": album_id,
                "duracao_ms": duracao_ms,
                "explicit": explicito,
                "isrc": isrc,
                "url": url_musica,
                "termo_busca": termo
            }

    dados_extraidos = {
        "artistas": list(artistas.values()),
        "albuns": list(albuns.values()),
        "generos": list(generos.values()),
        "musicas": list(musicas.values())
    }

    return dados_extraidos


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

    dados = extrair_dados_spotify(termos_busca=termos, limite_por_termo=10)

    with open("data/raw/spotify_raw.json", "w", encoding="utf-8") as arquivo:
        json.dump(dados, arquivo, indent=4, ensure_ascii=False)

print("Dados brutos do Spotify salvos em data/raw/spotify_raw.json")