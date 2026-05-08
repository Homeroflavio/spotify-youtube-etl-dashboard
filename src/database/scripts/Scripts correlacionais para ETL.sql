-- =========================================================
-- SCRIPT DE TESTES INTEGRADOS - SPOTIFY + YOUTUBE + REGIÕES
-- Projeto ETL Spotify + YouTube
-- =========================================================

-- 1. Ver correlações entre músicas do Spotify e vídeos do YouTube

SELECT
    m.nome AS musica_spotify,
    a.nome AS artista_spotify,
    v.titulo AS video_youtube,
    c.nome AS canal_youtube,
    mvc.score_correlacao,
    mvc.criterio_match
FROM musica_video_correlacao mvc
JOIN spotify_musicas m
    ON mvc.musica_id = m.id
JOIN spotify_artistas a
    ON m.artista_id = a.id
JOIN youtube_videos v
    ON mvc.video_id = v.id
JOIN youtube_canais c
    ON v.canal_id = c.id
ORDER BY mvc.score_correlacao DESC
LIMIT 20;


-- 2. Ver músicas correlacionadas com vídeos e suas estatísticas de engajamento

SELECT
    m.nome AS musica,
    a.nome AS artista,
    v.titulo AS video,
    e.views,
    e.likes,
    e.comentarios,
    mvc.score_correlacao
FROM musica_video_correlacao mvc
JOIN spotify_musicas m
    ON mvc.musica_id = m.id
JOIN spotify_artistas a
    ON m.artista_id = a.id
JOIN youtube_videos v
    ON mvc.video_id = v.id
JOIN youtube_video_estatisticas e
    ON v.id = e.video_id
ORDER BY e.views DESC
LIMIT 20;


-- 3. Ranking de regiões por total de visualizações

SELECT
    r.nome AS regiao,
    r.codigo,
    SUM(er.views) AS total_views,
    SUM(er.likes) AS total_likes,
    SUM(er.comentarios) AS total_comentarios,
    ROUND(AVG(er.taxa_engajamento), 4) AS media_taxa_engajamento
FROM engajamento_regional er
JOIN regioes r
    ON er.regiao_id = r.id
GROUP BY r.nome, r.codigo
ORDER BY total_views DESC;


-- 4. Top vídeos por região

SELECT
    r.nome AS regiao,
    v.titulo AS video,
    c.nome AS canal,
    er.views,
    er.likes,
    er.comentarios,
    er.taxa_engajamento
FROM engajamento_regional er
JOIN regioes r
    ON er.regiao_id = r.id
JOIN youtube_videos v
    ON er.video_id = v.id
JOIN youtube_canais c
    ON v.canal_id = c.id
ORDER BY r.nome, er.views DESC
LIMIT 50;


-- 5. Comparar engajamento médio entre regiões

SELECT
    r.nome AS regiao,
    COUNT(er.video_id) AS total_videos,
    ROUND(AVG(er.views), 2) AS media_views,
    ROUND(AVG(er.likes), 2) AS media_likes,
    ROUND(AVG(er.comentarios), 2) AS media_comentarios,
    ROUND(AVG(er.taxa_engajamento), 4) AS media_taxa_engajamento
FROM engajamento_regional er
JOIN regioes r
    ON er.regiao_id = r.id
GROUP BY r.nome
ORDER BY media_taxa_engajamento DESC;


-- 6. Vídeos correlacionados com músicas por região

SELECT
    r.nome AS regiao,
    m.nome AS musica,
    a.nome AS artista,
    v.titulo AS video,
    er.views,
    er.likes,
    er.comentarios,
    er.taxa_engajamento,
    mvc.score_correlacao
FROM musica_video_correlacao mvc
JOIN spotify_musicas m
    ON mvc.musica_id = m.id
JOIN spotify_artistas a
    ON m.artista_id = a.id
JOIN youtube_videos v
    ON mvc.video_id = v.id
JOIN engajamento_regional er
    ON v.id = er.video_id
JOIN regioes r
    ON er.regiao_id = r.id
ORDER BY er.views DESC
LIMIT 30;


-- 7. Quantidade de vídeos musicais por região

SELECT
    r.nome AS regiao,
    COUNT(DISTINCT er.video_id) AS total_videos
FROM engajamento_regional er
JOIN regioes r
    ON er.regiao_id = r.id
GROUP BY r.nome
ORDER BY total_videos DESC;


-- 8. Top canais por engajamento regional

SELECT
    r.nome AS regiao,
    c.nome AS canal,
    SUM(er.views) AS total_views,
    SUM(er.likes) AS total_likes,
    SUM(er.comentarios) AS total_comentarios,
    ROUND(AVG(er.taxa_engajamento), 4) AS media_taxa_engajamento
FROM engajamento_regional er
JOIN regioes r
    ON er.regiao_id = r.id
JOIN youtube_videos v
    ON er.video_id = v.id
JOIN youtube_canais c
    ON v.canal_id = c.id
GROUP BY r.nome, c.nome
ORDER BY total_views DESC
LIMIT 30;


-- 9. Resumo geral do banco ETL

SELECT 'Spotify músicas' AS tabela, COUNT(*) AS total FROM spotify_musicas
UNION ALL
SELECT 'Spotify artistas', COUNT(*) FROM spotify_artistas
UNION ALL
SELECT 'Spotify playlists', COUNT(*) FROM spotify_playlists
UNION ALL
SELECT 'YouTube vídeos', COUNT(*) FROM youtube_videos
UNION ALL
SELECT 'YouTube canais', COUNT(*) FROM youtube_canais
UNION ALL
SELECT 'Correlação música-vídeo', COUNT(*) FROM musica_video_correlacao
UNION ALL
SELECT 'Engajamento regional', COUNT(*) FROM engajamento_regional;


-- 10. Top músicas correlacionadas com vídeos de maior engajamento

SELECT
    m.nome AS musica,
    a.nome AS artista,
    v.titulo AS video,
    SUM(er.views) AS total_views_regionais,
    SUM(er.likes) AS total_likes_regionais,
    SUM(er.comentarios) AS total_comentarios_regionais,
    ROUND(AVG(er.taxa_engajamento), 4) AS media_taxa_engajamento,
    mvc.score_correlacao
FROM musica_video_correlacao mvc
JOIN spotify_musicas m
    ON mvc.musica_id = m.id
JOIN spotify_artistas a
    ON m.artista_id = a.id
JOIN youtube_videos v
    ON mvc.video_id = v.id
JOIN engajamento_regional er
    ON v.id = er.video_id
GROUP BY
    m.nome,
    a.nome,
    v.titulo,
    mvc.score_correlacao
ORDER BY total_views_regionais DESC
LIMIT 20;