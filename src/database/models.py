from sqlalchemy import Column, Integer, String, Float, ForeignKey, DateTime
from sqlalchemy.orm import declarative_base, relationship

# Base do ORM(sql no python usando sqlalchemy) 
Base = declarative_base()


# =========================
# ARTISTAS
# =========================
class SpotifyArtista(Base):
    __tablename__ = "spotify_artistas"

    id = Column(String, primary_key=True, autoincrement=False)
    nome = Column(String, nullable=False)
    popularidade = Column(Integer)

    # relação: um artista tem várias músicas
    musicas = relationship("SpotifyMusica", back_populates="artista")


# =========================
# GÊNEROS
# =========================
class SpotifyGenero(Base):
    __tablename__ = "spotify_generos"

    id = Column(String, primary_key=True, autoincrement=False)
    nome = Column(String, nullable=False, unique=True)

    musicas = relationship("SpotifyMusica", back_populates="genero")


# =========================
# ÁLBUNS
# =========================
class SpotifyAlbum(Base):
    __tablename__ = "spotify_albuns"

    id = Column(String, primary_key=True, autoincrement=False)
    nome = Column(String, nullable=False)
    data_lancamento = Column(String)

    musicas = relationship("SpotifyMusica", back_populates="album")


# =========================
# MÚSICAS
# =========================
class SpotifyMusica(Base):
    __tablename__ = "spotify_musicas"

    id = Column(String, primary_key=True, autoincrement=False)
    nome = Column(String, nullable=False)
    popularidade = Column(Integer)
    duracao = Column(Float)

    # Foreign Keys (ligações)
    artista_id = Column(String, ForeignKey("spotify_artistas.id"))
    album_id = Column(String, ForeignKey("spotify_albuns.id"))
    genero_id = Column(String, ForeignKey("spotify_generos.id"))

    # relacionamentos
    artista = relationship("SpotifyArtista", back_populates="musicas")
    album = relationship("SpotifyAlbum", back_populates="musicas")
    genero = relationship("SpotifyGenero", back_populates="musicas")
    
# =========================
# PLAYLISTS
# =========================
class SpotifyPlaylist(Base):
    __tablename__ = "spotify_playlists"

    id = Column(String, primary_key=True, autoincrement=False)
    nome = Column(String, nullable=False)

    # relação com tabela intermediária
    musicas = relationship("SpotifyPlaylistMusica", back_populates="playlist")


# =========================
# PLAYLIST_MUSICAS (tabela de ligação)
# =========================
class SpotifyPlaylistMusica(Base):
    __tablename__ = "spotify_playlist_musicas"

    id = Column(String, primary_key=True, autoincrement=False)

    playlist_id = Column(String, ForeignKey("spotify_playlists.id"))
    musica_id = Column(String, ForeignKey("spotify_musicas.id"))

    # relações
    playlist = relationship("SpotifyPlaylist", back_populates="musicas")
    musica = relationship("SpotifyMusica")
    
# =========================
# CANAIS DO YOUTUBE
# =========================
class YoutubeCanal(Base):
    __tablename__ = "youtube_canais"

    id = Column(Integer, primary_key=True, autoincrement=True)
    nome = Column(String, nullable=False)

    videos = relationship("YoutubeVideo", back_populates="canal")


# =========================
# CATEGORIAS DO YOUTUBE
# =========================
class YoutubeCategoria(Base):
    __tablename__ = "youtube_categorias"

    id = Column(Integer, primary_key=True, autoincrement=True)
    nome = Column(String, nullable=False, unique=True)

    videos = relationship("YoutubeVideo", back_populates="categoria")


# =========================
# VÍDEOS DO YOUTUBE
# =========================
class YoutubeVideo(Base):
    __tablename__ = "youtube_videos"

    id = Column(Integer, primary_key=True, autoincrement=True)
    titulo = Column(String, nullable=False)
    data_publicacao = Column(DateTime)

    canal_id = Column(Integer, ForeignKey("youtube_canais.id"))
    categoria_id = Column(Integer, ForeignKey("youtube_categorias.id"))

    canal = relationship("YoutubeCanal", back_populates="videos")
    categoria = relationship("YoutubeCategoria", back_populates="videos")
    estatisticas = relationship("YoutubeVideoEstatistica", back_populates="video")


# =========================
# ESTATÍSTICAS DOS VÍDEOS
# =========================
class YoutubeVideoEstatistica(Base):
    __tablename__ = "youtube_video_estatisticas"

    id = Column(Integer, primary_key=True, autoincrement=True)

    video_id = Column(Integer, ForeignKey("youtube_videos.id"))

    views = Column(Integer)
    likes = Column(Integer)
    comentarios = Column(Integer)
    data_coleta = Column(DateTime)

    video = relationship("YoutubeVideo", back_populates="estatisticas")
    
# =========================
# CORRELAÇÃO ENTRE SPOTIFY E YOUTUBE
# =========================
class MusicaVideoCorrelacao(Base):
    __tablename__ = "musica_video_correlacao"

    id = Column(Integer, primary_key=True, autoincrement=True)

    musica_id = Column(Integer, ForeignKey("spotify_musicas.id"))
    video_id = Column(Integer, ForeignKey("youtube_videos.id"))

    score_correlacao = Column(Float)
    criterio_match = Column(String)

    musica = relationship("SpotifyMusica")
    video = relationship("YoutubeVideo")
    
# =========================
# REGIÕES
# =========================
class Regiao(Base):
    __tablename__ = "regioes"

    id = Column(Integer, primary_key=True, autoincrement=True)
    nome = Column(String, nullable=False)
    codigo = Column(String, nullable=False)

    engajamentos = relationship("EngajamentoRegional", back_populates="regiao")


# =========================
# ENGAJAMENTO REGIONAL
# =========================
class EngajamentoRegional(Base):
    __tablename__ = "engajamento_regional"

    id = Column(Integer, primary_key=True, autoincrement=True)

    regiao_id = Column(Integer, ForeignKey("regioes.id"))

    musica_id = Column(Integer, ForeignKey("spotify_musicas.id"), nullable=True)
    video_id = Column(Integer, ForeignKey("youtube_videos.id"), nullable=True)

    views = Column(Integer)
    likes = Column(Integer)
    popularidade = Column(Integer)

    data_coleta = Column(DateTime)

    regiao = relationship("Regiao", back_populates="engajamentos")
    musica = relationship("SpotifyMusica")
    video = relationship("YoutubeVideo")