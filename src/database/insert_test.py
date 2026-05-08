from connection import engine
from models import SpotifyArtista, SpotifyAlbum, SpotifyGenero, SpotifyMusica
from sqlalchemy.orm import sessionmaker

# cria sessão
Session = sessionmaker(bind=engine)
session = Session()

# =====================
# INSERINDO DADOS
# =====================

# artista
artista = SpotifyArtista(nome="Artista Teste", popularidade=90)

# genero
genero = SpotifyGenero(nome="Pop")

# album
album = SpotifyAlbum(nome="Album Teste")

# adiciona primeiro
session.add_all([artista, genero, album])
session.commit()

# musica (ligando tudo)
musica = SpotifyMusica(
    nome="Musica Teste",
    popularidade=80,
    duracao=3.5,
    artista_id=artista.id,
    album_id=album.id,
    genero_id=genero.id
)

session.add(musica)
session.commit()

print("Dados inseridos com sucesso!")