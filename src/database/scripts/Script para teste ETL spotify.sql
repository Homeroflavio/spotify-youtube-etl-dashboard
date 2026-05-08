-- Script para ver música com seu artista(troque o limit para quanto preferir):

SELECT m.nome AS musica, a.nome AS artista
FROM spotify_musicas m
JOIN spotify_artistas a ON m.artista_id = a.id
LIMIT 10;

-- Script para ver a música + o album que ela pertence:

SELECT m.nome AS musica, al.nome AS album
FROM spotify_musicas m
JOIN spotify_albuns al ON m.album_id = al.id
LIMIT 10;

-- Script para ver músicas com maiores durações

SELECT nome, duracao_min
FROM spotify_musicas
ORDER BY duracao_min DESC
LIMIT 10;

-- Script para ver a quatidade de músicas por gênero 

SELECT termo_busca, COUNT(*) 
FROM spotify_musicas
GROUP BY termo_busca
ORDER BY COUNT(*) DESC;

-- Script para ver a quantidade de músicas por playlist

SELECT 
    p.nome AS playlist,
    COUNT(pm.musica_id) AS total_musicas
FROM spotify_playlists p
JOIN spotify_playlist_musicas pm
    ON p.id = pm.playlist_id
GROUP BY p.nome
ORDER BY total_musicas DESC;



