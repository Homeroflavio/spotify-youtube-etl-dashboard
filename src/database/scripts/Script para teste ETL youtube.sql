-- Script para ver vídeos mais vistos(Troque o Limit para quanto desejar ver)

SELECT 
    v.titulo,
    e.views
FROM youtube_videos v
JOIN youtube_video_estatisticas e
    ON v.id = e.video_id
ORDER BY e.views DESC
LIMIT 10;

-- Script para ver Vídeos + canal + categoria

SELECT 
    v.titulo,
    c.nome AS canal,
    cat.nome AS categoria
FROM youtube_videos v
JOIN youtube_canais c
    ON v.canal_id = c.id
JOIN youtube_categorias cat
    ON v.categoria_id = cat.id
LIMIT 20;

-- Script para ver média de likes por categoria

SELECT 
    cat.nome AS categoria,
    AVG(e.likes) AS media_likes
FROM youtube_videos v
JOIN youtube_categorias cat
    ON v.categoria_id = cat.id
JOIN youtube_video_estatisticas e
    ON v.id = e.video_id
GROUP BY cat.nome
ORDER BY media_likes DESC;

-- Script para ver vídeos com mais comentários

SELECT 
    v.titulo,
    e.comentarios
FROM youtube_videos v
JOIN youtube_video_estatisticas e
    ON v.id = e.video_id
ORDER BY e.comentarios DESC
LIMIT 10;

-- Script para ver todas informações completas de um vídeo

SELECT 
    v.titulo,
    c.nome AS canal,
    cat.nome AS categoria,
    e.views,
    e.likes,
    e.comentarios
FROM youtube_videos v
JOIN youtube_canais c
    ON v.canal_id = c.id
JOIN youtube_categorias cat
    ON v.categoria_id = cat.id
JOIN youtube_video_estatisticas e
    ON v.id = e.video_id
ORDER BY e.views DESC
LIMIT 15;