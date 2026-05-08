--
-- PostgreSQL database dump
--

\restrict QKfXFEiQHJkdatrLj8FWalHNvJwbKL4cCc5fLsOXkgwfRbd58IfSwOwQdIU4aIM

-- Dumped from database version 18.3
-- Dumped by pg_dump version 18.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: engajamento_regional; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.engajamento_regional (
    id integer NOT NULL,
    video_id character varying,
    regiao_id integer,
    views bigint,
    likes bigint,
    comentarios bigint,
    taxa_engajamento numeric(10,4),
    data_coleta timestamp without time zone
);


ALTER TABLE public.engajamento_regional OWNER TO postgres;

--
-- Name: engajamento_regional_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.engajamento_regional_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.engajamento_regional_id_seq OWNER TO postgres;

--
-- Name: engajamento_regional_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.engajamento_regional_id_seq OWNED BY public.engajamento_regional.id;


--
-- Name: musica_video_correlacao; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.musica_video_correlacao (
    id integer NOT NULL,
    musica_id character varying,
    video_id character varying,
    score_correlacao double precision,
    criterio_match character varying
);


ALTER TABLE public.musica_video_correlacao OWNER TO postgres;

--
-- Name: musica_video_correlacao_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.musica_video_correlacao_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.musica_video_correlacao_id_seq OWNER TO postgres;

--
-- Name: musica_video_correlacao_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.musica_video_correlacao_id_seq OWNED BY public.musica_video_correlacao.id;


--
-- Name: regioes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.regioes (
    id integer NOT NULL,
    nome character varying NOT NULL,
    codigo character varying NOT NULL
);


ALTER TABLE public.regioes OWNER TO postgres;

--
-- Name: regioes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.regioes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.regioes_id_seq OWNER TO postgres;

--
-- Name: regioes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.regioes_id_seq OWNED BY public.regioes.id;


--
-- Name: spotify_albuns; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spotify_albuns (
    id character varying NOT NULL,
    nome character varying NOT NULL,
    data_lancamento character varying
);


ALTER TABLE public.spotify_albuns OWNER TO postgres;

--
-- Name: spotify_artistas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spotify_artistas (
    id character varying NOT NULL,
    nome character varying NOT NULL,
    popularidade integer
);


ALTER TABLE public.spotify_artistas OWNER TO postgres;

--
-- Name: spotify_generos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spotify_generos (
    id character varying NOT NULL,
    nome character varying NOT NULL
);


ALTER TABLE public.spotify_generos OWNER TO postgres;

--
-- Name: spotify_musicas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spotify_musicas (
    id character varying NOT NULL,
    nome character varying NOT NULL,
    popularidade integer,
    duracao double precision,
    artista_id character varying,
    album_id character varying,
    genero_id character varying,
    duracao_ms integer,
    explicit boolean,
    isrc character varying,
    url text,
    termo_busca character varying,
    duracao_min double precision
);


ALTER TABLE public.spotify_musicas OWNER TO postgres;

--
-- Name: spotify_playlist_musicas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spotify_playlist_musicas (
    id integer NOT NULL,
    playlist_id character varying,
    musica_id character varying
);


ALTER TABLE public.spotify_playlist_musicas OWNER TO postgres;

--
-- Name: spotify_playlist_musicas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spotify_playlist_musicas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spotify_playlist_musicas_id_seq OWNER TO postgres;

--
-- Name: spotify_playlist_musicas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spotify_playlist_musicas_id_seq OWNED BY public.spotify_playlist_musicas.id;


--
-- Name: spotify_playlists; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spotify_playlists (
    id character varying NOT NULL,
    nome character varying,
    total_musicas integer,
    url character varying
);


ALTER TABLE public.spotify_playlists OWNER TO postgres;

--
-- Name: youtube_canais; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.youtube_canais (
    id character varying NOT NULL,
    nome character varying
);


ALTER TABLE public.youtube_canais OWNER TO postgres;

--
-- Name: youtube_categorias; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.youtube_categorias (
    id character varying NOT NULL,
    nome character varying
);


ALTER TABLE public.youtube_categorias OWNER TO postgres;

--
-- Name: youtube_video_estatisticas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.youtube_video_estatisticas (
    id integer NOT NULL,
    video_id character varying,
    views bigint,
    likes bigint,
    comentarios bigint,
    data_coleta timestamp without time zone
);


ALTER TABLE public.youtube_video_estatisticas OWNER TO postgres;

--
-- Name: youtube_video_estatisticas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.youtube_video_estatisticas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.youtube_video_estatisticas_id_seq OWNER TO postgres;

--
-- Name: youtube_video_estatisticas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.youtube_video_estatisticas_id_seq OWNED BY public.youtube_video_estatisticas.id;


--
-- Name: youtube_videos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.youtube_videos (
    id character varying NOT NULL,
    titulo character varying,
    data_publicacao timestamp without time zone,
    canal_id character varying,
    categoria_id character varying
);


ALTER TABLE public.youtube_videos OWNER TO postgres;

--
-- Name: engajamento_regional id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.engajamento_regional ALTER COLUMN id SET DEFAULT nextval('public.engajamento_regional_id_seq'::regclass);


--
-- Name: musica_video_correlacao id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.musica_video_correlacao ALTER COLUMN id SET DEFAULT nextval('public.musica_video_correlacao_id_seq'::regclass);


--
-- Name: regioes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.regioes ALTER COLUMN id SET DEFAULT nextval('public.regioes_id_seq'::regclass);


--
-- Name: spotify_playlist_musicas id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spotify_playlist_musicas ALTER COLUMN id SET DEFAULT nextval('public.spotify_playlist_musicas_id_seq'::regclass);


--
-- Name: youtube_video_estatisticas id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.youtube_video_estatisticas ALTER COLUMN id SET DEFAULT nextval('public.youtube_video_estatisticas_id_seq'::regclass);


--
-- Data for Name: engajamento_regional; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.engajamento_regional VALUES (1, 'Cxl52-1LW_k', 1, 2875, 586, 76, 23.0261, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (2, 'XeNibQZwp00', 1, 244491, 11723, 2296, 5.7340, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (3, 'qiOGfrte_Lg', 1, 26776, 4474, 572, 18.8452, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (4, 'oI51J1tjUBs', 1, 5236, 1018, 129, 21.9060, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (5, '-RuSsuxZjIg', 1, 6128, 391, 81, 7.7023, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (6, 'NcP5zbMA0QU', 1, 6718, 1496, 271, 26.3025, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (7, 'pkE_H8yEdl8', 1, 12173, 1173, 237, 11.5830, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (8, 'R1WQVeCq0Hs', 1, 2136847, 136805, 9417, 6.8429, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (9, 'V9PVRfjEBTI', 1, 809797806, 5299072, 143073, 0.6720, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (10, 'WXBHCQYxwr0', 1, 1037735331, 7627508, 155771, 0.7500, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (11, '-eGKhLZfkaU', 1, 137266, 8519, 0, 6.2062, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (12, 'fLexgOxsZu0', 1, 3206481890, 16529858, 676948, 0.5366, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (13, 'kF4MVeWFiDs', 1, 2805730, 94435, 3789, 3.5008, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (14, 'd-aa-dZZmF8', 1, 64831, 3920, 561, 6.9118, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (15, 'qOcZBlLdsXg', 1, 44507, 4801, 721, 12.4070, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (16, 'CcS1fsuT10M', 1, 22039027, 217825, 7424, 1.0220, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (17, 'KFMYx1TibeQ', 1, 86165429, 554626, 15781, 0.6620, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (18, 'aYMCeWO7D7k', 1, 88558, 3371, 766, 4.6715, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (19, '09R8_2nJtjg', 1, 4374490178, 16995520, 441325, 0.3986, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (20, 'm__b5iBYP1Y', 1, 11970891, 22002, 329, 0.1865, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (21, 'ko70cExuzZM', 1, 386868720, 3371990, 138515, 0.9074, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (22, 'GRiJXn0rgCQ', 1, 4983, 702, 50, 15.0913, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (23, 'bGx7sOyTRTA', 1, 16819, 1765, 84, 10.9935, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (24, '9qI2-UijNOo', 1, 96737, 1666, 530, 2.2701, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (25, 'PEnDh9CkLUc', 1, 11262, 632, 116, 6.6418, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (26, 'dgzN94w1lLE', 1, 8558, 878, 52, 10.8670, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (27, 'Ra_bioBGzUg', 1, 3008, 241, 29, 8.9761, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (28, '2aJUnltwsqs', 1, 210724645, 1392167, 50977, 0.6848, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (29, 'qgaRVvAKoqQ', 1, 94429184, 567829, 15814, 0.6181, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (30, 'fHI8X4OXluQ', 1, 865679068, 6364240, 172545, 0.7551, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (31, 'a7fzkqLozwA', 1, 448036654, 2900175, 47547, 0.6579, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (32, 'vGJTaP6anOU', 1, 471544373, 4230254, 141160, 0.9270, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (33, 'G23iLGhh9lo', 1, 38009430, 274739, 18123, 0.7705, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (34, 'oqv35UZepIM', 1, 309071672, 2291339, 36620, 0.7532, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (35, 'r58GQYFZeLE', 1, 52352215, 345731, 13271, 0.6857, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (36, '1vrEljMfXYo', 1, 567181344, 3609395, 177055, 0.6676, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (37, 'QhW3P7_jvWY', 1, 29996995, 192522, 10693, 0.6775, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (38, 'x47TgeRJtH0', 1, 81086718, 849304, 9533, 1.0592, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (39, 'W7nmB20qJv4', 1, 59689195, 611079, 14292, 1.0477, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (40, '9wT1s96JIb0', 1, 22303344, 270758, 5765, 1.2398, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (41, 'ZRHHOttkM1A', 1, 164768780, 1814249, 26644, 1.1173, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (42, 'F5eEvfOyb7k', 1, 23926890, 211675, 12925, 0.9387, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (43, 'RNOTF-znQyw', 1, 49449790, 292289, 17435, 0.6263, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (44, 'ifWOSnoCS0M', 1, 8777195, 83754, 4415, 1.0045, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (45, 'rTKpYJ80OVQ', 1, 50315735, 404732, 7852, 0.8200, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (46, 'oacaq_1TkMU', 1, 92474931, 438286, 10696, 0.4855, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (47, 'DmNfT-B7nlA', 1, 210343130, 1425653, 32534, 0.6932, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (48, '4FitbJ3oqww', 1, 77764302, 1040514, 52315, 1.4053, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (49, 'xy3AcmW0lrQ', 1, 140509101, 1051037, 18284, 0.7610, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (50, 'AeZRYhLDLeU', 1, 46136952, 303999, 10457, 0.6816, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (51, 'JNNKOkcojEc', 1, 34204, 3817, 140, 11.5688, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (52, 'KXJpP0jd9Lk', 1, 110823193, 513167, 16242, 0.4777, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (53, '-FVrYTPBqxg', 1, 30996, 828, 102, 3.0004, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (54, 'mAlFutzMbGI', 1, 1207, 189, 39, 18.8898, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (55, '5CxknorIHQ4', 1, 10507, 1264, 79, 12.7820, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (56, '81GaF34veWA', 1, 503048062, 1634260, 39380, 0.3327, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (57, '93TXfW3MT4o', 1, 358225252, 1267346, 34336, 0.3634, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (58, 'yxwnCxnUVlw', 1, 336176274, 1660624, 50282, 0.5089, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (59, 'dANcAGydlsM', 1, 450348863, 3978807, 91596, 0.9038, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (60, '49LvI-Y_ScY', 1, 9263321, 22503, 0, 0.2429, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (61, 'q0u47Nl7N7M', 1, 4697803, 92540, 3390, 2.0420, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (62, 'agr3esH33SU', 1, 6979, 1482, 271, 25.1182, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (63, '1ouf1Dt7H2A', 1, 1876262, 20138, 1520, 1.1543, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (64, 'ZDW9eJOtZ3s', 1, 16595316, 307359, 49155, 2.1483, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (65, 'tigPF7zhElk', 1, 379169, 17227, 782, 4.7496, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (66, 'FZm2Ci1jLe0', 1, 49419, 215, 10, 0.4553, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (67, 'xCuqr0PO0_8', 1, 9051643, 56605, 1579, 0.6428, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (68, 'WiNYFwIfg4w', 1, 196455920, 1106972, 11826, 0.5695, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (69, 'QrtoMb-o7b8', 1, 91191622, 329163, 3875, 0.3652, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (70, 'hpn23IVQTbY', 1, 16229, 1822, 121, 11.9724, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (71, 'ieTE4-Xy9xg', 1, 36571232, 199003, 5642, 0.5596, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (72, 'Lny-RiAKQ1Q', 1, 14081536, 56735, 1940, 0.4167, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (73, 'ug5IBOYCUzQ', 1, 80269226, 270125, 4619, 0.3423, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (74, '9TYOtiHgQTA', 1, 63750476, 218964, 11297, 0.3612, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (75, '5IWRU8k0qaU', 1, 18363638, 96214, 3595, 0.5435, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (76, 'M_eOUE6pFKY', 1, 74393023, 312013, 2108, 0.4222, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (77, 'upCptHeThio', 1, 476457877, 4623335, 107345, 0.9929, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (78, '0VNARs1fbrQ', 1, 2350846, 30578, 66, 1.3035, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (79, '_P7S2lKif-A', 1, 1947204659, 15504388, 413633, 0.8175, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (80, 'CogD1olVZYk', 1, 103369179, 563283, 7501, 0.5522, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (81, 'EWcOY14GWwM', 1, 749726636, 5572108, 217194, 0.7722, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (82, '4N2iMmHcHys', 1, 546127862, 3371457, 83925, 0.6327, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (83, 'uF_w5PjpuKI', 1, 4680018, 22893, 219, 0.4938, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (84, 'kxVm97f25VA', 1, 184630276, 468934, 4677, 0.2565, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (85, 'aHBW_Nd_z8k', 1, 189208854, 1091839, 12764, 0.5838, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (86, 'kzOkza_u3Z8', 1, 260916181, 2463502, 152335, 1.0026, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (87, '-UDWqs7TsTg', 1, 148556016, 686597, 11209, 0.4697, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (88, 'tnyJXbPrGN8', 1, 142789742, 1082991, 12338, 0.7671, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (89, 'kDhptBT_-VI', 1, 471976970, 4490481, 257571, 1.0060, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (90, 'iaXt5shHFL8', 1, 18465406, 275565, 23538, 1.6198, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (91, 'gEAXyEUQPUs', 1, 65259763, 485038, 0, 0.7432, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (92, 'buZm0R1qWgU', 1, 840441, 6033, 40, 0.7226, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (93, '3yd_eoMOvqk', 1, 1293725289, 9019773, 282132, 0.7190, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (94, 'iEenugG_y6c', 1, 132033840, 437135, 6286, 0.3358, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (95, 'uQPu_XgV2iU', 1, 11559716, 177753, 2826, 1.5621, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (96, '9QASL0SjNGQ', 1, 1199671, 28842, 668, 2.4598, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (97, 'RKb9WiYcfLM', 1, 142186953, 801486, 11313, 0.5716, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (98, 'ENHwrVK0wn8', 1, 175222578, 1059225, 12108, 0.6114, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (99, 'udVRjFnmeX4', 1, 136658, 2421, 48, 1.8067, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (100, 'VpJKsoMWnZM', 1, 210168699, 2304361, 51338, 1.1209, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (101, 'OFwLmOlaeV0', 1, 2294, 60, 1, 2.6591, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (102, 'PaQGJV4AHYg', 1, 8065, 175, 1, 2.1823, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (103, 'yv2i9s6c69g', 1, 23554, 179, 7, 0.7897, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (104, 'WQ3wmf8KyFo', 1, 474594, 2617, 29, 0.5575, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (105, '0nHHZZRYNf4', 1, 191276277, 990577, 11333, 0.5238, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (106, '4lH4Rk4iwBA', 1, 32550, 386, 2, 1.1920, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (107, '0QULuVbkGEU', 1, 6636462, 70722, 1041, 1.0813, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (108, 'XPs5XS5CtIw', 1, 823467, 7383, 87, 0.9071, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (109, 'QfzMtZ3HSG0', 1, 109855, 618, 9, 0.5708, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (110, 'OQODghPUIqg', 1, 153981, 1556, 27, 1.0280, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (111, 'Bb6nkSz8ThA', 1, 5942376, 34177, 731, 0.5874, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (112, 'nRbw5SCKD8M', 1, 414, 13, 2, 3.6232, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (113, 'hfwmSryJi98', 1, 66433, 456, 2, 0.6894, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (114, 'z5R9JzNpvPc', 1, 8878391, 51692, 0, 0.5822, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (115, '4NpT4hCgoB0', 1, 202613, 4297, 90, 2.1652, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (116, '63XyWeKWI0M', 1, 204520562, 1623377, 36881, 0.8118, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (117, 'MIjLD8KB2gs', 1, 632342, 4874, 38, 0.7768, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (118, 'yyq2L2Ws5Ow', 1, 75411, 685, 5, 0.9150, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (119, 'q-uWWNcu724', 1, 14879061, 171625, 2915, 1.1731, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (120, '_urlIWLDvrA', 1, 6996965, 126962, 2170, 1.8455, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (121, 'BZjxRqWBeHU', 1, 2417161, 23734, 408, 0.9988, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (122, 'Quc3PUKyGCA', 1, 542727, 5723, 30, 1.0600, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (123, 'Pes_L2tdrG8', 1, 999562, 6714, 91, 0.6808, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (124, 'gQreU1BGMmw', 1, 16113624, 176118, 1669, 1.1033, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (125, 'PI23ldAvdHY', 1, 18328786, 251503, 6424, 1.4072, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (126, 'vKRAmLTQ9Dk', 1, 39163200, 490070, 6776, 1.2687, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (127, 'ICkFEA5eunU', 1, 625163, 4678, 183, 0.7776, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (128, 'UZxnSc6VKog', 1, 88267097, 1378465, 43038, 1.6105, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (129, 'cIUSxV9J45w', 1, 14606, 227, 3, 1.5747, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (130, '7pD8k2zaLqk', 1, 44679277, 393219, 8671, 0.8995, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (131, 'e_xGeZDk3Sw', 1, 214517806, 3377566, 143796, 1.6415, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (132, '4Y_5uJpSOZM', 1, 15111041, 715221, 17348, 4.8479, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (133, 'vlZ9MGgC1NI', 1, 56512454, 449159, 9498, 0.8116, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (134, 'xAM51Ovpr9M', 1, 243136414, 3302321, 61698, 1.3836, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (135, 'iZq0u3quAqo', 1, 731558230, 3826354, 87184, 0.5350, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (136, 'Ibfm0yE5O_8', 1, 17568385, 121050, 3461, 0.7087, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (137, 'GA7LcSX8tYE', 1, 89457065, 830487, 26022, 0.9575, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (138, 'WF7LLl7r4Os', 1, 72530234, 606184, 18416, 0.8612, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (139, 's6dIjPBECXw', 1, 26419484, 304585, 3916, 1.1677, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (140, 'TwkKp-BBChg', 1, 86240693, 1143743, 55438, 1.3905, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (141, 'gUnpHJgLyRs', 1, 91302348, 746881, 4067, 0.8225, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (142, 'P-W2JmG9vtQ', 1, 18414654, 119047, 4087, 0.6687, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (143, 'o50J2xg8-sU', 1, 132325244, 952024, 6414, 0.7243, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (144, 'XpvSubMyL0k', 1, 3751521, 200568, 6578, 5.5217, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (145, 'Wu-HUG7ORt8', 1, 101304755, 761144, 16488, 0.7676, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (146, 'CWqoY1RK5lU', 1, 777516, 63849, 3458, 8.6567, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (147, 'fAHcrVZhLIA', 1, 16371573, 151150, 11188, 0.9916, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (148, 'G2huIPUuUQc', 1, 97813837, 559038, 10346, 0.5821, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (149, 'rC9vmpQRR40', 1, 33209322, 242776, 5929, 0.7489, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (150, '10XarNSkw0s', 1, 289605421, 646453, 17694, 0.2293, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (151, 'V2RgfAC0Mz8', 1, 606722, 2213, 26, 0.3690, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (152, 'YrvU5E-iF_s', 1, 2198073, 6922, 68, 0.3180, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (153, 'BEz8l69aI8Y', 1, 739695241, 1778116, 21450, 0.2433, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (154, 'Dt13Wv6Opeo', 1, 129282826, 762584, 25111, 0.6093, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (155, 'yZh9a-QX3Yo', 1, 328261, 1004, 33, 0.3159, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (156, 'UsEhWFeiCnA', 1, 302733, 991, 12, 0.3313, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (157, 'T67WZx7CxY8', 1, 62507054, 307520, 7855, 0.5045, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (158, 'BOn-sXalHxI', 1, 1704219, 4201, 59, 0.2500, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (159, 'J_jJhHhYW9w', 1, 324758399, 2446857, 51054, 0.7692, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (160, '8blgJSoAVBc', 1, 4441909, 18699, 282, 0.4273, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (161, 'veSzGDdQ_Ok', 1, 21688542, 78790, 1066, 0.3682, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (162, 'GVSS3lh_lCY', 1, 94980975, 79294, 1255, 0.0848, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (163, 'kI6ywewtYkc', 1, 126401525, 220601, 3769, 0.1775, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (164, 'PtJDSomNoUM', 1, 253448, 879, 17, 0.3535, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (165, 'ToabLkXUotM', 1, 92009463, 127016, 4962, 0.1434, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (166, 'jPwCxjJqHGw', 1, 115328494, 227994, 4053, 0.2012, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (167, 'o4SIXV3OKeY', 1, 241032953, 589164, 13341, 0.2500, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (168, 'OcKwmWEBi1I', 1, 82490660, 115528, 659, 0.1408, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (169, 'MO37-1KgcI4', 1, 66637209, 356685, 28136, 0.5775, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (170, 's9IlAyHO6EQ', 1, 63333028, 144900, 5763, 0.2379, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (171, 'uEtGTq92Cmk', 1, 161390933, 327576, 8097, 0.2080, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (172, 'ZIiQ1jMqhVM', 1, 232878158, 1992590, 54086, 0.8789, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (173, 'E7UBYWn_69c', 1, 880421, 1479, 22, 0.1705, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (174, 'lBDDMrUCz1A', 1, 16822535, 34403, 7300, 0.2479, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (175, 'eAIivxKZYZw', 1, 388135311, 1161887, 14866, 0.3032, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (176, 'n5wxZ_OBUXk', 1, 414238717, 1316712, 16130, 0.3218, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (177, 'h3nyYuevzi8', 1, 8786, 34, 0, 0.3870, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (178, 'qPgwDlqdiD0', 1, 51106989, 293958, 3103, 0.5813, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (179, 'Vvfs44wnHH0', 1, 10917915, 61477, 859, 0.5710, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (180, 'CgkLC1mcCE0', 1, 153874873, 293709, 4743, 0.1940, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (181, 'CGOKwddW7uo', 1, 7744176, 41041, 640, 0.5382, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (182, 'AAZmC2EcNng', 1, 49388930, 106656, 1381, 0.2187, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (183, 'iYjz1Ap1VvU', 1, 142373673, 383502, 4128, 0.2723, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (184, 'WrwEIKj7KB0', 1, 8943250, 37875, 409, 0.4281, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (185, 'ozLE7N5uEfw', 1, 49537682, 104012, 1378, 0.2127, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (186, 'iL_ljx5eXQc', 1, 45029098, 80088, 1795, 0.1818, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (187, 'lKsfbr_F6ho', 1, 335110, 1482, 30, 0.4512, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (188, 'TxCOdjTyY94', 1, 56675629, 104373, 1537, 0.1869, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (189, 'AA-sNG6eIyI', 1, 2923510, 15343, 354, 0.5369, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (190, 'eCdTbCf4EMM', 1, 2739333, 14661, 299, 0.5461, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (191, 'exTC-KFUJrM', 1, 40505397, 47782, 353, 0.1188, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (192, 'EEoqV07KXck', 1, 1421486, 8282, 181, 0.5954, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (193, 'QWgqN_oD934', 1, 238746, 3175, 133, 1.3856, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (194, 'wJPicWv_SGU', 1, 97116326, 109347, 579, 0.1132, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (195, 'WQyKuEsLpRY', 1, 205787000, 1162323, 17854, 0.5735, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (196, 'lRt16Y_ys7g', 1, 1266531, 10523, 460, 0.8672, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (197, 'KjdmmvEzGoc', 1, 157666143, 277080, 2417, 0.1773, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (198, 'I5Rl73wFmWs', 1, 220818244, 915710, 9039, 0.4188, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (199, 'VrTm4M6qAA4', 1, 41501912, 189100, 3932, 0.4651, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (200, 'HD2sMiAwpCQ', 1, 189285985, 687877, 8939, 0.3681, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (201, 'ox9zGoiJcKg', 1, 234852481, 865780, 17126, 0.3759, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (202, 'PvM_YAabhkk', 1, 69583797, 293295, 6967, 0.4315, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (203, 'g2o3CZaVVCo', 1, 131399854, 767498, 9981, 0.5917, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (204, 'KzPau_0Ad7o', 1, 142662760, 395237, 4894, 0.2805, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (205, 'aDDBdW8-PZo', 1, 12506467, 43524, 524, 0.3522, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (206, 'UtTDrO9arqI', 1, 34664295, 238325, 5036, 0.7021, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (207, 'tptkdXcBlzY', 1, 2307815, 10051, 314, 0.4491, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (208, 'ewnUjJkdeNI', 1, 6876157, 23707, 633, 0.3540, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (209, 'tvPSPkugS7A', 1, 124256471, 340387, 4918, 0.2779, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (210, 'lYv3IGKab44', 1, 328413, 4638, 60, 1.4305, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (211, '0692WFAqRxs', 1, 13828299, 164199, 4240, 1.2181, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (212, 'bjvLAQLl2xw', 1, 15434879, 81521, 2924, 0.5471, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (213, 'fp6p7-yxNeQ', 1, 793695, 9959, 109, 1.2685, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (214, 'skAvBJPTfSA', 1, 24542097, 104943, 1, 0.4276, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (215, 'W_jywiZmd-c', 1, 9234611, 65950, 1634, 0.7319, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (216, '_d3jWdIdRHQ', 1, 268107, 2246, 21, 0.8456, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (217, 'CVTWjpx8_YA', 1, 4511100, 41130, 0, 0.9118, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (218, '2HXbHjLJhAk', 1, 184796, 4802, 201, 2.7073, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (219, '8tzhHzV05_0', 1, 40345984, 127981, 1984, 0.3221, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (220, 'KzhZd3BcbWQ', 1, 1017831, 9606, 250, 0.9683, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (221, 'JCf4x_ODbhA', 1, 21551365, 87015, 1203, 0.4093, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (222, 'EToVcmE8RHQ', 1, 597936, 7006, 91, 1.1869, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (223, 'a9R7JuPdMLo', 1, 539524, 9758, 297, 1.8637, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (224, 'xNmehcf7bqI', 1, 193882, 2710, 0, 1.3978, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (225, 'eHHQaoEW30Q', 1, 120655745, 1884332, 228091, 1.7508, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (226, 'NYyNHZPeQ4I', 1, 14576085, 21970, 228, 0.1523, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (227, 'w7-SyTTulAw', 1, 7833, 2053, 56, 26.9245, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (228, 'qUxgHHiqGg0', 1, 17377113, 29000, 683, 0.1708, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (229, 'zDv9qV7PABI', 1, 32702110, 59619, 1000, 0.1854, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (230, '5L5eSTYX6wc', 1, 45083654, 94413, 1489, 0.2127, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (231, '-SEKt_0pdHM', 1, 2897717, 225863, 11246, 8.1826, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (232, 'bMhDJ0S0OBA', 1, 19021006, 413213, 24677, 2.3021, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (233, '_kS7F4VpJa0', 1, 52019544, 880316, 25208, 1.7407, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (234, 'TvVtYaqCni8', 1, 116344971, 1874157, 79987, 1.6796, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (235, 'z0Xc_rzYZV8', 1, 11323606, 31903, 923, 0.2899, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (236, 'vqkfEUqjl6Y', 1, 48243688, 544220, 51385, 1.2346, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (237, 'F7sGJVUrkjQ', 1, 92732358, 1106473, 86313, 1.2863, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (238, 'FEfPbOnE7VM', 1, 3338007, 14559, 517, 0.4516, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (239, 'yd_uG3TtREs', 1, 181284045, 1403835, 64041, 0.8097, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (240, 'nL2bLcCtXcM', 1, 33818852, 90343, 1092, 0.2704, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (241, '42wfEs7oIP8', 1, 70842747, 1400341, 36778, 2.0286, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (242, '2GJfWMYCWY0', 1, 74313088, 3657809, 354714, 5.3995, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (243, 'MoU3TctXBvs', 1, 27774866, 61010, 1080, 0.2235, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (244, 'GkG60kISnfc', 1, 62137136, 721006, 20539, 1.1934, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (245, 'AYQNN7OAHpM', 1, 8448044, 17486, 0, 0.2070, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (246, 'NED7nev2ywQ', 1, 105436177, 1929523, 162154, 1.9838, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (247, 'x_RYZsOfpKY', 1, 53197336, 815825, 29165, 1.5884, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (248, 'L3sOnIfU0QM', 1, 36906088, 219929, 8877, 0.6200, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (249, 'Ve_a9CXjlQc', 1, 42090684, 173456, 5413, 0.4250, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (250, 'GMFewiplIbw', 1, 2661527783, 8959837, 328586, 0.3490, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (251, 'Us2ZvSRUB1k', 1, 9264611, 39235, 560, 0.4295, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (252, 'kJQP7kiw5Fk', 1, 9010480726, 56173595, 4363523, 0.6719, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (253, 'WB9Egi9leWA', 1, 1858588, 23590, 733, 1.3087, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (254, 'yH1fk7WLiMc', 1, 12534967, 108608, 3587, 0.8951, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (255, 'BZIqOKGmDV4', 1, 1549774, 21527, 220, 1.4032, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (256, 'Xtt78SW-mgg', 1, 2701690, 108543, 3901, 4.1620, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (257, 'VMp55KH_3wo', 1, 1737200027, 4508875, 175276, 0.2696, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (258, '_NwcW2GwFGY', 1, 14147715, 149479, 1528, 1.0674, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (259, 'TyHvyGVs42U', 1, 2503870379, 10701969, 337966, 0.4409, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (260, 'dkGnWUfweUQ', 1, 974839, 12731, 206, 1.3271, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (261, 'nD3e_CQQwmM', 1, 1441898, 10773, 609, 0.7894, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (262, 'wnJ6LuUFpMo', 1, 3643659046, 19133403, 531616, 0.5397, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (263, 'hKwCRJfiHBo', 1, 335390, 14028, 252, 4.2577, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (264, 'QuSEbo03fc4', 1, 99626768, 591036, 13752, 0.6071, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (265, 'n7OUYLY5DG4', 1, 1622043, 64681, 2066, 4.1150, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (266, 'NUsoVlDFqZg', 1, 3825543878, 11914047, 300095, 0.3193, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (267, '2ZSAAI2BC1U', 1, 2226351, 22596, 838, 1.0526, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (268, 'YXnjy5YlDwk', 1, 1303924400, 3777447, 100750, 0.2974, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (269, 'FOtvRp-VEO0', 1, 10551890, 107351, 1413, 1.0308, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (270, 'RGNv4XI0jgI', 1, 1679648, 5101, 94, 0.3093, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (271, 'z1g_WMMFs88', 1, 36705, 250, 2, 0.6866, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (272, 'TgJY0UcmtCA', 1, 747979, 11937, 175, 1.6193, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (273, 'BXGYJPUAbMM', 1, 2684299, 73764, 411, 2.7633, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (274, 'c7l7Fnl0Oqo', 1, 1610374, 11118, 237, 0.7051, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (275, 'fTKqtvXjkvo', 1, 38350375, 87591, 4850, 0.2410, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (276, 'MKaPVvXXhxk', 1, 4599218, 61556, 282, 1.3445, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (277, 'zm4C9rx5fGY', 1, 13166940, 30918, 1386, 0.2453, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (278, 'LuzXr3He9NI', 1, 13584504, 45868, 2879, 0.3588, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (279, 'Y5lrZeDf1T4', 1, 992810, 13493, 938, 1.4536, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (280, 'uRiB1tsFIkE', 1, 35950208, 165178, 6791, 0.4784, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (281, 'rIt4pBtu0QA', 1, 570434, 4364, 104, 0.7833, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (282, 'cdTNj3y6G8I', 1, 6383137, 42784, 418, 0.6768, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (283, 'ed1RJCuNWAo', 1, 3240010, 15286, 387, 0.4837, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (284, 'DD2rp9pe6n4', 1, 1071464, 20475, 84, 1.9188, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (285, 'k6aqTBFpPl0', 1, 411691, 3746, 61, 0.9247, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (286, '7H3DiVmLG74', 1, 952172, 7582, 101, 0.8069, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (287, '2lnLrCo4bdY', 1, 1012606, 21247, 310, 2.1289, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (288, 'wBcptk5YWQI', 1, 32119825, 357609, 19105, 1.1728, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (289, 'ZvNnfTmBcME', 1, 1626674, 6278, 325, 0.4059, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (290, '4UWwpyYF4lo', 1, 2704615, 27227, 144, 1.0120, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (291, 'IMf9O3x6KzM', 1, 5137, 206, 33, 4.6525, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (292, 'CDBoHKXtrjs', 1, 850752, 11051, 484, 1.3559, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (293, 'yZL_C-Kcxf0', 1, 20005898, 819263, 20169, 4.1959, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (294, 't1MnvH6GPJ4', 1, 147678125, 4123658, 6425, 2.7967, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (295, 'q0I-N1wlwdE', 1, 4044377, 53766, 1089, 1.3563, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (296, 'z985Q4eTnks', 1, 14575611, 0, 1900, 0.0130, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (297, 'mQwdGdMGQNo', 1, 16376526, 43583, 1977, 0.2782, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (298, 'DVxpjW99ueQ', 1, 697591, 19466, 760, 2.8994, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (299, 'yFmkfJOOzE4', 1, 8716591, 383126, 4041, 4.4417, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (300, 'E0Y8OEo_zOc', 1, 1893781, 4344, 232, 0.2416, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (301, 'XXYlFuWEuKI', 1, 2130987802, 10815858, 332165, 0.5231, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (302, 'gPoiv0sZ4s4', 1, 15468450, 206749, 12627, 1.4182, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (303, 'nXeEQTnfljo', 1, 6263031, 18733, 449, 0.3063, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (304, 'aSugSGCC12I', 1, 175232231, 1910521, 66355, 1.1281, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (305, 'eVli-tstM5E', 1, 591684708, 4252319, 88504, 0.7336, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (306, '5GL9JoH4Sws', 1, 3073044859, 13134605, 484088, 0.4432, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (307, 'plNmaCuPSYw', 1, 7754118, 103979, 1437, 1.3595, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (308, '6GT7qDORxAE', 1, 4051, 0, 3, 0.0741, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (309, 'JGpQwM9fYnQ', 1, 95869, 953, 33, 1.0285, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (310, 'kPa7bsKwL-c', 1, 1667008843, 13728884, 571709, 0.8579, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (311, 'q5D2ZlBuG7g', 1, 2090089, 18456, 1143, 0.9377, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (312, 'Oa_RSwwpPaA', 1, 997891994, 6607773, 143824, 0.6766, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (313, 'NtTdainRvQ8', 1, 5504809, 194281, 2632, 3.5771, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (314, 'Rg0fyvTDfu8', 1, 2397198, 9260, 300, 0.3988, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (315, '9cZ7Nl3Ynxo', 1, 13928054, 24965, 433, 0.1824, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (316, 'M11SvDtPBhA', 1, 1138498400, 4992150, 463911, 0.4792, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (317, 'cQuJn-d0KOY', 1, 179676, 476, 15, 0.2733, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (318, 'Bk5_aL3y4ig', 1, 3713663, 20267, 247, 0.5524, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (319, 'WBy8ETk_Fqs', 1, 4545067, 0, 240, 0.0053, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (320, 'byxFUKxhT3s', 1, 154870408, 696720, 24157, 0.4655, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (321, '9Vti9E-TASg', 1, 13936472, 80840, 1128, 0.5882, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (322, '2UCBbcBT5Es', 1, 10131742, 80378, 1772, 0.8108, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (323, 'gCYcHz2k5x0', 1, 1859798714, 13033673, 352691, 0.7198, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (324, 'FC9MtWYShzg', 1, 95103735, 399796, 5840, 0.4265, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (325, 'wJnBTPUQS5A', 1, 1290196163, 11042119, 500964, 0.8947, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (326, 'WHHmiWUqIZA', 1, 47418548, 425568, 4696, 0.9074, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (327, 'zeHTVxkycgE', 1, 55151684, 394682, 11922, 0.7372, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (328, 'a4fv-BtzNmY', 1, 15438875, 95519, 4069, 0.6450, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (329, 'UScyjLs_XNU', 1, 1318936, 17151, 673, 1.3514, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (330, 'ZgvJgqi_DFk', 1, 8689748, 62448, 1927, 0.7408, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (331, 'z_7F9q7EIoI', 1, 1408740, 20146, 1224, 1.5170, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (332, 'R2KeQqLzr00', 1, 31768685, 239747, 2154, 0.7614, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (333, 'EJqFjvKF8HU', 1, 1516404, 36653, 1009, 2.4836, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (334, 'HFvjFC-YmHE', 1, 4416761, 24060, 341, 0.5525, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (335, 'mC_eGKko9FA', 1, 1008629, 36279, 1456, 3.7412, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (336, 'N6DW31S_oyI', 1, 15018376, 126260, 1426, 0.8502, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (337, '2z8GIdGkWnE', 1, 85499, 781, 43, 0.9638, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (338, 'hum1d7yvmXU', 1, 4202102, 76368, 4659, 1.9282, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (339, 'mdpSxWU4mv0', 1, 608098, 4371, 84, 0.7326, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (340, 'HvkAfj1QnK8', 1, 509707, 9225, 957, 1.9976, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (341, 'qAIy8godTy4', 1, 16923946, 130944, 1387, 0.7819, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (342, 'CE5i5Sf56vY', 1, 4936423, 17574, 164, 0.3593, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (343, 'b20j_p5_dwI', 1, 936003, 11188, 346, 1.2323, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (344, 'V6I7-39fn2Y', 1, 6137367, 26721, 565, 0.4446, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (345, 'E8xJaL_tMjw', 1, 293337, 13690, 362, 4.7904, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (346, 'YNVU7r0qVhU', 1, 331394, 984, 52, 0.3126, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (347, 'wPCMekJog4o', 1, 1931513, 6725, 125, 0.3546, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (348, 'TAx7x0rBdnY', 1, 509435, 1436, 61, 0.2939, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (349, 'N-prD5sprfs', 1, 417312, 1184, 33, 0.2916, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (350, 'yoZy2E17-50', 1, 365049751, 4391924, 125029, 1.2374, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (351, 'PImxg_WTtSc', 1, 198191, 1241, 28, 0.6403, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (352, '8inug0w8sXI', 1, 85298393, 531270, 4597, 0.6282, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (353, 'pO1XzKWCLIs', 1, 2078537, 4912, 172, 0.2446, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (354, 'reKQO4zrG64', 1, 1165070, 34926, 308, 3.0242, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (355, 'msZ0znCqn-0', 1, 2048024, 28568, 146, 1.4020, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (356, 'Slq4aeE8FoE', 1, 14533733, 163058, 3934, 1.1490, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (357, 'zMOWE6m4iP0', 1, 1718571, 26082, 200, 1.5293, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (358, 'PqF4QhB7IIU', 1, 183937, 1923, 26, 1.0596, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (359, 'mpk4ih1PNjM', 1, 289389, 6879, 109, 2.4147, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (360, 'vhodXy0A-Es', 1, 12837155, 674948, 9947, 5.3353, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (361, '4NOXfqO0l9g', 1, 1624160, 20903, 98, 1.2930, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (362, 'jEPqUxSDadI', 1, 774623, 10426, 298, 1.3844, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (363, 'GkHgQB4Wm7k', 1, 4803299, 1541, 54, 0.0332, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (364, 'a5Dn9XiChTk', 1, 3112288, 6481, 269, 0.2169, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (365, '1RhiEJqsyLI', 1, 101458, 793, 55, 0.8358, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (366, 'mw7R4RLmBg4', 1, 13019, 326, 19, 2.6500, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (367, 'gLYFLd88Xu4', 1, 880525, 2583, 72, 0.3015, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (368, 'kF4MVeWFiDs', 2, 2805730, 94435, 3789, 3.5008, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (369, '78wrful9cVU', 2, 25617689, 871989, 43866, 3.5751, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (370, '1FVF-9KQiPo', 2, 22642306, 641745, 28999, 2.9623, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (371, 'kiB9qk4gnt4', 2, 402241397, 2485223, 57642, 0.6322, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (372, 'rtwpk9rb1Dc', 2, 10533723, 381759, 16114, 3.7771, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (373, 'KFMYx1TibeQ', 2, 86165429, 554626, 15781, 0.6620, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (374, 'hwUixddbmrQ', 2, 35481844, 192130, 8766, 0.5662, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (375, 'ko70cExuzZM', 2, 386870789, 3371992, 138515, 0.9074, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (376, '7gKpREE5Z3w', 2, 3532411, 74687, 5022, 2.2565, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (377, 'qiOGfrte_Lg', 2, 26776, 4475, 572, 18.8490, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (378, 'aSkFygPCTwE', 2, 172972729, 629064, 19618, 0.3750, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (379, 'lY5V4hSLWY8', 2, 85513706, 1289672, 42586, 1.5579, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (380, 'u9Dg-g7t2l4', 2, 1172652381, 6979110, 270756, 0.6182, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (381, 'WXBHCQYxwr0', 2, 1037735331, 7627509, 155771, 0.7500, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (382, 'LHCob76kigA', 2, 1767030055, 12672329, 414198, 0.7406, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (383, 'fLexgOxsZu0', 2, 3206481890, 16529857, 676948, 0.5366, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (384, 'bkNaPl4kg7g', 2, 9168710, 150879, 6477, 1.7162, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (385, 'XXIX2WnfbpE', 2, 11680263, 537696, 25523, 4.8220, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (386, 'm__b5iBYP1Y', 2, 11970891, 22003, 329, 0.1866, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (387, 'NcP5zbMA0QU', 2, 6762, 1498, 271, 26.1609, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (388, 'KWoTyfPsqbE', 2, 24459923, 821078, 24395, 3.4566, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (389, '4LfJnj66HVQ', 2, 1204242204, 12501428, 756121, 1.1009, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (390, '5anLPw0Efmo', 2, 1094578359, 6175994, 240099, 0.5862, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (391, '5-ZiKXrnvog', 2, 180392324, 1861345, 48612, 1.0588, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (392, 'xPLGXQr7_vs', 2, 2652017, 39353, 2311, 1.5710, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (393, 'dgzN94w1lLE', 2, 8558, 879, 52, 10.8787, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (394, 'QhW3P7_jvWY', 2, 29996995, 192522, 10693, 0.6775, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (395, 'cgH0vpl4nQk', 2, 1706, 147, 29, 10.3165, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (396, 'Ra_bioBGzUg', 2, 3008, 241, 29, 8.9761, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (397, 'AxFdeZER8Eg', 2, 90935353, 522006, 11203, 0.5864, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (398, 'mjaayCARwro', 2, 381711446, 3111910, 104171, 0.8425, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (399, 'G23iLGhh9lo', 2, 38009430, 274739, 18123, 0.7705, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (400, '3ByIYof4mqo', 2, 10402440, 108429, 4068, 1.0814, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (401, 'r58GQYFZeLE', 2, 52352215, 345731, 13271, 0.6857, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (402, '9g08kucPQtE', 2, 46005704, 358033, 10511, 0.8011, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (403, 'F5eEvfOyb7k', 2, 23926890, 211675, 12925, 0.9387, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (404, 'T_Km11HNzUY', 2, 5054910, 60330, 2589, 1.2447, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (405, 'ifWOSnoCS0M', 2, 8777195, 83754, 4415, 1.0045, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (406, 'X2DTROC4JCI', 2, 33398190, 234651, 5755, 0.7198, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (407, '1vrEljMfXYo', 2, 567181344, 3609395, 177055, 0.6676, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (408, 'DmNfT-B7nlA', 2, 210343130, 1425652, 32534, 0.6932, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (409, 'XXx6RDzR6eM', 2, 38699873, 364112, 6156, 0.9568, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (410, 'W7nmB20qJv4', 2, 59689195, 611078, 14292, 1.0477, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (411, '_n9HhmX36Gk', 2, 7033489, 83348, 4094, 1.2432, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (412, 'emjLXdsj6xA', 2, 47462804, 393010, 8574, 0.8461, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (413, 'AeZRYhLDLeU', 2, 46137018, 303999, 10457, 0.6816, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (414, 'RNOTF-znQyw', 2, 49449790, 292289, 17435, 0.6263, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (415, 'pmrTPAejtAw', 2, 75220816, 516155, 15897, 0.7073, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (416, '9wT1s96JIb0', 2, 22303344, 270758, 5765, 1.2398, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (417, 'vGJTaP6anOU', 2, 471544373, 4230255, 141160, 0.9270, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (418, 'JNNKOkcojEc', 2, 34204, 3818, 140, 11.5717, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (419, '-FVrYTPBqxg', 2, 30996, 828, 102, 3.0004, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (420, '49LvI-Y_ScY', 2, 9263321, 22503, 0, 0.2429, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (421, 'NL7fgnv_VlQ', 2, 1429, 183, 3, 13.0161, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (422, 'q0u47Nl7N7M', 2, 4697803, 92540, 3390, 2.0420, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (423, 'hpn23IVQTbY', 2, 16229, 1822, 121, 11.9724, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (424, 'tigPF7zhElk', 2, 379169, 17228, 782, 4.7499, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (425, 'vuzCHdN9Okk', 2, 25998849, 136295, 637, 0.5267, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (426, 'agr3esH33SU', 2, 6979, 1483, 271, 25.1325, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (427, 'R1WQVeCq0Hs', 2, 2136754, 136810, 9417, 6.8434, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (428, 's49rOuVY3s0', 2, 8010652, 152370, 14469, 2.0827, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (429, 'P2LopW59duA', 2, 8558, 627, 39, 7.7822, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (430, '7IoSkJ-gnzM', 2, 3368397, 69383, 1163, 2.0943, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (431, 'FZm2Ci1jLe0', 2, 49419, 215, 10, 0.4553, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (432, 'KXJpP0jd9Lk', 2, 110823193, 513167, 16242, 0.4777, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (433, 'TBeGecLND84', 2, 50506299, 287744, 4417, 0.5785, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (434, '1ouf1Dt7H2A', 2, 1876262, 20138, 1520, 1.1543, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (435, 'QcS9ZndErHc', 2, 256586810, 3300761, 231502, 1.3766, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (436, 'OLVIwchMHxc', 2, 1104873, 9822, 799, 0.9613, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (437, '5CxknorIHQ4', 2, 10507, 1265, 79, 12.7915, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (438, 'xcrf_RKjaB4', 2, 412, 0, 0, 0.0000, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (439, 'gQihxm0-U64', 2, 2175755, 42364, 6736, 2.2567, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (440, '81GaF34veWA', 2, 503048062, 1634261, 39380, 0.3327, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (441, 'yKfhCPaVyYg', 2, 438694, 9280, 368, 2.1993, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (442, '6vOrbsVLPlg', 2, 4774, 159, 0, 3.3305, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (443, 'upCptHeThio', 2, 476457877, 4623335, 107345, 0.9929, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (444, 'kDhptBT_-VI', 2, 471976970, 4490481, 257571, 1.0060, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (445, '_P7S2lKif-A', 2, 1947204659, 15504388, 413633, 0.8175, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (446, 'EWcOY14GWwM', 2, 749726636, 5572108, 217194, 0.7722, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (447, 'M_eOUE6pFKY', 2, 74393023, 312013, 2108, 0.4222, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (448, '0VNARs1fbrQ', 2, 2350854, 30578, 66, 1.3035, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (449, 'kzOkza_u3Z8', 2, 260916181, 2463501, 152335, 1.0026, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (450, 'uF_w5PjpuKI', 2, 4680018, 22893, 219, 0.4938, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (451, '4N2iMmHcHys', 2, 546127862, 3371457, 83925, 0.6327, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (452, 'aHBW_Nd_z8k', 2, 189208854, 1091840, 12764, 0.5838, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (453, '3yd_eoMOvqk', 2, 1293725289, 9019772, 282132, 0.7190, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (454, 'gEAXyEUQPUs', 2, 65259763, 485037, 0, 0.7432, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (455, 'xJuVY0o7mak', 2, 4016913, 85459, 2256, 2.1836, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (456, '9QASL0SjNGQ', 2, 1199671, 28842, 668, 2.4598, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (457, 'CogD1olVZYk', 2, 103369179, 563283, 7501, 0.5522, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (458, 'vqKsHbyjjjI', 2, 87560952, 673293, 8746, 0.7789, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (459, 'RKb9WiYcfLM', 2, 142186953, 801486, 11313, 0.5716, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (460, 'iEenugG_y6c', 2, 132033840, 437135, 6286, 0.3358, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (461, 'iaXt5shHFL8', 2, 18465406, 275565, 23538, 1.6198, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (462, '1fdv0OIhzzA', 2, 527204537, 3669753, 101919, 0.7154, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (463, 'bKKRNscf5c4', 2, 4798293, 74043, 1276, 1.5697, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (464, 'FY3m6hMyh3g', 2, 235022811, 2583379, 201875, 1.1851, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (465, '3dBfojujJiQ', 2, 698547, 9879, 395, 1.4708, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (466, '5SMmxqA6-58', 2, 9365428, 89978, 1012, 0.9716, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (467, 'JjPtDl6EJ3o', 2, 111376323, 883674, 20117, 0.8115, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (468, 'yv2i9s6c69g', 2, 23554, 179, 7, 0.7897, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (469, 'WQ3wmf8KyFo', 2, 474594, 2617, 29, 0.5575, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (470, 'OFwLmOlaeV0', 2, 2294, 60, 1, 2.6591, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (471, 'XPs5XS5CtIw', 2, 823467, 7383, 87, 0.9071, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (472, '0nHHZZRYNf4', 2, 191276277, 990576, 11333, 0.5238, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (473, 'QfzMtZ3HSG0', 2, 109855, 618, 9, 0.5708, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (474, '0QULuVbkGEU', 2, 6636462, 70722, 1041, 1.0813, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (475, 'OQODghPUIqg', 2, 153981, 1556, 27, 1.0280, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (476, '4lH4Rk4iwBA', 2, 32550, 386, 2, 1.1920, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (477, '4NpT4hCgoB0', 2, 202613, 4297, 90, 2.1652, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (478, 'nRbw5SCKD8M', 2, 414, 13, 2, 3.6232, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (479, 'hfwmSryJi98', 2, 66433, 456, 2, 0.6894, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (480, 'PaQGJV4AHYg', 2, 8065, 175, 1, 2.1823, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (481, 'z5R9JzNpvPc', 2, 8878391, 51692, 0, 0.5822, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (482, 'MIjLD8KB2gs', 2, 632342, 4874, 38, 0.7768, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (483, 'Bb6nkSz8ThA', 2, 5942376, 34178, 731, 0.5875, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (484, '_urlIWLDvrA', 2, 6996965, 126962, 2170, 1.8455, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (485, 'yyq2L2Ws5Ow', 2, 75411, 685, 5, 0.9150, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (486, '63XyWeKWI0M', 2, 204520562, 1623377, 36881, 0.8118, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (487, 'Quc3PUKyGCA', 2, 542727, 5723, 30, 1.0600, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (488, 'q-uWWNcu724', 2, 14879061, 171625, 2915, 1.1731, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (489, 'Pes_L2tdrG8', 2, 999562, 6714, 91, 0.6808, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (490, 'a9MyzWfv4WU', 2, 4784766, 68840, 919, 1.4579, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (491, 'NWEd-92QkU8', 2, 1180694, 11378, 201, 0.9807, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (492, 'crJNdgAqTRQ', 2, 17537438, 386277, 8015, 2.2483, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (493, 'vKRAmLTQ9Dk', 2, 39163200, 490070, 6776, 1.2687, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (494, 'UZxnSc6VKog', 2, 88267097, 1378465, 43038, 1.6105, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (495, 'xAM51Ovpr9M', 2, 243136414, 3302322, 61698, 1.3836, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (496, 'ICkFEA5eunU', 2, 625163, 4678, 183, 0.7776, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (497, 'cIUSxV9J45w', 2, 14606, 227, 3, 1.5747, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (498, 'vau8mq3KcRw', 2, 43781712, 618627, 11796, 1.4399, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (499, 'e_xGeZDk3Sw', 2, 214517806, 3377566, 143796, 1.6415, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (500, 'GA7LcSX8tYE', 2, 89457065, 830487, 26022, 0.9575, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (501, '7pD8k2zaLqk', 2, 44679277, 393219, 8671, 0.8995, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (502, 's6dIjPBECXw', 2, 26419484, 304584, 3916, 1.1677, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (503, 'vlZ9MGgC1NI', 2, 56512454, 449161, 9498, 0.8116, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (504, '4Y_5uJpSOZM', 2, 15111041, 715221, 17348, 4.8479, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (505, 'gUnpHJgLyRs', 2, 91302348, 746882, 4068, 0.8225, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (506, 'WF7LLl7r4Os', 2, 72530234, 606184, 18416, 0.8612, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (507, 'o50J2xg8-sU', 2, 132325244, 952024, 6414, 0.7243, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (508, 'Ibfm0yE5O_8', 2, 17568397, 121050, 3461, 0.7087, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (509, 'fAHcrVZhLIA', 2, 16371573, 151150, 11188, 0.9916, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (510, 'XpvSubMyL0k', 2, 3751521, 200568, 6578, 5.5217, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (511, '3WQPW2OuUvk', 2, 423537, 52889, 3745, 13.3717, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (512, 'TwkKp-BBChg', 2, 86240790, 1143743, 55438, 1.3905, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (513, 'rC9vmpQRR40', 2, 33209322, 242776, 5929, 0.7489, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (514, 'G2huIPUuUQc', 2, 97813837, 559038, 10346, 0.5821, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (515, 'Wu-HUG7ORt8', 2, 101304755, 761144, 16488, 0.7676, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (516, 'i6fy_hdZ62I', 2, 30877, 1097, 75, 3.7957, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (517, 'YrvU5E-iF_s', 2, 2198073, 6922, 68, 0.3180, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (518, '10XarNSkw0s', 2, 289605421, 646455, 17694, 0.2293, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (519, 'V2RgfAC0Mz8', 2, 606722, 2213, 26, 0.3690, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (520, 'FCMyTR1SJM8', 2, 87400493, 1031767, 61802, 1.2512, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (521, '8blgJSoAVBc', 2, 4441909, 18699, 282, 0.4273, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (522, 'BOn-sXalHxI', 2, 1704219, 4201, 59, 0.2500, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (523, 'BEz8l69aI8Y', 2, 739695241, 1778116, 21450, 0.2433, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (524, 'owjosMjFas0', 2, 1583994, 8726, 108, 0.5577, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (525, 'UsEhWFeiCnA', 2, 302733, 991, 12, 0.3313, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (526, '8y5wbqEbj8Q', 2, 35840987, 220155, 3895, 0.6251, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (527, 'T67WZx7CxY8', 2, 62507054, 307520, 7855, 0.5045, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (528, 'OcKwmWEBi1I', 2, 82490660, 115528, 659, 0.1408, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (529, 'Dt13Wv6Opeo', 2, 129283775, 762586, 25111, 0.6093, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (530, 'eAmNdjkT5wU', 2, 18784, 138, 0, 0.7347, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (531, 'yZh9a-QX3Yo', 2, 328261, 1004, 33, 0.3159, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (532, 'lBDDMrUCz1A', 2, 16822535, 34404, 7300, 0.2479, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (533, 'jPwCxjJqHGw', 2, 115328494, 227994, 4053, 0.2012, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (534, 'wxLE0V9EFqg', 2, 168844284, 732529, 10240, 0.4399, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (535, 'YsL6eRCIwqw', 2, 6422141, 31760, 570, 0.5034, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (536, '6qwNoI2aVGo', 2, 503587, 1632, 12, 0.3265, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (537, 'yvTSFJWFMvs', 2, 809441, 9882, 82, 1.2310, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (538, 'GVSS3lh_lCY', 2, 94980975, 79294, 1255, 0.0848, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (539, 'ToabLkXUotM', 2, 92009463, 127016, 4962, 0.1434, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (540, 'aPqYwUPyZN0', 2, 5755329, 47758, 937, 0.8461, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (541, 'dzxjvHWocLA', 2, 2394196, 28468, 133, 1.1946, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (542, 'CGOKwddW7uo', 2, 7744243, 41041, 640, 0.5382, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (543, 'h3nyYuevzi8', 2, 8786, 34, 0, 0.3870, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (544, 'EEoqV07KXck', 2, 1421486, 8282, 181, 0.5954, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (545, 'Vvfs44wnHH0', 2, 10917915, 61477, 859, 0.5710, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (546, 'QWgqN_oD934', 2, 238746, 3175, 133, 1.3856, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (547, 'EMKupc9_FfM', 2, 3357579, 33775, 1349, 1.0461, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (548, 'M_p_LUseXGk', 2, 2556976, 19736, 287, 0.7831, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (549, 'ydJ7JGC9jVM', 2, 3458474, 32755, 1494, 0.9903, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (550, 'AAZmC2EcNng', 2, 49388930, 106656, 1381, 0.2187, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (551, 'lKsfbr_F6ho', 2, 335110, 1482, 30, 0.4512, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (552, 'lRt16Y_ys7g', 2, 1266531, 10523, 460, 0.8672, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (553, 'F0aus83qTW0', 2, 306940, 3090, 228, 1.0810, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (554, 'TxCOdjTyY94', 2, 56675629, 104373, 1537, 0.1869, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (555, 'T4tKkfBQRAY', 2, 31697445, 92933, 1068, 0.2966, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (556, '6p3ETYgcEN8', 2, 108537924, 366760, 3115, 0.3408, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (557, 'exTC-KFUJrM', 2, 40505397, 47782, 353, 0.1188, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (558, 'pLKlUP_BF70', 2, 25356315, 76206, 1363, 0.3059, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (559, 'wTArapD8l0w', 2, 738965, 8832, 232, 1.2266, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (560, 'sJuLi84tZy8', 2, 31428199, 73051, 692, 0.2346, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (561, 'wJPicWv_SGU', 2, 97116326, 109347, 579, 0.1132, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (562, 'iL_ljx5eXQc', 2, 45029446, 80088, 1795, 0.1818, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (563, 'GYoUeBjOCZQ', 2, 554201, 3422, 41, 0.6249, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (564, 'DosMGo4wNec', 2, 2648556, 12637, 329, 0.4895, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (565, 'sh_5wKArt-o', 2, 3935534, 23544, 304, 0.6060, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (566, '0j2dBAlv9lQ', 2, 1393737, 10845, 150, 0.7889, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (567, 'ox9zGoiJcKg', 2, 234852481, 865781, 17126, 0.3759, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (568, '2HXbHjLJhAk', 2, 184796, 4802, 201, 2.7073, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (569, 'aDDBdW8-PZo', 2, 12506467, 43524, 524, 0.3522, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (570, 'g2o3CZaVVCo', 2, 131399854, 767498, 9981, 0.5917, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (571, 'HD2sMiAwpCQ', 2, 189285985, 687877, 8939, 0.3681, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (572, 'skAvBJPTfSA', 2, 24542097, 104943, 1, 0.4276, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (573, 'y0E96wDzm-I', 2, 7084270, 112189, 1080, 1.5989, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (574, 'PvM_YAabhkk', 2, 69583797, 293295, 6967, 0.4315, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (575, '0692WFAqRxs', 2, 13828299, 164199, 4240, 1.2181, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (576, 'KzPau_0Ad7o', 2, 142663841, 395237, 4894, 0.2805, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (577, '0GdwfDhRzLY', 2, 2200523, 18716, 955, 0.8939, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (578, 'fp6p7-yxNeQ', 2, 793695, 9959, 109, 1.2685, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (579, 'lYv3IGKab44', 2, 328413, 4638, 60, 1.4305, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (580, 'KfrPqx5J4F8', 2, 37002924, 74988, 1198, 0.2059, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (581, 'w1eiO6QkQDY', 2, 6771274, 30146, 502, 0.4526, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (582, 'tptkdXcBlzY', 2, 2307815, 10051, 314, 0.4491, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (583, 'a9R7JuPdMLo', 2, 539524, 9758, 297, 1.8637, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (584, 'G4F7xkPK59o', 2, 267773, 4650, 157, 1.7952, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (585, '8tzhHzV05_0', 2, 40345984, 127981, 1984, 0.3221, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (586, 'ewnUjJkdeNI', 2, 6876157, 23707, 633, 0.3540, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (587, 'KvrYmPp0IXY', 2, 35934757, 106589, 1498, 0.3008, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (588, 'p_-VnONVoOQ', 2, 751948, 11152, 605, 1.5635, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (589, 'UtTDrO9arqI', 2, 34664295, 238325, 5036, 0.7021, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (590, 'hGD_KsvTxfo', 2, 104615, 1556, 9, 1.4960, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (591, 'pLtIr7j-eX8', 2, 307287, 2941, 3, 0.9581, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (592, 'bMhDJ0S0OBA', 2, 19021006, 413217, 24678, 2.3022, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (593, 'NYyNHZPeQ4I', 2, 14576085, 21970, 228, 0.1523, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (594, 'mHdcwc9eNjc', 2, 11414680, 62132, 0, 0.5443, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (595, 'FEfPbOnE7VM', 2, 3338305, 14559, 517, 0.4516, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (596, 'o3FYn6Hsdyw', 2, 16887943, 14763, 0, 0.0874, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (597, 'fESREcUo9ik', 2, 17628665, 84969, 1177, 0.4887, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (598, 'a2grcJdfXmY', 2, 7201712, 360279, 16581, 5.2329, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (599, 'Ve_a9CXjlQc', 2, 42090684, 173456, 5413, 0.4250, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (600, 'L3sOnIfU0QM', 2, 36906088, 219929, 8877, 0.6200, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (601, '-SEKt_0pdHM', 2, 2897717, 225866, 11246, 8.1827, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (602, 'yd_uG3TtREs', 2, 181284045, 1403836, 64041, 0.8097, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (603, 'GkG60kISnfc', 2, 62137136, 721006, 20539, 1.1934, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (604, '5L5eSTYX6wc', 2, 45083654, 94414, 1489, 0.2127, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (605, 'zDv9qV7PABI', 2, 32702110, 59618, 1000, 0.1854, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (606, 'nL2bLcCtXcM', 2, 33818852, 90344, 1092, 0.2704, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (607, 'vqkfEUqjl6Y', 2, 48243688, 544220, 51385, 1.2346, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (608, 'z0Xc_rzYZV8', 2, 11323911, 31903, 923, 0.2899, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (609, 'cvczHB0W4BY', 2, 25212, 324, 18, 1.3565, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (610, 'U6BDbXIah-Y', 2, 14577883, 883058, 61311, 6.4781, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (611, '9qkpcLK422o', 2, 47697101, 628680, 31630, 1.3844, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (612, '1LpU_nXky40', 2, 3155957, 20028, 747, 0.6583, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (613, 'oK5-nnngqA4', 2, 2325432, 9578, 316, 0.4255, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (614, 'MoU3TctXBvs', 2, 27774866, 61010, 1080, 0.2235, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (615, 'ygYPwsjyCzQ', 2, 38015059, 251236, 22058, 0.7189, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (616, 'Qrpq9iP9sg4', 2, 5381925, 40407, 1171, 0.7725, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (617, 'BZIqOKGmDV4', 2, 1549774, 21527, 220, 1.4032, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (618, 'Xtt78SW-mgg', 2, 2701690, 108543, 3901, 4.1620, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (619, 'kJQP7kiw5Fk', 2, 9010480726, 56173590, 4363523, 0.6719, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (620, 'WB9Egi9leWA', 2, 1858613, 23590, 733, 1.3087, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (621, 'GMFewiplIbw', 2, 2661529432, 8959836, 328586, 0.3490, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (622, 'VMp55KH_3wo', 2, 1737200027, 4508876, 175276, 0.2696, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (623, 'YXnjy5YlDwk', 2, 1303924400, 3777445, 100750, 0.2974, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (624, '2ZSAAI2BC1U', 2, 2226351, 22596, 838, 1.0526, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (625, 'z1g_WMMFs88', 2, 36705, 250, 2, 0.6866, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (626, 'yH1fk7WLiMc', 2, 12534967, 108608, 3587, 0.8951, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (627, 'nD3e_CQQwmM', 2, 1441898, 10773, 609, 0.7894, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (628, 'hKwCRJfiHBo', 2, 335390, 14028, 252, 4.2577, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (629, 'dkGnWUfweUQ', 2, 974839, 12731, 206, 1.3271, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (630, 'WZcLWx4fhKs', 2, 163289, 1770, 37, 1.1066, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (631, '_NwcW2GwFGY', 2, 14147715, 149479, 1528, 1.0674, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (632, 'QuSEbo03fc4', 2, 99626768, 591036, 13752, 0.6071, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (633, 'CEhLhiaygI0', 2, 335048, 9597, 87, 2.8903, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (634, 'd5q1ApthovU', 2, 4361016, 35255, 441, 0.8185, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (635, '_T_SIDKGRjs', 2, 48668447, 324126, 7368, 0.6811, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (636, 'G4rKTHSkfGE', 2, 1723738, 20200, 358, 1.1926, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (637, 'h54vH4ILDvc', 2, 206780, 3113, 77, 1.5427, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (638, 'FOtvRp-VEO0', 2, 10551960, 107351, 1413, 1.0307, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (639, 'c7l7Fnl0Oqo', 2, 1610374, 11118, 237, 0.7051, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (640, 'yQd4xQBlBa0', 2, 215575958, 1425885, 3593, 0.6631, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (641, 'N0nK0XjA3Tk', 2, 751291, 16546, 97, 2.2153, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (642, 'IMf9O3x6KzM', 2, 5150, 206, 33, 4.6408, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (643, 'fTKqtvXjkvo', 2, 38350375, 87591, 4850, 0.2410, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (644, 'ZDswWrrCGXk', 2, 8673805, 87419, 2908, 1.0414, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (645, 'pTAbOvv4vd8', 2, 15998913, 588127, 14623, 3.7674, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (646, '2lnLrCo4bdY', 2, 1012606, 21247, 310, 2.1289, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (647, 'CDBoHKXtrjs', 2, 850752, 11051, 484, 1.3559, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (648, 'MKaPVvXXhxk', 2, 4599218, 61556, 282, 1.3445, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (649, 'LuzXr3He9NI', 2, 13584504, 45868, 2879, 0.3588, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (650, 'cdTNj3y6G8I', 2, 6383137, 42785, 418, 0.6768, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (651, 'DD2rp9pe6n4', 2, 1071464, 20475, 84, 1.9188, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (652, 'zm4C9rx5fGY', 2, 13166940, 30918, 1386, 0.2453, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (653, 'oMTrz_Ym02A', 2, 647949, 5985, 383, 0.9828, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (654, 'x7lJb5mLTSM', 2, 6047133, 176333, 7502, 3.0400, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (655, '7H3DiVmLG74', 2, 952180, 7582, 101, 0.8069, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (656, 'Y5lrZeDf1T4', 2, 992810, 13493, 938, 1.4536, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (657, 'fTVvhkhCMuo', 2, 232773, 1388, 87, 0.6337, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (658, 'EuTsDjyjpJE', 2, 12170789, 453807, 9538, 3.8070, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (659, 'yZL_C-Kcxf0', 2, 20005898, 819263, 20169, 4.1959, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (660, 'ZvNnfTmBcME', 2, 1626674, 6278, 325, 0.4059, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (661, 'm1y28JAEqN8', 2, 4884685, 94435, 958, 1.9529, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (662, 'KHKJ1vFpXDs', 2, 14837279, 79688, 4455, 0.5671, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (663, 'Z6l90pTXTSY', 2, 1123705, 11987, 248, 1.0888, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (664, 'tWdlIHl8pnY', 2, 2803138, 0, 135, 0.0048, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (665, 'wBcptk5YWQI', 2, 32119825, 357608, 19105, 1.1728, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (666, 'rIt4pBtu0QA', 2, 570434, 4364, 104, 0.7833, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (667, 'E0Y8OEo_zOc', 2, 1893781, 4344, 232, 0.2416, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (668, 'gPoiv0sZ4s4', 2, 15468450, 206750, 12627, 1.4182, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (669, '6GT7qDORxAE', 2, 4068, 0, 3, 0.0737, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (670, 'l93JOUJZEoA', 2, 4662081, 159717, 25424, 3.9712, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (671, 'cQuJn-d0KOY', 2, 179694, 476, 15, 0.2732, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (672, 'JGpQwM9fYnQ', 2, 95875, 953, 33, 1.0284, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (673, 'M11SvDtPBhA', 2, 1138498400, 4992151, 463911, 0.4792, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (674, 'eVli-tstM5E', 2, 591684708, 4252320, 88504, 0.7336, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (675, 'plNmaCuPSYw', 2, 7754118, 103979, 1437, 1.3595, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (676, 'aSugSGCC12I', 2, 175232231, 1910525, 66355, 1.1281, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (677, 'Bk5_aL3y4ig', 2, 3713663, 20267, 247, 0.5524, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (678, 'CLLpSmaof4E', 2, 2656000, 5317, 172, 0.2067, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (679, 'q5D2ZlBuG7g', 2, 2090089, 18456, 1143, 0.9377, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (680, 'HL_9LIiGgj0', 2, 52254, 307, 7, 0.6009, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (681, 'nfWlot6h_JM', 2, 3675644166, 14215053, 604352, 0.4032, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (682, 'MEX3XzL2YRc', 2, 21461415, 133560, 3777, 0.6399, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (683, 'WBy8ETk_Fqs', 2, 4545067, 0, 240, 0.0053, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (684, 'Oa_RSwwpPaA', 2, 997891994, 6607772, 143824, 0.6766, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (685, 'NtTdainRvQ8', 2, 5504840, 194281, 2632, 3.5771, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (686, 'Rg0fyvTDfu8', 2, 2397198, 9260, 300, 0.3988, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (687, '5GL9JoH4Sws', 2, 3073044859, 13134606, 484088, 0.4432, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (688, 'dWix43csap4', 2, 58304, 2341, 21, 4.0512, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (689, '9Vti9E-TASg', 2, 13936472, 80840, 1128, 0.5882, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (690, 'gCYcHz2k5x0', 2, 1859799187, 13033673, 352691, 0.7198, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (691, 'a4fv-BtzNmY', 2, 15438877, 95519, 4069, 0.6450, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (692, 'EJ9Jc9blzBA', 2, 36425, 594, 14, 1.6692, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (693, 'R2KeQqLzr00', 2, 31768667, 239747, 2154, 0.7614, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (694, '2UCBbcBT5Es', 2, 10131742, 80379, 1772, 0.8108, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (695, 'z_7F9q7EIoI', 2, 1408751, 20146, 1224, 1.5169, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (696, 'sBJT1BpOcvg', 2, 4490844, 41827, 1141, 0.9568, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (697, 'V6I7-39fn2Y', 2, 6137367, 26721, 565, 0.4446, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (698, 'zeHTVxkycgE', 2, 55151684, 394682, 11922, 0.7372, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (699, '7YYBqjpmi-c', 2, 5597674, 59049, 774, 1.0687, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (700, 'sTmgaP2gYsk', 2, 16312592, 123334, 3673, 0.7786, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (701, 'UScyjLs_XNU', 2, 1318936, 17151, 673, 1.3514, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (702, 'CU1Nmb9_-dI', 2, 392219, 5886, 202, 1.5522, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (703, '71Nv50JG6RI', 2, 1426924, 13421, 500, 0.9756, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (704, '5-EuMi9-nSw', 2, 3945690, 19114, 242, 0.4906, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (705, 'EJqFjvKF8HU', 2, 1516404, 36653, 1009, 2.4836, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (706, 'mC_eGKko9FA', 2, 1008629, 36279, 1456, 3.7412, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (707, 'hum1d7yvmXU', 2, 4202102, 76368, 4659, 1.9282, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (708, 'r6fO-Ki9LzE', 2, 7714567, 91801, 5284, 1.2585, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (709, 'FC9MtWYShzg', 2, 95103735, 399796, 5840, 0.4265, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (710, 'OPQmOutTmyo', 2, 1206992, 13209, 491, 1.1351, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (711, 'HYIl_xHF5r4', 2, 308817, 7329, 653, 2.5847, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (712, 'l6gRKrU1swA', 2, 661659, 13068, 244, 2.0119, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (713, 'cVFzblT5VPE', 2, 18166957, 247576, 7320, 1.4031, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (714, 'wPCMekJog4o', 2, 1931513, 6725, 125, 0.3546, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (715, 'YNVU7r0qVhU', 2, 331394, 985, 52, 0.3129, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (716, 'OF04pKp-r9o', 2, 69113361, 438213, 12691, 0.6524, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (717, 'mpk4ih1PNjM', 2, 289389, 6879, 109, 2.4147, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (718, 'jEPqUxSDadI', 2, 774623, 10426, 298, 1.3844, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (719, 'a5Dn9XiChTk', 2, 3112288, 6481, 269, 0.2169, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (720, 'PImxg_WTtSc', 2, 198191, 1241, 28, 0.6403, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (721, 'PqF4QhB7IIU', 2, 183937, 1923, 26, 1.0596, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (722, 'zMOWE6m4iP0', 2, 1718571, 26082, 200, 1.5293, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (723, 'jaPGexY1l5A', 2, 11691009, 179902, 1602, 1.5525, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (724, '4NOXfqO0l9g', 2, 1624175, 20903, 98, 1.2930, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (725, '-tIVsACI4mI', 2, 1200, 52, 3, 4.5833, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (726, '7zUFWXx9X_c', 2, 50174365, 189330, 8750, 0.3948, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (727, 'TAx7x0rBdnY', 2, 509435, 1436, 61, 0.2939, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (728, 'vhodXy0A-Es', 2, 12837155, 674948, 9947, 5.3353, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (729, 'GkHgQB4Wm7k', 2, 4803299, 1541, 54, 0.0332, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (730, 'cce0lMgyrKc', 2, 3875690, 0, 324, 0.0084, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (731, '7bKTvsC7GUU', 2, 1120027, 601, 28, 0.0562, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (732, 'Slq4aeE8FoE', 2, 14533733, 163058, 3934, 1.1490, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (733, 'xBNYnpo4xVg', 2, 1100010, 31989, 419, 2.9462, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (734, 'BfQyu09_08w', 2, 24113671, 975928, 7528, 4.0784, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (735, 'YZJZm119nCI', 2, 909305, 3570, 1117, 0.5154, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (736, 'Cxl52-1LW_k', 3, 2875, 586, 76, 23.0261, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (737, 'oI51J1tjUBs', 3, 5248, 1019, 129, 21.8750, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (738, 'qiOGfrte_Lg', 3, 26776, 4478, 572, 18.8602, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (739, 'V9PVRfjEBTI', 3, 809797806, 5299072, 143073, 0.6720, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (740, 'WXBHCQYxwr0', 3, 1037735331, 7627509, 155771, 0.7500, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (741, 'fLexgOxsZu0', 3, 3206482948, 16529857, 676948, 0.5366, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (742, 'R1WQVeCq0Hs', 3, 2136754, 136812, 9417, 6.8435, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (743, 'kF4MVeWFiDs', 3, 2805730, 94436, 3789, 3.5009, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (744, 'ko70cExuzZM', 3, 386870789, 3371991, 138515, 0.9074, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (745, 'm__b5iBYP1Y', 3, 11970891, 22005, 329, 0.1866, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (746, '09R8_2nJtjg', 3, 4374490178, 16995519, 441325, 0.3986, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (747, 'KFMYx1TibeQ', 3, 86165429, 554627, 15781, 0.6620, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (748, '5NPBIwQyPWE', 3, 875217981, 5444604, 180580, 0.6427, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (749, 'wlS6Ix7mA0w', 3, 944472073, 5377308, 166281, 0.5870, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (750, '-RuSsuxZjIg', 3, 6128, 391, 81, 7.7023, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (751, '5anLPw0Efmo', 3, 1094578359, 6175995, 240098, 0.5862, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (752, 'XeNibQZwp00', 3, 244491, 11727, 2296, 5.7356, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (753, 'NcP5zbMA0QU', 3, 6762, 1498, 271, 26.1609, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (754, 'CcS1fsuT10M', 3, 22039082, 217826, 7424, 1.0220, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (755, '78wrful9cVU', 3, 25617689, 871992, 43866, 3.5751, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (756, 'lY5V4hSLWY8', 3, 85513706, 1289674, 42587, 1.5580, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (757, 'u9Dg-g7t2l4', 3, 1172652381, 6979111, 270756, 0.6182, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (758, 'rtwpk9rb1Dc', 3, 10534693, 381760, 16114, 3.7768, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (759, 'hiP14ED28CA', 3, 1029221570, 5984965, 128517, 0.5940, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (760, '4LfJnj66HVQ', 3, 1204242204, 12501428, 756121, 1.1009, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (761, 'dgzN94w1lLE', 3, 8558, 879, 52, 10.8787, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (762, 'Ra_bioBGzUg', 3, 3008, 241, 29, 8.9761, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (763, '2aJUnltwsqs', 3, 210724645, 1392168, 50977, 0.6848, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (764, 'qgaRVvAKoqQ', 3, 94429184, 567830, 15814, 0.6181, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (765, 'fHI8X4OXluQ', 3, 865679432, 6364240, 172545, 0.7551, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (766, 'vGJTaP6anOU', 3, 471544373, 4230255, 141160, 0.9270, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (767, 'r58GQYFZeLE', 3, 52352215, 345731, 13271, 0.6857, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (768, 'a7fzkqLozwA', 3, 448036654, 2900175, 47547, 0.6579, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (769, 'G23iLGhh9lo', 3, 38009430, 274739, 18123, 0.7705, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (770, 'QhW3P7_jvWY', 3, 29996995, 192522, 10693, 0.6775, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (771, 'oqv35UZepIM', 3, 309071672, 2291339, 36620, 0.7532, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (772, '1vrEljMfXYo', 3, 567181344, 3609396, 177055, 0.6676, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (773, 'x47TgeRJtH0', 3, 81086929, 849305, 9533, 1.0592, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (774, 'W7nmB20qJv4', 3, 59689394, 611078, 14292, 1.0477, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (775, 'AxFdeZER8Eg', 3, 90935353, 522006, 11203, 0.5864, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (776, '9wT1s96JIb0', 3, 22303344, 270758, 5765, 1.2398, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (777, 'F5eEvfOyb7k', 3, 23926890, 211675, 12925, 0.9387, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (778, 'RNOTF-znQyw', 3, 49449790, 292289, 17435, 0.6263, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (779, '56hqrlQxMMI', 3, 71114702, 504863, 12080, 0.7269, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (780, 'ZRHHOttkM1A', 3, 164768780, 1814249, 26644, 1.1173, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (781, 'oacaq_1TkMU', 3, 92474983, 438286, 10696, 0.4855, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (782, 'XXx6RDzR6eM', 3, 38699873, 364112, 6156, 0.9568, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (783, 'xy3AcmW0lrQ', 3, 140509640, 1051038, 18284, 0.7610, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (784, 'rTKpYJ80OVQ', 3, 50315735, 404732, 7852, 0.8200, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (785, 'XfMVF-o7g1o', 3, 823797, 40534, 1903, 5.1514, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (786, '-FVrYTPBqxg', 3, 30996, 828, 102, 3.0004, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (787, 'JNNKOkcojEc', 3, 34204, 3819, 140, 11.5747, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (788, '49LvI-Y_ScY', 3, 9263321, 22503, 0, 0.2429, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (789, 'tigPF7zhElk', 3, 379169, 17231, 782, 4.7507, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (790, 'NL7fgnv_VlQ', 3, 1429, 184, 3, 13.0861, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (791, 'agr3esH33SU', 3, 6979, 1484, 271, 25.1469, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (792, 'q0u47Nl7N7M', 3, 4697803, 92540, 3390, 2.0420, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (793, 'vuzCHdN9Okk', 3, 25998927, 136295, 637, 0.5267, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (794, 'xcrf_RKjaB4', 3, 413, 0, 0, 0.0000, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (795, 'mAlFutzMbGI', 3, 1207, 189, 39, 18.8898, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (796, 'hk24Oj-Txsw', 3, 250, 56, 17, 29.2000, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (797, 'P2LopW59duA', 3, 8558, 627, 39, 7.7822, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (798, 'TBeGecLND84', 3, 50506299, 287744, 4417, 0.5785, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (799, 'hpn23IVQTbY', 3, 16229, 1822, 121, 11.9724, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (800, 'FZm2Ci1jLe0', 3, 49679, 215, 10, 0.4529, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (801, 's49rOuVY3s0', 3, 8010652, 152370, 14469, 2.0827, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (802, 'KXJpP0jd9Lk', 3, 110823193, 513167, 16242, 0.4777, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (803, '81GaF34veWA', 3, 503048062, 1634261, 39380, 0.3327, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (804, '1ouf1Dt7H2A', 3, 1876262, 20138, 1520, 1.1543, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (805, 'Uf-PyfpJCfI', 3, 9938882, 226854, 11375, 2.3969, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (806, 'OLVIwchMHxc', 3, 1104873, 9822, 799, 0.9613, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (807, '5CxknorIHQ4', 3, 10507, 1265, 79, 12.7915, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (808, 'H6hEO4jwpuA', 3, 3020, 317, 37, 11.7219, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (809, 'MDxSeWwpyJ0', 3, 2910, 245, 60, 10.4811, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (810, 'upCptHeThio', 3, 476457877, 4623335, 107345, 0.9929, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (811, 'iaXt5shHFL8', 3, 18465406, 275565, 23538, 1.6198, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (812, 'kDhptBT_-VI', 3, 471976970, 4490480, 257571, 1.0060, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (813, 'JjPtDl6EJ3o', 3, 111376323, 883675, 20117, 0.8115, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (814, '_P7S2lKif-A', 3, 1947204659, 15504387, 413633, 0.8175, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (815, 'yfIPC-Erjbg', 3, 1648407, 12611, 204, 0.7774, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (816, 'EWcOY14GWwM', 3, 749726636, 5572108, 217194, 0.7722, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (817, 'mQ5wP0YazOE', 3, 1297511, 8287, 255, 0.6583, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (818, '3dBfojujJiQ', 3, 698547, 9879, 395, 1.4708, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (819, 'N441ZM2VHv4', 3, 1979379, 12441, 1372, 0.6978, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (820, 'M_eOUE6pFKY', 3, 74393285, 312013, 2108, 0.4222, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (821, 'Wc6iLg3mL7g', 3, 2986572, 70687, 1465, 2.4159, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (822, 'bKKRNscf5c4', 3, 4798301, 74042, 1276, 1.5697, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (823, 'ZiEyxl1bVr0', 3, 11578526, 100547, 5294, 0.9141, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (824, 'gEAXyEUQPUs', 3, 65259763, 485037, 0, 0.7432, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (825, 'XQIBSlB8MAc', 3, 167763, 6535, 212, 4.0217, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (826, 'eVz10_sCHJw', 3, 17196134, 212347, 2531, 1.2496, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (827, 'uF_w5PjpuKI', 3, 4680018, 22893, 219, 0.4938, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (828, 'wKycFNLaxFU', 3, 466544, 0, 159, 0.0341, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (829, 'uqY-3RS-V0Y', 3, 29608941, 154034, 1297, 0.5246, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (830, 'ZDmrqzOFEjc', 3, 2695673, 54576, 617, 2.0475, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (831, 'D60K8BU6lsY', 3, 33320152, 442252, 6314, 1.3462, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (832, 'RtTf76WAO6s', 3, 10294050, 329502, 7093, 3.2698, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (833, 'oGCu47JESi0', 3, 1534941, 25899, 250, 1.7036, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (834, 'aDl44-M6M0E', 3, 6333290, 152013, 8911, 2.5409, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (835, 'yv2i9s6c69g', 3, 23554, 179, 7, 0.7897, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (836, 'OFwLmOlaeV0', 3, 2294, 60, 1, 2.6591, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (837, 'WQ3wmf8KyFo', 3, 474594, 2617, 29, 0.5575, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (838, '0nHHZZRYNf4', 3, 191276672, 990576, 11333, 0.5238, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (839, 'XPs5XS5CtIw', 3, 823467, 7383, 87, 0.9071, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (840, 'Bb6nkSz8ThA', 3, 5942376, 34178, 731, 0.5875, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (841, 'uuoL1k_gaeA', 3, 217865311, 4088203, 148798, 1.9448, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (842, 'a9MyzWfv4WU', 3, 4784766, 68840, 919, 1.4579, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (843, '_urlIWLDvrA', 3, 6996965, 126962, 2170, 1.8455, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (844, 'OQODghPUIqg', 3, 153981, 1556, 27, 1.0280, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (845, '4lH4Rk4iwBA', 3, 32550, 386, 2, 1.1920, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (846, '0QULuVbkGEU', 3, 6636462, 70722, 1041, 1.0813, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (847, 'z5R9JzNpvPc', 3, 8878391, 51691, 0, 0.5822, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (848, 'QfzMtZ3HSG0', 3, 109855, 618, 9, 0.5708, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (849, 'MIjLD8KB2gs', 3, 632342, 4874, 38, 0.7768, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (850, '4NpT4hCgoB0', 3, 202613, 4297, 90, 2.1652, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (851, 'PaQGJV4AHYg', 3, 8098, 175, 1, 2.1734, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (852, '63XyWeKWI0M', 3, 204520645, 1623377, 36881, 0.8118, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (853, 'q-uWWNcu724', 3, 14879061, 171625, 2915, 1.1731, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (854, 'hfwmSryJi98', 3, 66433, 456, 2, 0.6894, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (855, '0lgAIjua6pA', 3, 143657253, 604541, 5058, 0.4243, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (856, 'Quc3PUKyGCA', 3, 542727, 5723, 30, 1.0600, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (857, 'crJNdgAqTRQ', 3, 17537438, 386277, 8015, 2.2483, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (858, 'PI23ldAvdHY', 3, 18328786, 251503, 6424, 1.4072, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (859, 'hbm-DXoQhcg', 3, 88942, 788, 14, 0.9017, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (860, 'vKRAmLTQ9Dk', 3, 39163200, 490070, 6776, 1.2687, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (861, 'ICkFEA5eunU', 3, 625163, 4678, 183, 0.7776, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (862, 'UZxnSc6VKog', 3, 88267097, 1378465, 43038, 1.6105, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (863, 'Ibfm0yE5O_8', 3, 17568397, 121050, 3461, 0.7087, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (864, 'vau8mq3KcRw', 3, 43781718, 618627, 11796, 1.4399, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (865, 'GA7LcSX8tYE', 3, 89457218, 830487, 26022, 0.9575, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (866, 'e_xGeZDk3Sw', 3, 214517806, 3377566, 143796, 1.6415, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (867, 'cIUSxV9J45w', 3, 14606, 227, 3, 1.5747, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (868, 'xAM51Ovpr9M', 3, 243136414, 3302321, 61698, 1.3836, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (869, '4Y_5uJpSOZM', 3, 15111041, 715221, 17348, 4.8479, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (870, 's6dIjPBECXw', 3, 26419798, 304584, 3916, 1.1677, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (871, 'o50J2xg8-sU', 3, 132325517, 952024, 6414, 0.7243, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (872, 'WF7LLl7r4Os', 3, 72530234, 606184, 18416, 0.8612, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (873, 'gUnpHJgLyRs', 3, 91302348, 746882, 4069, 0.8225, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (874, 'eWa95Ym9sZ0', 3, 11108830, 70259, 3086, 0.6602, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (875, '7pD8k2zaLqk', 3, 44679277, 393219, 8671, 0.8995, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (876, 'i6fy_hdZ62I', 3, 30877, 1097, 75, 3.7957, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (877, 'rC9vmpQRR40', 3, 33209322, 242776, 5929, 0.7489, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (878, 'XpvSubMyL0k', 3, 3751521, 200568, 6578, 5.5217, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (879, '3WQPW2OuUvk', 3, 423537, 52889, 3745, 13.3717, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (880, 'xfpFe7CZ4Do', 3, 25004485, 170737, 2513, 0.6929, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (881, 'G2huIPUuUQc', 3, 97813837, 559038, 10346, 0.5821, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (882, 'vlZ9MGgC1NI', 3, 56512454, 449162, 9498, 0.8116, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (883, 'idDCk4RTx4g', 3, 50858901, 1047718, 25723, 2.1106, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (884, 'YrvU5E-iF_s', 3, 2198073, 6922, 68, 0.3180, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (885, 'V2RgfAC0Mz8', 3, 606722, 2213, 26, 0.3690, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (886, '10XarNSkw0s', 3, 289605421, 646455, 17694, 0.2293, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (887, 'BEz8l69aI8Y', 3, 739696243, 1778115, 21450, 0.2433, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (888, '8blgJSoAVBc', 3, 4441909, 18699, 282, 0.4273, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (889, 'UsEhWFeiCnA', 3, 302733, 991, 12, 0.3313, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (890, 'yZh9a-QX3Yo', 3, 328268, 1004, 33, 0.3159, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (891, 'BOn-sXalHxI', 3, 1704219, 4201, 59, 0.2500, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (892, 'GVSS3lh_lCY', 3, 94980975, 79294, 1255, 0.0848, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (893, 'kI6ywewtYkc', 3, 126401525, 220604, 3769, 0.1775, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (894, 'H97EFhNUADY', 3, 636205, 10594, 775, 1.7870, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (895, 'aPqYwUPyZN0', 3, 5755329, 47758, 937, 0.8461, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (896, 'T67WZx7CxY8', 3, 62507667, 307520, 7855, 0.5045, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (897, 'ToabLkXUotM', 3, 92009463, 127016, 4962, 0.1434, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (898, 'Dt13Wv6Opeo', 3, 129283775, 762586, 25111, 0.6093, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (899, 'OcKwmWEBi1I', 3, 82490826, 115528, 659, 0.1408, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (900, 'owjosMjFas0', 3, 1583994, 8726, 108, 0.5577, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (901, 'E7UBYWn_69c', 3, 880437, 1479, 22, 0.1705, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (902, 'PtJDSomNoUM', 3, 253448, 879, 17, 0.3535, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (903, 'MO37-1KgcI4', 3, 66637209, 356688, 28136, 0.5775, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (904, 'jPwCxjJqHGw', 3, 115328494, 227994, 4053, 0.2012, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (905, '5ymK_qr474k', 3, 15891827, 22036, 10108, 0.2023, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (906, 'Vai1oBXCiiA', 3, 3014458, 11963, 1635, 0.4511, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (907, 'hRcYZVuQtjA', 3, 791088, 12856, 109, 1.6389, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (908, 'CGOKwddW7uo', 3, 7744243, 41041, 640, 0.5382, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (909, 'h3nyYuevzi8', 3, 8786, 34, 0, 0.3870, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (910, 'AAZmC2EcNng', 3, 49388930, 106656, 1381, 0.2187, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (911, 'Vvfs44wnHH0', 3, 10917915, 61477, 859, 0.5710, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (912, 'ozLE7N5uEfw', 3, 49537682, 104012, 1378, 0.2127, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (913, 'lKsfbr_F6ho', 3, 335110, 1482, 30, 0.4512, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (914, 'QWgqN_oD934', 3, 238763, 3175, 133, 1.3855, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (915, 'EEoqV07KXck', 3, 1421486, 8282, 181, 0.5954, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (916, 'ydJ7JGC9jVM', 3, 3458474, 32755, 1494, 0.9903, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (917, 'TxCOdjTyY94', 3, 56675629, 104373, 1537, 0.1869, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (918, 'EMKupc9_FfM', 3, 3357579, 33776, 1349, 1.0461, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (919, '6p3ETYgcEN8', 3, 108538142, 366760, 3115, 0.3408, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (920, 'of6fAGawnUc', 3, 114618670, 175528, 2184, 0.1550, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (921, 'lRt16Y_ys7g', 3, 1266531, 10523, 460, 0.8672, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (922, 'fBNW09FVtEA', 3, 56577154, 144360, 1255, 0.2574, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (923, 'wJPicWv_SGU', 3, 97116326, 109347, 579, 0.1132, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (924, 'exTC-KFUJrM', 3, 40505397, 47782, 353, 0.1188, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (925, 'JmfRmK-v7UU', 3, 12387232, 50674, 1630, 0.4222, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (926, 'M_p_LUseXGk', 3, 2556984, 19736, 287, 0.7831, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (927, 'sJuLi84tZy8', 3, 31428199, 73051, 692, 0.2346, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (928, 'AA-sNG6eIyI', 3, 2923510, 15343, 354, 0.5369, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (929, 'iL_ljx5eXQc', 3, 45029446, 80088, 1795, 0.1818, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (930, '-Y1k19Z06iQ', 3, 1006880, 16497, 277, 1.6659, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (931, 'pLKlUP_BF70', 3, 25356315, 76206, 1363, 0.3059, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (932, '0j2dBAlv9lQ', 3, 1393737, 10845, 150, 0.7889, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (933, 'ox9zGoiJcKg', 3, 234852481, 865781, 17126, 0.3759, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (934, '8_bs7PKJuO0', 3, 317248, 4717, 51, 1.5029, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (935, 'aDDBdW8-PZo', 3, 12506467, 43524, 524, 0.3522, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (936, 'HD2sMiAwpCQ', 3, 189285985, 687878, 8939, 0.3681, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (937, 'y0E96wDzm-I', 3, 7084270, 112189, 1080, 1.5989, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (938, 'skAvBJPTfSA', 3, 24542097, 104943, 1, 0.4276, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (939, '2HXbHjLJhAk', 3, 184796, 4802, 201, 2.7073, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (940, 'g2o3CZaVVCo', 3, 131399854, 767498, 9981, 0.5917, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (941, 'ewnUjJkdeNI', 3, 6876157, 23707, 633, 0.3540, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (942, 'KfrPqx5J4F8', 3, 37002924, 74988, 1198, 0.2059, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (943, 'lYv3IGKab44', 3, 328413, 4638, 60, 1.4305, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (944, 'pLtIr7j-eX8', 3, 307287, 2941, 3, 0.9581, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (945, 'hGD_KsvTxfo', 3, 104615, 1556, 9, 1.4960, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (946, 'tptkdXcBlzY', 3, 2307815, 10051, 314, 0.4491, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (947, '0GdwfDhRzLY', 3, 2200523, 18716, 955, 0.8939, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (948, 'w1eiO6QkQDY', 3, 6771274, 30146, 502, 0.4526, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (949, 'fp6p7-yxNeQ', 3, 793695, 9959, 109, 1.2685, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (950, 'PvM_YAabhkk', 3, 69583797, 293295, 6967, 0.4315, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (951, 'gfuJOymXwH4', 3, 2627692, 75469, 820, 2.9033, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (952, 'xNmehcf7bqI', 3, 193905, 2710, 0, 1.3976, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (953, 'P4UViMg6ofY', 3, 35356, 262, 1, 0.7439, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (954, 'UtTDrO9arqI', 3, 34664295, 238325, 5036, 0.7021, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (955, '2xCYS4TjLJM', 3, 7247210, 190536, 3130, 2.6723, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (956, 'UKx8bw1mP2E', 3, 391401, 5018, 63, 1.2982, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (957, 'mjEtZsq-rEA', 3, 2544, 199, 6, 8.0582, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (958, 'nvtGsaMv9yc', 3, 32014271, 57521, 1444, 0.1842, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (959, '5L5eSTYX6wc', 3, 45083654, 94414, 1489, 0.2127, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (960, 'mHdcwc9eNjc', 3, 11414680, 62132, 0, 0.5443, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (961, 'o3FYn6Hsdyw', 3, 16887943, 14762, 0, 0.0874, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (962, 'NYyNHZPeQ4I', 3, 14576085, 21970, 228, 0.1523, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (963, 'z0Xc_rzYZV8', 3, 11323911, 31903, 923, 0.2899, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (964, 'bMhDJ0S0OBA', 3, 19021006, 413218, 24679, 2.3022, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (965, 'Wm97ow7T8J8', 3, 14654833, 27524, 989, 0.1946, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (966, 'zDv9qV7PABI', 3, 32702110, 59618, 1000, 0.1854, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (967, 'AYQNN7OAHpM', 3, 8448044, 17486, 0, 0.2070, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (968, 'Qrpq9iP9sg4', 3, 5381925, 40407, 1171, 0.7725, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (969, 'FEfPbOnE7VM', 3, 3338305, 14558, 517, 0.4516, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (970, 'fESREcUo9ik', 3, 17628665, 84969, 1177, 0.4887, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (971, 'MoU3TctXBvs', 3, 27774866, 61010, 1080, 0.2235, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (972, 'RIdSu-q46Y0', 3, 43350609, 244494, 3876, 0.5729, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (973, 'L3sOnIfU0QM', 3, 36906088, 219929, 8877, 0.6200, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (974, 'co-TFLbaZAE', 3, 263766622, 2436870, 91903, 0.9587, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (975, 'GkG60kISnfc', 3, 62137136, 721007, 20539, 1.1934, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (976, 'FGrbMP4ksk8', 3, 16334516, 78718, 255, 0.4835, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (977, 'cvczHB0W4BY', 3, 25212, 324, 18, 1.3565, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (978, 'jWQx2f-CErU', 3, 283856971, 2537985, 95487, 0.9277, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (979, 'yd_uG3TtREs', 3, 181284045, 1403839, 64041, 0.8097, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (980, 'nL2bLcCtXcM', 3, 33820883, 90344, 1092, 0.2704, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (981, 'U6BDbXIah-Y', 3, 14577883, 883066, 61312, 6.4782, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (982, 'iojQFPplbic', 3, 24508378, 106596, 894, 0.4386, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (983, 'GMFewiplIbw', 3, 2661529432, 8959836, 328587, 0.3490, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (984, 'WB9Egi9leWA', 3, 1858613, 23590, 733, 1.3087, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (985, 'kJQP7kiw5Fk', 3, 9010482439, 56173590, 4363523, 0.6719, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (986, 'yH1fk7WLiMc', 3, 12534967, 108608, 3587, 0.8951, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (987, 'BZIqOKGmDV4', 3, 1549774, 21527, 220, 1.4032, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (988, 'Us2ZvSRUB1k', 3, 9264611, 39235, 560, 0.4295, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (989, 'VMp55KH_3wo', 3, 1737200027, 4508876, 175276, 0.2696, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (990, '_NwcW2GwFGY', 3, 14147715, 149479, 1528, 1.0674, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (991, 'jCY6d1F16eQ', 3, 593856, 6438, 135, 1.1068, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (992, 'dkGnWUfweUQ', 3, 974839, 12731, 206, 1.3271, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (993, 'QuSEbo03fc4', 3, 99626768, 591036, 13752, 0.6071, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (994, 'hKwCRJfiHBo', 3, 335390, 14028, 252, 4.2577, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (995, 'YXnjy5YlDwk', 3, 1303924400, 3777445, 100750, 0.2974, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (996, 'wnJ6LuUFpMo', 3, 3643659046, 19133405, 531616, 0.5397, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (997, 'nD3e_CQQwmM', 3, 1441898, 10773, 609, 0.7894, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (998, 'FOtvRp-VEO0', 3, 10551960, 107351, 1413, 1.0307, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (999, 'n7OUYLY5DG4', 3, 1622043, 64681, 2066, 4.1150, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1000, 'TyHvyGVs42U', 3, 2503870379, 10701968, 337966, 0.4409, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1001, '2ZSAAI2BC1U', 3, 2226351, 22596, 838, 1.0526, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1002, 'NUsoVlDFqZg', 3, 3825543938, 11914048, 300095, 0.3193, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1003, 'iHy9WrnYnlA', 3, 273155, 1845, 26, 0.6850, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1004, '1_zgKRBrT0Y', 3, 3130673122, 14232514, 388675, 0.4670, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1005, 'VqEbCxg2bNI', 3, 2822293539, 9393850, 283391, 0.3429, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1006, '9im7yVc_jGA', 3, 95371, 1202, 22, 1.2834, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1007, 'z1g_WMMFs88', 3, 36705, 250, 2, 0.6866, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1008, 'IMf9O3x6KzM', 3, 5150, 206, 33, 4.6408, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1009, 'S0lx-sIjbHA', 3, 36313, 416, 22, 1.2062, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1010, 'k3cZ6qaqkMo', 3, 13006, 37, 0, 0.2845, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1011, 'LuzXr3He9NI', 3, 13584552, 45868, 2879, 0.3588, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1012, 'fTKqtvXjkvo', 3, 38350375, 87591, 4850, 0.2410, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1013, 'uRiB1tsFIkE', 3, 35950538, 165178, 6791, 0.4783, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1014, 'MKaPVvXXhxk', 3, 4599218, 61556, 282, 1.3445, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1015, 'Y5lrZeDf1T4', 3, 992810, 13493, 938, 1.4536, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1016, 'zm4C9rx5fGY', 3, 13166940, 30917, 1386, 0.2453, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1017, 'gLDQ7Yvww7Q', 3, 51957, 143, 5, 0.2849, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1018, 'rIt4pBtu0QA', 3, 570434, 4364, 104, 0.7833, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1019, 'CDBoHKXtrjs', 3, 850752, 11051, 484, 1.3559, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1020, '2lnLrCo4bdY', 3, 1012606, 21247, 310, 2.1289, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1021, 'ed1RJCuNWAo', 3, 3240010, 15286, 387, 0.4837, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1022, 'k6aqTBFpPl0', 3, 411691, 3746, 61, 0.9247, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1023, 'wBcptk5YWQI', 3, 32119825, 357608, 19105, 1.1728, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1024, '4UWwpyYF4lo', 3, 2704617, 27227, 144, 1.0120, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1025, 'q0I-N1wlwdE', 3, 4044377, 53766, 1089, 1.3563, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1026, '7H3DiVmLG74', 3, 952180, 7582, 101, 0.8069, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1027, 'UOrCIg_Qu3o', 3, 4141449, 37253, 542, 0.9126, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1028, 'YNVU7r0qVhU', 3, 331394, 984, 52, 0.3126, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1029, 'z985Q4eTnks', 3, 14575611, 0, 1900, 0.0130, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1030, 'gLYFLd88Xu4', 3, 880525, 2583, 72, 0.3015, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1031, 't1MnvH6GPJ4', 3, 147678125, 4123657, 6425, 2.7967, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1032, 'PImxg_WTtSc', 3, 198191, 1241, 28, 0.6403, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1033, 'E0Y8OEo_zOc', 3, 1893815, 4344, 232, 0.2416, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1034, 'gPoiv0sZ4s4', 3, 15468450, 206750, 12627, 1.4182, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1035, 'nXeEQTnfljo', 3, 6263056, 18733, 449, 0.3063, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1036, 'mS95hDkYEJc', 3, 694, 47, 2, 7.0605, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1037, 'OPf0YbXqDm0', 3, 5806754432, 23316272, 651219, 0.4128, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1038, 'aSugSGCC12I', 3, 175234209, 1910529, 66355, 1.1281, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1039, '6GT7qDORxAE', 3, 4068, 0, 3, 0.0737, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1040, 'XXYlFuWEuKI', 3, 2130987802, 10815858, 332165, 0.5231, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1041, 'eVli-tstM5E', 3, 591684708, 4252321, 88504, 0.7336, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1042, 'JGpQwM9fYnQ', 3, 95875, 953, 33, 1.0284, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1043, '5GL9JoH4Sws', 3, 3073045871, 13134605, 484088, 0.4432, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1044, 'Bk5_aL3y4ig', 3, 3713680, 20267, 247, 0.5524, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1045, 'q5D2ZlBuG7g', 3, 2090089, 18456, 1143, 0.9377, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1046, 'M11SvDtPBhA', 3, 1138498400, 4992152, 463911, 0.4792, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1047, 'plNmaCuPSYw', 3, 7754122, 103979, 1437, 1.3595, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1048, 'MEX3XzL2YRc', 3, 21461415, 133560, 3777, 0.6399, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1049, 'NtTdainRvQ8', 3, 5504840, 194280, 2632, 3.5771, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1050, 'cQuJn-d0KOY', 3, 179694, 476, 15, 0.2732, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1051, 'V7Wc2O6HUsM', 3, 1711578, 10194, 221, 0.6085, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1052, 'WBy8ETk_Fqs', 3, 4545067, 0, 240, 0.0053, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1053, 'Rg0fyvTDfu8', 3, 2397198, 9260, 300, 0.3988, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1054, '9Vti9E-TASg', 3, 13936530, 80840, 1128, 0.5882, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1055, '2UCBbcBT5Es', 3, 10131742, 80379, 1772, 0.8108, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1056, 'gCYcHz2k5x0', 3, 1859799187, 13033673, 352691, 0.7198, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1057, '7YYBqjpmi-c', 3, 5597674, 59049, 774, 1.0687, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1058, 'CE5i5Sf56vY', 3, 4936423, 17574, 164, 0.3593, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1059, 'UScyjLs_XNU', 3, 1318936, 17151, 673, 1.3514, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1060, 'FC9MtWYShzg', 3, 95103735, 399795, 5840, 0.4265, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1061, 'wJnBTPUQS5A', 3, 1290196816, 11042119, 500964, 0.8947, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1062, 'a4fv-BtzNmY', 3, 15438877, 95519, 4069, 0.6450, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1063, 'zeHTVxkycgE', 3, 55151684, 394682, 11922, 0.7372, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1064, '2z8GIdGkWnE', 3, 85499, 781, 43, 0.9638, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1065, 'EJqFjvKF8HU', 3, 1516404, 36653, 1009, 2.4836, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1066, 'R2KeQqLzr00', 3, 31768667, 239747, 2154, 0.7614, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1067, 'WHHmiWUqIZA', 3, 47418628, 425568, 4696, 0.9074, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1068, 'gU2Jzsa9Q_Y', 3, 1356162, 11207, 169, 0.8388, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1069, '5-EuMi9-nSw', 3, 3945690, 19114, 242, 0.4906, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1070, 'z_7F9q7EIoI', 3, 1408751, 20146, 1224, 1.5169, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1071, 'V6I7-39fn2Y', 3, 6137367, 26721, 565, 0.4446, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1072, 'mC_eGKko9FA', 3, 1008629, 36279, 1456, 3.7412, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1073, 'mdpSxWU4mv0', 3, 608098, 4371, 84, 0.7326, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1074, 'cVFzblT5VPE', 3, 18166957, 247576, 7320, 1.4031, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1075, 'sBJT1BpOcvg', 3, 4490844, 41827, 1141, 0.9568, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1076, 'qAIy8godTy4', 3, 16923946, 130944, 1387, 0.7819, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1077, 'HFvjFC-YmHE', 3, 4416761, 24061, 341, 0.5525, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1078, 'hum1d7yvmXU', 3, 4202102, 76368, 4659, 1.9282, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1079, 'wPCMekJog4o', 3, 1931513, 6725, 125, 0.3546, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1080, 'iP6XpLQM2Cs', 3, 755690169, 5223813, 221543, 0.7206, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1081, 'pO1XzKWCLIs', 3, 2078537, 4912, 172, 0.2446, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1082, 'msZ0znCqn-0', 3, 2048024, 28568, 146, 1.4020, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1083, 'PqF4QhB7IIU', 3, 183937, 1923, 26, 1.0596, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1084, 'jEPqUxSDadI', 3, 774623, 10426, 298, 1.3844, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1085, '8inug0w8sXI', 3, 85299958, 531271, 4597, 0.6282, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1086, 'mpk4ih1PNjM', 3, 289389, 6879, 109, 2.4147, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1087, 'reKQO4zrG64', 3, 1165070, 34926, 308, 3.0242, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1088, 'vhodXy0A-Es', 3, 12837155, 674947, 9947, 5.3352, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1089, 'zMOWE6m4iP0', 3, 1718571, 26082, 200, 1.5293, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1090, 'a5Dn9XiChTk', 3, 3112288, 6481, 269, 0.2169, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1091, 'Slq4aeE8FoE', 3, 14533733, 163058, 3934, 1.1490, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1092, 'GkHgQB4Wm7k', 3, 4803299, 1541, 54, 0.0332, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1093, '4NOXfqO0l9g', 3, 1624175, 20903, 98, 1.2930, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1094, 'TAx7x0rBdnY', 3, 509435, 1436, 61, 0.2939, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1095, 'fTVvhkhCMuo', 3, 232773, 1388, 87, 0.6337, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1096, 'X2Nv4KqRGK0', 3, 567635, 6696, 36, 1.1860, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1097, 'GJ2v96T9xOk', 3, 97842210, 1165644, 15075, 1.2068, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1098, 'Cxl52-1LW_k', 4, 2875, 586, 76, 23.0261, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1099, 'V9PVRfjEBTI', 4, 809797806, 5299074, 143073, 0.6720, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1100, 'WXBHCQYxwr0', 4, 1037735331, 7627509, 155771, 0.7500, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1101, 'oI51J1tjUBs', 4, 5248, 1019, 129, 21.8750, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1102, 'qiOGfrte_Lg', 4, 26776, 4482, 572, 18.8751, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1103, 'fLexgOxsZu0', 4, 3206484479, 16529856, 676948, 0.5366, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1104, 'R1WQVeCq0Hs', 4, 2136754, 136813, 9417, 6.8436, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1105, '-RuSsuxZjIg', 4, 6144, 391, 81, 7.6823, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1106, '09R8_2nJtjg', 4, 4374490178, 16995518, 441325, 0.3986, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1107, 'kF4MVeWFiDs', 4, 2805730, 94437, 3789, 3.5009, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1108, 'wZTIdnooV-s', 4, 315219144, 1901338, 46481, 0.6179, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1109, 'ko70cExuzZM', 4, 386870789, 3371991, 138515, 0.9074, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1110, 'm__b5iBYP1Y', 4, 11970891, 22007, 329, 0.1866, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1111, '5NPBIwQyPWE', 4, 875219246, 5444603, 180580, 0.6427, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1112, 'CcS1fsuT10M', 4, 22039082, 217826, 7424, 1.0220, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1113, 'wlS6Ix7mA0w', 4, 944472073, 5377308, 166281, 0.5870, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1114, '5anLPw0Efmo', 4, 1094578359, 6175995, 240098, 0.5862, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1115, 'KFMYx1TibeQ', 4, 86165429, 554627, 15781, 0.6620, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1116, 'rtwpk9rb1Dc', 4, 10534693, 381760, 16114, 3.7768, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1117, 'lY5V4hSLWY8', 4, 85513706, 1289675, 42587, 1.5580, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1118, 'u9Dg-g7t2l4', 4, 1172652381, 6979112, 270756, 0.6182, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1119, '4LfJnj66HVQ', 4, 1204242204, 12501428, 756121, 1.1009, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1120, 'XXIX2WnfbpE', 4, 11680263, 537701, 25523, 4.8220, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1121, '78wrful9cVU', 4, 25617689, 871992, 43866, 3.5751, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1122, 'NcP5zbMA0QU', 4, 6762, 1498, 271, 26.1609, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1123, 'dgzN94w1lLE', 4, 8558, 880, 52, 10.8904, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1124, 'Ra_bioBGzUg', 4, 3008, 241, 29, 8.9761, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1125, 'qgaRVvAKoqQ', 4, 94429184, 567831, 15814, 0.6181, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1126, 'fHI8X4OXluQ', 4, 865679432, 6364240, 172545, 0.7551, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1127, 'r58GQYFZeLE', 4, 52352215, 345731, 13271, 0.6857, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1128, 'vGJTaP6anOU', 4, 471544751, 4230256, 141160, 0.9270, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1129, 'oqv35UZepIM', 4, 309071999, 2291339, 36620, 0.7532, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1130, 'G23iLGhh9lo', 4, 38009430, 274739, 18123, 0.7705, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1131, 'F5eEvfOyb7k', 4, 23926890, 211675, 12925, 0.9387, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1132, 'a7fzkqLozwA', 4, 448036654, 2900175, 47547, 0.6579, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1133, 'rTKpYJ80OVQ', 4, 50315735, 404732, 7852, 0.8200, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1134, 'x47TgeRJtH0', 4, 81086929, 849306, 9533, 1.0592, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1135, 'QhW3P7_jvWY', 4, 29996995, 192522, 10693, 0.6775, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1136, '1vrEljMfXYo', 4, 567181344, 3609396, 177055, 0.6676, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1137, 'W7nmB20qJv4', 4, 59689394, 611078, 14292, 1.0477, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1138, '9wT1s96JIb0', 4, 22303388, 270758, 5765, 1.2398, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1139, 'a-SX4DDjD2E', 4, 22045, 3195, 345, 16.0581, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1140, '56hqrlQxMMI', 4, 71114702, 504863, 12080, 0.7269, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1141, '_n9HhmX36Gk', 4, 7033489, 83348, 4094, 1.2432, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1142, 'ifWOSnoCS0M', 4, 8777195, 83754, 4415, 1.0045, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1143, 'RNOTF-znQyw', 4, 49449809, 292289, 17435, 0.6263, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1144, 'ZRHHOttkM1A', 4, 164768780, 1814249, 26644, 1.1173, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1145, 'xy3AcmW0lrQ', 4, 140509640, 1051037, 18284, 0.7610, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1146, 'T_Km11HNzUY', 4, 5054910, 60330, 2589, 1.2447, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1147, 'AeZRYhLDLeU', 4, 46137018, 303999, 10457, 0.6816, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1148, '49LvI-Y_ScY', 4, 9263321, 22503, 0, 0.2429, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1149, 'q0u47Nl7N7M', 4, 4697862, 92540, 3390, 2.0420, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1150, 'vuzCHdN9Okk', 4, 25998927, 136294, 637, 0.5267, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1151, 's49rOuVY3s0', 4, 8010652, 152370, 14469, 2.0827, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1152, 'TBeGecLND84', 4, 50506299, 287744, 4417, 0.5785, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1153, '1ouf1Dt7H2A', 4, 1876262, 20138, 1520, 1.1543, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1154, 'OLVIwchMHxc', 4, 1104884, 9822, 799, 0.9613, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1155, 'ug5IBOYCUzQ', 4, 80269226, 270125, 4619, 0.3423, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1156, 'KXJpP0jd9Lk', 4, 110823193, 513167, 16242, 0.4777, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1157, 'KUWLUGtEkMo', 4, 739872, 6870, 636, 1.0145, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1158, 'MG_cjByleYI', 4, 145698201, 702624, 0, 0.4822, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1159, '81GaF34veWA', 4, 503048062, 1634261, 39380, 0.3327, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1160, 'ZDW9eJOtZ3s', 4, 16595316, 307356, 49155, 2.1483, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1161, '69JAoslGYI8', 4, 321948777, 2217388, 47307, 0.7034, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1162, 'y4rD8gOe7yg', 4, 604195, 6400, 525, 1.1462, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1163, 'QrtoMb-o7b8', 4, 91191882, 329164, 3875, 0.3652, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1164, 'qTjjBequjGY', 4, 92841013, 536890, 15082, 0.5945, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1165, 'aKlepLWOh3Q', 4, 913268, 9908, 886, 1.1819, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1166, 'cuIVkdwm2SE', 4, 762057, 8116, 847, 1.1762, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1167, '93TXfW3MT4o', 4, 358225252, 1267347, 34336, 0.3634, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1168, 'gQihxm0-U64', 4, 2175755, 42364, 6736, 2.2567, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1169, 'FnjexNf7Pdo', 4, 407640505, 2660513, 34181, 0.6610, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1170, '9TYOtiHgQTA', 4, 63750476, 218964, 11297, 0.3612, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1171, 'xCuqr0PO0_8', 4, 9051643, 56605, 1579, 0.6428, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1172, 'WiNYFwIfg4w', 4, 196455920, 1106970, 11826, 0.5695, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1173, 'upCptHeThio', 4, 476457877, 4623336, 107345, 0.9929, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1174, 'uqY-3RS-V0Y', 4, 29608941, 154034, 1297, 0.5246, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1175, 'EWcOY14GWwM', 4, 749726636, 5572108, 217194, 0.7722, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1176, 'kDhptBT_-VI', 4, 471977182, 4490480, 257571, 1.0060, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1177, 'M_eOUE6pFKY', 4, 74393285, 312013, 2108, 0.4222, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1178, 'CogD1olVZYk', 4, 103369283, 563282, 7501, 0.5522, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1179, '_P7S2lKif-A', 4, 1947204659, 15504386, 413633, 0.8175, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1180, '3yd_eoMOvqk', 4, 1293725289, 9019772, 282132, 0.7190, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1181, 'iaXt5shHFL8', 4, 18465406, 275565, 23538, 1.6198, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1182, 'kzOkza_u3Z8', 4, 260916181, 2463501, 152335, 1.0026, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1183, '4N2iMmHcHys', 4, 546128076, 3371457, 83925, 0.6327, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1184, 'kxVm97f25VA', 4, 184630276, 468935, 4677, 0.2565, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1185, 'aHBW_Nd_z8k', 4, 189208854, 1091839, 12764, 0.5838, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1186, '9QASL0SjNGQ', 4, 1199671, 28842, 668, 2.4598, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1187, 'RKb9WiYcfLM', 4, 142186951, 801483, 11313, 0.5716, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1188, 'gEAXyEUQPUs', 4, 65259763, 485037, 0, 0.7432, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1189, '5SMmxqA6-58', 4, 9365428, 89978, 1012, 0.9716, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1190, 'tnyJXbPrGN8', 4, 142789789, 1082991, 12338, 0.7671, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1191, 'vqKsHbyjjjI', 4, 87561108, 673293, 8746, 0.7789, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1192, 'xJuVY0o7mak', 4, 4016913, 85459, 2256, 2.1836, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1193, '-UDWqs7TsTg', 4, 148556194, 686597, 11209, 0.4697, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1194, 'VpJKsoMWnZM', 4, 210168733, 2304361, 51338, 1.1209, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1195, '-PH4S7IPQxU', 4, 713793484, 5344309, 169387, 0.7724, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1196, 'uF_w5PjpuKI', 4, 4680018, 22893, 219, 0.4938, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1197, 'iEenugG_y6c', 4, 132033840, 437136, 6286, 0.3358, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1198, 'OFwLmOlaeV0', 4, 2294, 60, 1, 2.6591, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1199, 'yv2i9s6c69g', 4, 23554, 179, 7, 0.7897, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1200, 'WQ3wmf8KyFo', 4, 474594, 2617, 29, 0.5575, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1201, 'PaQGJV4AHYg', 4, 8098, 175, 1, 2.1734, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1202, 'XPs5XS5CtIw', 4, 823467, 7383, 87, 0.9071, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1203, '0nHHZZRYNf4', 4, 191276672, 990576, 11333, 0.5238, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1204, 'QfzMtZ3HSG0', 4, 109855, 618, 9, 0.5708, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1205, 'OQODghPUIqg', 4, 153981, 1556, 27, 1.0280, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1206, '4NpT4hCgoB0', 4, 202613, 4297, 90, 2.1652, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1207, '4lH4Rk4iwBA', 4, 32550, 386, 2, 1.1920, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1208, '0QULuVbkGEU', 4, 6636462, 70722, 1041, 1.0813, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1209, 'g2kz4sykhgk', 4, 335252, 4818, 72, 1.4586, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1210, 'hfwmSryJi98', 4, 66433, 456, 2, 0.6894, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1211, 'Bb6nkSz8ThA', 4, 5942376, 34178, 731, 0.5875, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1212, 'MIjLD8KB2gs', 4, 632342, 4874, 38, 0.7768, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1213, '_urlIWLDvrA', 4, 6996965, 126962, 2170, 1.8455, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1214, 'NWEd-92QkU8', 4, 1180694, 11378, 201, 0.9807, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1215, 'nRbw5SCKD8M', 4, 414, 13, 2, 3.6232, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1216, 'yyq2L2Ws5Ow', 4, 75411, 685, 5, 0.9150, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1217, 'Quc3PUKyGCA', 4, 542727, 5723, 30, 1.0600, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1218, 'Pes_L2tdrG8', 4, 999562, 6714, 91, 0.6808, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1219, '63XyWeKWI0M', 4, 204520645, 1623377, 36881, 0.8118, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1220, 'z5R9JzNpvPc', 4, 8878391, 51691, 0, 0.5822, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1221, 'q-uWWNcu724', 4, 14879061, 171625, 2915, 1.1731, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1222, 'Ws_fR1oMN9c', 4, 42862, 351, 5, 0.8306, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1223, 'vKRAmLTQ9Dk', 4, 39163200, 490070, 6776, 1.2687, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1224, 'UZxnSc6VKog', 4, 88267097, 1378465, 43038, 1.6105, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1225, 'ICkFEA5eunU', 4, 625163, 4678, 183, 0.7776, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1226, 'e_xGeZDk3Sw', 4, 214517806, 3377567, 143796, 1.6415, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1227, 'cIUSxV9J45w', 4, 14606, 227, 3, 1.5747, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1228, '7pD8k2zaLqk', 4, 44679277, 393219, 8671, 0.8995, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1229, 'xAM51Ovpr9M', 4, 243136414, 3302321, 61698, 1.3836, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1230, 'TwkKp-BBChg', 4, 86240790, 1143743, 55438, 1.3905, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1231, 'Rj-Q-cgG70I', 4, 5020056, 63535, 2329, 1.3120, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1232, 'vlZ9MGgC1NI', 4, 56512454, 449160, 9498, 0.8116, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1233, 'vau8mq3KcRw', 4, 43781718, 618627, 11796, 1.4399, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1234, '4Y_5uJpSOZM', 4, 15111041, 715221, 17348, 4.8479, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1235, '60DvFz6jMgY', 4, 1678433, 14667, 554, 0.9069, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1236, '3WQPW2OuUvk', 4, 423537, 52889, 3745, 13.3717, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1237, 'XpvSubMyL0k', 4, 3751521, 200568, 6578, 5.5217, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1238, 'gpxa9q_kPKQ', 4, 1356760, 12119, 188, 0.9071, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1239, 'GA7LcSX8tYE', 4, 89457218, 830487, 26022, 0.9575, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1240, 'klQ8uzsm938', 4, 550815, 9338, 320, 1.7534, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1241, 'gUnpHJgLyRs', 4, 91302348, 746882, 4069, 0.8225, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1242, '4JYSkt3qsKI', 4, 2268837, 32785, 10, 1.4455, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1243, 'a9MyzWfv4WU', 4, 4784766, 68840, 919, 1.4579, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1244, 's6dIjPBECXw', 4, 26419798, 304585, 3916, 1.1677, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1245, 'qdsTUfDTEhQ', 4, 423560096, 2258618, 44536, 0.5438, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1246, 'TPomzwIYsLQ', 4, 1189730, 18768, 165, 1.5914, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1247, 'YrvU5E-iF_s', 4, 2198133, 6922, 68, 0.3180, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1248, 'V2RgfAC0Mz8', 4, 606722, 2213, 26, 0.3690, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1249, 'e1MHLJsv6Ks', 4, 18732331, 101257, 2283, 0.5527, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1250, '10XarNSkw0s', 4, 289605421, 646456, 17694, 0.2293, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1251, 'BOn-sXalHxI', 4, 1704255, 4201, 59, 0.2500, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1252, 'FCMyTR1SJM8', 4, 87400493, 1031767, 61802, 1.2512, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1253, '8blgJSoAVBc', 4, 4441932, 18699, 282, 0.4273, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1254, 'UsEhWFeiCnA', 4, 302733, 991, 12, 0.3313, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1255, 'yZh9a-QX3Yo', 4, 328268, 1004, 33, 0.3159, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1256, 'lnsWe87Q9yY', 4, 8292, 273, 4, 3.3406, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1257, 'GVSS3lh_lCY', 4, 94980975, 79294, 1255, 0.0848, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1258, 'lgjayJik2n4', 4, 5578639, 36568, 654, 0.6672, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1259, 'ToabLkXUotM', 4, 92009463, 127016, 4962, 0.1434, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1260, 'OcKwmWEBi1I', 4, 82490826, 115528, 659, 0.1408, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1261, 'Dt13Wv6Opeo', 4, 129283775, 762588, 25111, 0.6093, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1262, 'owjosMjFas0', 4, 1583994, 8726, 108, 0.5577, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1263, 'kI6ywewtYkc', 4, 126401525, 220605, 3769, 0.1775, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1264, 'YsL6eRCIwqw', 4, 6422141, 31760, 570, 0.5034, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1265, 'jPwCxjJqHGw', 4, 115328494, 227994, 4053, 0.2012, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1266, 'T67WZx7CxY8', 4, 62507667, 307519, 7855, 0.5045, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1267, 'E7UBYWn_69c', 4, 880437, 1479, 22, 0.1705, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1268, 'PtJDSomNoUM', 4, 253448, 879, 17, 0.3535, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1269, 'H97EFhNUADY', 4, 636205, 10594, 775, 1.7870, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1270, 'fLE53xD9h_s', 4, 1316, 23, 0, 1.7477, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1271, 'FIXFq7wtMEI', 4, 3548891, 36315, 1175, 1.0564, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1272, 'CGOKwddW7uo', 4, 7744243, 41041, 640, 0.5382, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1273, 'h3nyYuevzi8', 4, 8786, 34, 0, 0.3870, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1274, 'ydJ7JGC9jVM', 4, 3458474, 32755, 1494, 0.9903, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1275, 'Vvfs44wnHH0', 4, 10917915, 61477, 859, 0.5710, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1276, 'CgkLC1mcCE0', 4, 153875094, 293709, 4743, 0.1940, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1277, 'S_SXl-ETXRI', 4, 355502018, 1458241, 21655, 0.4163, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1278, 'AAZmC2EcNng', 4, 49389314, 106656, 1381, 0.2187, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1279, 'QWgqN_oD934', 4, 238763, 3175, 133, 1.3855, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1280, 'M_p_LUseXGk', 4, 2556984, 19736, 287, 0.7831, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1281, 'TxCOdjTyY94', 4, 56675789, 104373, 1537, 0.1869, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1282, 'pLKlUP_BF70', 4, 25356315, 76206, 1363, 0.3059, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1283, 'lRt16Y_ys7g', 4, 1266531, 10523, 460, 0.8672, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1284, '6p3ETYgcEN8', 4, 108538142, 366760, 3115, 0.3408, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1285, 'exTC-KFUJrM', 4, 40505397, 47782, 353, 0.1188, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1286, 'T4tKkfBQRAY', 4, 31697445, 92933, 1068, 0.2966, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1287, 'wJPicWv_SGU', 4, 97116722, 109347, 579, 0.1132, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1288, 'AA-sNG6eIyI', 4, 2923510, 15343, 354, 0.5369, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1289, 'GYoUeBjOCZQ', 4, 554201, 3422, 41, 0.6249, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1290, 'qsCxSb1Qato', 4, 4912716, 25704, 363, 0.5306, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1291, 'XUTFBdw7Vqk', 4, 29635358, 44920, 273, 0.1525, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1292, '-Y1k19Z06iQ', 4, 1006880, 16497, 277, 1.6659, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1293, '62zBQ2vbxLo', 4, 124100, 1460, 61, 1.2256, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1294, '0j2dBAlv9lQ', 4, 1393737, 10845, 150, 0.7889, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1295, 'iL_ljx5eXQc', 4, 45029446, 80088, 1795, 0.1818, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1296, 'NSbS-8oB7Z0', 4, 2707402, 32270, 2125, 1.2704, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1297, 'ox9zGoiJcKg', 4, 234852481, 865781, 17126, 0.3759, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1298, 'HD2sMiAwpCQ', 4, 189285985, 687878, 8939, 0.3681, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1299, 'y0E96wDzm-I', 4, 7084284, 112189, 1080, 1.5989, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1300, '_d3jWdIdRHQ', 4, 268107, 2246, 21, 0.8456, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1301, '832-ygXkNJE', 4, 118682, 819, 8, 0.6968, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1302, '0GdwfDhRzLY', 4, 2200523, 18717, 955, 0.8940, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1303, 'PvM_YAabhkk', 4, 69583797, 293295, 6967, 0.4315, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1304, 'g2o3CZaVVCo', 4, 131399854, 767498, 9981, 0.5917, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1305, 'vudZL4_uqLo', 4, 245937, 2994, 47, 1.2365, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1306, 'aDDBdW8-PZo', 4, 12506467, 43524, 524, 0.3522, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1307, 'KfrPqx5J4F8', 4, 37002924, 74988, 1198, 0.2059, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1308, 'UtTDrO9arqI', 4, 34664295, 238325, 5036, 0.7021, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1309, 'skAvBJPTfSA', 4, 24542097, 104943, 1, 0.4276, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1310, 'hGD_KsvTxfo', 4, 104621, 1556, 9, 1.4959, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1311, 'lYv3IGKab44', 4, 328413, 4638, 60, 1.4305, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1312, 'w1eiO6QkQDY', 4, 6771274, 30146, 502, 0.4526, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1313, 'tptkdXcBlzY', 4, 2307815, 10051, 314, 0.4491, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1314, 'JCf4x_ODbhA', 4, 21551365, 87015, 1203, 0.4093, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1315, 'a9R7JuPdMLo', 4, 539524, 9758, 297, 1.8637, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1316, 'pLtIr7j-eX8', 4, 307287, 2941, 3, 0.9581, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1317, 'zAV3_mg941w', 4, 40501, 1527, 28, 3.8394, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1318, '3pWWNxUeODQ', 4, 10313, 217, 6, 2.1623, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1319, '0692WFAqRxs', 4, 13828299, 164200, 4240, 1.2181, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1320, 'mjEtZsq-rEA', 4, 2568, 199, 6, 7.9829, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1321, 'PhJ09yDQKJ0', 4, 1000989, 17552, 243, 1.7777, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1322, 'nvtGsaMv9yc', 4, 32014271, 57521, 1444, 0.1842, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1323, 'NYyNHZPeQ4I', 4, 14576085, 21970, 228, 0.1523, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1324, 'mHdcwc9eNjc', 4, 11415561, 62132, 0, 0.5443, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1325, '5L5eSTYX6wc', 4, 45084980, 94414, 1489, 0.2127, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1326, 'FEfPbOnE7VM', 4, 3338305, 14558, 517, 0.4516, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1327, 'Wm97ow7T8J8', 4, 14654833, 27524, 989, 0.1946, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1328, 'bMhDJ0S0OBA', 4, 19021006, 413224, 24679, 2.3022, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1329, 'zDv9qV7PABI', 4, 32702110, 59618, 1000, 0.1854, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1330, 'z0Xc_rzYZV8', 4, 11323911, 31903, 923, 0.2899, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1331, 'L3sOnIfU0QM', 4, 36906088, 219929, 8877, 0.6200, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1332, 'nsS-j9He_Wg', 4, 18338575, 121904, 788, 0.6690, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1333, 'nL2bLcCtXcM', 4, 33820959, 90344, 1092, 0.2704, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1334, 'MoU3TctXBvs', 4, 27775030, 61010, 1080, 0.2235, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1335, 'bbBAMe92Btg', 4, 6227495, 70036, 696, 1.1358, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1336, 'fESREcUo9ik', 4, 17628665, 84969, 1177, 0.4887, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1337, 'co-TFLbaZAE', 4, 263769055, 2436873, 91903, 0.9587, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1338, 'Ve_a9CXjlQc', 4, 42090894, 173456, 5413, 0.4250, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1339, 'a2grcJdfXmY', 4, 7201712, 360283, 16581, 5.2330, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1340, 'cvczHB0W4BY', 4, 25212, 324, 18, 1.3565, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1341, 'yd_uG3TtREs', 4, 181284045, 1403840, 64041, 0.8097, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1342, 'U6BDbXIah-Y', 4, 14577883, 883067, 61312, 6.4782, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1343, 'GkG60kISnfc', 4, 62137136, 721007, 20539, 1.1934, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1344, '42wfEs7oIP8', 4, 70842747, 1400347, 36778, 2.0286, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1345, '9qkpcLK422o', 4, 47697101, 628678, 31630, 1.3844, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1346, '3-VwlTqxH-0', 4, 24805836, 109615, 1197, 0.4467, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1347, 'GMFewiplIbw', 4, 2661529432, 8959837, 328587, 0.3490, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1348, 'kJQP7kiw5Fk', 4, 9010483346, 56173590, 4363523, 0.6719, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1349, 'nWWtiRHEaV4', 4, 48772909, 136674, 3697, 0.2878, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1350, 'yH1fk7WLiMc', 4, 12534967, 108608, 3587, 0.8951, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1351, 'Us2ZvSRUB1k', 4, 9264632, 39235, 560, 0.4295, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1352, 'BgMU9Vuj17Y', 4, 86515460, 703406, 30890, 0.8487, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1353, 'VMp55KH_3wo', 4, 1737200027, 4508876, 175276, 0.2696, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1354, 'TyHvyGVs42U', 4, 2503870379, 10701967, 337966, 0.4409, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1355, 'WB9Egi9leWA', 4, 1858613, 23590, 733, 1.3087, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1356, 'NUsoVlDFqZg', 4, 3825543938, 11914047, 300095, 0.3193, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1357, 'BZIqOKGmDV4', 4, 1549774, 21527, 220, 1.4032, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1358, 'T2JnyCuAQMg', 4, 41220988, 330202, 4865, 0.8129, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1359, 'YXnjy5YlDwk', 4, 1303924400, 3777445, 100750, 0.2974, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1360, '_NwcW2GwFGY', 4, 14147715, 149479, 1528, 1.0674, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1361, 'e-CEd6xrRQc', 4, 320597470, 2122059, 46728, 0.6765, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1362, 'UMWhHWgXJdg', 4, 4818255, 8534, 343, 0.1842, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1363, 'jCY6d1F16eQ', 4, 593856, 6438, 135, 1.1068, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1364, '1_zgKRBrT0Y', 4, 3130673340, 14232515, 388676, 0.4670, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1365, 'DiItGE3eAyQ', 4, 3156363490, 15015508, 408605, 0.4887, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1366, 'wnJ6LuUFpMo', 4, 3643659046, 19133403, 531616, 0.5397, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1367, 'Bo0xYL7hbAA', 4, 6394116, 28278, 406, 0.4486, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1368, 'nD3e_CQQwmM', 4, 1441898, 10773, 609, 0.7894, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1369, 'ZRJipL32oCA', 4, 6029691, 44857, 670, 0.7550, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1370, 'dkGnWUfweUQ', 4, 974839, 12731, 206, 1.3271, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1371, 'pkqHgo-3lpA', 4, 3402215, 44827, 583, 1.3347, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1372, 'MKaPVvXXhxk', 4, 4599218, 61556, 282, 1.3445, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1373, 'zm4C9rx5fGY', 4, 13166940, 30917, 1386, 0.2453, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1374, 'fTKqtvXjkvo', 4, 38350375, 87591, 4850, 0.2410, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1375, 'LuzXr3He9NI', 4, 13584552, 45868, 2879, 0.3588, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1376, 'Sgl_T2zoIQU', 4, 948392, 4495, 416, 0.5178, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1377, 'uRiB1tsFIkE', 4, 35950538, 165178, 6791, 0.4783, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1378, 'Y5lrZeDf1T4', 4, 992810, 13493, 938, 1.4536, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1379, 'cdTNj3y6G8I', 4, 6383415, 42785, 418, 0.6768, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1380, 'k6aqTBFpPl0', 4, 411691, 3746, 61, 0.9247, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1381, 'CDBoHKXtrjs', 4, 850752, 11051, 484, 1.3559, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1382, '2lnLrCo4bdY', 4, 1012610, 21247, 310, 2.1289, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1383, '4UWwpyYF4lo', 4, 2704617, 27227, 144, 1.0120, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1384, 'DD2rp9pe6n4', 4, 1071464, 20475, 84, 1.9188, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1385, 'rIt4pBtu0QA', 4, 570434, 4364, 104, 0.7833, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1386, '7H3DiVmLG74', 4, 952180, 7582, 101, 0.8069, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1387, 'ZvNnfTmBcME', 4, 1626674, 6278, 325, 0.4059, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1388, 'wBcptk5YWQI', 4, 32119825, 357608, 19105, 1.1728, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1389, 't1MnvH6GPJ4', 4, 147678125, 4123656, 6425, 2.7967, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1390, 'mQwdGdMGQNo', 4, 16376630, 43583, 1977, 0.2782, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1391, 'yZL_C-Kcxf0', 4, 20005898, 819263, 20169, 4.1959, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1392, 'ed1RJCuNWAo', 4, 3240010, 15286, 387, 0.4837, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1393, 'KHKJ1vFpXDs', 4, 14837279, 79688, 4455, 0.5671, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1394, 'z985Q4eTnks', 4, 14575891, 0, 1900, 0.0130, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1395, 'oMTrz_Ym02A', 4, 648016, 5985, 383, 0.9827, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1396, 'DVxpjW99ueQ', 4, 697591, 19466, 760, 2.8994, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1397, 'E0Y8OEo_zOc', 4, 1893815, 4344, 232, 0.2416, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1398, 'nXeEQTnfljo', 4, 6263056, 18733, 449, 0.3063, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1399, 'gPoiv0sZ4s4', 4, 15468450, 206750, 12627, 1.4182, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1400, 'mS95hDkYEJc', 4, 694, 47, 2, 7.0605, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1401, 'q5D2ZlBuG7g', 4, 2090089, 18456, 1143, 0.9377, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1402, 'aSugSGCC12I', 4, 175234209, 1910528, 66355, 1.1281, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1403, '6GT7qDORxAE', 4, 4068, 0, 3, 0.0737, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1404, '5GL9JoH4Sws', 4, 3073045871, 13134605, 484088, 0.4432, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1405, 'JGpQwM9fYnQ', 4, 95875, 953, 33, 1.0284, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1406, 'eVli-tstM5E', 4, 591684708, 4252323, 88504, 0.7336, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1407, 'XXYlFuWEuKI', 4, 2130987802, 10815858, 332165, 0.5231, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1408, 'plNmaCuPSYw', 4, 7754122, 103979, 1437, 1.3595, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1409, 'NtTdainRvQ8', 4, 5504840, 194280, 2632, 3.5771, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1410, 'MEX3XzL2YRc', 4, 21461415, 133560, 3777, 0.6399, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1411, 'Bk5_aL3y4ig', 4, 3713680, 20267, 247, 0.5524, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1412, 'cQuJn-d0KOY', 4, 179694, 476, 15, 0.2732, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1413, 'WBy8ETk_Fqs', 4, 4545067, 0, 240, 0.0053, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1414, 'V7Wc2O6HUsM', 4, 1711578, 10194, 221, 0.6085, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1415, 'M11SvDtPBhA', 4, 1138498400, 4992153, 463911, 0.4792, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1416, 'Oa_RSwwpPaA', 4, 997891994, 6607769, 143824, 0.6766, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1417, 'AJCzsLXrpao', 4, 107890, 900, 4, 0.8379, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1418, '9Vti9E-TASg', 4, 13936530, 80840, 1128, 0.5882, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1419, 'gCYcHz2k5x0', 4, 1859799187, 13033672, 352691, 0.7198, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1420, '2UCBbcBT5Es', 4, 10131742, 80379, 1772, 0.8108, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1421, 'R2KeQqLzr00', 4, 31768667, 239748, 2154, 0.7614, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1422, 'CE5i5Sf56vY', 4, 4936473, 17574, 164, 0.3593, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1423, 'a4fv-BtzNmY', 4, 15438877, 95519, 4069, 0.6450, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1424, 'WHHmiWUqIZA', 4, 47418628, 425569, 4696, 0.9074, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1425, 'QCuUAClm-hQ', 4, 7795714, 77605, 779, 1.0055, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1426, 'UScyjLs_XNU', 4, 1318936, 17151, 673, 1.3514, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1427, 'zeHTVxkycgE', 4, 55151684, 394682, 11922, 0.7372, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1428, 'mdpSxWU4mv0', 4, 608098, 4371, 84, 0.7326, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1429, 'z_7F9q7EIoI', 4, 1408751, 20146, 1224, 1.5169, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1430, 'EJqFjvKF8HU', 4, 1516404, 36653, 1009, 2.4836, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1431, 'gU2Jzsa9Q_Y', 4, 1356162, 11207, 169, 0.8388, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1432, '5-EuMi9-nSw', 4, 3945690, 19114, 242, 0.4906, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1433, 'HvkAfj1QnK8', 4, 509711, 9225, 957, 1.9976, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1434, 'r6fO-Ki9LzE', 4, 7714617, 91801, 5284, 1.2585, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1435, 'sBJT1BpOcvg', 4, 4490844, 41827, 1141, 0.9568, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1436, 'qAIy8godTy4', 4, 16923946, 130944, 1387, 0.7819, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1437, '2z8GIdGkWnE', 4, 85499, 781, 43, 0.9638, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1438, 'WjPUgEDQ4yE', 4, 508424, 15453, 736, 3.1842, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1439, '7YYBqjpmi-c', 4, 5597674, 59050, 774, 1.0687, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1440, 'hum1d7yvmXU', 4, 4202102, 76368, 4659, 1.9282, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1441, 'sTmgaP2gYsk', 4, 16312592, 123334, 3673, 0.7786, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1442, 'cVFzblT5VPE', 4, 18166957, 247576, 7320, 1.4031, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1443, 'YNVU7r0qVhU', 4, 331394, 985, 52, 0.3129, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1444, 'wPCMekJog4o', 4, 1931513, 6725, 125, 0.3546, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1445, 'TAx7x0rBdnY', 4, 509435, 1436, 61, 0.2939, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1446, '8inug0w8sXI', 4, 85299958, 531271, 4597, 0.6282, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1447, 'yoZy2E17-50', 4, 365049751, 4391924, 125029, 1.2374, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1448, 'PImxg_WTtSc', 4, 198191, 1241, 28, 0.6403, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1449, 'N-prD5sprfs', 4, 417312, 1185, 33, 0.2919, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1450, 'pO1XzKWCLIs', 4, 2078537, 4912, 172, 0.2446, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1451, 'PqF4QhB7IIU', 4, 183937, 1923, 26, 1.0596, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1452, 'mpk4ih1PNjM', 4, 289389, 6879, 109, 2.4147, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1453, 'OF04pKp-r9o', 4, 69113552, 438213, 12691, 0.6524, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1454, '-tIVsACI4mI', 4, 1200, 52, 3, 4.5833, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1455, 'reKQO4zrG64', 4, 1165072, 34926, 308, 3.0242, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1456, 'jEPqUxSDadI', 4, 774623, 10426, 298, 1.3844, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1457, 'vhodXy0A-Es', 4, 12837155, 674947, 9947, 5.3352, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1458, 'zMOWE6m4iP0', 4, 1718571, 26082, 200, 1.5293, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1459, 'Slq4aeE8FoE', 4, 14533733, 163058, 3934, 1.1490, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1460, 'mw7R4RLmBg4', 4, 13019, 326, 19, 2.6500, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1461, 'a5Dn9XiChTk', 4, 3112318, 6481, 269, 0.2169, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1462, 'X2Nv4KqRGK0', 4, 567635, 6696, 36, 1.1860, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1463, 'fTVvhkhCMuo', 4, 232773, 1388, 87, 0.6337, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1464, 'gLYFLd88Xu4', 4, 880525, 2583, 72, 0.3015, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1465, 'Cxl52-1LW_k', 5, 2875, 586, 76, 23.0261, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1466, 'oI51J1tjUBs', 5, 5248, 1019, 129, 21.8750, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1467, 'Paddtn5IdCk', 5, 4814778, 98401, 3963, 2.1260, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1468, '-RuSsuxZjIg', 5, 6144, 391, 81, 7.6823, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1469, 'WXBHCQYxwr0', 5, 1037735331, 7627508, 155771, 0.7500, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1470, 'R1WQVeCq0Hs', 5, 2137879, 136815, 9417, 6.8401, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1471, 'pkE_H8yEdl8', 5, 12183, 1173, 237, 11.5735, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1472, 'V9PVRfjEBTI', 5, 809797806, 5299076, 143073, 0.6720, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1473, 'kF4MVeWFiDs', 5, 2805730, 94437, 3789, 3.5009, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1474, 'NcP5zbMA0QU', 5, 6762, 1498, 271, 26.1609, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1475, 'm__b5iBYP1Y', 5, 11977147, 22007, 329, 0.1865, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1476, 'XeNibQZwp00', 5, 245380, 11728, 2296, 5.7152, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1477, 'ko70cExuzZM', 5, 386870789, 3371992, 138515, 0.9074, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1478, 'rtwpk9rb1Dc', 5, 10534693, 381761, 16114, 3.7768, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1479, 'KFMYx1TibeQ', 5, 86166262, 554627, 15781, 0.6620, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1480, 'qiOGfrte_Lg', 5, 27038, 4484, 572, 18.6996, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1481, 'CcS1fsuT10M', 5, 22039082, 217826, 7424, 1.0220, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1482, 'fLexgOxsZu0', 5, 3206484479, 16529857, 676948, 0.5366, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1483, '5anLPw0Efmo', 5, 1094578359, 6175996, 240098, 0.5862, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1484, 'u9Dg-g7t2l4', 5, 1172652381, 6979115, 270756, 0.6182, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1485, 'lY5V4hSLWY8', 5, 85516634, 1289676, 42587, 1.5579, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1486, 'wZTIdnooV-s', 5, 315219144, 1901337, 46481, 0.6179, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1487, '09R8_2nJtjg', 5, 4374490178, 16995518, 441325, 0.3986, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1488, 'wlS6Ix7mA0w', 5, 944472073, 5377307, 166281, 0.5870, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1489, 'XXIX2WnfbpE', 5, 11680263, 537705, 25523, 4.8220, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1490, 'dgzN94w1lLE', 5, 8558, 880, 52, 10.8904, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1491, 'cgH0vpl4nQk', 5, 1706, 147, 29, 10.3165, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1492, 'Ra_bioBGzUg', 5, 3008, 241, 29, 8.9761, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1493, '2aJUnltwsqs', 5, 210724645, 1392169, 50977, 0.6848, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1494, 'qgaRVvAKoqQ', 5, 94429184, 567832, 15814, 0.6181, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1495, 'fHI8X4OXluQ', 5, 865679432, 6364239, 172545, 0.7551, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1496, 'a7fzkqLozwA', 5, 448036654, 2900174, 47547, 0.6579, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1497, 'sySB31z9RRQ', 5, 4120, 510, 29, 13.0825, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1498, 'G23iLGhh9lo', 5, 38009430, 274739, 18123, 0.7705, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1499, 'vGJTaP6anOU', 5, 471544751, 4230255, 141160, 0.9270, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1500, 'r58GQYFZeLE', 5, 52352215, 345731, 13271, 0.6857, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1501, 'oqv35UZepIM', 5, 309071999, 2291338, 36620, 0.7532, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1502, '1vrEljMfXYo', 5, 567181344, 3609396, 177055, 0.6676, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1503, 'QhW3P7_jvWY', 5, 29996995, 192522, 10693, 0.6775, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1504, 'DmNfT-B7nlA', 5, 210343277, 1425652, 32534, 0.6932, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1505, 'x47TgeRJtH0', 5, 81086929, 849306, 9533, 1.0592, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1506, 'ifWOSnoCS0M', 5, 8777195, 83754, 4415, 1.0045, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1507, 'F5eEvfOyb7k', 5, 23926890, 211675, 12925, 0.9387, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1508, 'rTKpYJ80OVQ', 5, 50315735, 404732, 7852, 0.8200, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1509, 'W7nmB20qJv4', 5, 59689394, 611078, 14292, 1.0477, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1510, 'RNOTF-znQyw', 5, 49449809, 292289, 17435, 0.6263, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1511, '9wT1s96JIb0', 5, 22303388, 270758, 5765, 1.2398, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1512, 'XXx6RDzR6eM', 5, 38699873, 364111, 6156, 0.9568, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1513, 'AeZRYhLDLeU', 5, 46137018, 303999, 10457, 0.6816, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1514, 'ZRHHOttkM1A', 5, 164768985, 1814249, 26644, 1.1173, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1515, 'JNNKOkcojEc', 5, 34204, 3822, 140, 11.5834, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1516, 'KXJpP0jd9Lk', 5, 110823193, 513166, 16242, 0.4777, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1517, '81GaF34veWA', 5, 503048062, 1634261, 39380, 0.3327, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1518, '-FVrYTPBqxg', 5, 30996, 829, 102, 3.0036, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1519, 'q0u47Nl7N7M', 5, 4697862, 92540, 3390, 2.0420, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1520, 'hpn23IVQTbY', 5, 16257, 1822, 121, 11.9518, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1521, 'yxwnCxnUVlw', 5, 336176468, 1660624, 50282, 0.5089, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1522, '5CxknorIHQ4', 5, 10514, 1265, 79, 12.7830, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1523, '93TXfW3MT4o', 5, 358225252, 1267347, 34336, 0.3634, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1524, 'dANcAGydlsM', 5, 450348863, 3978805, 91594, 0.9038, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1525, '49LvI-Y_ScY', 5, 9263321, 22503, 0, 0.2429, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1526, '1ouf1Dt7H2A', 5, 1876275, 20138, 1520, 1.1543, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1527, 'xCuqr0PO0_8', 5, 9051643, 56604, 1579, 0.6428, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1528, 'agr3esH33SU', 5, 7049, 1484, 272, 24.9113, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1529, '5IWRU8k0qaU', 5, 18363638, 96214, 3595, 0.5435, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1530, 'WiNYFwIfg4w', 5, 196455920, 1106969, 11826, 0.5695, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1531, 'ZDW9eJOtZ3s', 5, 16595316, 307356, 49155, 2.1483, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1532, '9TYOtiHgQTA', 5, 63750476, 218964, 11297, 0.3612, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1533, 'OLVIwchMHxc', 5, 1104884, 9822, 799, 0.9613, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1534, 'tigPF7zhElk', 5, 379858, 17235, 782, 4.7431, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1535, 'Lny-RiAKQ1Q', 5, 14081536, 56734, 1940, 0.4167, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1536, 'FZm2Ci1jLe0', 5, 49688, 215, 10, 0.4528, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1537, 'ug5IBOYCUzQ', 5, 80269226, 270125, 4619, 0.3423, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1538, 'sWhy1VcvvgY', 5, 290609489, 2745747, 81851, 0.9730, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1539, 'upCptHeThio', 5, 476458094, 4623336, 107345, 0.9929, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1540, 'M_eOUE6pFKY', 5, 74393285, 312013, 2108, 0.4222, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1541, '0VNARs1fbrQ', 5, 2350854, 30578, 66, 1.3035, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1542, 'CogD1olVZYk', 5, 103369283, 563282, 7501, 0.5522, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1543, '_P7S2lKif-A', 5, 1947204659, 15504387, 413633, 0.8175, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1544, 'kDhptBT_-VI', 5, 471977182, 4490480, 257571, 1.0060, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1545, 'aHBW_Nd_z8k', 5, 189208854, 1091839, 12764, 0.5838, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1546, '3yd_eoMOvqk', 5, 1293725605, 9019771, 282132, 0.7190, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1547, 'EWcOY14GWwM', 5, 749726636, 5572107, 217194, 0.7722, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1548, '-wEhzTTdsS8', 5, 44157192, 173866, 1282, 0.3966, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1549, 'iaXt5shHFL8', 5, 18465406, 275565, 23538, 1.6198, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1550, 'kzOkza_u3Z8', 5, 260916181, 2463501, 152335, 1.0026, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1551, '4N2iMmHcHys', 5, 546128076, 3371456, 83925, 0.6327, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1552, 'tnyJXbPrGN8', 5, 142789789, 1082991, 12338, 0.7671, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1553, 'iEenugG_y6c', 5, 132033840, 437136, 6286, 0.3358, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1554, 'RKb9WiYcfLM', 5, 142186951, 801483, 11313, 0.5716, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1555, 'uF_w5PjpuKI', 5, 4680018, 22893, 219, 0.4938, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1556, '9QASL0SjNGQ', 5, 1199671, 28842, 668, 2.4598, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1557, 'gEAXyEUQPUs', 5, 65259763, 485037, 0, 0.7432, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1558, 'vqKsHbyjjjI', 5, 87561108, 673293, 8746, 0.7789, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1559, 'UhyFCJJgzL4', 5, 2176877, 34682, 309, 1.6074, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1560, '-PH4S7IPQxU', 5, 713793484, 5344308, 169387, 0.7724, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1561, 'xJuVY0o7mak', 5, 4016913, 85458, 2256, 2.1836, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1562, 'JjPtDl6EJ3o', 5, 111376657, 883676, 20117, 0.8115, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1563, '1fdv0OIhzzA', 5, 527204537, 3669751, 101919, 0.7154, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1564, 'OFwLmOlaeV0', 5, 2294, 60, 1, 2.6591, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1565, 'yv2i9s6c69g', 5, 23554, 179, 7, 0.7897, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1566, 'PaQGJV4AHYg', 5, 8098, 175, 1, 2.1734, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1567, 'WQ3wmf8KyFo', 5, 474594, 2617, 29, 0.5575, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1568, '0QULuVbkGEU', 5, 6636462, 70722, 1041, 1.0813, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1569, '4lH4Rk4iwBA', 5, 32550, 386, 2, 1.1920, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1570, 'XPs5XS5CtIw', 5, 823467, 7383, 87, 0.9071, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1571, '0nHHZZRYNf4', 5, 191276672, 990576, 11333, 0.5238, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1572, 'QfzMtZ3HSG0', 5, 109855, 618, 9, 0.5708, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1573, 'nRbw5SCKD8M', 5, 414, 13, 2, 3.6232, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1574, 'H88WuHdzAwg', 5, 47999, 842, 20, 1.7959, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1575, 'BZjxRqWBeHU', 5, 2417174, 23734, 408, 0.9988, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1576, 'OQODghPUIqg', 5, 153981, 1556, 27, 1.0280, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1577, '4NpT4hCgoB0', 5, 202613, 4297, 90, 2.1652, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1578, 'hfwmSryJi98', 5, 66433, 456, 2, 0.6894, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1579, 'Quc3PUKyGCA', 5, 542727, 5723, 30, 1.0600, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1580, 'yyq2L2Ws5Ow', 5, 75411, 685, 5, 0.9150, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1581, '63XyWeKWI0M', 5, 204520645, 1623377, 36881, 0.8118, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1582, 'Bb6nkSz8ThA', 5, 5942376, 34178, 731, 0.5875, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1583, 'z5R9JzNpvPc', 5, 8878391, 51691, 0, 0.5822, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1584, 'MIjLD8KB2gs', 5, 632342, 4874, 38, 0.7768, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1585, '_urlIWLDvrA', 5, 6996979, 126962, 2170, 1.8455, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1586, 'q-uWWNcu724', 5, 14879061, 171625, 2915, 1.1731, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1587, 'PI23ldAvdHY', 5, 18328825, 251503, 6424, 1.4072, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1588, 'QIVnz6hZmME', 5, 83034, 877, 11, 1.0694, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1589, 'vKRAmLTQ9Dk', 5, 39163230, 490070, 6776, 1.2687, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1590, 'UZxnSc6VKog', 5, 88267097, 1378465, 43038, 1.6105, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1591, 'xAM51Ovpr9M', 5, 243136414, 3302321, 61698, 1.3836, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1592, 'ICkFEA5eunU', 5, 625163, 4678, 183, 0.7776, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1593, 'e_xGeZDk3Sw', 5, 214517806, 3377567, 143796, 1.6415, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1594, '7pD8k2zaLqk', 5, 44679277, 393219, 8671, 0.8995, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1595, '4Y_5uJpSOZM', 5, 15111048, 715221, 17348, 4.8479, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1596, 'vlZ9MGgC1NI', 5, 56512454, 449160, 9498, 0.8116, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1597, 'GA7LcSX8tYE', 5, 89457218, 830487, 26022, 0.9575, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1598, 's6dIjPBECXw', 5, 26419798, 304585, 3916, 1.1677, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1599, 'cIUSxV9J45w', 5, 14606, 227, 3, 1.5747, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1600, 'TwkKp-BBChg', 5, 86240790, 1143743, 55438, 1.3905, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1601, 'iZq0u3quAqo', 5, 731558230, 3826352, 87184, 0.5350, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1602, 'WF7LLl7r4Os', 5, 72530234, 606185, 18416, 0.8612, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1603, 'XpvSubMyL0k', 5, 3751521, 200568, 6578, 5.5217, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1604, 'Ibfm0yE5O_8', 5, 17568397, 121050, 3461, 0.7087, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1605, '2PRAiVs3MVc', 5, 477900377, 3172653, 51099, 0.6746, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1606, 'fAHcrVZhLIA', 5, 16371573, 151150, 11188, 0.9916, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1607, 'G2huIPUuUQc', 5, 97813903, 559038, 10346, 0.5821, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1608, 'gUnpHJgLyRs', 5, 91302348, 746882, 4069, 0.8225, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1609, 'o50J2xg8-sU', 5, 132325517, 952024, 6414, 0.7243, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1610, 'iOM20kM2gOQ', 5, 115525744, 1733073, 28535, 1.5249, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1611, 'P-W2JmG9vtQ', 5, 18414654, 119047, 4087, 0.6687, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1612, '3WQPW2OuUvk', 5, 423537, 52889, 3745, 13.3717, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1613, '10XarNSkw0s', 5, 289605421, 646457, 17694, 0.2293, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1614, 'V2RgfAC0Mz8', 5, 606722, 2213, 26, 0.3690, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1615, 'YrvU5E-iF_s', 5, 2198133, 6922, 68, 0.3180, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1616, 'BEz8l69aI8Y', 5, 739696243, 1778115, 21450, 0.2433, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1617, 'BOn-sXalHxI', 5, 1704255, 4201, 59, 0.2500, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1618, '8blgJSoAVBc', 5, 4441932, 18699, 282, 0.4273, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1619, 'J_jJhHhYW9w', 5, 324758399, 2446857, 51054, 0.7692, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1620, 'Dt13Wv6Opeo', 5, 129283775, 762589, 25111, 0.6093, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1621, 'PtJDSomNoUM', 5, 253448, 879, 17, 0.3535, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1622, 'UsEhWFeiCnA', 5, 302733, 991, 12, 0.3313, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1623, 'yZh9a-QX3Yo', 5, 328268, 1004, 33, 0.3159, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1624, 'uEtGTq92Cmk', 5, 161392228, 327578, 8097, 0.2080, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1625, 'T67WZx7CxY8', 5, 62507667, 307519, 7855, 0.5045, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1626, 'kI6ywewtYkc', 5, 126401525, 220605, 3769, 0.1775, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1627, 'jPwCxjJqHGw', 5, 115328494, 227994, 4053, 0.2012, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1628, 'owjosMjFas0', 5, 1583994, 8726, 108, 0.5577, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1629, 'ToabLkXUotM', 5, 92009961, 127016, 4962, 0.1434, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1630, 'GVSS3lh_lCY', 5, 94980975, 79294, 1255, 0.0848, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1631, 'veSzGDdQ_Ok', 5, 21688542, 78790, 1066, 0.3682, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1632, 'Hv53XBYeK7E', 5, 20749745, 126206, 14221, 0.6768, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1633, 'lnsWe87Q9yY', 5, 8338, 273, 4, 3.3221, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1634, 'E7UBYWn_69c', 5, 880437, 1479, 22, 0.1705, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1635, 'ZIiQ1jMqhVM', 5, 232878158, 1992590, 54086, 0.8789, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1636, 's9IlAyHO6EQ', 5, 63333028, 144900, 5763, 0.2379, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1637, 'lBDDMrUCz1A', 5, 16823792, 34406, 7300, 0.2479, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1638, 'h3nyYuevzi8', 5, 8786, 34, 0, 0.3870, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1639, 'CGOKwddW7uo', 5, 7744243, 41041, 640, 0.5382, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1640, 'CgkLC1mcCE0', 5, 153875094, 293708, 4743, 0.1940, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1641, 'Vvfs44wnHH0', 5, 10918005, 61477, 859, 0.5709, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1642, 'ydJ7JGC9jVM', 5, 3458474, 32755, 1494, 0.9903, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1643, 'Z4zCDg7GDuw', 5, 7439, 38, 0, 0.5108, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1644, 'TxCOdjTyY94', 5, 56675789, 104373, 1537, 0.1869, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1645, 'QWgqN_oD934', 5, 238763, 3175, 133, 1.3855, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1646, 'AAZmC2EcNng', 5, 49389314, 106656, 1381, 0.2187, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1647, 'EEoqV07KXck', 5, 1421486, 8282, 181, 0.5954, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1648, 'EMKupc9_FfM', 5, 3357579, 33776, 1349, 1.0461, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1649, 'ozLE7N5uEfw', 5, 49537682, 104012, 1378, 0.2127, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1650, '6p3ETYgcEN8', 5, 108538142, 366760, 3115, 0.3408, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1651, 'lRt16Y_ys7g', 5, 1266531, 10523, 460, 0.8672, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1652, 'M_p_LUseXGk', 5, 2556984, 19736, 287, 0.7831, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1653, 'exTC-KFUJrM', 5, 40505397, 47782, 353, 0.1188, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1654, 'iL_ljx5eXQc', 5, 45029446, 80088, 1795, 0.1818, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1655, 'AA-sNG6eIyI', 5, 2923510, 15343, 354, 0.5369, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1656, 'lKsfbr_F6ho', 5, 335110, 1482, 30, 0.4512, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1657, 'wcBsG24gouw', 5, 9008, 39, 0, 0.4329, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1658, 'wJPicWv_SGU', 5, 97116722, 109346, 579, 0.1132, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1659, 'NwIvYGn3ca4', 5, 8067028, 31137, 364, 0.3905, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1660, '0j2dBAlv9lQ', 5, 1393737, 10845, 150, 0.7889, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1661, 'xLwmpWkav8E', 5, 24857037, 131409, 3771, 0.5438, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1662, 'hd5ysbUDYF8', 5, 12725143, 32691, 534, 0.2611, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1663, 'HD2sMiAwpCQ', 5, 189288042, 687878, 8939, 0.3681, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1664, 'ox9zGoiJcKg', 5, 234852481, 865782, 17126, 0.3759, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1665, 'y0E96wDzm-I', 5, 7084284, 112189, 1080, 1.5989, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1666, 'PvM_YAabhkk', 5, 69583797, 293295, 6967, 0.4315, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1667, 'tvPSPkugS7A', 5, 124256471, 340388, 4918, 0.2779, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1668, 'KzPau_0Ad7o', 5, 142663841, 395237, 4894, 0.2805, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1669, 'g2o3CZaVVCo', 5, 131399854, 767498, 9981, 0.5917, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1670, 'aDDBdW8-PZo', 5, 12506467, 43524, 524, 0.3522, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1671, 'UtTDrO9arqI', 5, 34664295, 238325, 5036, 0.7021, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1672, 'NsvbWEvCsjI', 5, 10026576, 34189, 842, 0.3494, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1673, 'JCf4x_ODbhA', 5, 21551407, 87015, 1203, 0.4093, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1674, 'ewnUjJkdeNI', 5, 6876157, 23707, 633, 0.3540, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1675, 'fp6p7-yxNeQ', 5, 793695, 9959, 109, 1.2685, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1676, 'hGD_KsvTxfo', 5, 104621, 1556, 9, 1.4959, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1677, '_d3jWdIdRHQ', 5, 268117, 2246, 21, 0.8455, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1678, 'r5kO1hpnJwU', 5, 9000586, 78265, 337, 0.8733, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1679, 'EToVcmE8RHQ', 5, 598058, 7006, 91, 1.1867, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1680, 'a9R7JuPdMLo', 5, 539524, 9758, 297, 1.8637, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1681, '1vrM6cOQgcg', 5, 12465034, 28779, 516, 0.2350, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1682, '6GNdiKjFm4k', 5, 1456021, 12792, 0, 0.8786, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1683, 'tptkdXcBlzY', 5, 2307815, 10051, 314, 0.4491, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1684, 'VydmHcmCBeU', 5, 388860, 6976, 71, 1.8122, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1685, 'lYv3IGKab44', 5, 328413, 4638, 60, 1.4305, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1686, 'QfXSL60kFaM', 5, 197627, 4505, 34, 2.2968, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1687, 'CVTWjpx8_YA', 5, 4511100, 41130, 0, 0.9118, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1688, 'mHdcwc9eNjc', 5, 11415561, 62133, 0, 0.5443, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1689, 'NYyNHZPeQ4I', 5, 14576085, 21970, 228, 0.1523, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1690, 'MoU3TctXBvs', 5, 27775030, 61010, 1080, 0.2235, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1691, 'U6BDbXIah-Y', 5, 14577883, 883071, 61312, 6.4782, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1692, 'bMhDJ0S0OBA', 5, 19021006, 413232, 24680, 2.3023, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1693, '5L5eSTYX6wc', 5, 45084980, 94414, 1489, 0.2127, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1694, '-SEKt_0pdHM', 5, 2897717, 225872, 11246, 8.1829, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1695, 'a2grcJdfXmY', 5, 7201712, 360284, 16581, 5.2330, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1696, 'o3FYn6Hsdyw', 5, 16888558, 14762, 0, 0.0874, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1697, 'cvczHB0W4BY', 5, 25214, 324, 18, 1.3564, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1698, 'FEfPbOnE7VM', 5, 3338305, 14558, 517, 0.4516, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1699, 'bbBAMe92Btg', 5, 6227718, 70036, 696, 1.1358, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1700, 'zDv9qV7PABI', 5, 32702110, 59618, 1000, 0.1854, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1701, '42wfEs7oIP8', 5, 70842747, 1400347, 36779, 2.0286, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1702, 'yd_uG3TtREs', 5, 181284045, 1403842, 64041, 0.8097, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1703, 'z0Xc_rzYZV8', 5, 11323911, 31903, 923, 0.2899, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1704, 'co-TFLbaZAE', 5, 263769055, 2436872, 91903, 0.9587, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1705, 'GkG60kISnfc', 5, 62137136, 721008, 20539, 1.1934, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1706, 'nL2bLcCtXcM', 5, 33820959, 90344, 1092, 0.2704, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1707, 'fESREcUo9ik', 5, 17628917, 84970, 1177, 0.4887, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1708, '6ZUIwj3FgUY', 5, 381656838, 2702724, 136637, 0.7440, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1709, 'F7sGJVUrkjQ', 5, 92732358, 1106480, 86313, 1.2863, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1710, 'KNexS61fjus', 5, 187061338, 1834974, 34326, 0.9993, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1711, 'ygYPwsjyCzQ', 5, 38015059, 251236, 22058, 0.7189, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1712, 'nvtGsaMv9yc', 5, 32014271, 57521, 1444, 0.1842, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1713, 'GMFewiplIbw', 5, 2661529432, 8959836, 328587, 0.3490, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1714, 'kJQP7kiw5Fk', 5, 9010483346, 56173589, 4363523, 0.6719, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1715, 'yH1fk7WLiMc', 5, 12534967, 108608, 3587, 0.8951, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1716, 'WB9Egi9leWA', 5, 1858613, 23591, 733, 1.3087, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1717, 'BZIqOKGmDV4', 5, 1549774, 21527, 220, 1.4032, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1718, 'VMp55KH_3wo', 5, 1737200027, 4508876, 175276, 0.2696, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1719, 'Xtt78SW-mgg', 5, 2701690, 108543, 3901, 4.1620, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1720, 'Us2ZvSRUB1k', 5, 9264632, 39235, 560, 0.4295, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1721, '_NwcW2GwFGY', 5, 14147715, 149478, 1528, 1.0674, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1722, 'TyHvyGVs42U', 5, 2503870910, 10701966, 337966, 0.4409, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1723, 'YXnjy5YlDwk', 5, 1303924400, 3777446, 100750, 0.2974, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1724, 'dkGnWUfweUQ', 5, 974839, 12731, 206, 1.3271, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1725, 'CEhLhiaygI0', 5, 335055, 9597, 87, 2.8903, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1726, 'QuSEbo03fc4', 5, 99626768, 591036, 13752, 0.6071, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1727, 'wnJ6LuUFpMo', 5, 3643659046, 19133403, 531616, 0.5397, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1728, 'nD3e_CQQwmM', 5, 1441898, 10773, 609, 0.7894, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1729, 'OSUxrSe5GbI', 5, 1689393298, 8765339, 209310, 0.5312, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1730, 'NUsoVlDFqZg', 5, 3825543938, 11914047, 300095, 0.3193, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1731, '_I_D_8Z4sJE', 5, 2339759013, 10722850, 267558, 0.4697, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1732, 'hKwCRJfiHBo', 5, 335390, 14028, 252, 4.2577, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1733, 'n7OUYLY5DG4', 5, 1622043, 64681, 2066, 4.1150, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1734, 'T0Zw6fYCIWU', 5, 424755, 6235, 71, 1.4846, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1735, 'WZcLWx4fhKs', 5, 163299, 1770, 37, 1.1066, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1736, '2ZSAAI2BC1U', 5, 2226358, 22596, 838, 1.0526, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1737, 'FOtvRp-VEO0', 5, 10551960, 107351, 1413, 1.0307, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1738, 'IMf9O3x6KzM', 5, 5150, 206, 33, 4.6408, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1739, 'S0lx-sIjbHA', 5, 36313, 417, 22, 1.2089, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1740, 'k3cZ6qaqkMo', 5, 13006, 37, 0, 0.2845, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1741, 'LuzXr3He9NI', 5, 13584552, 45868, 2879, 0.3588, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1742, 'fTKqtvXjkvo', 5, 38350375, 87591, 4850, 0.2410, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1743, 'MKaPVvXXhxk', 5, 4599218, 61556, 282, 1.3445, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1744, 'Y5lrZeDf1T4', 5, 992810, 13493, 938, 1.4536, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1745, 'uRiB1tsFIkE', 5, 35950538, 165178, 6791, 0.4783, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1746, 'hkdtBztPUjg', 5, 23257, 323, 2, 1.3974, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1747, 'UOrCIg_Qu3o', 5, 4141449, 37254, 542, 0.9126, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1748, 'rIt4pBtu0QA', 5, 570434, 4364, 104, 0.7833, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1749, 'gLDQ7Yvww7Q', 5, 51957, 143, 5, 0.2849, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1750, 'zm4C9rx5fGY', 5, 13166940, 30917, 1386, 0.2453, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1751, '-YlmnPh-6rE', 5, 300008619, 1857118, 32630, 0.6299, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1752, 'ed1RJCuNWAo', 5, 3240010, 15286, 387, 0.4837, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1753, '2lnLrCo4bdY', 5, 1012610, 21247, 310, 2.1289, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1754, 'vB0V3iCSzQw', 5, 296751460, 1929201, 51876, 0.6676, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1755, '7H3DiVmLG74', 5, 952180, 7582, 101, 0.8069, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1756, 't1MnvH6GPJ4', 5, 147678125, 4123656, 6425, 2.7967, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1757, '4UWwpyYF4lo', 5, 2704617, 27227, 144, 1.0120, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1758, 'oMTrz_Ym02A', 5, 648016, 5985, 383, 0.9827, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1759, 'q0I-N1wlwdE', 5, 4044377, 53766, 1089, 1.3563, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1760, 'yZL_C-Kcxf0', 5, 20005898, 819263, 20169, 4.1959, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1761, 'c2nHxn2P5EU', 5, 70811735, 645389, 5665, 0.9194, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1762, 'CDBoHKXtrjs', 5, 850752, 11051, 484, 1.3559, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1763, 'E0Y8OEo_zOc', 5, 1893815, 4344, 232, 0.2416, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1764, 'gPoiv0sZ4s4', 5, 15468450, 206750, 12627, 1.4182, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1765, 'aSugSGCC12I', 5, 175234209, 1910528, 66355, 1.1281, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1766, '5GL9JoH4Sws', 5, 3073045871, 13134605, 484088, 0.4432, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1767, 'nXeEQTnfljo', 5, 6263056, 18733, 449, 0.3063, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1768, 'q5D2ZlBuG7g', 5, 2090089, 18456, 1143, 0.9377, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1769, 'eVli-tstM5E', 5, 591686192, 4252321, 88504, 0.7336, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1770, '6GT7qDORxAE', 5, 4068, 0, 3, 0.0737, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1771, 'JGpQwM9fYnQ', 5, 95875, 953, 33, 1.0284, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1772, 'plNmaCuPSYw', 5, 7754122, 103979, 1437, 1.3595, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1773, 'Oa_RSwwpPaA', 5, 997891994, 6607766, 143824, 0.6766, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1774, 'MEX3XzL2YRc', 5, 21461415, 133560, 3777, 0.6399, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1775, 'NtTdainRvQ8', 5, 5504840, 194280, 2632, 3.5771, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1776, 'M11SvDtPBhA', 5, 1138498400, 4992154, 463911, 0.4792, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1777, 'cQuJn-d0KOY', 5, 179694, 476, 15, 0.2732, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1778, 'XXYlFuWEuKI', 5, 2130987802, 10815857, 332166, 0.5231, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1779, 'Rg0fyvTDfu8', 5, 2397239, 9261, 300, 0.3988, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1780, 'AJCzsLXrpao', 5, 107890, 901, 4, 0.8388, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1781, 'Bk5_aL3y4ig', 5, 3713680, 20267, 247, 0.5524, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1782, '-CXDKsZY80I', 5, 6017182, 0, 485, 0.0081, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1783, 'WBy8ETk_Fqs', 5, 4545067, 0, 240, 0.0053, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1784, '9Vti9E-TASg', 5, 13936530, 80840, 1128, 0.5882, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1785, 'EJ9Jc9blzBA', 5, 36425, 594, 14, 1.6692, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1786, '2UCBbcBT5Es', 5, 10131742, 80379, 1772, 0.8108, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1787, 'gCYcHz2k5x0', 5, 1859799187, 13033674, 352691, 0.7198, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1788, '2z8GIdGkWnE', 5, 85499, 781, 43, 0.9638, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1789, 'a4fv-BtzNmY', 5, 15438877, 95519, 4069, 0.6450, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1790, 'EJqFjvKF8HU', 5, 1516429, 36653, 1009, 2.4836, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1791, 'R2KeQqLzr00', 5, 31768667, 239748, 2154, 0.7614, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1792, 'UScyjLs_XNU', 5, 1318936, 17151, 673, 1.3514, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1793, 'z_7F9q7EIoI', 5, 1408751, 20146, 1224, 1.5169, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1794, 'zeHTVxkycgE', 5, 55151684, 394682, 11922, 0.7372, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1795, 'sBJT1BpOcvg', 5, 4490876, 41827, 1141, 0.9568, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1796, 'qAIy8godTy4', 5, 16923990, 130944, 1387, 0.7819, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1797, 'WHHmiWUqIZA', 5, 47418628, 425569, 4696, 0.9074, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1798, 'VJtg7pJO3hQ', 5, 949527, 17428, 351, 1.8724, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1799, 'Nylxb9lSDxk', 5, 78495, 531, 28, 0.7121, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1800, 'Il-ZpBuC8tA', 5, 1648116, 7132, 0, 0.4327, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1801, 'M5Df0ugyV2o', 5, 787002, 34211, 586, 4.4215, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1802, 'UIJiuOguxeI', 5, 984243, 48182, 416, 4.9376, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1803, 'hum1d7yvmXU', 5, 4202102, 76368, 4659, 1.9282, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1804, 'V6I7-39fn2Y', 5, 6137367, 26721, 565, 0.4446, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1805, 'lsduGj42ZJA', 5, 7345821, 162884, 4746, 2.2820, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1806, 'N6DW31S_oyI', 5, 15018376, 126260, 1426, 0.8502, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1807, 'r6fO-Ki9LzE', 5, 7714617, 91801, 5284, 1.2585, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1808, 'b20j_p5_dwI', 5, 936006, 11188, 346, 1.2323, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1809, 'YNVU7r0qVhU', 5, 331394, 986, 52, 0.3132, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1810, 'wPCMekJog4o', 5, 1931513, 6725, 125, 0.3546, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1811, 'jEPqUxSDadI', 5, 774623, 10426, 298, 1.3844, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1812, 'OF04pKp-r9o', 5, 69113552, 438213, 12692, 0.6524, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1813, 'PImxg_WTtSc', 5, 198191, 1241, 28, 0.6403, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1814, 'PqF4QhB7IIU', 5, 183937, 1923, 26, 1.0596, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1815, 'mpk4ih1PNjM', 5, 289389, 6879, 109, 2.4147, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1816, 'TAx7x0rBdnY', 5, 509435, 1436, 61, 0.2939, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1817, 'pO1XzKWCLIs', 5, 2078851, 4913, 172, 0.2446, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1818, 'vhodXy0A-Es', 5, 12837155, 674947, 9947, 5.3352, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1819, 'Slq4aeE8FoE', 5, 14533733, 163059, 3934, 1.1490, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1820, '-tIVsACI4mI', 5, 1200, 52, 3, 4.5833, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1821, '8inug0w8sXI', 5, 85299958, 531271, 4597, 0.6282, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1822, 'zMOWE6m4iP0', 5, 1718571, 26082, 200, 1.5293, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1823, 'yoZy2E17-50', 5, 365049751, 4391923, 125029, 1.2374, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1824, 'reKQO4zrG64', 5, 1165072, 34926, 308, 3.0242, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1825, 'wBcptk5YWQI', 5, 32119825, 357609, 19105, 1.1728, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1826, 'fTVvhkhCMuo', 5, 232773, 1388, 87, 0.6337, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1827, 'cce0lMgyrKc', 5, 3875690, 0, 324, 0.0084, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1828, '1RhiEJqsyLI', 5, 101458, 793, 55, 0.8358, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1829, 'N-prD5sprfs', 5, 417312, 1185, 33, 0.2919, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1830, 'GkHgQB4Wm7k', 5, 4803299, 1541, 54, 0.0332, '2026-05-06 22:05:02.315393');
INSERT INTO public.engajamento_regional VALUES (1831, 'a5Dn9XiChTk', 5, 3112318, 6481, 269, 0.2169, '2026-05-06 22:05:02.315393');


--
-- Data for Name: musica_video_correlacao; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.musica_video_correlacao VALUES (1, '1vQgz7OFIrWFf7W0o2TccY', 'S_SXl-ETXRI', 0.56, 'similaridade_forte');
INSERT INTO public.musica_video_correlacao VALUES (2, '7qqixxBvZIGSep53Eh2o0b', 'gEAXyEUQPUs', 0.56, 'similaridade_forte');
INSERT INTO public.musica_video_correlacao VALUES (3, '5FgvfSQJG0BugPXlbJPaeG', 'q-uWWNcu724', 0.95, 'nome_musica_contido_no_titulo');
INSERT INTO public.musica_video_correlacao VALUES (4, '6mLHDDBbPFX0SU2KbVEBsv', 'uuoL1k_gaeA', 0.61, 'similaridade_forte');
INSERT INTO public.musica_video_correlacao VALUES (5, '6OAjbLmKmJpewSIfNiY4rI', 'uuoL1k_gaeA', 0.67, 'similaridade_forte');
INSERT INTO public.musica_video_correlacao VALUES (6, '4J53px209KDQCnsQTEsMJO', '_urlIWLDvrA', 0.95, 'nome_musica_contido_no_titulo');
INSERT INTO public.musica_video_correlacao VALUES (7, '4S9FqbHyKVul04EpbA2Jin', '4JYSkt3qsKI', 0.75, 'similaridade_forte');
INSERT INTO public.musica_video_correlacao VALUES (8, '0fXOs5kxjG7QHtow1BeY6H', 'vlZ9MGgC1NI', 0.95, 'nome_musica_contido_no_titulo');
INSERT INTO public.musica_video_correlacao VALUES (9, '6xcQRc6H2UdTX425C2YzNY', 'KzhZd3BcbWQ', 0.56, 'similaridade_forte');
INSERT INTO public.musica_video_correlacao VALUES (10, '4k3xDpAdBuM17mNNHhOZkK', 'G23iLGhh9lo', 0.95, 'nome_musica_contido_no_titulo');
INSERT INTO public.musica_video_correlacao VALUES (11, '18KyJgSmfIPEsimWshBojB', 'OF04pKp-r9o', 0.6, 'similaridade_forte');
INSERT INTO public.musica_video_correlacao VALUES (12, '39995SwI9fcO5ON9aku0gU', 'r5kO1hpnJwU', 0.56, 'similaridade_forte');
INSERT INTO public.musica_video_correlacao VALUES (13, '3JojUdNlifAfB5J9dLvJ9H', '10XarNSkw0s', 0.95, 'nome_musica_contido_no_titulo');
INSERT INTO public.musica_video_correlacao VALUES (14, '4ksSf8cL3VlUvQSkFcRHy3', 'TwkKp-BBChg', 0.58, 'similaridade_forte');
INSERT INTO public.musica_video_correlacao VALUES (15, '3tj5s3iIcTaJWh5MMrGB3k', 'uuoL1k_gaeA', 0.57, 'similaridade_forte');
INSERT INTO public.musica_video_correlacao VALUES (16, '2Hw0LzrD6ic8AckKBxJhiO', 'ToabLkXUotM', 0.95, 'nome_musica_contido_no_titulo');
INSERT INTO public.musica_video_correlacao VALUES (17, '6LlcXmX87Fe96hABt7Bg7r', 'ieTE4-Xy9xg', 0.95, 'nome_musica_contido_no_titulo');
INSERT INTO public.musica_video_correlacao VALUES (18, '0gg3QtCcPZn4aJ0D7dRNul', 'g2o3CZaVVCo', 0.95, 'nome_musica_contido_no_titulo');
INSERT INTO public.musica_video_correlacao VALUES (19, '0GSkoU7eaY0VvEPKdcAtHQ', 'fp6p7-yxNeQ', 0.95, 'nome_musica_contido_no_titulo');
INSERT INTO public.musica_video_correlacao VALUES (20, '4bxyHku6rNffRealVxu30p', 'iYjz1Ap1VvU', 0.95, 'nome_musica_contido_no_titulo');
INSERT INTO public.musica_video_correlacao VALUES (21, '3DT6PksB7jmHufnbDwgHnu', '0j2dBAlv9lQ', 0.56, 'similaridade_forte');
INSERT INTO public.musica_video_correlacao VALUES (22, '2nNxtJ8Ce702sXXbVBwvW6', '0j2dBAlv9lQ', 0.56, 'similaridade_forte');
INSERT INTO public.musica_video_correlacao VALUES (23, '028i7HBfp8uE5epmx5ieMA', 'buZm0R1qWgU', 0.95, 'nome_musica_contido_no_titulo');
INSERT INTO public.musica_video_correlacao VALUES (24, '3i8fIJNV0yuC4kXT3SkVBZ', '2z8GIdGkWnE', 0.95, 'nome_musica_contido_no_titulo');
INSERT INTO public.musica_video_correlacao VALUES (25, '4SjcIkVc4cvFgURD1EHxDM', 'HD2sMiAwpCQ', 0.95, 'nome_musica_contido_no_titulo');
INSERT INTO public.musica_video_correlacao VALUES (26, '2WQ09wqQBIOor7Q0VpIDBK', '8inug0w8sXI', 0.95, 'nome_musica_contido_no_titulo');
INSERT INTO public.musica_video_correlacao VALUES (27, '7L9wyYAJgDPu9ClHhbtdQH', 'G2huIPUuUQc', 0.95, 'nome_musica_contido_no_titulo');
INSERT INTO public.musica_video_correlacao VALUES (28, '3qhlB30KknSejmIvZZLjOD', 'xy3AcmW0lrQ', 0.95, 'nome_musica_contido_no_titulo');
INSERT INTO public.musica_video_correlacao VALUES (29, '6K4t31amVTZDgR3sKmwUJJ', 'a7fzkqLozwA', 0.6, 'similaridade_forte');
INSERT INTO public.musica_video_correlacao VALUES (30, '4c9XojqJDu7KNCh8GmNbj5', 'i6fy_hdZ62I', 0.8, 'palavras_musica_no_titulo');
INSERT INTO public.musica_video_correlacao VALUES (31, '6ZEKE3RR5EMhAMTJzjGOB6', 'iZq0u3quAqo', 0.8, 'palavras_musica_no_titulo');
INSERT INTO public.musica_video_correlacao VALUES (32, '3cuY2usAdXwLGKh8TtWgj5', '_T_SIDKGRjs', 0.56, 'similaridade_forte');
INSERT INTO public.musica_video_correlacao VALUES (33, '16Ij1j3ZawPQ2vxsnusKLY', 'lsduGj42ZJA', 0.95, 'nome_musica_contido_no_titulo');
INSERT INTO public.musica_video_correlacao VALUES (34, '1QaNsRazpKjGm3xhIrEVfO', 'uuoL1k_gaeA', 0.59, 'similaridade_forte');
INSERT INTO public.musica_video_correlacao VALUES (35, '5u7Xi0QhfkYy3qETJJ5lae', '-UDWqs7TsTg', 0.95, 'nome_musica_contido_no_titulo');
INSERT INTO public.musica_video_correlacao VALUES (36, '1vt0n3GcAYrsSMue1C6OtC', 'GYoUeBjOCZQ', 0.57, 'similaridade_forte');
INSERT INTO public.musica_video_correlacao VALUES (37, '6fbCGwvj2V5JXYFovauhUr', 'NwIvYGn3ca4', 0.63, 'similaridade_forte');
INSERT INTO public.musica_video_correlacao VALUES (38, '5Cp75TUMrHF6c8xbhdligS', 'MoU3TctXBvs', 0.95, 'nome_musica_contido_no_titulo');
INSERT INTO public.musica_video_correlacao VALUES (39, '1xOqGUkyxGQRdCvGpvWKmL', 'uRiB1tsFIkE', 0.95, 'nome_musica_contido_no_titulo');
INSERT INTO public.musica_video_correlacao VALUES (40, '2bAQsNqdo62T8akkIvWzGl', 'F7sGJVUrkjQ', 0.95, 'nome_musica_contido_no_titulo');
INSERT INTO public.musica_video_correlacao VALUES (41, '2N9miXnewVmUrgl6JSK1FI', 'TvVtYaqCni8', 0.95, 'nome_musica_contido_no_titulo');
INSERT INTO public.musica_video_correlacao VALUES (42, '1CPZ5BxNNd0n0nF4Orb9JS', 'MoU3TctXBvs', 0.95, 'nome_musica_contido_no_titulo');
INSERT INTO public.musica_video_correlacao VALUES (43, '5sBDrrtLGbV64QJnEqfjer', 'FEfPbOnE7VM', 0.95, 'nome_musica_contido_no_titulo');
INSERT INTO public.musica_video_correlacao VALUES (44, '1I37Zz2g3hk9eWxaNkj031', 'L3sOnIfU0QM', 0.95, 'nome_musica_contido_no_titulo');
INSERT INTO public.musica_video_correlacao VALUES (45, '5p02vl3X0p227XS6Lro9sI', 'PI23ldAvdHY', 0.65, 'similaridade_forte');
INSERT INTO public.musica_video_correlacao VALUES (46, '2KrQbq3aqGOFGnkTKnN2XA', 'BgMU9Vuj17Y', 0.95, 'nome_musica_contido_no_titulo');
INSERT INTO public.musica_video_correlacao VALUES (47, '7oo3L1ZPEQSavDVSnlOvDa', 'HD2sMiAwpCQ', 0.55, 'similaridade_forte');
INSERT INTO public.musica_video_correlacao VALUES (48, '7CBWajKPyBA0GFtxmTzLBV', 'R1WQVeCq0Hs', 0.95, 'nome_musica_contido_no_titulo');
INSERT INTO public.musica_video_correlacao VALUES (49, '5WNTWK6ISkfnkth9JwxvCp', 'R1WQVeCq0Hs', 0.95, 'nome_musica_contido_no_titulo');


--
-- Data for Name: regioes; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.regioes VALUES (1, 'Brasil', 'BR');
INSERT INTO public.regioes VALUES (2, 'Estados Unidos', 'US');
INSERT INTO public.regioes VALUES (3, 'México', 'MX');
INSERT INTO public.regioes VALUES (4, 'Argentina', 'AR');
INSERT INTO public.regioes VALUES (5, 'Portugal', 'PT');


--
-- Data for Name: spotify_albuns; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.spotify_albuns VALUES ('1DT9WAK6DKPI4zBPTGOAKt', 'O Tbt Que Ele Quer', '2025-06-30');
INSERT INTO public.spotify_albuns VALUES ('3ALuRC0WpEev3kQlYUH4Dt', 'Eu Vou Cuspir', '2026-01-09');
INSERT INTO public.spotify_albuns VALUES ('3KcnMYtFSEkkHfNsy6KwuA', 'Diário de um Cafajeste', '2025-11-06');
INSERT INTO public.spotify_albuns VALUES ('1lDtxHF9So0nM2qJJ5ngso', 'Puta É Só um Detalhe', '2024-10-14');
INSERT INTO public.spotify_albuns VALUES ('1KhJdFsGysry0ClG5S8t16', 'Pirocada Quente', '2025-01-28');
INSERT INTO public.spotify_albuns VALUES ('7s3G8eaTZ8mjCF18c9VKHb', 'O Vovô Não Ta Casado', '2025-09-15');
INSERT INTO public.spotify_albuns VALUES ('2C55Mdj6fs7MHU4wO3UmWe', 'A Gente Brigou', '2017-05-29');
INSERT INTO public.spotify_albuns VALUES ('0gFiHNOMhjKEMjbvFTUfGc', 'Funk do Patinho', '2022-01-22');
INSERT INTO public.spotify_albuns VALUES ('0iyEVVDNrHcSKCu37Jdc49', 'Beat Que Te Deixa Alerta', '2025-12-17');
INSERT INTO public.spotify_albuns VALUES ('4LsyhH9r3N2I20orjPdtfq', 'Mete Com Força Com Talento', '2018-10-05');
INSERT INTO public.spotify_albuns VALUES ('5qNaCpWDBGkFQ4xfLs0TKs', 'Qual é seu desejo?', '2024-02-29');
INSERT INTO public.spotify_albuns VALUES ('6yrjtgrbKq5voENqyje92P', 'Trap de Bandido (feat. Meno Tody)', '2021-09-03');
INSERT INTO public.spotify_albuns VALUES ('4KngrxmbT1fr7Tkdqo1Sei', 'É Só Dizer Que Sim', '2014-02-12');
INSERT INTO public.spotify_albuns VALUES ('2gKQvajkEEaDtkqJ8FJ4uw', 'Fetty Wap (Deluxe)', '2015-09-25');
INSERT INTO public.spotify_albuns VALUES ('0kMDUt8bGLJfHRyXiUnBnJ', 'Magia Azul', '2024-06-20');
INSERT INTO public.spotify_albuns VALUES ('77zQ29QAZp5Rr0t3Vxnqoo', 'Trap de Cria 2', '2022-02-22');
INSERT INTO public.spotify_albuns VALUES ('2Gb9tOJBTIkiXfdQq1cLgo', 'Trap The Fato', '2022-12-08');
INSERT INTO public.spotify_albuns VALUES ('28zfaQrASPCHeLDkPIYQg8', 'Toma Gostosona', '2025-04-28');
INSERT INTO public.spotify_albuns VALUES ('1sLXpSh9ol5lle83QZyJTI', 'SET DJ YURI PEDRADA - TRAVA CHIP', '2025-12-18');
INSERT INTO public.spotify_albuns VALUES ('22mM3uheuOoCmlbe2079WE', 'Rap Da Akatsuki: Os Ninjas Mais Procurados Do Mundo (Nerd Hits)', '2020-05-12');
INSERT INTO public.spotify_albuns VALUES ('1bOPoayIll75eZMxLV6lmp', 'Rap da Lealdade', '2026-01-14');
INSERT INTO public.spotify_albuns VALUES ('0zaHf6dvKmMh7H2kg6tJLf', 'Funk Brasil Relíquias, Vol. 2', '2017-12-21');
INSERT INTO public.spotify_albuns VALUES ('0epgFUtxp0mQwVWiGHbqzE', 'Rap dos Hokages: A Vontade do Fogo (Nerd Hits)', '2020-12-25');
INSERT INTO public.spotify_albuns VALUES ('5tY1spD2VSjVodP2V8FZSS', 'Só Poesias No Médio Grave (Vol.1)', '2025-12-26');
INSERT INTO public.spotify_albuns VALUES ('51waJCCTeUhh893IsA9AeS', 'Rap do Itachi: Essa Dor Que Causei... (NERD HITS)', '2018-06-05');
INSERT INTO public.spotify_albuns VALUES ('6iRyot1JljNZA7RnQp4aiK', 'Dizeres (Undaiá)', '2018-12-07');
INSERT INTO public.spotify_albuns VALUES ('4M15kEp2oeRXUV3UsApUms', 'Rap do Zoro: O Maior Espadachim do Mundo (Nerd Hits)', '2021-03-24');
INSERT INTO public.spotify_albuns VALUES ('4hiArqU343m8BUT0lymyLO', 'LIVE FOREVER', '2015-12-02');
INSERT INTO public.spotify_albuns VALUES ('3OB3nqd1Vm38NSTT4gC1gN', 'PRODUTO DO AMBIENTE', '2025-12-16');
INSERT INTO public.spotify_albuns VALUES ('7eKb9OUJogXHVngYaCxTCR', 'Ao Vivo em São José do Rio Preto (Deluxe)', '2016-11-11');
INSERT INTO public.spotify_albuns VALUES ('6QRuaVhphYKYRiydSRzQhX', 'Ao Vivo Em Uberlândia', '2025-11-20');
INSERT INTO public.spotify_albuns VALUES ('0spzPH10djjrUshMB2z9jt', 'Os Anjos Cantam', '2015-03-23');
INSERT INTO public.spotify_albuns VALUES ('3yQc10lMcK8z7CfCRkCAJ3', 'Pra Ouvir Tomando Uma, Vol. 1', '2019-03-29');
INSERT INTO public.spotify_albuns VALUES ('4QyeHXku1kDXZyGR9Do0Jv', 'Acústico de Novo', '2019-01-11');
INSERT INTO public.spotify_albuns VALUES ('2yqFE84Ne8JjDcEXhdi6qB', 'Tempo Certo (Ao Vivo em Campo Grande)', '2015-02-03');
INSERT INTO public.spotify_albuns VALUES ('3a6T0jJ6mF4KpBYvKH5o7Z', 'Escolhas, Vol. 2 (Ao Vivo)', '2023-06-22');
INSERT INTO public.spotify_albuns VALUES ('7ufAQ7EXPaaozbcIWszU5F', 'Até Você Voltar (Ao Vivo)', '2014-06-09');
INSERT INTO public.spotify_albuns VALUES ('1gjSzchPJFPPm6ZXAc0kbW', 'Questão de Tempo (Ao Vivo / Parte 1)', '2024-05-03');
INSERT INTO public.spotify_albuns VALUES ('2lmUmRXPsds8n2YU68dalX', 'Acústico (Ao Vivo)', '2025-08-14');
INSERT INTO public.spotify_albuns VALUES ('7nvdFAVwTz9D2ioC8polNu', 'Batom de Ouro', '2019-09-26');
INSERT INTO public.spotify_albuns VALUES ('2aLLbD01475VnYlT7SPar8', 'Brucelose & Gilson Neto', '2002-06-20');
INSERT INTO public.spotify_albuns VALUES ('767gNuyfmDzbss8YCPHhGf', 'De Bar em Bar 4.0', '2024-03-06');
INSERT INTO public.spotify_albuns VALUES ('4Z47CXdkaO1PtucxpdbNK2', 'É Nóis na Fita!, Vol. 4', '2013-11-19');
INSERT INTO public.spotify_albuns VALUES ('6jaxI8krAMWipqYy44b36X', 'SENTIMENTO', '2023-11-03');
INSERT INTO public.spotify_albuns VALUES ('1DZBpWdVyg0hm4K1efXHSt', 'Búfalo Do Marajó - Ao Vivo', '2024-12-19');
INSERT INTO public.spotify_albuns VALUES ('64A77adCRgi3mQhdwPPa3k', 'Seu Amor É Meu', '2019-11-01');
INSERT INTO public.spotify_albuns VALUES ('5Z9c1jU30BmlT1Vh10cMCJ', 'Vale a Pena, Vol. 5', '2014-07-31');
INSERT INTO public.spotify_albuns VALUES ('3sC9tJZqJHFEwLeEMOLoyN', 'Meu Forró É Mundo (Ao Vivo)', '2026-04-24');
INSERT INTO public.spotify_albuns VALUES ('1i6thmVWAz7Q9CMBSIWim5', 'Paralelos Vol. 02', '2025-11-27');
INSERT INTO public.spotify_albuns VALUES ('20PI0BGshx4A5gz0Onl91a', '100% Grupo Revelação', '2009-07-01');
INSERT INTO public.spotify_albuns VALUES ('0XEvRPcICVFzRYvEuC6i5L', 'Arrependidaço (Onde Você Anda)', '2025-12-04');
INSERT INTO public.spotify_albuns VALUES ('01sCx6Vm4aogmmBf8SKYQP', 'Até Que Durou (Ao Vivo)', '2018-12-21');
INSERT INTO public.spotify_albuns VALUES ('5QVFS3TZhg8te5X8Eq20zV', 'Pela Última Vez (Ao Vivo)', '2025-08-20');
INSERT INTO public.spotify_albuns VALUES ('3GBBYTV5NTTn95v2z2ECyP', 'Bebe e Vem Me Procurar / Quem Ama Sente Saudade (Ao Vivo)', '2021-01-28');
INSERT INTO public.spotify_albuns VALUES ('7s2MXOVpIWBNcfnHGCDh3v', 'Churrasquinho Menos É Mais (Ao Vivo)', '2020-04-23');
INSERT INTO public.spotify_albuns VALUES ('4rqK6xBQRRn9jBrHRQ3J2w', 'Confia (Ao Vivo)', '2023-01-20');
INSERT INTO public.spotify_albuns VALUES ('4S9yXoEJxk13SHsFsnYLcm', 'Ferrugem 10 Anos, Vol. 1: O Início (Ao Vivo)', '2024-04-18');
INSERT INTO public.spotify_albuns VALUES ('2g4R36g4rMzR8ST2xLQu39', 'Marvvila na Área (Ao Vivo)', '2022-06-24');
INSERT INTO public.spotify_albuns VALUES ('61erIGUIWd2zHF7KTaR9Xx', 'A Pagodeira (Ao vivo)', '2021-12-03');
INSERT INTO public.spotify_albuns VALUES ('69BqE1V8Bzb9GCyeP1fFeR', 'Kiss All The Time. Disco, Occasionally.', '2026-03-06');
INSERT INTO public.spotify_albuns VALUES ('5O0zUvdnJr0RbWzLFneN2i', 'Popular (Music from the HBO Original Series)', '2023-06-02');
INSERT INTO public.spotify_albuns VALUES ('5nNtpPsSUgb9Hlb3dF1gXa', 'POPSTAR (feat. Drake)', '2020-07-17');
INSERT INTO public.spotify_albuns VALUES ('3ukkRHDHbN8tNRPKsGZR1h', 'ARIRANG', '2026-03-20');
INSERT INTO public.spotify_albuns VALUES ('3JUrJP460nFIqwjxM19slT', 'Wicked: The Soundtrack', '2024-11-22');
INSERT INTO public.spotify_albuns VALUES ('2jlH0RiQxg63MI9E4MuXle', 'Viral', '2026-01-16');
INSERT INTO public.spotify_albuns VALUES ('0DWDEZ0R8mkCVvVZJXOIcN', 'Popotão Grandão', '2018-01-03');
INSERT INTO public.spotify_albuns VALUES ('6POZaAyKpUNRelsnsQQRzN', 'Sleep Well', '2024-02-16');
INSERT INTO public.spotify_albuns VALUES ('3PWOSqpHDsgbSNFjnsDTLn', 'Saudade do Carai', '2025-11-20');
INSERT INTO public.spotify_albuns VALUES ('4KTpdC3znS9wWKo4KQw6oA', 'Eu Me Apaixonei', '2025-02-27');
INSERT INTO public.spotify_albuns VALUES ('28yHV3Gdg30AiB8h8em1eW', 'Appetite For Destruction', '1987-07-21');
INSERT INTO public.spotify_albuns VALUES ('02w1xMzzdF2OJxTeh1basm', 'Fallen', '2003-03-04');
INSERT INTO public.spotify_albuns VALUES ('4FA68GsblSfvKZZRfM1tI1', 'Dynasty', '1979-03-23');
INSERT INTO public.spotify_albuns VALUES ('2UJcKiJxNryhL050F5Z1Fk', 'Nevermind (Remastered)', '1991-09-26');
INSERT INTO public.spotify_albuns VALUES ('2ZytN2cY4Zjrr9ukb2rqTP', 'Off the Wall', '1979-08-10');
INSERT INTO public.spotify_albuns VALUES ('1dgbFU08pXJXZhGPlybdMX', 'THE E.N.D. (THE ENERGY NEVER DIES) [Deluxe Version]', '2009-01-01');
INSERT INTO public.spotify_albuns VALUES ('6trNtQUgC8cgbWcqoMYkOR', 'beerbongs & bentleys', '2018-04-27');
INSERT INTO public.spotify_albuns VALUES ('3XZy1VJL8AdWFQrtZI9PM6', 'Unknown', '2025-11-05');
INSERT INTO public.spotify_albuns VALUES ('2ei2X6ghPnw7YRwQtAH075', 'Honky Chateau', '1972-05-19');
INSERT INTO public.spotify_albuns VALUES ('05jbNkYoEQdjVDHEHtg1gY', 'Don''t Forget About Me, Demos', '2018-10-16');
INSERT INTO public.spotify_albuns VALUES ('4xkM0BwLM9H2IUcbYzpcBI', 'I Love You.', '2013-04-22');
INSERT INTO public.spotify_albuns VALUES ('4JDXBZdRPId4devseaAOKH', 'DECIDE', '2022-09-16');
INSERT INTO public.spotify_albuns VALUES ('1XkGORuUX2QGOEIL4EbJKm', 'Favourite Worst Nightmare', '2007-04-22');
INSERT INTO public.spotify_albuns VALUES ('79dL7FLiJFOO0EoehUHQBv', 'Currents', '2015-07-17');
INSERT INTO public.spotify_albuns VALUES ('5WjaIWthUR3AjA0UYG3jR5', 'Freaks', '2021-05-15');
INSERT INTO public.spotify_albuns VALUES ('1737ABfA7XhOtMybGsUGIu', 'Indie Cross (Indies)', '2026-04-05');
INSERT INTO public.spotify_albuns VALUES ('4QcHsIfSbjgNzZmxqfRP7N', 'Naked All the Time', '2015-07-24');
INSERT INTO public.spotify_albuns VALUES ('1SXwt1XA4nUzOTU8fHadTY', 'Indie Dance & House (LVL1)', '2016-08-01');
INSERT INTO public.spotify_albuns VALUES ('5XqEf16OrHdmMoNS1b6WDg', 'Greatest Hits', '2007-03-02');
INSERT INTO public.spotify_albuns VALUES ('35voVqYGkotyJ945O9egDY', 'Dark & Wild', '2014-08-20');
INSERT INTO public.spotify_albuns VALUES ('7I35r17JNFjVEZPMHfe2nq', 'Pandemonium!', '2003-03-06');
INSERT INTO public.spotify_albuns VALUES ('6TejnanlyEl203l8tnsS5C', 'Hip Hop Rare', '2020-11-19');
INSERT INTO public.spotify_albuns VALUES ('2pidzXTaHV4WaIJYRxKDCH', 'The Massacre', '2005-03-03');
INSERT INTO public.spotify_albuns VALUES ('1Do3y8IAcbYOToYQJnGwSO', 'Tha Carter III', '2008-01-01');
INSERT INTO public.spotify_albuns VALUES ('4CIryXJJ3KvTalvh2JdPzB', 'Amor e Fé (Acústico)', '2024-06-16');
INSERT INTO public.spotify_albuns VALUES ('3BXCGSZweo2wKz2ifG4ekS', 'Provavelmente', '2016-10-12');
INSERT INTO public.spotify_albuns VALUES ('0maGsMVxTXH82a904gn2Q8', 'A Rua', '2018-01-07');
INSERT INTO public.spotify_albuns VALUES ('6dkYPGRCnQUdCbCtS1em4C', 'Dubai', '2016-04-15');
INSERT INTO public.spotify_albuns VALUES ('3HuBoelQqiwD47mpONUHQw', 'Sambista Perfeito', '2007-10-22');
INSERT INTO public.spotify_albuns VALUES ('1cARJvatBbzfuHONe2kr75', '360º Ao Vivo', '2012-01-01');
INSERT INTO public.spotify_albuns VALUES ('7dSmIjXuJI4vFgIF06hQ1k', 'QVVJFA?', '2022-01-26');
INSERT INTO public.spotify_albuns VALUES ('45IHFpwPgHPvjQHsZHURSu', 'Samba de Malandro', '2024-03-14');
INSERT INTO public.spotify_albuns VALUES ('1vFjgGAi4Kw2XbLJ7ppDPw', 'Viola de Doze (Ao Vivo)', '2006-06-07');
INSERT INTO public.spotify_albuns VALUES ('2YE1G8rqX7FPwixLn3N5sv', 'A Bossa De Caetano', '2000-01-01');
INSERT INTO public.spotify_albuns VALUES ('2BdaFtjbJo0wrU8HFOjnP8', 'Sambas de Enredo Rio Carnaval 2025', '2024-11-29');
INSERT INTO public.spotify_albuns VALUES ('7tIsYy5aV1KSsfBtgSK3dd', 'Na Mesma Roda (Ao Vivo)', '2020-11-13');
INSERT INTO public.spotify_albuns VALUES ('2q4uMcogIfSvbjZevQTIDL', 'Golden (from the Netflix film KPop Demon Hunters)', '2025-06-19');
INSERT INTO public.spotify_albuns VALUES ('5o5cJ6yZmcyy4y4hK0J6de', 'What is Love?', '2018-04-09');
INSERT INTO public.spotify_albuns VALUES ('6rpin9IVOuBEWBYnrA9hft', 'Gabriela', '2025-06-20');
INSERT INTO public.spotify_albuns VALUES ('3053E9tumiU5rqbAPWF06s', 'RUDE!', '2026-02-20');
INSERT INTO public.spotify_albuns VALUES ('2yUrwTLHDWBrW74Ewuw6RX', 'SPAGHETTI', '2025-10-24');
INSERT INTO public.spotify_albuns VALUES ('1IxQnpYIIFY9F2IVVsD27F', 'LOVE CATCHER', '2026-03-11');
INSERT INTO public.spotify_albuns VALUES ('1vWMw6pu3err6qqZzI3RhH', 'Ruby', '2025-03-07');
INSERT INTO public.spotify_albuns VALUES ('14JkAa6IiFaOh5s0nMyMU9', 'KPop Demon Hunters (Soundtrack from the Netflix Film)', '2025-06-20');
INSERT INTO public.spotify_albuns VALUES ('06bOKhOjYZe7OGjA5XK6tt', 'Latino Americano', '2024-11-08');
INSERT INTO public.spotify_albuns VALUES ('2niOUFzrPzRJceBtDslesX', 'Marcas De Amor', '1994-03-30');
INSERT INTO public.spotify_albuns VALUES ('0yY0fT7zibMEffhBJD9Nab', 'Tropicoqueta', '2025-06-20');
INSERT INTO public.spotify_albuns VALUES ('2NMI7OstpbjpH9DRrwL3nS', 'Junto e Misturado', '2008-10-15');
INSERT INTO public.spotify_albuns VALUES ('5K79FLRUCSysQnVESLcTdb', 'DeBÍ TiRAR MáS FOToS', '2025-01-05');
INSERT INTO public.spotify_albuns VALUES ('6gPlOUYW8fgYluWN0NCJEG', 'Latino Apresenta as Aventuras de DJ L - Festa no Apê', '2004-06-07');
INSERT INTO public.spotify_albuns VALUES ('2AwtTIdUFaUl69alioeFut', 'Alucinacao', '1976-01-01');
INSERT INTO public.spotify_albuns VALUES ('3yqcj5G3zkeXuWIx6cjQgx', 'Entren Los Que Quieran', '2010-11-22');
INSERT INTO public.spotify_albuns VALUES ('0ei3ArgXpn3uFZwxs90ySw', 'Choka Choka', '2026-04-10');
INSERT INTO public.spotify_albuns VALUES ('0X22dVuwJtKnZDlie1Eln5', 'EQUILIBRIVM', '2026-04-17');
INSERT INTO public.spotify_albuns VALUES ('6VoEqXw1611XhQ60m0Uv3E', 'World Hold On (Children Of The Sky) [FISHER Rework]', '2022-07-08');
INSERT INTO public.spotify_albuns VALUES ('2H6i2CrWgXE1HookLu8Au0', 'True', '2013-09-16');
INSERT INTO public.spotify_albuns VALUES ('6g8Zu43gbKXEHqYs0ZKTcT', 'Electronic', '1991-05-24');
INSERT INTO public.spotify_albuns VALUES ('61DpFmkJvRgVWfqIFs5aaL', 'Electronic Heart', '2025-07-25');
INSERT INTO public.spotify_albuns VALUES ('5ZX3Zdp20YCGI4ruAfZlMj', 'Jamaican (Bam Bam)', '2025-11-07');
INSERT INTO public.spotify_albuns VALUES ('32ctPhGdnV2wvbwnZOacM2', 'Get The Message - The Best Of Electronic', '2006-09-15');
INSERT INTO public.spotify_albuns VALUES ('5RgewWw04f2SoharlTtjDc', 'Electronic Universe', '2024-10-18');
INSERT INTO public.spotify_albuns VALUES ('48zisMeiXniWLzOQghbPqS', 'Motion', '2014-10-31');
INSERT INTO public.spotify_albuns VALUES ('6EsBhtdqv8jbflBVjEOi68', 'ME PROVOCAS', '2019-05-03');


--
-- Data for Name: spotify_artistas; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.spotify_artistas VALUES ('1xmIVtkS9LEchsnnrKzhIR', 'DJ HM ZL', 0);
INSERT INTO public.spotify_artistas VALUES ('3lxhCRbMuc8uHPFG714lqM', 'DJ YAN MARIOTO', 0);
INSERT INTO public.spotify_artistas VALUES ('1b8S7EPzdckRyIh0uSbOMI', 'DJ Oreia', 0);
INSERT INTO public.spotify_artistas VALUES ('27CMmXxUH8UMkVGuFNFSOi', 'DJ Douglinhas', 0);
INSERT INTO public.spotify_artistas VALUES ('2f8xoxornfSw6ePzgyM9NO', 'MC Jvila', 0);
INSERT INTO public.spotify_artistas VALUES ('6kHgGRuWCJ5FpbieBncl9X', 'Biurifol', 0);
INSERT INTO public.spotify_artistas VALUES ('7Lmrb6KcIzfkmgbtokjsAL', 'Mc Don Juan', 0);
INSERT INTO public.spotify_artistas VALUES ('06ZuM9U6LcEyj1jLIE6jYt', 'Bento e Totó', 0);
INSERT INTO public.spotify_artistas VALUES ('1bpnl8qbR9GxmiNlkEufW6', 'DJ Japa NK', 0);
INSERT INTO public.spotify_artistas VALUES ('6liy2XyeKhIfj6dfSG1gCu', 'Dj Cabide', 0);
INSERT INTO public.spotify_artistas VALUES ('3lIU3RoZiHen1QXAQ3KQ9e', 'Tz da Coronel', 0);
INSERT INTO public.spotify_artistas VALUES ('1oBkccDqIDMTntIIHKlJBp', 'Long beatz', 0);
INSERT INTO public.spotify_artistas VALUES ('2uOlKKhuUUWlTITCYYUuIK', 'Pablo', 0);
INSERT INTO public.spotify_artistas VALUES ('6PXS4YHDkKvl1wkIl4V8DL', 'Fetty Wap', 0);
INSERT INTO public.spotify_artistas VALUES ('39QiJaZ1HzRcpY9xlMKCsF', 'TrapLaudo', 0);
INSERT INTO public.spotify_artistas VALUES ('05qCf6M7E7AxizHVmrcPqh', 'Kyan', 0);
INSERT INTO public.spotify_artistas VALUES ('4Y0VwRwAOyJutxoVpPX4td', 'Derek', 0);
INSERT INTO public.spotify_artistas VALUES ('1mV9h1AwhRXSjBFcYpajgY', 'Mc Lele JP', 0);
INSERT INTO public.spotify_artistas VALUES ('3EYuWIltJb3kzoKyRzcTsi', 'Dj Yuri Pedrada', 0);
INSERT INTO public.spotify_artistas VALUES ('2563ILWHSx52eOxOoi5rJW', '7 Minutoz', 0);
INSERT INTO public.spotify_artistas VALUES ('7gJN8W0589FisSYJS17K54', 'Filipe Ret', 0);
INSERT INTO public.spotify_artistas VALUES ('2A34a0y7xLXf20pXZpbjCY', 'DJ Marlboro', 0);
INSERT INTO public.spotify_artistas VALUES ('4vZcLTSiYdIBUFYtaps1uW', 'Filho do Piseiro', 0);
INSERT INTO public.spotify_artistas VALUES ('5UOOgRWguRmVZo1voJuQpf', 'Orgânico', 0);
INSERT INTO public.spotify_artistas VALUES ('2kCcBybjl3SAtIcwdWpUe3', 'Lil Peep', 0);
INSERT INTO public.spotify_artistas VALUES ('1YOVBTvznjiDvtAj4ExHeo', 'BK', 0);
INSERT INTO public.spotify_artistas VALUES ('487N2T9nIPEHrlTZLL3SQs', 'Zé Neto & Cristiano', 0);
INSERT INTO public.spotify_artistas VALUES ('3k68C6mNMJL6OaAdWeW2ZF', 'Diego & Victor Hugo', 0);
INSERT INTO public.spotify_artistas VALUES ('1elUiq4X7pxej6FRlrEzjM', 'Jorge & Mateus', 0);
INSERT INTO public.spotify_artistas VALUES ('3hq7WoPJsrRP0KMSLhUgRz', 'Murilo Huff', 0);
INSERT INTO public.spotify_artistas VALUES ('1D6vAeVUcgMbSx80IA3Zun', 'Henrique & Diego', 0);
INSERT INTO public.spotify_artistas VALUES ('3p7PcrEHaaKLJnPUGOtRlT', 'Henrique & Juliano', 0);
INSERT INTO public.spotify_artistas VALUES ('7gZu6kPnY9enEi5FvgTO4F', 'Felipe e Rodrigo', 0);
INSERT INTO public.spotify_artistas VALUES ('5Lv2GUVwqmQBPwrTrxucE5', 'Os Barões Da Pisadinha', 0);
INSERT INTO public.spotify_artistas VALUES ('6osuzg3Iddz6orKpsW17rT', 'Forró da Brucelose & Gilson Neto', 0);
INSERT INTO public.spotify_artistas VALUES ('0Il5vC8lqunSFNav4mMLxU', 'Natanzinho Lima', 0);
INSERT INTO public.spotify_artistas VALUES ('0iEEXnLK5t87wh91rNYozv', 'Forró Boys', 0);
INSERT INTO public.spotify_artistas VALUES ('2MRXYszuTIaEliCCD22crt', 'Manim Vaqueiro', 0);
INSERT INTO public.spotify_artistas VALUES ('4tuEa306iAefne5kgwLFnD', 'O Muriel', 0);
INSERT INTO public.spotify_artistas VALUES ('05bzIqzoC8zzAZVvUDdq1N', 'Forró Top 10', 0);
INSERT INTO public.spotify_artistas VALUES ('1AL2GKpmRrKXkYIcASuRFa', 'Wesley Safadão', 0);
INSERT INTO public.spotify_artistas VALUES ('6wduHvHCH5QZtWs6ULilDM', 'Henry Freitas', 0);
INSERT INTO public.spotify_artistas VALUES ('7yQrcdkLdBAkV7yY9fF2Hw', 'Grupo Revelação', 0);
INSERT INTO public.spotify_artistas VALUES ('5ZfBThYiIIhL7jHMG8gDB2', 'Ferrugem', 0);
INSERT INTO public.spotify_artistas VALUES ('6gEzJZrbm0F4ihvE9iXR9z', 'Péricles', 0);
INSERT INTO public.spotify_artistas VALUES ('6vTqEFbTtTRJsuIpzZgjxi', 'Grupo Menos É Mais', 0);
INSERT INTO public.spotify_artistas VALUES ('5JG9GISYjRLQUJMH2C6iJ5', 'Turma do Pagode', 0);
INSERT INTO public.spotify_artistas VALUES ('0pC5o5Jo4P8uNn2SSNmpXz', 'Marvvila', 0);
INSERT INTO public.spotify_artistas VALUES ('6KImCVD70vtIoJWnq6nGn3', 'Harry Styles', 0);
INSERT INTO public.spotify_artistas VALUES ('1Xyo4u8uXC1ZmMpatF05PJ', 'The Weeknd', 0);
INSERT INTO public.spotify_artistas VALUES ('0QHgL1lAIqAw0HtD7YldmP', 'DJ Khaled', 0);
INSERT INTO public.spotify_artistas VALUES ('3Nrfpe0tUJi4K4DXYWgMUX', 'BTS', 0);
INSERT INTO public.spotify_artistas VALUES ('66CXWjxzNUsdJxJ2JdwvnR', 'Ariana Grande', 0);
INSERT INTO public.spotify_artistas VALUES ('7qga9VgjmVrAAawr8WwUAH', 'Mc Leléto', 0);
INSERT INTO public.spotify_artistas VALUES ('6TxINSxeDX9C70nAiJZoVA', 'Mc Neguinho do ITR', 0);
INSERT INTO public.spotify_artistas VALUES ('3YJDqtTSjydvUpTvU1fJ6O', 'CG5', 0);
INSERT INTO public.spotify_artistas VALUES ('0BHm7qbh3ENxvXzkQAG7MP', 'Mari Fernandez', 0);
INSERT INTO public.spotify_artistas VALUES ('6xrc4RXcso9uKlYWlIANPU', 'Vitinho Imperador', 0);
INSERT INTO public.spotify_artistas VALUES ('3qm84nBOXUEQ2vnTfUTTFC', 'Guns N'' Roses', 0);
INSERT INTO public.spotify_artistas VALUES ('5nGIFgo0shDenQYSE0Sn7c', 'Evanescence', 0);
INSERT INTO public.spotify_artistas VALUES ('07XSN3sPlIlB2L2XNcTwJw', 'KISS', 0);
INSERT INTO public.spotify_artistas VALUES ('6olE6TJLqED3rqDCT0FyPh', 'Nirvana', 0);
INSERT INTO public.spotify_artistas VALUES ('3fMbdgg4jU18AjLCKBhRSm', 'Michael Jackson', 0);
INSERT INTO public.spotify_artistas VALUES ('1yxSLGMDHlW21z4YXirZDS', 'Black Eyed Peas', 0);
INSERT INTO public.spotify_artistas VALUES ('246dkjvS1zLTtiykXe5h60', 'Post Malone', 0);
INSERT INTO public.spotify_artistas VALUES ('2sHqRjGZ53cs4dnCU762na', 'Moura Dj', 0);
INSERT INTO public.spotify_artistas VALUES ('3PhoLpVuITZKcymswpck5b', 'Elton John', 0);
INSERT INTO public.spotify_artistas VALUES ('6USv9qhCn6zfxlBQIYJ9qs', 'Dominic Fike', 0);
INSERT INTO public.spotify_artistas VALUES ('77SW9BnxLY8rJ0RciFqkHh', 'The Neighbourhood', 0);
INSERT INTO public.spotify_artistas VALUES ('5p9HO3XC5P3BLxJs5Mtrhm', 'Djo', 0);
INSERT INTO public.spotify_artistas VALUES ('7Ln80lUS6He07XvHI8qqHH', 'Arctic Monkeys', 0);
INSERT INTO public.spotify_artistas VALUES ('5INjqkS1o8h1imAzPqGZBb', 'Tame Impala', 0);
INSERT INTO public.spotify_artistas VALUES ('1gl0S9pS0Zw0qfa14rDD3D', 'Surf Curse', 0);
INSERT INTO public.spotify_artistas VALUES ('2lJBtc5blv39p4PkiejRNE', 'eChevz', 0);
INSERT INTO public.spotify_artistas VALUES ('4AGNJdJiVltImYk1UTLE0K', 'Sports', 0);
INSERT INTO public.spotify_artistas VALUES ('1Lpj9eQh51y06BS2d7CrM3', 'Ducked Ape', 0);
INSERT INTO public.spotify_artistas VALUES ('5me0Irg2ANcsgc93uaYrpb', 'The Notorious B.I.G.', 0);
INSERT INTO public.spotify_artistas VALUES ('51d3rUlLuMh7EW09aMe7yj', 'B2K', 0);
INSERT INTO public.spotify_artistas VALUES ('0JjPiLQNgAFaEkwoy56B1C', 'L7NNON', 0);
INSERT INTO public.spotify_artistas VALUES ('3q7HBObVc0L8jNeTe5Gofh', '50 Cent', 0);
INSERT INTO public.spotify_artistas VALUES ('55Aa2cqylxrFIXC767Z865', 'Lil Wayne', 0);
INSERT INTO public.spotify_artistas VALUES ('0vLuOi2k62sHujIfplInlK', 'Hungria', 0);
INSERT INTO public.spotify_artistas VALUES ('2uwIwpXUSnFLDvw6tfiX43', 'Pacificadores', 0);
INSERT INTO public.spotify_artistas VALUES ('096an3uS6ZaK2XySae6SqP', 'Arlindo Cruz', 0);
INSERT INTO public.spotify_artistas VALUES ('78nr1pVnDR7qZH6QbVMYZf', 'Baco Exu do Blues', 0);
INSERT INTO public.spotify_artistas VALUES ('592JnViQ2tot63c1SbtgK2', 'MC Paulin da Capital', 0);
INSERT INTO public.spotify_artistas VALUES ('1McfnZuVjyGcXelEHsN2vc', 'Viola de Doze', 0);
INSERT INTO public.spotify_artistas VALUES ('7HGNYPmbDrMkylWqeFCOIQ', 'Caetano Veloso', 0);
INSERT INTO public.spotify_artistas VALUES ('74e1KteYpnPnRM4SiTJt9v', 'Rio Carnaval', 0);
INSERT INTO public.spotify_artistas VALUES ('5x2zeeLVXEDaMHRaRmH3FD', 'Vou Zuar', 0);
INSERT INTO public.spotify_artistas VALUES ('2yNNYQBChuox9A5Ka93BIn', 'HUNTR/X', 0);
INSERT INTO public.spotify_artistas VALUES ('7n2Ycct7Beij7Dj7meI4X0', 'TWICE', 0);
INSERT INTO public.spotify_artistas VALUES ('3c0gDdb9lhnHGFtP4prQpn', 'KATSEYE', 0);
INSERT INTO public.spotify_artistas VALUES ('1ZLU77nRzQIaP23mVSYpCQ', 'Hearts2Hearts', 0);
INSERT INTO public.spotify_artistas VALUES ('4SpbR6yFEvexJuaBpgAU5p', 'LE SSERAFIM', 0);
INSERT INTO public.spotify_artistas VALUES ('49muoiIu4uea4PO8vueUNN', 'YENA', 0);
INSERT INTO public.spotify_artistas VALUES ('250b0Wlc5Vk0CoUsaCY84M', 'JENNIE', 0);
INSERT INTO public.spotify_artistas VALUES ('0BJ2EjOqcfgFvlZXNKrNbE', 'Saja Boys', 0);
INSERT INTO public.spotify_artistas VALUES ('5WN4qyNrnrDosMqrczBxuo', 'Drinho Sp', 0);
INSERT INTO public.spotify_artistas VALUES ('06EMbW4WO6U4fGNnKjeuI5', 'Latino', 0);
INSERT INTO public.spotify_artistas VALUES ('790FomKkXshlbRYZFtlgla', 'KAROL G', 0);
INSERT INTO public.spotify_artistas VALUES ('4q3ewBCX7sLwd24euuV69X', 'Bad Bunny', 0);
INSERT INTO public.spotify_artistas VALUES ('0C8HhyOa7zfzIl3gmPjY52', 'Belchior', 0);
INSERT INTO public.spotify_artistas VALUES ('0yNSzH5nZmHzeE2xn6Xshb', 'Calle 13', 0);
INSERT INTO public.spotify_artistas VALUES ('7FNnA9vBm6EKceENgCGRMb', 'Anitta', 0);
INSERT INTO public.spotify_artistas VALUES ('5YFS41yoX0YuFY39fq21oN', 'Bob Sinclar', 0);
INSERT INTO public.spotify_artistas VALUES ('1vCWHaC5f2uS3yhpwWbIA6', 'Avicii', 0);
INSERT INTO public.spotify_artistas VALUES ('3xYNGCooNIzKMAtJYKSOyq', 'Electronic', 0);
INSERT INTO public.spotify_artistas VALUES ('4PUbhYyuHOrbVt6SIA4QPG', 'NIVEK FFORHS', 0);
INSERT INTO public.spotify_artistas VALUES ('5PlfkPxwCpRRWQJBxCa0By', 'HUGEL', 0);
INSERT INTO public.spotify_artistas VALUES ('6SGuGs4jpcN5beYE0ieD8O', 'UNCØD', 0);
INSERT INTO public.spotify_artistas VALUES ('7CajNmpbOovFoOoasH2HaY', 'Calvin Harris', 0);
INSERT INTO public.spotify_artistas VALUES ('3iuDJzaIhy7gDPgmUW2ujw', 'Fumaratto', 0);


--
-- Data for Name: spotify_generos; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.spotify_generos VALUES ('1', 'funk');
INSERT INTO public.spotify_generos VALUES ('2', 'trap');
INSERT INTO public.spotify_generos VALUES ('3', 'rap');
INSERT INTO public.spotify_generos VALUES ('4', 'sertanejo');
INSERT INTO public.spotify_generos VALUES ('5', 'forro');
INSERT INTO public.spotify_generos VALUES ('6', 'pagode');
INSERT INTO public.spotify_generos VALUES ('7', 'pop');
INSERT INTO public.spotify_generos VALUES ('8', 'rock');
INSERT INTO public.spotify_generos VALUES ('9', 'indie');
INSERT INTO public.spotify_generos VALUES ('10', 'hip hop');
INSERT INTO public.spotify_generos VALUES ('11', 'samba');
INSERT INTO public.spotify_generos VALUES ('12', 'kpop');
INSERT INTO public.spotify_generos VALUES ('13', 'latin');
INSERT INTO public.spotify_generos VALUES ('14', 'electronic');


--
-- Data for Name: spotify_musicas; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.spotify_musicas VALUES ('5s4j3EtFF9P0f1KkqYzcT5', 'O Tbt Que Ele Quer', NULL, NULL, '1xmIVtkS9LEchsnnrKzhIR', '1DT9WAK6DKPI4zBPTGOAKt', NULL, 172392, true, 'GXBAV2146965', 'https://open.spotify.com/track/5s4j3EtFF9P0f1KkqYzcT5', 'funk', 2.87);
INSERT INTO public.spotify_musicas VALUES ('27rqWKpmFCD0Mmw3XABBOW', 'Eu Vou Cuspir', NULL, NULL, '3lxhCRbMuc8uHPFG714lqM', '3ALuRC0WpEev3kQlYUH4Dt', NULL, 121846, true, 'QZ5FN2610844', 'https://open.spotify.com/track/27rqWKpmFCD0Mmw3XABBOW', 'funk', 2.03);
INSERT INTO public.spotify_musicas VALUES ('6kaWah1Acn1dtNjAy6sm1p', 'Diário de um Cafajeste', NULL, NULL, '1b8S7EPzdckRyIh0uSbOMI', '3KcnMYtFSEkkHfNsy6KwuA', NULL, 357120, true, 'BCGWP2500085', 'https://open.spotify.com/track/6kaWah1Acn1dtNjAy6sm1p', 'trap', 5.95);
INSERT INTO public.spotify_musicas VALUES ('4eqOz5gdCYww9GB5q3q1pU', 'Puta É Só um Detalhe', NULL, NULL, '27CMmXxUH8UMkVGuFNFSOi', '1lDtxHF9So0nM2qJJ5ngso', NULL, 158827, true, 'BC3PG2403709', 'https://open.spotify.com/track/4eqOz5gdCYww9GB5q3q1pU', 'funk', 2.65);
INSERT INTO public.spotify_musicas VALUES ('2Z1DmmPWD3Lm0dWAxMfjxG', 'Pirocada Quente', NULL, NULL, '2f8xoxornfSw6ePzgyM9NO', '1KhJdFsGysry0ClG5S8t16', NULL, 195692, true, 'BK4DA2502895', 'https://open.spotify.com/track/2Z1DmmPWD3Lm0dWAxMfjxG', 'funk', 3.26);
INSERT INTO public.spotify_musicas VALUES ('1UWDkzoTCX0prwWRuSOgAw', 'O Vovô Não Ta Casado', NULL, NULL, '6kHgGRuWCJ5FpbieBncl9X', '7s3G8eaTZ8mjCF18c9VKHb', NULL, 217845, true, 'BKBL72500076', 'https://open.spotify.com/track/1UWDkzoTCX0prwWRuSOgAw', 'funk', 3.63);
INSERT INTO public.spotify_musicas VALUES ('5UP7bp4eLm6MNOTWqqn19x', 'A Gente Brigou', NULL, NULL, '7Lmrb6KcIzfkmgbtokjsAL', '2C55Mdj6fs7MHU4wO3UmWe', NULL, 169769, true, 'BXG6R1700090', 'https://open.spotify.com/track/5UP7bp4eLm6MNOTWqqn19x', 'funk', 2.83);
INSERT INTO public.spotify_musicas VALUES ('1vQgz7OFIrWFf7W0o2TccY', 'Funk do Patinho', NULL, NULL, '06ZuM9U6LcEyj1jLIE6jYt', '0gFiHNOMhjKEMjbvFTUfGc', NULL, 113611, false, 'BX7CP2200001', 'https://open.spotify.com/track/1vQgz7OFIrWFf7W0o2TccY', 'funk', 1.89);
INSERT INTO public.spotify_musicas VALUES ('7qqixxBvZIGSep53Eh2o0b', 'Gauchinha', NULL, NULL, '1bpnl8qbR9GxmiNlkEufW6', '0iyEVVDNrHcSKCu37Jdc49', NULL, 273326, false, 'BRKO12501723', 'https://open.spotify.com/track/7qqixxBvZIGSep53Eh2o0b', 'funk', 4.56);
INSERT INTO public.spotify_musicas VALUES ('4tBVQcM2K5SBangjIl94ae', 'Mete Com Força Com Talento', NULL, NULL, '6liy2XyeKhIfj6dfSG1gCu', '4LsyhH9r3N2I20orjPdtfq', NULL, 135944, true, 'QZ5AB2087019', 'https://open.spotify.com/track/4tBVQcM2K5SBangjIl94ae', 'funk', 2.27);
INSERT INTO public.spotify_musicas VALUES ('2HzLEPWKXcfpwfmEIUURHo', 'Qual é seu desejo?', NULL, NULL, '3lIU3RoZiHen1QXAQ3KQ9e', '5qNaCpWDBGkFQ4xfLs0TKs', NULL, 153429, true, 'BC2TS2400002', 'https://open.spotify.com/track/2HzLEPWKXcfpwfmEIUURHo', 'trap', 2.56);
INSERT INTO public.spotify_musicas VALUES ('5FgvfSQJG0BugPXlbJPaeG', 'Trap de Bandido (feat. Meno Tody)', NULL, NULL, '1oBkccDqIDMTntIIHKlJBp', '6yrjtgrbKq5voENqyje92P', NULL, 279964, false, 'BRWMB2000916', 'https://open.spotify.com/track/5FgvfSQJG0BugPXlbJPaeG', 'trap', 4.67);
INSERT INTO public.spotify_musicas VALUES ('6mLHDDBbPFX0SU2KbVEBsv', 'Trapos e Farrapos', NULL, NULL, '2uOlKKhuUUWlTITCYYUuIK', '4KngrxmbT1fr7Tkdqo1Sei', NULL, 209880, false, 'BR6G51400012', 'https://open.spotify.com/track/6mLHDDBbPFX0SU2KbVEBsv', 'trap', 3.5);
INSERT INTO public.spotify_musicas VALUES ('2d8JP84HNLKhmd6IYOoupQ', 'Trap Queen', NULL, NULL, '6PXS4YHDkKvl1wkIl4V8DL', '2gKQvajkEEaDtkqJ8FJ4uw', NULL, 222093, true, 'QM7XC1400004', 'https://open.spotify.com/track/2d8JP84HNLKhmd6IYOoupQ', 'trap', 3.7);
INSERT INTO public.spotify_musicas VALUES ('4W87Hv4pBFsE0JEi7enRBQ', 'Malvada', NULL, NULL, '39QiJaZ1HzRcpY9xlMKCsF', '0kMDUt8bGLJfHRyXiUnBnJ', NULL, 300487, false, 'BK4442400131', 'https://open.spotify.com/track/4W87Hv4pBFsE0JEi7enRBQ', 'trap', 5.01);
INSERT INTO public.spotify_musicas VALUES ('6OAjbLmKmJpewSIfNiY4rI', 'Trap de Cria 2', NULL, NULL, '05qCf6M7E7AxizHVmrcPqh', '77zQ29QAZp5Rr0t3Vxnqoo', NULL, 157566, true, 'BX46W2100101', 'https://open.spotify.com/track/6OAjbLmKmJpewSIfNiY4rI', 'trap', 2.63);
INSERT INTO public.spotify_musicas VALUES ('4J53px209KDQCnsQTEsMJO', 'TRAP THE FATO', NULL, NULL, '4Y0VwRwAOyJutxoVpPX4td', '2Gb9tOJBTIkiXfdQq1cLgo', NULL, 216329, true, 'QZWDD2287294', 'https://open.spotify.com/track/4J53px209KDQCnsQTEsMJO', 'trap', 3.61);
INSERT INTO public.spotify_musicas VALUES ('7G8V8LiyyqwzSlsQLiaitN', 'Toma Gostosona', NULL, NULL, '1mV9h1AwhRXSjBFcYpajgY', '28zfaQrASPCHeLDkPIYQg8', NULL, 156923, true, 'BC3PG2501522', 'https://open.spotify.com/track/7G8V8LiyyqwzSlsQLiaitN', 'trap', 2.62);
INSERT INTO public.spotify_musicas VALUES ('65O1EyYSg0Leyf0li6Vzah', 'SET DJ YURI PEDRADA - TRAVA CHIP', NULL, NULL, '3EYuWIltJb3kzoKyRzcTsi', '1sLXpSh9ol5lle83QZyJTI', NULL, 487384, true, 'BXG6R2501138', 'https://open.spotify.com/track/65O1EyYSg0Leyf0li6Vzah', 'trap', 8.12);
INSERT INTO public.spotify_musicas VALUES ('3YWdolIwRLOeLbmj5Q9lIO', 'Rap Da Akatsuki: Os Ninjas Mais Procurados Do Mundo (Nerd Hits)', NULL, NULL, '2563ILWHSx52eOxOoi5rJW', '22mM3uheuOoCmlbe2079WE', NULL, 591298, false, 'QZES92035680', 'https://open.spotify.com/track/3YWdolIwRLOeLbmj5Q9lIO', 'rap', 9.85);
INSERT INTO public.spotify_musicas VALUES ('4S9FqbHyKVul04EpbA2Jin', 'Rap da Lealdade', NULL, NULL, '7gJN8W0589FisSYJS17K54', '1bOPoayIll75eZMxLV6lmp', NULL, 181417, false, 'BX7E52600003', 'https://open.spotify.com/track/4S9FqbHyKVul04EpbA2Jin', 'rap', 3.02);
INSERT INTO public.spotify_musicas VALUES ('0fXOs5kxjG7QHtow1BeY6H', 'Rap Do Silva', NULL, NULL, '2A34a0y7xLXf20pXZpbjCY', '0zaHf6dvKmMh7H2kg6tJLf', NULL, 252168, false, 'BRLRE0300140', 'https://open.spotify.com/track/0fXOs5kxjG7QHtow1BeY6H', 'rap', 4.2);
INSERT INTO public.spotify_musicas VALUES ('6xcQRc6H2UdTX425C2YzNY', 'Rap dos Hokages: A Vontade do Fogo (Nerd Hits)', NULL, NULL, '2563ILWHSx52eOxOoi5rJW', '0epgFUtxp0mQwVWiGHbqzE', NULL, 561495, false, 'QZPLR2077047', 'https://open.spotify.com/track/6xcQRc6H2UdTX425C2YzNY', 'rap', 9.36);
INSERT INTO public.spotify_musicas VALUES ('5puMdJT0vTBEnn0k0Cnah4', 'Raparigas', NULL, NULL, '4vZcLTSiYdIBUFYtaps1uW', '5tY1spD2VSjVodP2V8FZSS', NULL, 136333, true, 'QT6662597601', 'https://open.spotify.com/track/5puMdJT0vTBEnn0k0Cnah4', 'rap', 2.27);
INSERT INTO public.spotify_musicas VALUES ('1AiQsM4HVi0A3xxrXKvdxu', 'Rap do Itachi: Essa Dor Que Causei... (NERD HITS)', NULL, NULL, '2563ILWHSx52eOxOoi5rJW', '51waJCCTeUhh893IsA9AeS', NULL, 192060, false, 'QZHZ41930655', 'https://open.spotify.com/track/1AiQsM4HVi0A3xxrXKvdxu', 'rap', 3.2);
INSERT INTO public.spotify_musicas VALUES ('4HQ4VFKOJRnTGZlYOOgrr6', 'Dizeres (Undaiá)', NULL, NULL, '5UOOgRWguRmVZo1voJuQpf', '6iRyot1JljNZA7RnQp4aiK', NULL, 257644, false, 'BRC1S1800201', 'https://open.spotify.com/track/4HQ4VFKOJRnTGZlYOOgrr6', 'rap', 4.29);
INSERT INTO public.spotify_musicas VALUES ('4suKHiKiIP8uBmYWRBm3l9', 'Rap do Zoro: O Maior Espadachim do Mundo (Nerd Hits)', NULL, NULL, '2563ILWHSx52eOxOoi5rJW', '4M15kEp2oeRXUV3UsApUms', NULL, 209984, false, 'QZES52135715', 'https://open.spotify.com/track/4suKHiKiIP8uBmYWRBm3l9', 'rap', 3.5);
INSERT INTO public.spotify_musicas VALUES ('4k3xDpAdBuM17mNNHhOZkK', 'nuts', NULL, NULL, '2kCcBybjl3SAtIcwdWpUe3', '4hiArqU343m8BUT0lymyLO', NULL, 85360, true, 'UKELY2100069', 'https://open.spotify.com/track/4k3xDpAdBuM17mNNHhOZkK', 'rap', 1.42);
INSERT INTO public.spotify_musicas VALUES ('18KyJgSmfIPEsimWshBojB', 'Deusa', NULL, NULL, '1YOVBTvznjiDvtAj4ExHeo', '3OB3nqd1Vm38NSTT4gC1gN', NULL, 274800, false, 'BXAK52500025', 'https://open.spotify.com/track/18KyJgSmfIPEsimWshBojB', 'rap', 4.58);
INSERT INTO public.spotify_musicas VALUES ('39995SwI9fcO5ON9aku0gU', 'Seu Polícia - Ao Vivo', NULL, NULL, '487N2T9nIPEHrlTZLL3SQs', '7eKb9OUJogXHVngYaCxTCR', NULL, 169466, false, 'BRWNV1500037', 'https://open.spotify.com/track/39995SwI9fcO5ON9aku0gU', 'sertanejo', 2.82);
INSERT INTO public.spotify_musicas VALUES ('3JojUdNlifAfB5J9dLvJ9H', 'Tubarões - Ao Vivo', NULL, NULL, '3k68C6mNMJL6OaAdWeW2ZF', '6QRuaVhphYKYRiydSRzQhX', NULL, 162580, false, 'BC29Q2500001', 'https://open.spotify.com/track/3JojUdNlifAfB5J9dLvJ9H', 'sertanejo', 2.71);
INSERT INTO public.spotify_musicas VALUES ('6ccKu0LwJzOhLAxBwP2PTk', 'Os Anjos Cantam', NULL, NULL, '1elUiq4X7pxej6FRlrEzjM', '0spzPH10djjrUshMB2z9jt', NULL, 197600, false, 'BRRGE1500206', 'https://open.spotify.com/track/6ccKu0LwJzOhLAxBwP2PTk', 'sertanejo', 3.29);
INSERT INTO public.spotify_musicas VALUES ('38jMHjnOAJDR4QUdk3IXsw', 'Dois Enganados', NULL, NULL, '3hq7WoPJsrRP0KMSLhUgRz', '3yQc10lMcK8z7CfCRkCAJ3', NULL, 172751, false, 'BXMUM1900001', 'https://open.spotify.com/track/38jMHjnOAJDR4QUdk3IXsw', 'sertanejo', 2.88);
INSERT INTO public.spotify_musicas VALUES ('3Exj9ecmWalLPR6wHSxDFf', 'Whisky e Gelo - Acústico', NULL, NULL, '487N2T9nIPEHrlTZLL3SQs', '4QyeHXku1kDXZyGR9Do0Jv', NULL, 153426, false, 'BRRGE1900328', 'https://open.spotify.com/track/3Exj9ecmWalLPR6wHSxDFf', 'sertanejo', 2.56);
INSERT INTO public.spotify_musicas VALUES ('4lbPwb1Beo7JU2VwuJRTeR', 'Suíte 14 - Ao Vivo', NULL, NULL, '1D6vAeVUcgMbSx80IA3Zun', '2yqFE84Ne8JjDcEXhdi6qB', NULL, 178066, false, 'BRSME1401154', 'https://open.spotify.com/track/4lbPwb1Beo7JU2VwuJRTeR', 'sertanejo', 2.97);
INSERT INTO public.spotify_musicas VALUES ('42JNab8NPeCADJ9D3Cl5wS', 'Barulho Do Foguete - Ao Vivo', NULL, NULL, '487N2T9nIPEHrlTZLL3SQs', '3a6T0jJ6mF4KpBYvKH5o7Z', NULL, 133546, false, 'BRRGE2300443', 'https://open.spotify.com/track/42JNab8NPeCADJ9D3Cl5wS', 'sertanejo', 2.23);
INSERT INTO public.spotify_musicas VALUES ('4ksSf8cL3VlUvQSkFcRHy3', 'Até Você Voltar - Ao Vivo', NULL, NULL, '3p7PcrEHaaKLJnPUGOtRlT', '7ufAQ7EXPaaozbcIWszU5F', NULL, 204080, false, 'BRWNV1400045', 'https://open.spotify.com/track/4ksSf8cL3VlUvQSkFcRHy3', 'sertanejo', 3.4);
INSERT INTO public.spotify_musicas VALUES ('3tj5s3iIcTaJWh5MMrGB3k', 'Gosta De Rua (Ao Vivo)', NULL, NULL, '7gZu6kPnY9enEi5FvgTO4F', '1gjSzchPJFPPm6ZXAc0kbW', NULL, 171335, false, 'BKMKR2400004', 'https://open.spotify.com/track/3tj5s3iIcTaJWh5MMrGB3k', 'sertanejo', 2.86);
INSERT INTO public.spotify_musicas VALUES ('2Hw0LzrD6ic8AckKBxJhiO', 'Deixa Eu - Ao Vivo', NULL, NULL, '3hq7WoPJsrRP0KMSLhUgRz', '2lmUmRXPsds8n2YU68dalX', NULL, 158470, false, 'BKMWS2500003', 'https://open.spotify.com/track/2Hw0LzrD6ic8AckKBxJhiO', 'sertanejo', 2.64);
INSERT INTO public.spotify_musicas VALUES ('6nWPzkaAjRdjAGSFhpGc3O', 'Já Que Me Ensinou a Beber', NULL, NULL, '5Lv2GUVwqmQBPwrTrxucE5', '7nvdFAVwTz9D2ioC8polNu', NULL, 158432, false, 'BXDW71900041', 'https://open.spotify.com/track/6nWPzkaAjRdjAGSFhpGc3O', 'forro', 2.64);
INSERT INTO public.spotify_musicas VALUES ('47N8LdgG7I4H0sCSGtrKlP', 'Ficar Por Ficar', NULL, NULL, '6osuzg3Iddz6orKpsW17rT', '2aLLbD01475VnYlT7SPar8', NULL, 251506, false, 'BRBEL1900037', 'https://open.spotify.com/track/47N8LdgG7I4H0sCSGtrKlP', 'forro', 4.19);
INSERT INTO public.spotify_musicas VALUES ('0B5MvllckYxwCaf6S09XCx', '5 Da Manhã', NULL, NULL, '0Il5vC8lqunSFNav4mMLxU', '767gNuyfmDzbss8YCPHhGf', NULL, 148897, false, 'US3DF2421692', 'https://open.spotify.com/track/0B5MvllckYxwCaf6S09XCx', 'forro', 2.48);
INSERT INTO public.spotify_musicas VALUES ('6LlcXmX87Fe96hABt7Bg7r', 'Acabou', NULL, NULL, '0iEEXnLK5t87wh91rNYozv', '4Z47CXdkaO1PtucxpdbNK2', NULL, 255600, true, 'BRWNK1300065', 'https://open.spotify.com/track/6LlcXmX87Fe96hABt7Bg7r', 'forro', 4.26);
INSERT INTO public.spotify_musicas VALUES ('0gg3QtCcPZn4aJ0D7dRNul', 'Forró e Desmantelo', NULL, NULL, '2MRXYszuTIaEliCCD22crt', '6jaxI8krAMWipqYy44b36X', NULL, 162646, false, 'BKFGT2300214', 'https://open.spotify.com/track/0gg3QtCcPZn4aJ0D7dRNul', 'forro', 2.71);
INSERT INTO public.spotify_musicas VALUES ('4ScIxqcGDrJI8jCrd31brK', 'Búfalo Do Marajó - Ao Vivo', NULL, NULL, '4tuEa306iAefne5kgwLFnD', '1DZBpWdVyg0hm4K1efXHSt', NULL, 171767, false, 'BK4DA2463697', 'https://open.spotify.com/track/4ScIxqcGDrJI8jCrd31brK', 'forro', 2.86);
INSERT INTO public.spotify_musicas VALUES ('19ArNGHjjcLP4d1c8rL1RX', 'Seu Amor É Meu', NULL, NULL, '05bzIqzoC8zzAZVvUDdq1N', '64A77adCRgi3mQhdwPPa3k', NULL, 231660, false, 'FR96X1997553', 'https://open.spotify.com/track/19ArNGHjjcLP4d1c8rL1RX', 'forro', 3.86);
INSERT INTO public.spotify_musicas VALUES ('10AYbz4ux6BmC8b1BEDtFJ', 'Baladeiro', NULL, NULL, '0iEEXnLK5t87wh91rNYozv', '5Z9c1jU30BmlT1Vh10cMCJ', NULL, 231080, false, 'BRWNK1400071', 'https://open.spotify.com/track/10AYbz4ux6BmC8b1BEDtFJ', 'forro', 3.85);
INSERT INTO public.spotify_musicas VALUES ('0GSkoU7eaY0VvEPKdcAtHQ', 'Forrobodó - Ao Vivo', NULL, NULL, '1AL2GKpmRrKXkYIcASuRFa', '3sC9tJZqJHFEwLeEMOLoyN', NULL, 154761, false, 'BX12K2600017', 'https://open.spotify.com/track/0GSkoU7eaY0VvEPKdcAtHQ', 'forro', 2.58);
INSERT INTO public.spotify_musicas VALUES ('42AIPMFY5Plqxr4Mw6Bhx9', 'Me Fala Qual Necessidade - Ao Vivo', NULL, NULL, '6wduHvHCH5QZtWs6ULilDM', '1i6thmVWAz7Q9CMBSIWim5', NULL, 148195, false, 'BRSME2501472', 'https://open.spotify.com/track/42AIPMFY5Plqxr4Mw6Bhx9', 'forro', 2.47);
INSERT INTO public.spotify_musicas VALUES ('50mawjudhEofTcUIpRmGXr', 'Deixa Acontecer', NULL, NULL, '7yQrcdkLdBAkV7yY9fF2Hw', '20PI0BGshx4A5gz0Onl91a', NULL, 246226, false, 'BRDEP0400145', 'https://open.spotify.com/track/50mawjudhEofTcUIpRmGXr', 'samba', 4.1);
INSERT INTO public.spotify_musicas VALUES ('2NWFrQ7jPrZily5NVfgjFp', 'Arrependidaço (Onde Você Anda)', NULL, NULL, '5ZfBThYiIIhL7jHMG8gDB2', '0XEvRPcICVFzRYvEuC6i5L', NULL, 180832, false, 'BXG3O2500178', 'https://open.spotify.com/track/2NWFrQ7jPrZily5NVfgjFp', 'pagode', 3.01);
INSERT INTO public.spotify_musicas VALUES ('5MLTylyzHVd7oV8OE4JMZt', 'Até Que Durou - Ao Vivo', NULL, NULL, '6gEzJZrbm0F4ihvE9iXR9z', '01sCx6Vm4aogmmBf8SKYQP', NULL, 313854, false, 'BX3F31800002', 'https://open.spotify.com/track/5MLTylyzHVd7oV8OE4JMZt', 'pagode', 5.23);
INSERT INTO public.spotify_musicas VALUES ('4bxyHku6rNffRealVxu30p', 'Pela Última Vez - Ao Vivo', NULL, NULL, '6vTqEFbTtTRJsuIpzZgjxi', '5QVFS3TZhg8te5X8Eq20zV', NULL, 162325, false, 'BRRGE2502829', 'https://open.spotify.com/track/4bxyHku6rNffRealVxu30p', 'pagode', 2.71);
INSERT INTO public.spotify_musicas VALUES ('5A4DlgM68SnFSKImnMeiUH', 'Bebe e Vem Me Procurar / Quem Ama Sente Saudade (Ao Vivo)', NULL, NULL, '5JG9GISYjRLQUJMH2C6iJ5', '3GBBYTV5NTTn95v2z2ECyP', NULL, 216818, false, 'BXTUP2000035', 'https://open.spotify.com/track/5A4DlgM68SnFSKImnMeiUH', 'pagode', 3.61);
INSERT INTO public.spotify_musicas VALUES ('4rGZaAoBrEvfLGMDZapBKL', 'Vai Me Dando Corda - Ao Vivo', NULL, NULL, '6vTqEFbTtTRJsuIpzZgjxi', '7s2MXOVpIWBNcfnHGCDh3v', NULL, 268597, false, 'BCM8E2000004', 'https://open.spotify.com/track/4rGZaAoBrEvfLGMDZapBKL', 'pagode', 4.48);
INSERT INTO public.spotify_musicas VALUES ('4f0aDk7HX37SfzerfznYlr', 'Lapada Dela - Ao Vivo', NULL, NULL, '6vTqEFbTtTRJsuIpzZgjxi', '4rqK6xBQRRn9jBrHRQ3J2w', NULL, 159322, false, 'BCM8E2300013', 'https://open.spotify.com/track/4f0aDk7HX37SfzerfznYlr', 'pagode', 2.66);
INSERT INTO public.spotify_musicas VALUES ('65vJAh07BdwurqR9SRa6f8', 'Apaguei Pra Todos - Ao Vivo', NULL, NULL, '5ZfBThYiIIhL7jHMG8gDB2', '4S9yXoEJxk13SHsFsnYLcm', NULL, 198678, false, 'BXG3O2400032', 'https://open.spotify.com/track/65vJAh07BdwurqR9SRa6f8', 'pagode', 3.31);
INSERT INTO public.spotify_musicas VALUES ('3DT6PksB7jmHufnbDwgHnu', 'A Pagodeira - Ao Vivo', NULL, NULL, '0pC5o5Jo4P8uNn2SSNmpXz', '2g4R36g4rMzR8ST2xLQu39', NULL, 215196, false, 'BRWMB2100934', 'https://open.spotify.com/track/3DT6PksB7jmHufnbDwgHnu', 'pagode', 3.59);
INSERT INTO public.spotify_musicas VALUES ('2nNxtJ8Ce702sXXbVBwvW6', 'A Pagodeira - Ao Vivo', NULL, NULL, '0pC5o5Jo4P8uNn2SSNmpXz', '61erIGUIWd2zHF7KTaR9Xx', NULL, 215196, false, 'BRWMB2100934', 'https://open.spotify.com/track/2nNxtJ8Ce702sXXbVBwvW6', 'pagode', 3.59);
INSERT INTO public.spotify_musicas VALUES ('028i7HBfp8uE5epmx5ieMA', 'Pop', NULL, NULL, '6KImCVD70vtIoJWnq6nGn3', '69BqE1V8Bzb9GCyeP1fFeR', NULL, 216026, false, 'USSM12600104', 'https://open.spotify.com/track/028i7HBfp8uE5epmx5ieMA', 'pop', 3.6);
INSERT INTO public.spotify_musicas VALUES ('6WzRpISELf3YglGAh7TXcG', 'Popular (with Playboi Carti & Madonna) - From The Idol Vol. 1 (Music from the HBO Original Series)', NULL, NULL, '1Xyo4u8uXC1ZmMpatF05PJ', '5O0zUvdnJr0RbWzLFneN2i', NULL, 215466, true, 'USUG12303876', 'https://open.spotify.com/track/6WzRpISELf3YglGAh7TXcG', 'pop', 3.59);
INSERT INTO public.spotify_musicas VALUES ('6EDO9iiTtwNv6waLwa1UUq', 'POPSTAR (feat. Drake)', NULL, NULL, '0QHgL1lAIqAw0HtD7YldmP', '5nNtpPsSUgb9Hlb3dF1gXa', NULL, 200221, true, 'USSM12004501', 'https://open.spotify.com/track/6EDO9iiTtwNv6waLwa1UUq', 'pop', 3.34);
INSERT INTO public.spotify_musicas VALUES ('68lbSrXDORS51pmyjZv712', 'SWIM', NULL, NULL, '3Nrfpe0tUJi4K4DXYWgMUX', '3ukkRHDHbN8tNRPKsGZR1h', NULL, 159007, false, 'USA2P2600449', 'https://open.spotify.com/track/68lbSrXDORS51pmyjZv712', 'pop', 2.65);
INSERT INTO public.spotify_musicas VALUES ('3i8fIJNV0yuC4kXT3SkVBZ', 'Popular', NULL, NULL, '66CXWjxzNUsdJxJ2JdwvnR', '3JUrJP460nFIqwjxM19slT', NULL, 241501, false, 'USUG12407080', 'https://open.spotify.com/track/3i8fIJNV0yuC4kXT3SkVBZ', 'pop', 4.03);
INSERT INTO public.spotify_musicas VALUES ('7ndenspR4gaToxPExlgrop', 'Popozão', NULL, NULL, '7qga9VgjmVrAAawr8WwUAH', '2jlH0RiQxg63MI9E4MuXle', NULL, 117365, true, 'BXWC52600004', 'https://open.spotify.com/track/7ndenspR4gaToxPExlgrop', 'pop', 1.96);
INSERT INTO public.spotify_musicas VALUES ('75E2xyRjYAsmjfDeAwdW0D', 'Popotão Grandão', NULL, NULL, '6TxINSxeDX9C70nAiJZoVA', '0DWDEZ0R8mkCVvVZJXOIcN', NULL, 132922, false, 'BXG5C1700265', 'https://open.spotify.com/track/75E2xyRjYAsmjfDeAwdW0D', 'pop', 2.22);
INSERT INTO public.spotify_musicas VALUES ('5c0LlTO3yRYMkElrZCByjy', 'Sleep Well', NULL, NULL, '3YJDqtTSjydvUpTvU1fJ6O', '6POZaAyKpUNRelsnsQQRzN', NULL, 207654, false, 'USA2P2406901', 'https://open.spotify.com/track/5c0LlTO3yRYMkElrZCByjy', 'pop', 3.46);
INSERT INTO public.spotify_musicas VALUES ('0HixceBFegrCY3GFBB7SlQ', 'Saudade do Carai', NULL, NULL, '0BHm7qbh3ENxvXzkQAG7MP', '3PWOSqpHDsgbSNFjnsDTLn', NULL, 170777, false, 'BRRGE2506753', 'https://open.spotify.com/track/0HixceBFegrCY3GFBB7SlQ', 'pop', 2.85);
INSERT INTO public.spotify_musicas VALUES ('4SjcIkVc4cvFgURD1EHxDM', 'Eu Me Apaixonei', NULL, NULL, '6xrc4RXcso9uKlYWlIANPU', '4KTpdC3znS9wWKo4KQw6oA', NULL, 205714, false, 'BC8VV2500003', 'https://open.spotify.com/track/4SjcIkVc4cvFgURD1EHxDM', 'pop', 3.43);
INSERT INTO public.spotify_musicas VALUES ('7snQQk1zcKl8gZ92AnueZW', 'Sweet Child O'' Mine', NULL, NULL, '3qm84nBOXUEQ2vnTfUTTFC', '28yHV3Gdg30AiB8h8em1eW', NULL, 356066, false, 'USGF18714809', 'https://open.spotify.com/track/7snQQk1zcKl8gZ92AnueZW', 'rock', 5.93);
INSERT INTO public.spotify_musicas VALUES ('0COqiPhxzoWICwFCS4eZcp', 'Bring Me To Life', NULL, NULL, '5nGIFgo0shDenQYSE0Sn7c', '02w1xMzzdF2OJxTeh1basm', NULL, 235893, false, 'USWU30200093', 'https://open.spotify.com/track/0COqiPhxzoWICwFCS4eZcp', 'rock', 3.93);
INSERT INTO public.spotify_musicas VALUES ('07q0QVgO56EorrSGHC48y3', 'I Was Made For Lovin'' You', NULL, NULL, '07XSN3sPlIlB2L2XNcTwJw', '4FA68GsblSfvKZZRfM1tI1', NULL, 271240, false, 'USPR39330175', 'https://open.spotify.com/track/07q0QVgO56EorrSGHC48y3', 'rock', 4.52);
INSERT INTO public.spotify_musicas VALUES ('4CeeEOM32jQcH3eN9Q2dGj', 'Smells Like Teen Spirit', NULL, NULL, '6olE6TJLqED3rqDCT0FyPh', '2UJcKiJxNryhL050F5Z1Fk', NULL, 301920, false, 'USGF19942501', 'https://open.spotify.com/track/4CeeEOM32jQcH3eN9Q2dGj', 'indie', 5.03);
INSERT INTO public.spotify_musicas VALUES ('7oOOI85fVQvVnK5ynNMdW7', 'Rock with You - Single Version', NULL, NULL, '3fMbdgg4jU18AjLCKBhRSm', '2ZytN2cY4Zjrr9ukb2rqTP', NULL, 219926, false, 'USSM17900817', 'https://open.spotify.com/track/7oOOI85fVQvVnK5ynNMdW7', 'rock', 3.67);
INSERT INTO public.spotify_musicas VALUES ('2WQ09wqQBIOor7Q0VpIDBK', 'Rock That Body', NULL, NULL, '1yxSLGMDHlW21z4YXirZDS', '1dgbFU08pXJXZhGPlybdMX', NULL, 268840, false, 'USUM70967623', 'https://open.spotify.com/track/2WQ09wqQBIOor7Q0VpIDBK', 'rock', 4.48);
INSERT INTO public.spotify_musicas VALUES ('0e7ipj03S05BNilyu5bRzt', 'rockstar (feat. 21 Savage)', NULL, NULL, '246dkjvS1zLTtiykXe5h60', '6trNtQUgC8cgbWcqoMYkOR', NULL, 218146, true, 'USUM71710087', 'https://open.spotify.com/track/0e7ipj03S05BNilyu5bRzt', 'rock', 3.64);
INSERT INTO public.spotify_musicas VALUES ('7L9wyYAJgDPu9ClHhbtdQH', 'ROCK', NULL, NULL, '2sHqRjGZ53cs4dnCU762na', '3XZy1VJL8AdWFQrtZI9PM6', NULL, 118052, true, 'BCZ582501041', 'https://open.spotify.com/track/7L9wyYAJgDPu9ClHhbtdQH', 'rock', 1.97);
INSERT INTO public.spotify_musicas VALUES ('0xaNdYwK8ZF3cHSjraQGC0', 'Rocket Queen', NULL, NULL, '3qm84nBOXUEQ2vnTfUTTFC', '28yHV3Gdg30AiB8h8em1eW', NULL, 373266, false, 'USGF18714812', 'https://open.spotify.com/track/0xaNdYwK8ZF3cHSjraQGC0', 'rock', 6.22);
INSERT INTO public.spotify_musicas VALUES ('3gdewACMIVMEWVbyb8O9sY', 'Rocket Man (I Think It''s Going To Be A Long, Long Time)', NULL, NULL, '3PhoLpVuITZKcymswpck5b', '2ei2X6ghPnw7YRwQtAH075', NULL, 281613, false, 'GBAMB7200006', 'https://open.spotify.com/track/3gdewACMIVMEWVbyb8O9sY', 'rock', 4.69);
INSERT INTO public.spotify_musicas VALUES ('7yNf9YjeO5JXUE3JEBgnYc', 'Babydoll', NULL, NULL, '6USv9qhCn6zfxlBQIYJ9qs', '05jbNkYoEQdjVDHEHtg1gY', NULL, 97960, false, 'USQX91802457', 'https://open.spotify.com/track/7yNf9YjeO5JXUE3JEBgnYc', 'indie', 1.63);
INSERT INTO public.spotify_musicas VALUES ('2QjOHCTQ1Jl3zawyYOpxh6', 'Sweater Weather', NULL, NULL, '77SW9BnxLY8rJ0RciFqkHh', '4xkM0BwLM9H2IUcbYzpcBI', NULL, 240400, false, 'USSM11300080', 'https://open.spotify.com/track/2QjOHCTQ1Jl3zawyYOpxh6', 'indie', 4.01);
INSERT INTO public.spotify_musicas VALUES ('3qhlB30KknSejmIvZZLjOD', 'End of Beginning', NULL, NULL, '5p9HO3XC5P3BLxJs5Mtrhm', '4JDXBZdRPId4devseaAOKH', NULL, 159245, false, 'GBKPL2205058', 'https://open.spotify.com/track/3qhlB30KknSejmIvZZLjOD', 'indie', 2.65);
INSERT INTO public.spotify_musicas VALUES ('0BxE4FqsDD1Ot4YuBXwAPp', '505', NULL, NULL, '7Ln80lUS6He07XvHI8qqHH', '1XkGORuUX2QGOEIL4EbJKm', NULL, 253586, false, 'GBCEL0700074', 'https://open.spotify.com/track/0BxE4FqsDD1Ot4YuBXwAPp', 'indie', 4.23);
INSERT INTO public.spotify_musicas VALUES ('6K4t31amVTZDgR3sKmwUJJ', 'The Less I Know The Better', NULL, NULL, '5INjqkS1o8h1imAzPqGZBb', '79dL7FLiJFOO0EoehUHQBv', NULL, 216320, true, 'AUUM71500303', 'https://open.spotify.com/track/6K4t31amVTZDgR3sKmwUJJ', 'indie', 3.61);
INSERT INTO public.spotify_musicas VALUES ('7EkWXAI1wn8Ii883ecd9xr', 'Freaks', NULL, NULL, '1gl0S9pS0Zw0qfa14rDD3D', '5WjaIWthUR3AjA0UYG3jR5', NULL, 147062, false, 'USAT22102269', 'https://open.spotify.com/track/7EkWXAI1wn8Ii883ecd9xr', 'indie', 2.45);
INSERT INTO public.spotify_musicas VALUES ('0XqAH9essFTfk72Zq0Eqe4', 'Indie Cross (Indies)', NULL, NULL, '2lJBtc5blv39p4PkiejRNE', '1737ABfA7XhOtMybGsUGIu', NULL, 482313, false, 'QZYHM2601827', 'https://open.spotify.com/track/0XqAH9essFTfk72Zq0Eqe4', 'indie', 8.04);
INSERT INTO public.spotify_musicas VALUES ('2qpacEyFxmbxCpIEqZkqvC', 'You Are the Right One', NULL, NULL, '4AGNJdJiVltImYk1UTLE0K', '4QcHsIfSbjgNzZmxqfRP7N', NULL, 172506, false, 'QMAAK1594503', 'https://open.spotify.com/track/2qpacEyFxmbxCpIEqZkqvC', 'indie', 2.88);
INSERT INTO public.spotify_musicas VALUES ('7eqYRfkJM3oqXTKP7r1jiR', 'Indie Dance & House (LVL1) - Continuous Mix', NULL, NULL, '1Lpj9eQh51y06BS2d7CrM3', '1SXwt1XA4nUzOTU8fHadTY', NULL, 2575000, false, 'USLZJ1593830', 'https://open.spotify.com/track/7eqYRfkJM3oqXTKP7r1jiR', 'indie', 42.92);
INSERT INTO public.spotify_musicas VALUES ('63BcfK6YAzJYeISaTPr6IO', 'Big Poppa - 2007 Remaster', NULL, NULL, '5me0Irg2ANcsgc93uaYrpb', '5XqEf16OrHdmMoNS1b6WDg', NULL, 249866, true, 'USBB40706423', 'https://open.spotify.com/track/63BcfK6YAzJYeISaTPr6IO', 'hip hop', 4.16);
INSERT INTO public.spotify_musicas VALUES ('4c9XojqJDu7KNCh8GmNbj5', 'Hip Hop Phile', NULL, NULL, '3Nrfpe0tUJi4K4DXYWgMUX', '35voVqYGkotyJ945O9egDY', NULL, 257299, false, 'KRA381208691', 'https://open.spotify.com/track/4c9XojqJDu7KNCh8GmNbj5', 'hip hop', 4.29);
INSERT INTO public.spotify_musicas VALUES ('75lRRdjplzfpmBjNzMPyjR', 'Bump, Bump, Bump (feat. P. Diddy)', NULL, NULL, '51d3rUlLuMh7EW09aMe7yj', '7I35r17JNFjVEZPMHfe2nq', NULL, 282773, false, 'USSM10212636', 'https://open.spotify.com/track/75lRRdjplzfpmBjNzMPyjR', 'hip hop', 4.71);
INSERT INTO public.spotify_musicas VALUES ('1kErDTZ3TBduzQt1y6xIPX', 'Perdição', NULL, NULL, '0JjPiLQNgAFaEkwoy56B1C', '6TejnanlyEl203l8tnsS5C', NULL, 275000, false, 'BR5TG1900052', 'https://open.spotify.com/track/1kErDTZ3TBduzQt1y6xIPX', 'hip hop', 4.58);
INSERT INTO public.spotify_musicas VALUES ('5D2mYZuzcgjpchVY1pmTPh', 'Candy Shop', NULL, NULL, '3q7HBObVc0L8jNeTe5Gofh', '2pidzXTaHV4WaIJYRxKDCH', NULL, 209106, true, 'USIR10500072', 'https://open.spotify.com/track/5D2mYZuzcgjpchVY1pmTPh', 'hip hop', 3.49);
INSERT INTO public.spotify_musicas VALUES ('5jnxxpX2834SB6LJ0S73Uz', 'Lollipop', NULL, NULL, '55Aa2cqylxrFIXC767Z865', '1Do3y8IAcbYOToYQJnGwSO', NULL, 299333, true, 'USCM50800556', 'https://open.spotify.com/track/5jnxxpX2834SB6LJ0S73Uz', 'hip hop', 4.99);
INSERT INTO public.spotify_musicas VALUES ('6ZEKE3RR5EMhAMTJzjGOB6', 'Amor e Fé - Acústico', NULL, NULL, '0vLuOi2k62sHujIfplInlK', '4CIryXJJ3KvTalvh2JdPzB', NULL, 322736, true, 'BRAPI2000255', 'https://open.spotify.com/track/6ZEKE3RR5EMhAMTJzjGOB6', 'hip hop', 5.38);
INSERT INTO public.spotify_musicas VALUES ('3cuY2usAdXwLGKh8TtWgj5', 'Provavelmente', NULL, NULL, '0vLuOi2k62sHujIfplInlK', '3BXCGSZweo2wKz2ifG4ekS', NULL, 245504, false, 'QZ5AB1618558', 'https://open.spotify.com/track/3cuY2usAdXwLGKh8TtWgj5', 'hip hop', 4.09);
INSERT INTO public.spotify_musicas VALUES ('3OvcNlQAene3qcqwwfxsvO', 'A Rua', NULL, NULL, '2uwIwpXUSnFLDvw6tfiX43', '0maGsMVxTXH82a904gn2Q8', NULL, 261006, false, 'QZ5AB1834689', 'https://open.spotify.com/track/3OvcNlQAene3qcqwwfxsvO', 'hip hop', 4.35);
INSERT INTO public.spotify_musicas VALUES ('16Ij1j3ZawPQ2vxsnusKLY', 'Dubai', NULL, NULL, '0vLuOi2k62sHujIfplInlK', '6dkYPGRCnQUdCbCtS1em4C', NULL, 280218, true, 'US7VG1624695', 'https://open.spotify.com/track/16Ij1j3ZawPQ2vxsnusKLY', 'hip hop', 4.67);
INSERT INTO public.spotify_musicas VALUES ('52NFgCjGw7oZKIBABYKLPG', 'Meu Lugar', NULL, NULL, '096an3uS6ZaK2XySae6SqP', '3HuBoelQqiwD47mpONUHQw', NULL, 292906, false, 'BRDEP0700292', 'https://open.spotify.com/track/52NFgCjGw7oZKIBABYKLPG', 'samba', 4.88);
INSERT INTO public.spotify_musicas VALUES ('6ycaCm185cxHgc6ZAGgoMV', 'Ô Queiroz - Live At HSBC Arena/Rio de Janeiro(RJ)-Brazil/2012', NULL, NULL, '7yQrcdkLdBAkV7yY9fF2Hw', '1cARJvatBbzfuHONe2kr75', NULL, 207186, false, 'BRUM71201099', 'https://open.spotify.com/track/6ycaCm185cxHgc6ZAGgoMV', 'samba', 3.45);
INSERT INTO public.spotify_musicas VALUES ('1QaNsRazpKjGm3xhIrEVfO', 'Só Vai De Camarote - Ao Vivo', NULL, NULL, '7yQrcdkLdBAkV7yY9fF2Hw', '1cARJvatBbzfuHONe2kr75', NULL, 202800, false, 'BRUM71201092', 'https://open.spotify.com/track/1QaNsRazpKjGm3xhIrEVfO', 'samba', 3.38);
INSERT INTO public.spotify_musicas VALUES ('25KQALHh04rbmAamifLwKt', 'Samba in Paris', NULL, NULL, '78nr1pVnDR7qZH6QbVMYZf', '7dSmIjXuJI4vFgIF06hQ1k', NULL, 266250, false, 'BX2DO2200006', 'https://open.spotify.com/track/25KQALHh04rbmAamifLwKt', 'samba', 4.44);
INSERT INTO public.spotify_musicas VALUES ('5u7Xi0QhfkYy3qETJJ5lae', 'Samba de Malandro', NULL, NULL, '592JnViQ2tot63c1SbtgK2', '45IHFpwPgHPvjQHsZHURSu', NULL, 300842, true, 'BXKG22400584', 'https://open.spotify.com/track/5u7Xi0QhfkYy3qETJJ5lae', 'samba', 5.01);
INSERT INTO public.spotify_musicas VALUES ('6r7oDjoQCO9NG7KbfkL3jt', 'Samba Miudinho', NULL, NULL, '1McfnZuVjyGcXelEHsN2vc', '1vFjgGAi4Kw2XbLJ7ppDPw', NULL, 183506, false, 'QZEQU2079553', 'https://open.spotify.com/track/6r7oDjoQCO9NG7KbfkL3jt', 'samba', 3.06);
INSERT INTO public.spotify_musicas VALUES ('1vt0n3GcAYrsSMue1C6OtC', 'Samba De Verão', NULL, NULL, '7HGNYPmbDrMkylWqeFCOIQ', '2YE1G8rqX7FPwixLn3N5sv', NULL, 187626, false, 'BRLUM9800084', 'https://open.spotify.com/track/1vt0n3GcAYrsSMue1C6OtC', 'samba', 3.13);
INSERT INTO public.spotify_musicas VALUES ('4LmmmKA36fx4k2Nw5T6m23', 'Salgueiro de Corpo Fechado', NULL, NULL, '74e1KteYpnPnRM4SiTJt9v', '2BdaFtjbJo0wrU8HFOjnP8', NULL, 358721, false, 'BRGES2400016', 'https://open.spotify.com/track/4LmmmKA36fx4k2Nw5T6m23', 'samba', 5.98);
INSERT INTO public.spotify_musicas VALUES ('6fbCGwvj2V5JXYFovauhUr', 'Não Deixe o Samba Morrer / Retalhos de Cetim / Será Que É Amor - Ao Vivo', NULL, NULL, '5x2zeeLVXEDaMHRaRmH3FD', '7tIsYy5aV1KSsfBtgSK3dd', NULL, 438442, false, 'BXM2C2000026', 'https://open.spotify.com/track/6fbCGwvj2V5JXYFovauhUr', 'samba', 7.31);
INSERT INTO public.spotify_musicas VALUES ('5Cp75TUMrHF6c8xbhdligS', 'Golden', NULL, NULL, '2yNNYQBChuox9A5Ka93BIn', '2q4uMcogIfSvbjZevQTIDL', NULL, 194607, false, 'QZ8BZ2513510', 'https://open.spotify.com/track/5Cp75TUMrHF6c8xbhdligS', 'kpop', 3.24);
INSERT INTO public.spotify_musicas VALUES ('54mnwt3kO0uYsy0ceg14JP', 'What is Love?', NULL, NULL, '7n2Ycct7Beij7Dj7meI4X0', '5o5cJ6yZmcyy4y4hK0J6de', NULL, 208226, false, 'US5TA1800038', 'https://open.spotify.com/track/54mnwt3kO0uYsy0ceg14JP', 'kpop', 3.47);
INSERT INTO public.spotify_musicas VALUES ('1xOqGUkyxGQRdCvGpvWKmL', 'Gabriela', NULL, NULL, '3c0gDdb9lhnHGFtP4prQpn', '6rpin9IVOuBEWBYnrA9hft', NULL, 197226, false, 'USUM72503465', 'https://open.spotify.com/track/1xOqGUkyxGQRdCvGpvWKmL', 'kpop', 3.29);
INSERT INTO public.spotify_musicas VALUES ('2bAQsNqdo62T8akkIvWzGl', 'RUDE!', NULL, NULL, '1ZLU77nRzQIaP23mVSYpCQ', '3053E9tumiU5rqbAPWF06s', NULL, 200000, false, 'KRA302600032', 'https://open.spotify.com/track/2bAQsNqdo62T8akkIvWzGl', 'kpop', 3.33);
INSERT INTO public.spotify_musicas VALUES ('2N9miXnewVmUrgl6JSK1FI', 'SPAGHETTI', NULL, NULL, '4SpbR6yFEvexJuaBpgAU5p', '2yUrwTLHDWBrW74Ewuw6RX', NULL, 172313, true, 'USA2P2552922', 'https://open.spotify.com/track/2N9miXnewVmUrgl6JSK1FI', 'kpop', 2.87);
INSERT INTO public.spotify_musicas VALUES ('2O9bMJticxbQ8FH3NiQ7Xh', 'Catch Catch', NULL, NULL, '49muoiIu4uea4PO8vueUNN', '1IxQnpYIIFY9F2IVVsD27F', NULL, 180000, false, 'KRMIM2619092', 'https://open.spotify.com/track/2O9bMJticxbQ8FH3NiQ7Xh', 'kpop', 3);
INSERT INTO public.spotify_musicas VALUES ('0fK7ie6XwGxQTIkpFoWkd1', 'like JENNIE', NULL, NULL, '250b0Wlc5Vk0CoUsaCY84M', '1vWMw6pu3err6qqZzI3RhH', NULL, 123517, true, 'USQX92500261', 'https://open.spotify.com/track/0fK7ie6XwGxQTIkpFoWkd1', 'kpop', 2.06);
INSERT INTO public.spotify_musicas VALUES ('1CPZ5BxNNd0n0nF4Orb9JS', 'Golden', NULL, NULL, '2yNNYQBChuox9A5Ka93BIn', '14JkAa6IiFaOh5s0nMyMU9', NULL, 194607, false, 'QZ8BZ2513510', 'https://open.spotify.com/track/1CPZ5BxNNd0n0nF4Orb9JS', 'kpop', 3.24);
INSERT INTO public.spotify_musicas VALUES ('5sBDrrtLGbV64QJnEqfjer', 'What It Sounds Like', NULL, NULL, '2yNNYQBChuox9A5Ka93BIn', '14JkAa6IiFaOh5s0nMyMU9', NULL, 250268, false, 'QZ8BZ2513514', 'https://open.spotify.com/track/5sBDrrtLGbV64QJnEqfjer', 'kpop', 4.17);
INSERT INTO public.spotify_musicas VALUES ('1I37Zz2g3hk9eWxaNkj031', 'Your Idol', NULL, NULL, '0BJ2EjOqcfgFvlZXNKrNbE', '14JkAa6IiFaOh5s0nMyMU9', NULL, 191537, false, 'QZ8BZ2513512', 'https://open.spotify.com/track/1I37Zz2g3hk9eWxaNkj031', 'kpop', 3.19);
INSERT INTO public.spotify_musicas VALUES ('5p02vl3X0p227XS6Lro9sI', 'Latino Americano', NULL, NULL, '5WN4qyNrnrDosMqrczBxuo', '06bOKhOjYZe7OGjA5XK6tt', NULL, 276009, true, 'TCAIS2489607', 'https://open.spotify.com/track/5p02vl3X0p227XS6Lro9sI', 'latin', 4.6);
INSERT INTO public.spotify_musicas VALUES ('4noiU4KsxfroRVW1Ar19zB', 'Me Leva', NULL, NULL, '06EMbW4WO6U4fGNnKjeuI5', '2niOUFzrPzRJceBtDslesX', NULL, 216600, false, 'BRSME9500566', 'https://open.spotify.com/track/4noiU4KsxfroRVW1Ar19zB', 'latin', 3.61);
INSERT INTO public.spotify_musicas VALUES ('2KrQbq3aqGOFGnkTKnN2XA', 'LATINA FOREVA', NULL, NULL, '790FomKkXshlbRYZFtlgla', '0yY0fT7zibMEffhBJD9Nab', NULL, 159522, true, 'USUG12502629', 'https://open.spotify.com/track/2KrQbq3aqGOFGnkTKnN2XA', 'latin', 2.66);
INSERT INTO public.spotify_musicas VALUES ('68UEFTj2lUKMu6mJlp77mm', 'Amigo Fura-Olho', NULL, NULL, '06EMbW4WO6U4fGNnKjeuI5', '2NMI7OstpbjpH9DRrwL3nS', NULL, 274920, false, 'USQY50818969', 'https://open.spotify.com/track/68UEFTj2lUKMu6mJlp77mm', 'latin', 4.58);
INSERT INTO public.spotify_musicas VALUES ('3sK8wGT43QFpWrvNQsrQya', 'DtMF', NULL, NULL, '4q3ewBCX7sLwd24euuV69X', '5K79FLRUCSysQnVESLcTdb', NULL, 237117, true, 'QMFMF2447070', 'https://open.spotify.com/track/3sK8wGT43QFpWrvNQsrQya', 'latin', 3.95);
INSERT INTO public.spotify_musicas VALUES ('4MhdkKwzXifgDrdtNvMvJJ', 'Festa no Apê (Dragostea Din Tei)', NULL, NULL, '06EMbW4WO6U4fGNnKjeuI5', '6gPlOUYW8fgYluWN0NCJEG', NULL, 251520, false, 'BRUPP0400002', 'https://open.spotify.com/track/4MhdkKwzXifgDrdtNvMvJJ', 'latin', 4.19);
INSERT INTO public.spotify_musicas VALUES ('7oo3L1ZPEQSavDVSnlOvDa', 'Apenas Um Rapaz Latino Americano', NULL, NULL, '0C8HhyOa7zfzIl3gmPjY52', '2AwtTIdUFaUl69alioeFut', NULL, 258026, false, 'BRMCA7600058', 'https://open.spotify.com/track/7oo3L1ZPEQSavDVSnlOvDa', 'latin', 4.3);
INSERT INTO public.spotify_musicas VALUES ('1xuYajTJZh8zZrPRmUaagf', 'Latinoamérica (feat. Totó la Momposina, Susana Baca & Maria Rita)', NULL, NULL, '0yNSzH5nZmHzeE2xn6Xshb', '3yqcj5G3zkeXuWIx6cjQgx', NULL, 301426, false, 'USSD11000423', 'https://open.spotify.com/track/1xuYajTJZh8zZrPRmUaagf', 'latin', 5.02);
INSERT INTO public.spotify_musicas VALUES ('7CBWajKPyBA0GFtxmTzLBV', 'Choka Choka', NULL, NULL, '7FNnA9vBm6EKceENgCGRMb', '0ei3ArgXpn3uFZwxs90ySw', NULL, 131562, false, 'USUG12603194', 'https://open.spotify.com/track/7CBWajKPyBA0GFtxmTzLBV', 'latin', 2.19);
INSERT INTO public.spotify_musicas VALUES ('5WNTWK6ISkfnkth9JwxvCp', 'Choka Choka', NULL, NULL, '7FNnA9vBm6EKceENgCGRMb', '0X22dVuwJtKnZDlie1Eln5', NULL, 131555, false, 'USUG12603194', 'https://open.spotify.com/track/5WNTWK6ISkfnkth9JwxvCp', 'latin', 2.19);
INSERT INTO public.spotify_musicas VALUES ('6kTwzV93qpcovlRPmBOXmn', 'World Hold On (Children Of The Sky) - FISHER Rework', NULL, NULL, '5YFS41yoX0YuFY39fq21oN', '6VoEqXw1611XhQ60m0Uv3E', NULL, 178304, false, 'FR4E42227000', 'https://open.spotify.com/track/6kTwzV93qpcovlRPmBOXmn', 'electronic', 2.97);
INSERT INTO public.spotify_musicas VALUES ('0nrRP2bk19rLc0orkWPQk2', 'Wake Me Up', NULL, NULL, '1vCWHaC5f2uS3yhpwWbIA6', '2H6i2CrWgXE1HookLu8Au0', NULL, 247426, false, 'SEUM71301326', 'https://open.spotify.com/track/0nrRP2bk19rLc0orkWPQk2', 'electronic', 4.12);
INSERT INTO public.spotify_musicas VALUES ('0YZ7Q5i99vt9OEF8AEEaBV', 'Getting Away with It', NULL, NULL, '3xYNGCooNIzKMAtJYKSOyq', '6g8Zu43gbKXEHqYs0ZKTcT', NULL, 314600, false, 'USWB10002142', 'https://open.spotify.com/track/0YZ7Q5i99vt9OEF8AEEaBV', 'electronic', 5.24);
INSERT INTO public.spotify_musicas VALUES ('1RJY9Sgj963s3nQfF3VuR3', 'Electronic Heart - Slowed', NULL, NULL, '4PUbhYyuHOrbVt6SIA4QPG', '61DpFmkJvRgVWfqIFs5aaL', NULL, 235839, false, 'GXBAV2164406', 'https://open.spotify.com/track/1RJY9Sgj963s3nQfF3VuR3', 'electronic', 3.93);
INSERT INTO public.spotify_musicas VALUES ('6zyKrSyQWUqbIHAHQnCKry', 'Electronic Heart', NULL, NULL, '4PUbhYyuHOrbVt6SIA4QPG', '61DpFmkJvRgVWfqIFs5aaL', NULL, 188671, false, 'GXBAV2181356', 'https://open.spotify.com/track/6zyKrSyQWUqbIHAHQnCKry', 'electronic', 3.14);
INSERT INTO public.spotify_musicas VALUES ('7e4zDInS6tA2jwzphvs2Ay', 'Jamaican (Bam Bam)', NULL, NULL, '5PlfkPxwCpRRWQJBxCa0By', '5ZX3Zdp20YCGI4ruAfZlMj', NULL, 156393, false, 'ITFGO2500099', 'https://open.spotify.com/track/7e4zDInS6tA2jwzphvs2Ay', 'electronic', 2.61);
INSERT INTO public.spotify_musicas VALUES ('6sSvQqt2qVcZKOpqOvxJk9', 'Disappointed - Single Mix', NULL, NULL, '3xYNGCooNIzKMAtJYKSOyq', '32ctPhGdnV2wvbwnZOacM2', NULL, 261853, false, 'GBCBN9200005', 'https://open.spotify.com/track/6sSvQqt2qVcZKOpqOvxJk9', 'electronic', 4.36);
INSERT INTO public.spotify_musicas VALUES ('1VUG2lPBgTOwoLtQmR36Js', 'Electronic Universe', NULL, NULL, '6SGuGs4jpcN5beYE0ieD8O', '5RgewWw04f2SoharlTtjDc', NULL, 178116, false, 'QZTVM2494701', 'https://open.spotify.com/track/1VUG2lPBgTOwoLtQmR36Js', 'electronic', 2.97);
INSERT INTO public.spotify_musicas VALUES ('7MmG8p0F9N3C4AXdK6o6Eb', 'Outside (feat. Ellie Goulding)', NULL, NULL, '7CajNmpbOovFoOoasH2HaY', '48zisMeiXniWLzOQghbPqS', NULL, 227266, false, 'GBARL1401201', 'https://open.spotify.com/track/7MmG8p0F9N3C4AXdK6o6Eb', 'electronic', 3.79);
INSERT INTO public.spotify_musicas VALUES ('3S7Wn5DPIfUoJaGyQUtrV1', 'ME PROVOCAS', NULL, NULL, '3iuDJzaIhy7gDPgmUW2ujw', '6EsBhtdqv8jbflBVjEOi68', NULL, 292872, false, 'QZG2X1900022', 'https://open.spotify.com/track/3S7Wn5DPIfUoJaGyQUtrV1', 'electronic', 4.88);


--
-- Data for Name: spotify_playlist_musicas; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.spotify_playlist_musicas VALUES (1, 'funk', '5s4j3EtFF9P0f1KkqYzcT5');
INSERT INTO public.spotify_playlist_musicas VALUES (2, 'funk', '27rqWKpmFCD0Mmw3XABBOW');
INSERT INTO public.spotify_playlist_musicas VALUES (3, 'trap', '6kaWah1Acn1dtNjAy6sm1p');
INSERT INTO public.spotify_playlist_musicas VALUES (4, 'funk', '4eqOz5gdCYww9GB5q3q1pU');
INSERT INTO public.spotify_playlist_musicas VALUES (5, 'funk', '2Z1DmmPWD3Lm0dWAxMfjxG');
INSERT INTO public.spotify_playlist_musicas VALUES (6, 'funk', '1UWDkzoTCX0prwWRuSOgAw');
INSERT INTO public.spotify_playlist_musicas VALUES (7, 'funk', '5UP7bp4eLm6MNOTWqqn19x');
INSERT INTO public.spotify_playlist_musicas VALUES (8, 'funk', '1vQgz7OFIrWFf7W0o2TccY');
INSERT INTO public.spotify_playlist_musicas VALUES (9, 'funk', '7qqixxBvZIGSep53Eh2o0b');
INSERT INTO public.spotify_playlist_musicas VALUES (10, 'funk', '4tBVQcM2K5SBangjIl94ae');
INSERT INTO public.spotify_playlist_musicas VALUES (11, 'trap', '2HzLEPWKXcfpwfmEIUURHo');
INSERT INTO public.spotify_playlist_musicas VALUES (12, 'trap', '5FgvfSQJG0BugPXlbJPaeG');
INSERT INTO public.spotify_playlist_musicas VALUES (13, 'trap', '6mLHDDBbPFX0SU2KbVEBsv');
INSERT INTO public.spotify_playlist_musicas VALUES (14, 'trap', '2d8JP84HNLKhmd6IYOoupQ');
INSERT INTO public.spotify_playlist_musicas VALUES (15, 'trap', '4W87Hv4pBFsE0JEi7enRBQ');
INSERT INTO public.spotify_playlist_musicas VALUES (16, 'trap', '6OAjbLmKmJpewSIfNiY4rI');
INSERT INTO public.spotify_playlist_musicas VALUES (17, 'trap', '4J53px209KDQCnsQTEsMJO');
INSERT INTO public.spotify_playlist_musicas VALUES (18, 'trap', '7G8V8LiyyqwzSlsQLiaitN');
INSERT INTO public.spotify_playlist_musicas VALUES (19, 'trap', '65O1EyYSg0Leyf0li6Vzah');
INSERT INTO public.spotify_playlist_musicas VALUES (20, 'rap', '3YWdolIwRLOeLbmj5Q9lIO');
INSERT INTO public.spotify_playlist_musicas VALUES (21, 'rap', '4S9FqbHyKVul04EpbA2Jin');
INSERT INTO public.spotify_playlist_musicas VALUES (22, 'rap', '0fXOs5kxjG7QHtow1BeY6H');
INSERT INTO public.spotify_playlist_musicas VALUES (23, 'rap', '6xcQRc6H2UdTX425C2YzNY');
INSERT INTO public.spotify_playlist_musicas VALUES (24, 'rap', '5puMdJT0vTBEnn0k0Cnah4');
INSERT INTO public.spotify_playlist_musicas VALUES (25, 'rap', '1AiQsM4HVi0A3xxrXKvdxu');
INSERT INTO public.spotify_playlist_musicas VALUES (26, 'rap', '4HQ4VFKOJRnTGZlYOOgrr6');
INSERT INTO public.spotify_playlist_musicas VALUES (27, 'rap', '4suKHiKiIP8uBmYWRBm3l9');
INSERT INTO public.spotify_playlist_musicas VALUES (28, 'rap', '4k3xDpAdBuM17mNNHhOZkK');
INSERT INTO public.spotify_playlist_musicas VALUES (29, 'rap', '18KyJgSmfIPEsimWshBojB');
INSERT INTO public.spotify_playlist_musicas VALUES (30, 'sertanejo', '39995SwI9fcO5ON9aku0gU');
INSERT INTO public.spotify_playlist_musicas VALUES (31, 'sertanejo', '3JojUdNlifAfB5J9dLvJ9H');
INSERT INTO public.spotify_playlist_musicas VALUES (32, 'sertanejo', '6ccKu0LwJzOhLAxBwP2PTk');
INSERT INTO public.spotify_playlist_musicas VALUES (33, 'sertanejo', '38jMHjnOAJDR4QUdk3IXsw');
INSERT INTO public.spotify_playlist_musicas VALUES (34, 'sertanejo', '3Exj9ecmWalLPR6wHSxDFf');
INSERT INTO public.spotify_playlist_musicas VALUES (35, 'sertanejo', '4lbPwb1Beo7JU2VwuJRTeR');
INSERT INTO public.spotify_playlist_musicas VALUES (36, 'sertanejo', '42JNab8NPeCADJ9D3Cl5wS');
INSERT INTO public.spotify_playlist_musicas VALUES (37, 'sertanejo', '4ksSf8cL3VlUvQSkFcRHy3');
INSERT INTO public.spotify_playlist_musicas VALUES (38, 'sertanejo', '3tj5s3iIcTaJWh5MMrGB3k');
INSERT INTO public.spotify_playlist_musicas VALUES (39, 'sertanejo', '2Hw0LzrD6ic8AckKBxJhiO');
INSERT INTO public.spotify_playlist_musicas VALUES (40, 'forro', '6nWPzkaAjRdjAGSFhpGc3O');
INSERT INTO public.spotify_playlist_musicas VALUES (41, 'forro', '47N8LdgG7I4H0sCSGtrKlP');
INSERT INTO public.spotify_playlist_musicas VALUES (42, 'forro', '0B5MvllckYxwCaf6S09XCx');
INSERT INTO public.spotify_playlist_musicas VALUES (43, 'forro', '6LlcXmX87Fe96hABt7Bg7r');
INSERT INTO public.spotify_playlist_musicas VALUES (44, 'forro', '0gg3QtCcPZn4aJ0D7dRNul');
INSERT INTO public.spotify_playlist_musicas VALUES (45, 'forro', '4ScIxqcGDrJI8jCrd31brK');
INSERT INTO public.spotify_playlist_musicas VALUES (46, 'forro', '19ArNGHjjcLP4d1c8rL1RX');
INSERT INTO public.spotify_playlist_musicas VALUES (47, 'forro', '10AYbz4ux6BmC8b1BEDtFJ');
INSERT INTO public.spotify_playlist_musicas VALUES (48, 'forro', '0GSkoU7eaY0VvEPKdcAtHQ');
INSERT INTO public.spotify_playlist_musicas VALUES (49, 'forro', '42AIPMFY5Plqxr4Mw6Bhx9');
INSERT INTO public.spotify_playlist_musicas VALUES (50, 'samba', '50mawjudhEofTcUIpRmGXr');
INSERT INTO public.spotify_playlist_musicas VALUES (51, 'pagode', '2NWFrQ7jPrZily5NVfgjFp');
INSERT INTO public.spotify_playlist_musicas VALUES (52, 'pagode', '5MLTylyzHVd7oV8OE4JMZt');
INSERT INTO public.spotify_playlist_musicas VALUES (53, 'pagode', '4bxyHku6rNffRealVxu30p');
INSERT INTO public.spotify_playlist_musicas VALUES (54, 'pagode', '5A4DlgM68SnFSKImnMeiUH');
INSERT INTO public.spotify_playlist_musicas VALUES (55, 'pagode', '4rGZaAoBrEvfLGMDZapBKL');
INSERT INTO public.spotify_playlist_musicas VALUES (56, 'pagode', '4f0aDk7HX37SfzerfznYlr');
INSERT INTO public.spotify_playlist_musicas VALUES (57, 'pagode', '65vJAh07BdwurqR9SRa6f8');
INSERT INTO public.spotify_playlist_musicas VALUES (58, 'pagode', '3DT6PksB7jmHufnbDwgHnu');
INSERT INTO public.spotify_playlist_musicas VALUES (59, 'pagode', '2nNxtJ8Ce702sXXbVBwvW6');
INSERT INTO public.spotify_playlist_musicas VALUES (60, 'pop', '028i7HBfp8uE5epmx5ieMA');
INSERT INTO public.spotify_playlist_musicas VALUES (61, 'pop', '6WzRpISELf3YglGAh7TXcG');
INSERT INTO public.spotify_playlist_musicas VALUES (62, 'pop', '6EDO9iiTtwNv6waLwa1UUq');
INSERT INTO public.spotify_playlist_musicas VALUES (63, 'pop', '68lbSrXDORS51pmyjZv712');
INSERT INTO public.spotify_playlist_musicas VALUES (64, 'pop', '3i8fIJNV0yuC4kXT3SkVBZ');
INSERT INTO public.spotify_playlist_musicas VALUES (65, 'pop', '7ndenspR4gaToxPExlgrop');
INSERT INTO public.spotify_playlist_musicas VALUES (66, 'pop', '75E2xyRjYAsmjfDeAwdW0D');
INSERT INTO public.spotify_playlist_musicas VALUES (67, 'pop', '5c0LlTO3yRYMkElrZCByjy');
INSERT INTO public.spotify_playlist_musicas VALUES (68, 'pop', '0HixceBFegrCY3GFBB7SlQ');
INSERT INTO public.spotify_playlist_musicas VALUES (69, 'pop', '4SjcIkVc4cvFgURD1EHxDM');
INSERT INTO public.spotify_playlist_musicas VALUES (70, 'rock', '7snQQk1zcKl8gZ92AnueZW');
INSERT INTO public.spotify_playlist_musicas VALUES (71, 'rock', '0COqiPhxzoWICwFCS4eZcp');
INSERT INTO public.spotify_playlist_musicas VALUES (72, 'rock', '07q0QVgO56EorrSGHC48y3');
INSERT INTO public.spotify_playlist_musicas VALUES (73, 'indie', '4CeeEOM32jQcH3eN9Q2dGj');
INSERT INTO public.spotify_playlist_musicas VALUES (74, 'rock', '7oOOI85fVQvVnK5ynNMdW7');
INSERT INTO public.spotify_playlist_musicas VALUES (75, 'rock', '2WQ09wqQBIOor7Q0VpIDBK');
INSERT INTO public.spotify_playlist_musicas VALUES (76, 'rock', '0e7ipj03S05BNilyu5bRzt');
INSERT INTO public.spotify_playlist_musicas VALUES (77, 'rock', '7L9wyYAJgDPu9ClHhbtdQH');
INSERT INTO public.spotify_playlist_musicas VALUES (78, 'rock', '0xaNdYwK8ZF3cHSjraQGC0');
INSERT INTO public.spotify_playlist_musicas VALUES (79, 'rock', '3gdewACMIVMEWVbyb8O9sY');
INSERT INTO public.spotify_playlist_musicas VALUES (80, 'indie', '7yNf9YjeO5JXUE3JEBgnYc');
INSERT INTO public.spotify_playlist_musicas VALUES (81, 'indie', '2QjOHCTQ1Jl3zawyYOpxh6');
INSERT INTO public.spotify_playlist_musicas VALUES (82, 'indie', '3qhlB30KknSejmIvZZLjOD');
INSERT INTO public.spotify_playlist_musicas VALUES (83, 'indie', '0BxE4FqsDD1Ot4YuBXwAPp');
INSERT INTO public.spotify_playlist_musicas VALUES (84, 'indie', '6K4t31amVTZDgR3sKmwUJJ');
INSERT INTO public.spotify_playlist_musicas VALUES (85, 'indie', '7EkWXAI1wn8Ii883ecd9xr');
INSERT INTO public.spotify_playlist_musicas VALUES (86, 'indie', '0XqAH9essFTfk72Zq0Eqe4');
INSERT INTO public.spotify_playlist_musicas VALUES (87, 'indie', '2qpacEyFxmbxCpIEqZkqvC');
INSERT INTO public.spotify_playlist_musicas VALUES (88, 'indie', '7eqYRfkJM3oqXTKP7r1jiR');
INSERT INTO public.spotify_playlist_musicas VALUES (89, 'hip hop', '63BcfK6YAzJYeISaTPr6IO');
INSERT INTO public.spotify_playlist_musicas VALUES (90, 'hip hop', '4c9XojqJDu7KNCh8GmNbj5');
INSERT INTO public.spotify_playlist_musicas VALUES (91, 'hip hop', '75lRRdjplzfpmBjNzMPyjR');
INSERT INTO public.spotify_playlist_musicas VALUES (92, 'hip hop', '1kErDTZ3TBduzQt1y6xIPX');
INSERT INTO public.spotify_playlist_musicas VALUES (93, 'hip hop', '5D2mYZuzcgjpchVY1pmTPh');
INSERT INTO public.spotify_playlist_musicas VALUES (94, 'hip hop', '5jnxxpX2834SB6LJ0S73Uz');
INSERT INTO public.spotify_playlist_musicas VALUES (95, 'hip hop', '6ZEKE3RR5EMhAMTJzjGOB6');
INSERT INTO public.spotify_playlist_musicas VALUES (96, 'hip hop', '3cuY2usAdXwLGKh8TtWgj5');
INSERT INTO public.spotify_playlist_musicas VALUES (97, 'hip hop', '3OvcNlQAene3qcqwwfxsvO');
INSERT INTO public.spotify_playlist_musicas VALUES (98, 'hip hop', '16Ij1j3ZawPQ2vxsnusKLY');
INSERT INTO public.spotify_playlist_musicas VALUES (99, 'samba', '52NFgCjGw7oZKIBABYKLPG');
INSERT INTO public.spotify_playlist_musicas VALUES (100, 'samba', '6ycaCm185cxHgc6ZAGgoMV');
INSERT INTO public.spotify_playlist_musicas VALUES (101, 'samba', '1QaNsRazpKjGm3xhIrEVfO');
INSERT INTO public.spotify_playlist_musicas VALUES (102, 'samba', '25KQALHh04rbmAamifLwKt');
INSERT INTO public.spotify_playlist_musicas VALUES (103, 'samba', '5u7Xi0QhfkYy3qETJJ5lae');
INSERT INTO public.spotify_playlist_musicas VALUES (104, 'samba', '6r7oDjoQCO9NG7KbfkL3jt');
INSERT INTO public.spotify_playlist_musicas VALUES (105, 'samba', '1vt0n3GcAYrsSMue1C6OtC');
INSERT INTO public.spotify_playlist_musicas VALUES (106, 'samba', '4LmmmKA36fx4k2Nw5T6m23');
INSERT INTO public.spotify_playlist_musicas VALUES (107, 'samba', '6fbCGwvj2V5JXYFovauhUr');
INSERT INTO public.spotify_playlist_musicas VALUES (108, 'kpop', '5Cp75TUMrHF6c8xbhdligS');
INSERT INTO public.spotify_playlist_musicas VALUES (109, 'kpop', '54mnwt3kO0uYsy0ceg14JP');
INSERT INTO public.spotify_playlist_musicas VALUES (110, 'kpop', '1xOqGUkyxGQRdCvGpvWKmL');
INSERT INTO public.spotify_playlist_musicas VALUES (111, 'kpop', '2bAQsNqdo62T8akkIvWzGl');
INSERT INTO public.spotify_playlist_musicas VALUES (112, 'kpop', '2N9miXnewVmUrgl6JSK1FI');
INSERT INTO public.spotify_playlist_musicas VALUES (113, 'kpop', '2O9bMJticxbQ8FH3NiQ7Xh');
INSERT INTO public.spotify_playlist_musicas VALUES (114, 'kpop', '0fK7ie6XwGxQTIkpFoWkd1');
INSERT INTO public.spotify_playlist_musicas VALUES (115, 'kpop', '1CPZ5BxNNd0n0nF4Orb9JS');
INSERT INTO public.spotify_playlist_musicas VALUES (116, 'kpop', '5sBDrrtLGbV64QJnEqfjer');
INSERT INTO public.spotify_playlist_musicas VALUES (117, 'kpop', '1I37Zz2g3hk9eWxaNkj031');
INSERT INTO public.spotify_playlist_musicas VALUES (118, 'latin', '5p02vl3X0p227XS6Lro9sI');
INSERT INTO public.spotify_playlist_musicas VALUES (119, 'latin', '4noiU4KsxfroRVW1Ar19zB');
INSERT INTO public.spotify_playlist_musicas VALUES (120, 'latin', '2KrQbq3aqGOFGnkTKnN2XA');
INSERT INTO public.spotify_playlist_musicas VALUES (121, 'latin', '68UEFTj2lUKMu6mJlp77mm');
INSERT INTO public.spotify_playlist_musicas VALUES (122, 'latin', '3sK8wGT43QFpWrvNQsrQya');
INSERT INTO public.spotify_playlist_musicas VALUES (123, 'latin', '4MhdkKwzXifgDrdtNvMvJJ');
INSERT INTO public.spotify_playlist_musicas VALUES (124, 'latin', '7oo3L1ZPEQSavDVSnlOvDa');
INSERT INTO public.spotify_playlist_musicas VALUES (125, 'latin', '1xuYajTJZh8zZrPRmUaagf');
INSERT INTO public.spotify_playlist_musicas VALUES (126, 'latin', '7CBWajKPyBA0GFtxmTzLBV');
INSERT INTO public.spotify_playlist_musicas VALUES (127, 'latin', '5WNTWK6ISkfnkth9JwxvCp');
INSERT INTO public.spotify_playlist_musicas VALUES (128, 'electronic', '6kTwzV93qpcovlRPmBOXmn');
INSERT INTO public.spotify_playlist_musicas VALUES (129, 'electronic', '0nrRP2bk19rLc0orkWPQk2');
INSERT INTO public.spotify_playlist_musicas VALUES (130, 'electronic', '0YZ7Q5i99vt9OEF8AEEaBV');
INSERT INTO public.spotify_playlist_musicas VALUES (131, 'electronic', '1RJY9Sgj963s3nQfF3VuR3');
INSERT INTO public.spotify_playlist_musicas VALUES (132, 'electronic', '6zyKrSyQWUqbIHAHQnCKry');
INSERT INTO public.spotify_playlist_musicas VALUES (133, 'electronic', '7e4zDInS6tA2jwzphvs2Ay');
INSERT INTO public.spotify_playlist_musicas VALUES (134, 'electronic', '6sSvQqt2qVcZKOpqOvxJk9');
INSERT INTO public.spotify_playlist_musicas VALUES (135, 'electronic', '1VUG2lPBgTOwoLtQmR36Js');
INSERT INTO public.spotify_playlist_musicas VALUES (136, 'electronic', '7MmG8p0F9N3C4AXdK6o6Eb');
INSERT INTO public.spotify_playlist_musicas VALUES (137, 'electronic', '3S7Wn5DPIfUoJaGyQUtrV1');


--
-- Data for Name: spotify_playlists; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.spotify_playlists VALUES ('funk', 'funk', 9, NULL);
INSERT INTO public.spotify_playlists VALUES ('trap', 'trap', 10, NULL);
INSERT INTO public.spotify_playlists VALUES ('rap', 'rap', 10, NULL);
INSERT INTO public.spotify_playlists VALUES ('sertanejo', 'sertanejo', 10, NULL);
INSERT INTO public.spotify_playlists VALUES ('forro', 'forro', 10, NULL);
INSERT INTO public.spotify_playlists VALUES ('samba', 'samba', 10, NULL);
INSERT INTO public.spotify_playlists VALUES ('pagode', 'pagode', 9, NULL);
INSERT INTO public.spotify_playlists VALUES ('pop', 'pop', 10, NULL);
INSERT INTO public.spotify_playlists VALUES ('rock', 'rock', 9, NULL);
INSERT INTO public.spotify_playlists VALUES ('indie', 'indie', 10, NULL);
INSERT INTO public.spotify_playlists VALUES ('hip hop', 'hip hop', 10, NULL);
INSERT INTO public.spotify_playlists VALUES ('kpop', 'kpop', 10, NULL);
INSERT INTO public.spotify_playlists VALUES ('latin', 'latin', 10, NULL);
INSERT INTO public.spotify_playlists VALUES ('electronic', 'electronic', 10, NULL);


--
-- Data for Name: youtube_canais; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.youtube_canais VALUES ('UCuRGk7Q3-HzP036f6iCGwGg', 'MC Negão Original');
INSERT INTO public.youtube_canais VALUES ('UC5XG4yYM-_DQ-3HPRuam76Q', 'ingresso.com');
INSERT INTO public.youtube_canais VALUES ('UCIXguhHCl8eDTkXpEuiGPUA', 'Jazzghost');
INSERT INTO public.youtube_canais VALUES ('UChzfdc3Nx_FQhXMXu2RprUQ', 'Nova Hinos Evangélicos');
INSERT INTO public.youtube_canais VALUES ('UC9NXpIA01HVRhYgcEbs80Nw', 'Sony Pictures Brasil');
INSERT INTO public.youtube_canais VALUES ('UCrcBZDofBltcgGxphNia2tw', 'ProbIems');
INSERT INTO public.youtube_canais VALUES ('UCQp4yrRCGdGWi4TrF6xJyfg', 'MORADA');
INSERT INTO public.youtube_canais VALUES ('UC86X0tzvfk12eAG9JYMp99w', 'EA SPORTS UFC');
INSERT INTO public.youtube_canais VALUES ('UCZiYbVptd3PVPf4f6eR6UaQ', 'CazéTV');
INSERT INTO public.youtube_canais VALUES ('UCaxjS8mdF402rdn1hP6_1_Q', 'nostalgia lyrics.');
INSERT INTO public.youtube_canais VALUES ('UCTK443WemZxmW-hqYMe_2gA', 'A Gente Faz Agora');
INSERT INTO public.youtube_canais VALUES ('UCYkjBwZBgKTPuTLf_o4qcqw', 'ALEC GO! #games');
INSERT INTO public.youtube_canais VALUES ('UCedwIM6dmZy-f90HTzE1P-g', 'Love Trip');
INSERT INTO public.youtube_canais VALUES ('UCt_4wzTQqmcUvemNkeO0plA', 'Ei Nerd');
INSERT INTO public.youtube_canais VALUES ('UC0pQd2kmeo-bOL8JHB2dDLg', 'Top Hinos Gospel');
INSERT INTO public.youtube_canais VALUES ('UCAnCxJ1Weh2pUAKJW0bro0Q', 'Paramount+ Brasil');
INSERT INTO public.youtube_canais VALUES ('UCUouM5ZRqZoFNzUvpDeYNGQ', 'Lucas Clash ON');
INSERT INTO public.youtube_canais VALUES ('UChFSlUTSJNQK3v79abpQP4w', 'FUNK DE BIGODE');
INSERT INTO public.youtube_canais VALUES ('UCz1GPotHecuLngiLuY739QQ', 'Rotten Tomatoes TV');
INSERT INTO public.youtube_canais VALUES ('UCHDV3JN5aqxAy9hwTTVHJow', 'Skorpion Gamer');
INSERT INTO public.youtube_canais VALUES ('UCUcYZfWtTmNCHZf__dYkPHA', 'Release - Topic');
INSERT INTO public.youtube_canais VALUES ('UCP0GI-IbEZV59oExPioxeHw', 'Irmãos Piologo');
INSERT INTO public.youtube_canais VALUES ('UCdK8veAN0I3-9gs2Xqa7v9A', 'Amy Scarletona');
INSERT INTO public.youtube_canais VALUES ('UCqwUnggBBct-AY2lAdI88jQ', 'BABYMONSTER');
INSERT INTO public.youtube_canais VALUES ('UCc1l5mTmAv2GC_PXrBpqyKQ', 'Netflix Brasil');
INSERT INTO public.youtube_canais VALUES ('UCH27Wi4vlk2inrM8PLz02AQ', 'Nicole Maffi');
INSERT INTO public.youtube_canais VALUES ('UCxD5vCH031B-ifASKaTL9Sw', 'FUNKEIROS by Funk 24por48');
INSERT INTO public.youtube_canais VALUES ('UCWO8fCsyihQ9G8TdL_dS14w', 'Canal Influencine');
INSERT INTO public.youtube_canais VALUES ('UCf36H4Zhcv6k5R0C7hKZMxg', 'WELIX');
INSERT INTO public.youtube_canais VALUES ('UCn7Z0uhzGS1KjnO-sWml_dw', 'Unique Vibes');
INSERT INTO public.youtube_canais VALUES ('UCX9AkKp_kixtLvIILx2EewA', 'EntreMigas');
INSERT INTO public.youtube_canais VALUES ('UC9Qu6o04oTf-b2acahQVk1g', 'Kass & KR');
INSERT INTO public.youtube_canais VALUES ('UCzUYxHzLGAOtrdMFzb3inIQ', 'Top Gospel');
INSERT INTO public.youtube_canais VALUES ('UCGHFaCYLsfrK2uLNDRNZKOA', 'RcVillasBoas');
INSERT INTO public.youtube_canais VALUES ('UCR-Y4lWmrCYbr1XavmNMlvQ', 'Canal Clash War');
INSERT INTO public.youtube_canais VALUES ('UCgDOgC29exQffRL2jJxHfEA', 'DJ XOXO');
INSERT INTO public.youtube_canais VALUES ('UC2eb58Gxb613nJDjpuwWmgg', 'ONE Media Brasil');
INSERT INTO public.youtube_canais VALUES ('UC6P6SvP2arhEdJ9Pg8qwP2A', 'Athos');
INSERT INTO public.youtube_canais VALUES ('UCRmPovMeLZDTig34yDBZy4A', 'Chivateando x world');
INSERT INTO public.youtube_canais VALUES ('UCuPivVjnfNo4mb3Oog_frZg', 'A24');
INSERT INTO public.youtube_canais VALUES ('UCWh1rB6PKbMp2AkCMR4E_-Q', 'Liga GWL');
INSERT INTO public.youtube_canais VALUES ('UCvfRnJ72k-PrCzUmDdeaX-Q', '7clouds Country');
INSERT INTO public.youtube_canais VALUES ('UCQsRkagAnkyMoY6lOLN3EVA', 'Gigante Richard');
INSERT INTO public.youtube_canais VALUES ('UCABon3LeMfnU5ajXaOYC1oA', 'Amy Scarlet');
INSERT INTO public.youtube_canais VALUES ('UCcufmrPiSes5KceDFmVsEKA', 'GOSPEL MELODIES');
INSERT INTO public.youtube_canais VALUES ('UCaSAM5kna2KyX-uVLSGr8PQ', 'omeleteve');
INSERT INTO public.youtube_canais VALUES ('UCymE80p2pHiTP4Xye327CVA', 'Gabriel e Shirley - Games');
INSERT INTO public.youtube_canais VALUES ('UCQRNBXeiOQqdg4z3Fs2xw-Q', 'Get Worship');
INSERT INTO public.youtube_canais VALUES ('UCferfyAeOJAjS9GoI4td6gg', 'Canal PeeWee');
INSERT INTO public.youtube_canais VALUES ('UCQYcCfKYfYMcuCsem8z5CyQ', 'Pussy Riot');
INSERT INTO public.youtube_canais VALUES ('UCNlU3oSU8UnJ_V9uMB-cPOg', 'Musica Studios');
INSERT INTO public.youtube_canais VALUES ('UCjwIVogi9H0SYNuV8ZKPoxg', 'AZ Quiet Money');
INSERT INTO public.youtube_canais VALUES ('UCUUIp1k0tywKM1oGMkkuFvw', 'Nini Music');
INSERT INTO public.youtube_canais VALUES ('UCugdDigC_MdbHulqsdmTrDA', 'GRAVITY OMUTUJJU');
INSERT INTO public.youtube_canais VALUES ('UCuRYugT7op_l3_DTTHFxLKw', 'Shawn Storm Official');
INSERT INTO public.youtube_canais VALUES ('UCQRvC3Y_lvGpVBz-swkd3oA', 'KMK MAKUBURI');
INSERT INTO public.youtube_canais VALUES ('UCqjjyPUghDSSKFBABM_CXMw', 'Anitta');
INSERT INTO public.youtube_canais VALUES ('UCDGmojLIoWpXok597xYo8cg', 'BillieEilishVEVO');
INSERT INTO public.youtube_canais VALUES ('UCOwgc8DswjoBMuuUU2ScPvQ', 'Ava Max');
INSERT INTO public.youtube_canais VALUES ('UC-GI5LST5T3Gw93yZxjdFaw', 'DORETDEPLATINE');
INSERT INTO public.youtube_canais VALUES ('UCoUM-UJ7rirJYP8CQ0EIaHA', 'Bruno Mars');
INSERT INTO public.youtube_canais VALUES ('UCRQ6wJbGwbF9Wmvp5HfT7Pg', 'Latto');
INSERT INTO public.youtube_canais VALUES ('UCGocLgVQxEPvgIdIf299dkQ', 'La Tasya');
INSERT INTO public.youtube_canais VALUES ('UCbLXmxUM4ed7ls1Jwk0AT8w', 'Wada Du Game');
INSERT INTO public.youtube_canais VALUES ('UCPq0kgKjpNzryoNbRp5eUyQ', 'Cup of Joe');
INSERT INTO public.youtube_canais VALUES ('UCuE1A4MDBt8YkgUkRAKMtjw', 'Kehlani');
INSERT INTO public.youtube_canais VALUES ('UCv_GqVskWN79P-mfkGT8KXw', 'Syahiba Saufa Official');
INSERT INTO public.youtube_canais VALUES ('UCN1hnUccO4FD5WfM7ithXaw', 'Maroon5VEVO');
INSERT INTO public.youtube_canais VALUES ('UC6X1L21saoUvtnFsq_tI4Xw', 'SXYBIT');
INSERT INTO public.youtube_canais VALUES ('UCqECaJ8Gagnn7YCbPEzWH6g', 'Taylor Swift');
INSERT INTO public.youtube_canais VALUES ('UC0OgDWBWWo6Psopj6130G7Q', 'Nathan James');
INSERT INTO public.youtube_canais VALUES ('UCxw78-TUwaA2xqQkmjVHGLw', 'Belly Gang Kushington ');
INSERT INTO public.youtube_canais VALUES ('UC5r_oKHytA_qIFwguEbmRHA', 'KᗩTᗴᖇIᑎᗩ');
INSERT INTO public.youtube_canais VALUES ('UCsX6KBGngxQNW6By9VVPBuw', 'TRISNA MUSIC');
INSERT INTO public.youtube_canais VALUES ('UCdJoimz0uTe9bmvvf9G3s9A', 'FullyChop');
INSERT INTO public.youtube_canais VALUES ('UCGUS15deGIm934CuenQueAg', 'MrSad 17');
INSERT INTO public.youtube_canais VALUES ('UCe4LM_eKc9ywRmVuBm5pjQg', 'Atlantic Records');
INSERT INTO public.youtube_canais VALUES ('UCqSQvq0K7rtRL8hX175LkMA', 'PearljamVEVO');
INSERT INTO public.youtube_canais VALUES ('UCF_fDSgPpBQuh1MsUTgIARQ', 'TheWeekndVEVO');
INSERT INTO public.youtube_canais VALUES ('UCfLdIEPs1tYj4ieEdJnyNyw', 'Lauv');
INSERT INTO public.youtube_canais VALUES ('UCSEmH1YyFWltSBYkfLMtkcg', 'ElvisPresleyVEVO');
INSERT INTO public.youtube_canais VALUES ('UChf0Knt-e9Pw8VywfuTZCjA', 'AliceInChainsVEVO');
INSERT INTO public.youtube_canais VALUES ('UCpTaAz_BxtkUB1qc8JTU_7g', 'dojacatVEVO');
INSERT INTO public.youtube_canais VALUES ('UC72IXi6wx33LdltVkdwtLpw', 'EarthWindandFireVEVO');
INSERT INTO public.youtube_canais VALUES ('UCB2ADTh5dbYcI46S-_ju7ww', 'JohnDenverVEVO');
INSERT INTO public.youtube_canais VALUES ('UCJRqaM_C1asb8fq-zeSps0w', 'TheNeighbourhoodVEVO');
INSERT INTO public.youtube_canais VALUES ('UCc7_woMAIVIW2mAr1rPCsFQ', 'Paramore');
INSERT INTO public.youtube_canais VALUES ('UCty_FzLdVEPlsUMg1O8eEgA', 'SantanaVEVO');
INSERT INTO public.youtube_canais VALUES ('UCzSMLQdgZwTE4emG7teJ5lw', 'barbrastreisandVEVO');
INSERT INTO public.youtube_canais VALUES ('UCppDTVlStRaBhBrifooOOWg', 'MobbDeepVEVO');
INSERT INTO public.youtube_canais VALUES ('UCfgsFOdVScKetBXYrFNr5LQ', 'A Boogie Wit da Hoodie');
INSERT INTO public.youtube_canais VALUES ('UCxMAbVFmxKUVGAll0WVGpFw', 'Cardi B');
INSERT INTO public.youtube_canais VALUES ('UChwJDTqACGvdzI7-BI_BX5w', 'Djo Music');
INSERT INTO public.youtube_canais VALUES ('UCp_8NqIsZVAaGiVi3im7A8Q', 'JohnnyCashVEVO');
INSERT INTO public.youtube_canais VALUES ('UCpf5YXmzGHC4m5uLCdlrrfA', 'Todah Music');
INSERT INTO public.youtube_canais VALUES ('UCbVwJCxsVbmaP1PFmbGQDeQ', 'MK MUSIC');
INSERT INTO public.youtube_canais VALUES ('UCX4avjbYsDZasQPfYST1kJQ', 'Graça Music');
INSERT INTO public.youtube_canais VALUES ('UCBP7b1xKoI-ahduavsqeLCQ', 'Todah Experience Live');
INSERT INTO public.youtube_canais VALUES ('UCY9xIaF8CIdS23e0W6nHAmg', 'Talking Tom & Friends Brasil');
INSERT INTO public.youtube_canais VALUES ('UC2mT7quMGAx5wPsARspOGIA', 'Marina Sena');
INSERT INTO public.youtube_canais VALUES ('UChGlhi8jkPmZWC_YzoZavDw', 'Raffa Moreira');
INSERT INTO public.youtube_canais VALUES ('UCNauntDSSJY2kSODiVBg4jQ', 'Rio Carnaval');
INSERT INTO public.youtube_canais VALUES ('UCEUsbKNdilM6Z-HMJDpo-yQ', 'Mundo Torajo');
INSERT INTO public.youtube_canais VALUES ('UCyPw7nYWFQ4kS9GdcZKKFUg', 'Theuzinho Cantor');
INSERT INTO public.youtube_canais VALUES ('UC3EPFEI1TdOtPdDPS1nRt2w', 'Nattan');
INSERT INTO public.youtube_canais VALUES ('UCwSE3LmfzUsVzhWHVGE9Bog', 'Anderson E Vei da Pisadinha Oficial');
INSERT INTO public.youtube_canais VALUES ('UC6rYtBoPD6pmI06POwKij-g', 'ArianneMusic');
INSERT INTO public.youtube_canais VALUES ('UCBuxb0TFYFzbKcDxs1pwV1Q', 'Eliane Fernandes');
INSERT INTO public.youtube_canais VALUES ('UCYZ5mprkRCja8rHBlZEwp-Q', 'Pisadinha De Luxo');
INSERT INTO public.youtube_canais VALUES ('UCS9gMdk-A9MQbCk9k_1NFoQ', 'Antônia Gomes');
INSERT INTO public.youtube_canais VALUES ('UCIcC20Zdy6PYASADaGQV_Eg', 'Funk 24por48');
INSERT INTO public.youtube_canais VALUES ('UC5U4MfVveoRxlMx0czbPGqw', 'Funk Explode ');
INSERT INTO public.youtube_canais VALUES ('UCSuSIGBs8xTkPID0maXgydg', 'Release - Topic');
INSERT INTO public.youtube_canais VALUES ('UCffDXn7ycAzwL2LDlbyWOTw', 'Canal KondZilla');
INSERT INTO public.youtube_canais VALUES ('UCNUQK9mQoqi4yNXw2_Rj6SA', 'GR6 EXPLODE');
INSERT INTO public.youtube_canais VALUES ('UCaQZ8fVbivr6hHtaTgGvQ-g', 'FUNK NO TOPO');
INSERT INTO public.youtube_canais VALUES ('UCW25ko4WmwfDKht1Vy8ujaQ', 'VISÃO DE CRIA');
INSERT INTO public.youtube_canais VALUES ('UCrPMM16a2XymtrPJwFW4kAQ', 'DENNIS');
INSERT INTO public.youtube_canais VALUES ('UC9OMsuaqvGdF0MtK3gYYNkA', 'Love Funk');
INSERT INTO public.youtube_canais VALUES ('UC51rMi7DcZmStoQH91Adveg', 'Dj Caio Vieira - Topic');
INSERT INTO public.youtube_canais VALUES ('UCUk_if2zqfCvPFz3jydYrjA', 'BEL MUSIC');
INSERT INTO public.youtube_canais VALUES ('UCxiHdOFRj1uT_vzZmdmNtXw', 'Bololo Records');
INSERT INTO public.youtube_canais VALUES ('UCa1Bc6MEwQjMYJx1nar2DIQ', 'Robin Roxette');
INSERT INTO public.youtube_canais VALUES ('UCGBpxWJr9FNOcFYA5GkKrMg', 'Boiler Room');
INSERT INTO public.youtube_canais VALUES ('UCgDXShbFfBWHWbzv2p_2M7A', 'DJ MARCELO FOGUETE');
INSERT INTO public.youtube_canais VALUES ('UCXX14DhKp9FsTo50osm-KUw', 'VIRAL HITS');
INSERT INTO public.youtube_canais VALUES ('UCPW7syVY4Xt52Fhn6NxWFSQ', 'Fuego Brasil Graves');
INSERT INTO public.youtube_canais VALUES ('UCR1bQTKTuTm99nDQUo9BgPg', 'Dj menor do sb');
INSERT INTO public.youtube_canais VALUES ('UCYOpPILQDfJdQP3zCX3aVfQ', 'Vulgo FK');
INSERT INTO public.youtube_canais VALUES ('UCoHV8LxUFKeIvifJsB3c7Ww', '30PRAUM');
INSERT INTO public.youtube_canais VALUES ('UCWSQbyw6p43P1w2gyKsyH1w', 'Ícaro Lima');
INSERT INTO public.youtube_canais VALUES ('UCH8pCpWTijJeDxi-8zM2F-w', 'TRAP BRASIL');
INSERT INTO public.youtube_canais VALUES ('UCq6oOchdrstuKgv8d3kV3Dw', 'WIU - Topic');
INSERT INTO public.youtube_canais VALUES ('UCxpQLDqF5sl1mGuy3609NrQ', 'TRAP BRASIL OFICIAL');
INSERT INTO public.youtube_canais VALUES ('UCAI8SmRbXgSpP8Zo3xZbxzQ', 'Hungria');
INSERT INTO public.youtube_canais VALUES ('UCYxLlKfySq3RVLKdNSQ1Gug', 'Warner Music Brasil');
INSERT INTO public.youtube_canais VALUES ('UCu7O9lAbeZp3WW96Lf5Xk7g', 'DEREK');
INSERT INTO public.youtube_canais VALUES ('UCCrz2yNyIsxpPe2rhJR2zjA', 'BG LOVE FUNK');
INSERT INTO public.youtube_canais VALUES ('UCEio9P7qw32d5pnLKJQWJUA', 'DJ LUANZINHO YTB LIGHT');
INSERT INTO public.youtube_canais VALUES ('UCKh2WhQRJ5RkAQ9_TIKQGcg', 'Duquesa');
INSERT INTO public.youtube_canais VALUES ('UCm_ScSW5MFcTLLh4pzch7JQ', 'Leviano');
INSERT INTO public.youtube_canais VALUES ('UCe5pPUSFEajlij-LrxUl19A', 'Tribo da Periferia');
INSERT INTO public.youtube_canais VALUES ('UC6dtGRUp-ZhaICs0qz2l0Fw', 'henrique961000');
INSERT INTO public.youtube_canais VALUES ('UC2EBMe1AVltGzvL7UpXCMmw', 'Blakkclout');
INSERT INTO public.youtube_canais VALUES ('UC6eIJRyB8MvcqdwF6ZFUnqQ', 'Cyber Dj');
INSERT INTO public.youtube_canais VALUES ('UCDT5YhWTMwdyWTJC2QsZp5g', 'Cidinho & Doca');
INSERT INTO public.youtube_canais VALUES ('UCqhmlFknRAuBvT1grx1jZPw', 'HAIKAISS OFICIAL');
INSERT INTO public.youtube_canais VALUES ('UCAe6HU3wR0FCdIzkg22TgWw', 'Bendita Gravadora');
INSERT INTO public.youtube_canais VALUES ('UCLgLOu_gWyumG83paac3nTw', 'Bob Rum');
INSERT INTO public.youtube_canais VALUES ('UCsyd_nnNNDxlOs9TYrDvCoQ', 'MC Poze do Rodo');
INSERT INTO public.youtube_canais VALUES ('UCRApI5JQ8oA9r5NxZXX8O9w', 'Dj Hum');
INSERT INTO public.youtube_canais VALUES ('UCHJZxi3jW7iT-5Ae5xWXE5Q', 'Sabotage');
INSERT INTO public.youtube_canais VALUES ('UCaqFH2lGTICD9iWi8NCdbBw', 'TASHA & TRACIE');
INSERT INTO public.youtube_canais VALUES ('UCr3DvQcWm5ljd-c68cu1wZw', 'mexicanpride3235');
INSERT INTO public.youtube_canais VALUES ('UC0-clSqGiArqh1CaskKiu3g', 'Racionais MC''s - Topic');
INSERT INTO public.youtube_canais VALUES ('UCFiCa9ecf-jGAGQuHbcoOLw', 'Planet Hemp');
INSERT INTO public.youtube_canais VALUES ('UCe6pKugTDyOPT1Md2DTybbQ', '7 Minutoz');
INSERT INTO public.youtube_canais VALUES ('UC81qZMkuX_kaJytab4wKqng', 'Insanou');
INSERT INTO public.youtube_canais VALUES ('UCPIImx-7tGVN50o5EsyUGhg', 'CL a Posse');
INSERT INTO public.youtube_canais VALUES ('UCxcJlObi1B4hKPY-so-4myw', 'Edi Rock');
INSERT INTO public.youtube_canais VALUES ('UCJZMKO4pCeNf8jVifCGxFjw', 'Diego e Victor Hugo');
INSERT INTO public.youtube_canais VALUES ('UCn0NUsrqao9WNBO6A-hIEOg', 'Sertanejo 2020');
INSERT INTO public.youtube_canais VALUES ('UCVjsKYd_OXTP1M2Kbmcz64g', 'MatheusKauanVEVO');
INSERT INTO public.youtube_canais VALUES ('UCwfEOn0O1DWcyTgzVVu28ig', 'Marília Mendonça');
INSERT INTO public.youtube_canais VALUES ('UCXooz9whNJZBRTHi9AqdjPw', 'Gusttavo Lima Oficial');
INSERT INTO public.youtube_canais VALUES ('UCPdHWqkyXG7JBcsOv0sT6Bg', 'Tierry Oficial');
INSERT INTO public.youtube_canais VALUES ('UCOIg-wxSLlZJi6hHddtO8-A', 'Modão e Sertanejo - Ferrari Produções ');
INSERT INTO public.youtube_canais VALUES ('UC-QoZ0V193UMCLFaK-usjqw', 'Guilherme e Santiago');
INSERT INTO public.youtube_canais VALUES ('UCpxck6bZZZ44S7VcKZ1Ub9A', 'Panda Cantor');
INSERT INTO public.youtube_canais VALUES ('UCMZKcLkNw1AMgfusg3Mjutw', 'Murilo Huff');
INSERT INTO public.youtube_canais VALUES ('UC4GQcpSxXmvhjn8bAfUubgg', 'Mari Fernandez');
INSERT INTO public.youtube_canais VALUES ('UCP7kEjy0tpXY0A20qy-lUMQ', 'Pedro Sanchez e Thiago');
INSERT INTO public.youtube_canais VALUES ('UCCCIzjqbX7psrn0HYG50phg', 'Gustavo Mioto');
INSERT INTO public.youtube_canais VALUES ('UC55hzEBczDivH31zVueh8Gg', 'Ícaro e Gilmar');
INSERT INTO public.youtube_canais VALUES ('UCH7vP1JyEwTy-D-ikZUoCww', 'Simone Mendes');
INSERT INTO public.youtube_canais VALUES ('UC6rwiIxv0w2fbmmr66wl1rA', 'Luan Santana');
INSERT INTO public.youtube_canais VALUES ('UCRRu9OXVYd5clj2Bs29gUVQ', 'Zé Neto e Cristiano');
INSERT INTO public.youtube_canais VALUES ('UCmkSzYG4ykYKFE4Ow0030zw', 'Grupo Menos é Mais');
INSERT INTO public.youtube_canais VALUES ('UCJjq3bUli6GPgH2ebLcsdcA', 'Zyvex Aura');
INSERT INTO public.youtube_canais VALUES ('UCvOHHWVKwPd_oCH73I1ukKQ', 'Grupo Doze por Oito ');
INSERT INTO public.youtube_canais VALUES ('UClqmzNx7-xd-5_MzdSotYKw', 'Sorriso Maroto');
INSERT INTO public.youtube_canais VALUES ('UCMEmGaZIImpsI7Jn6Mh1WtA', 'Grupo TeDeJota');
INSERT INTO public.youtube_canais VALUES ('UCdldpvtnXURuU7NNeyhLBwg', 'Pagode do Adame');
INSERT INTO public.youtube_canais VALUES ('UCXY8-t6n8CxCRtH9kcPPYkA', 'Grupo Zero 19');
INSERT INTO public.youtube_canais VALUES ('UC8OSnmaf9DJI11Dy2VP5yLg', 'Yan Cantor');
INSERT INTO public.youtube_canais VALUES ('UCFInGcq6uwEPRnAF0SaXwTA', 'Corridos Éxitos Mix');
INSERT INTO public.youtube_canais VALUES ('UCSCB1IQUmNa8Gn5VfSUAUpg', 'LUDMILLA');
INSERT INTO public.youtube_canais VALUES ('UCCccwoGbhxh5iA_Diu6-aSw', 'Renan Oliveira');
INSERT INTO public.youtube_canais VALUES ('UC3vSHJGkAqiNgN5FovH7BKQ', 'Marvvila');
INSERT INTO public.youtube_canais VALUES ('UC_XtzPwdBLInyyxNRId4hjw', 'Grupo Balacobaco');
INSERT INTO public.youtube_canais VALUES ('UCIbM7_vOcqn4ApWtQlKrOSA', 'Leleco');
INSERT INTO public.youtube_canais VALUES ('UCKTsmTjpzWuCoFcdaJ4GnSA', 'Grupo Presença Oficial');
INSERT INTO public.youtube_canais VALUES ('UCwuBNS7gH0rguuRj80VTeEw', 'Atração Divulga');
INSERT INTO public.youtube_canais VALUES ('UC5nczbo5SMeTmAMDanQxeGA', 'Vitinho Imperador');
INSERT INTO public.youtube_canais VALUES ('UCCrT2C0TsEyz8KVv_ztktog', 'Alemão Do Forró Oficial');
INSERT INTO public.youtube_canais VALUES ('UCciJLMuECsXuOyhA4FO48Sg', 'Wesley Safadão');
INSERT INTO public.youtube_canais VALUES ('UCS-NH1TPhpzYNCI5gj_reog', 'Manim ');
INSERT INTO public.youtube_canais VALUES ('UCIy12y9x1XhfFhqqfACsVeg', 'Natanzinho Lima Oficial');
INSERT INTO public.youtube_canais VALUES ('UCVjB_lvGGBByw0yHJot61JA', 'Leãozinho Do Forró Oficial');
INSERT INTO public.youtube_canais VALUES ('UCcko8s0ABbz_46T8qACOt5A', 'FLAVIO LEANDRO OFICIAL');
INSERT INTO public.youtube_canais VALUES ('UCdR-R3gUP7LmkxdK7b-DeWQ', 'Forró+Tóys - OFICIAL');
INSERT INTO public.youtube_canais VALUES ('UCiaaVxbrsY3W64mDeJPtDdg', 'Forró Cintura de Mola ');
INSERT INTO public.youtube_canais VALUES ('UCfuRRJ76VluLiHW2pqwZNwg', 'Xand Avião');
INSERT INTO public.youtube_canais VALUES ('UCfbOVqyATpdSyaJDFZ2x_Cw', 'Flaguim Moral - Topic');
INSERT INTO public.youtube_canais VALUES ('UCtuGSMqrYY6kvq2CWvJ3FbA', 'Canal JV Music');
INSERT INTO public.youtube_canais VALUES ('UC24eqcXucH3sdxlD-y6I-kg', 'Cavaleiros do Forró');
INSERT INTO public.youtube_canais VALUES ('UC9iSCrkcRGmxMHyl67AedsQ', 'Forró Cintura de Mola - Topic');
INSERT INTO public.youtube_canais VALUES ('UCu3RDAFOTJVDCQ75nX05Dpg', 'LOVE REMIX');
INSERT INTO public.youtube_canais VALUES ('UCoSNIGPdZNpqBjBApohGKWg', 'Nordeste Musical - Topic');
INSERT INTO public.youtube_canais VALUES ('UCansSGlIQZHVEUEvQiPiR8Q', 'FORRO IA SHOW');
INSERT INTO public.youtube_canais VALUES ('UCOSTZL7J8WjEZGAtzQHtuEA', 'Banda Magníficos');
INSERT INTO public.youtube_canais VALUES ('UChbVeRtv-cDsM9-PO4Mxltw', 'Conde do Forró');
INSERT INTO public.youtube_canais VALUES ('UCEATCATai_oafDuqKssZITw', 'Som Livre');
INSERT INTO public.youtube_canais VALUES ('UCGDngB0sA3CGLcktUOkdAEw', 'Flaguim Moral');
INSERT INTO public.youtube_canais VALUES ('UCbFd5vmueW5bynE7HndCRTw', 'Walkyria Santos');
INSERT INTO public.youtube_canais VALUES ('UCszJJVN1OUjYmBHWwOA5dmQ', 'Fragantes do Forró - Topic');
INSERT INTO public.youtube_canais VALUES ('UCaO6TYtlC8U5ttz62hTrZgg', 'JYP Entertainment');
INSERT INTO public.youtube_canais VALUES ('UCfYafi2D0Z_IF3SJjp3qK1w', 'Dj GG');
INSERT INTO public.youtube_canais VALUES ('UCZaTZL0I081HoXWVIy9H9Mg', 'DAN');
INSERT INTO public.youtube_canais VALUES ('UCLWqX5BVDidcfByzyyY_XGg', 'Hitomi Flor');
INSERT INTO public.youtube_canais VALUES ('UC5glVtzzbPwzXwqdRIFHwjg', 'F-LIVE');
INSERT INTO public.youtube_canais VALUES ('UCouD8uM_hrbWtVdDIWf4LFg', 'MilkyyMelodies');
INSERT INTO public.youtube_canais VALUES ('UC3IZKseVpdzPSBaWxBxundA', 'HYBE LABELS');
INSERT INTO public.youtube_canais VALUES ('UClRx3MMyYUyqOxyEqA5F2nQ', 'TravisScottVEVO');
INSERT INTO public.youtube_canais VALUES ('UCQdq-lqPEq_yZ_wP_kuVB9Q', 'KQ ENTERTAINMENT');
INSERT INTO public.youtube_canais VALUES ('UCEf_Bc-KVd7onSeifS3py9g', 'SMTOWN');
INSERT INTO public.youtube_canais VALUES ('UClD6WONO_a-N0dusWg1yH8Q', 'HAPIKATO');
INSERT INTO public.youtube_canais VALUES ('UCOmHUn--16B90oW2L6FRR3A', 'BLACKPINK');
INSERT INTO public.youtube_canais VALUES ('UCq3lYlgl7Uhl5Wq2f-BHXrw', 'Saint Perez');
INSERT INTO public.youtube_canais VALUES ('UCE4pdOAge35Ylr-DJgvllbQ', 'Republic Records');
INSERT INTO public.youtube_canais VALUES ('UCJrREGJ2R1mMuKJkZ8SMCcA', 'BeckyGVEVO');
INSERT INTO public.youtube_canais VALUES ('UCNKGkgPvTgIykSU6Cs9acWQ', 'DJ PHILLIP');
INSERT INTO public.youtube_canais VALUES ('UCLp8RBhQHu9wSsq62j_Md6A', 'LuisFonsiVEVO');
INSERT INTO public.youtube_canais VALUES ('UCPr_qJ3txALVZw8zcns3gcA', 'La Clave');
INSERT INTO public.youtube_canais VALUES ('UCFkoPRmuxqr37jvGmmpzhzQ', 'MalumaVEVO');
INSERT INTO public.youtube_canais VALUES ('UCDon__fFmiP4b5pUmbtzsKA', 'KARYO');
INSERT INTO public.youtube_canais VALUES ('UCbVcb9puAsOhXBT2_XPFf-A', 'the_miracle_aligner');
INSERT INTO public.youtube_canais VALUES ('UCfNRJSZ9FpkYK0ghVHDUuJQ', 'GenteDeZonaVEVO');
INSERT INTO public.youtube_canais VALUES ('UCOYewhdZ1yy0U_IZMSb7g3A', 'djalexmoreira');
INSERT INTO public.youtube_canais VALUES ('UCD-Cf3w7_T12qa8xPHytEOA', 'Cafe Ritmo Cubano');
INSERT INTO public.youtube_canais VALUES ('UCF0bSIx6OvPNwkLYXL3nzVQ', 'masa-G channel');
INSERT INTO public.youtube_canais VALUES ('UCrHL_BF5lHyK43BxLU8-vBQ', 'jbalvinVEVO');
INSERT INTO public.youtube_canais VALUES ('UCKKezBu7Y4onrE3E-xaVpfw', 'Humano Studios');
INSERT INTO public.youtube_canais VALUES ('UCVttQE6tS_agDSAU61Q65aA', 'EnriqueIglesiasVEVO');
INSERT INTO public.youtube_canais VALUES ('UCoKJ6OCoKl0ytVFBNp7bbwA', 'Relaxing Mindscape');
INSERT INTO public.youtube_canais VALUES ('UCQhOf1GhzkMsyLAFwrnG8XQ', 'marcanthonyVEVO');
INSERT INTO public.youtube_canais VALUES ('UCUMYSG5KRHZajl9YIzIeqVw', 'DJ Vila');
INSERT INTO public.youtube_canais VALUES ('UCWUk7MGQfRCtLiKzlX9t_xA', 'DJ Renato B');
INSERT INTO public.youtube_canais VALUES ('UC46tz51bm2_7lX1mZeS_cmA', 'GowiththeFLOW');
INSERT INTO public.youtube_canais VALUES ('UC_OOuK8shEVRkwAyspMcw6A', 'HEDESIA');
INSERT INTO public.youtube_canais VALUES ('UC4V1qDl2dlzXnomwbdJMWtQ', 'Echo Bossa');
INSERT INTO public.youtube_canais VALUES ('UCuWvwU6qYCizRhaWVq5FbEw', 'Summer Vibes Latin');
INSERT INTO public.youtube_canais VALUES ('UCYXIviXPAaaaU_AOotpXTAw', 'Revive Music');
INSERT INTO public.youtube_canais VALUES ('UCb-iETlsaXr3fEG8znQjmZA', 'Masked Mortal');
INSERT INTO public.youtube_canais VALUES ('UCTjF8TNC7blVsBtWyMrsj4A', 'Horror Skunx');
INSERT INTO public.youtube_canais VALUES ('UCci3lozteCexkJ4g0xj-9NQ', 'Dynamic Deep House');
INSERT INTO public.youtube_canais VALUES ('UC0TTUIXCEWzqh66i65VGKgA', 'EverHits-moritabari');
INSERT INTO public.youtube_canais VALUES ('UCNqFDjYTexJDET3rPDrmJKg', '7clouds');
INSERT INTO public.youtube_canais VALUES ('UCpVkPcSVe4TWa91lj0s7Eaw', 'Acoustic Anna');
INSERT INTO public.youtube_canais VALUES ('UC1ovynwy4rDu3Yh1SIYewdg', 'Soulfulpop');
INSERT INTO public.youtube_canais VALUES ('UCL6LeUgTnxt1XsJVS71RTAQ', 'JsVibes Music');
INSERT INTO public.youtube_canais VALUES ('UC0V5TmyzmC8-CGIBtyNAI7w', 'Lyricsflow music');
INSERT INTO public.youtube_canais VALUES ('UC3Ioyv0BDo4DZlgB9WrynWQ', 'Rao treder ');
INSERT INTO public.youtube_canais VALUES ('UC9Vkr0WmRzVGxxIakJM8kQw', 'DJ Precise');
INSERT INTO public.youtube_canais VALUES ('UCz8UKjeBLJfxI6MgkAvj-UA', 'ARD PHONK');
INSERT INTO public.youtube_canais VALUES ('UCJ8X6dgebxD00iJZ-mXjWog', 'Bern Marzan');
INSERT INTO public.youtube_canais VALUES ('UC_KcoTPA9EfXoM8uOo3vrpw', 'minlee 민리');
INSERT INTO public.youtube_canais VALUES ('UCQ4lJJ8IcgycVm1FFYnkCIQ', 'RioX');
INSERT INTO public.youtube_canais VALUES ('UCgSZsQtFCXNmxB5irju2AOw', 'Arc North Daily');
INSERT INTO public.youtube_canais VALUES ('UCVpHD1Sk5Ixa7US7eWCrTSw', 'Jhankar Studio');
INSERT INTO public.youtube_canais VALUES ('UCvt5p3A11M8zd8iJPCC5XvQ', 'Love Life Lyrics');
INSERT INTO public.youtube_canais VALUES ('UCJaL41_6q8xgvBUqxyRGvPw', 'Phonk Tune');
INSERT INTO public.youtube_canais VALUES ('UChGfvO911vVH2KeJjFWUw8Q', 'Rey Music Collection');
INSERT INTO public.youtube_canais VALUES ('UC0EiruGxdY9xNUk-8ddrtgQ', 'Jesea Lee');
INSERT INTO public.youtube_canais VALUES ('UC9qUY3XMOenRdJ4VvpoFlnA', 'Melora');
INSERT INTO public.youtube_canais VALUES ('UCgYxUOF2QRkHjThQouNoRVw', 'Robin Scott - M');
INSERT INTO public.youtube_canais VALUES ('UCq4LI1nsSdyUNdgPxfwJ2BA', 'Sunset Playlist');
INSERT INTO public.youtube_canais VALUES ('UC4mYKePIas5YgGfYZ2J2OxQ', 'SabrinaCarpenterVEVO');
INSERT INTO public.youtube_canais VALUES ('UC09d82usokACH1z5YeKnfiA', 'FifthHarmonyVEVO');
INSERT INTO public.youtube_canais VALUES ('UCeTDWSJawSuNbBEURTC6w_A', '2ChainzVEVO');
INSERT INTO public.youtube_canais VALUES ('UC0_cyKup0lzAh2yLNB_7Wog', 'Slow Acoustic');
INSERT INTO public.youtube_canais VALUES ('UCdVxII5mXw0bBZXZ4R-sMxw', 'ZJ Liquid Music');
INSERT INTO public.youtube_canais VALUES ('UC07Kxew-cMIaykMOkzqHtBQ', 'LadyGagaVEVO');
INSERT INTO public.youtube_canais VALUES ('UC9VbclDBCTPprd223zbDKeg', 'Flavor Nostalgia');
INSERT INTO public.youtube_canais VALUES ('UCvILah8hAWYhYOmAG3ZjvBA', 'Benson Boone');
INSERT INTO public.youtube_canais VALUES ('UCgezh1PRAAHcwXGvNXFtjVA', 'Creall’s Music Vault');
INSERT INTO public.youtube_canais VALUES ('UCslAPmeF_jQ8yPB074AvfTA', 'Cafe Music');
INSERT INTO public.youtube_canais VALUES ('UCpPwodiYc4ceaqEBB54trHQ', 'HollywoodRecordsVEVO');
INSERT INTO public.youtube_canais VALUES ('UCq4zhQqEaUg7-OpXUSQn45A', 'Amazing Vibes');
INSERT INTO public.youtube_canais VALUES ('UCYtwkahMdrGeSQNyEe7IdEw', 'Dj StarSunglasses');
INSERT INTO public.youtube_canais VALUES ('UCjLpcmZgoxZGWAehyqYwO6g', 'Dj Remo');
INSERT INTO public.youtube_canais VALUES ('UCgwG7Tb7WohCHrDwLxB6JQQ', 'Maldo');
INSERT INTO public.youtube_canais VALUES ('UCB-7IEpKGIdXkgGUObE5D5A', 'STMPD RCRDS');
INSERT INTO public.youtube_canais VALUES ('UCtby3goA8evD4vAiVzZtbpQ', 'MusicForSoulVEVO');
INSERT INTO public.youtube_canais VALUES ('UCJrOtniJ0-NWz37R30urifQ', 'Alan Walker');
INSERT INTO public.youtube_canais VALUES ('UCH3RGiX9bimOPwQmEgrMAtg', 'Afterlife');
INSERT INTO public.youtube_canais VALUES ('UCW3a1sQ28Q9KLp2eYIDcDww', 'George Reynold');
INSERT INTO public.youtube_canais VALUES ('UC6mmtc9CwL6_-2Xq1cAg1Tg', 'Gravity Music');
INSERT INTO public.youtube_canais VALUES ('UCHBfQT8w01kthXFNMURsxrw', 'Bassline Friday');
INSERT INTO public.youtube_canais VALUES ('UCxM51ORxYHWULncNyfpTa3w', 'Nova Records - Música Eletrônica');
INSERT INTO public.youtube_canais VALUES ('UCIFh-_62PuXdMkvGhVYZZ5g', 'Luma Beats Street');
INSERT INTO public.youtube_canais VALUES ('UCNwskcb3I_iDDd5D56ozpXw', 'ELITE TRANCE MUSIC');
INSERT INTO public.youtube_canais VALUES ('UCilF9-bqOHHJwJZlnlQYIrw', 'Amoda Session');
INSERT INTO public.youtube_canais VALUES ('UCSU6XsiztZxbP-oSHmsfWpw', 'Chase The Deep');
INSERT INTO public.youtube_canais VALUES ('UC04BY9XdbTltt3PYOaGGMkA', 'TheonlyMajed');
INSERT INTO public.youtube_canais VALUES ('UCw527CsYYlcRVR3W2ywMV0A', 'Helios Deep');
INSERT INTO public.youtube_canais VALUES ('UCPVNT9hahuwpVwEpAgO0BtQ', 'BrutishHeavyMusic');
INSERT INTO public.youtube_canais VALUES ('UCZujT6fgrvbRGdBj24q_ZDA', 'ΛXIIOS™ OFFICIAL');
INSERT INTO public.youtube_canais VALUES ('UC0VG86SRO2X47HU20nQtDeA', 'KOROLOVA');
INSERT INTO public.youtube_canais VALUES ('UCj81KaRVv7hBbM8qqv4Kh1g', 'Dj Roll Perú');
INSERT INTO public.youtube_canais VALUES ('UCNnQqoYFCqLID3GAMkGtS6A', 'Legend Music - Música Electrónica');
INSERT INTO public.youtube_canais VALUES ('UCvbRrx-ASjO4HT5sgUez1Ag', 'Eli EDM');
INSERT INTO public.youtube_canais VALUES ('UC_IleaoZ0fgSbDrnWoFdTDA', 'Xdeep Mix');
INSERT INTO public.youtube_canais VALUES ('UC3yYq-Q4kOBMGUKXJXreO2A', 'Techno History Official');
INSERT INTO public.youtube_canais VALUES ('UCEplDDv2Vs6PI25pY-A9ATg', 'Kuya Magik');
INSERT INTO public.youtube_canais VALUES ('UCviq8Ih6BhHmlLEtcXEG_XQ', 'Light Night Music');
INSERT INTO public.youtube_canais VALUES ('UCjw1oJ4kNmyVWiU858O0WmQ', 'Zusebi');
INSERT INTO public.youtube_canais VALUES ('UCiaSWS6dgEp3135QV1jmdCw', 'DjChoijay Remix');
INSERT INTO public.youtube_canais VALUES ('UCOUqaKtbHHL7F1zOsYL0R6g', 'Trending Tiktok Mashup');
INSERT INTO public.youtube_canais VALUES ('UC-AlofdKECUdhXrbJQZ6iEg', 'LatinHype');
INSERT INTO public.youtube_canais VALUES ('UClosTbsE0_rJWxih0BtRwaw', 'ZeKe-y');
INSERT INTO public.youtube_canais VALUES ('UCKgwCnviw2cTzWTe3pOO52g', 'YouQuiz - Music');
INSERT INTO public.youtube_canais VALUES ('UC6_muGdOkCSgLtaW6frnvgA', 'TopTune');
INSERT INTO public.youtube_canais VALUES ('UCM_D1Gw5StkOffHbSId-1Rw', 'Levent Geiger');
INSERT INTO public.youtube_canais VALUES ('UC7_8w5vHeMPli0A0QA3g8RQ', 'yuuri !');
INSERT INTO public.youtube_canais VALUES ('UCUEmIc6QOle3caUN--BGPyQ', 'Panda - Music');
INSERT INTO public.youtube_canais VALUES ('UCI7BklpY2s6rd_5RN1c3f1Q', 'The Moonies Official');
INSERT INTO public.youtube_canais VALUES ('UCNoipNKdYgkTeYfYndii43Q', 'Mega Tik Tok Mashup');
INSERT INTO public.youtube_canais VALUES ('UCUh6KxkFhnELALvKKaDzaPw', 'Jo Haris');
INSERT INTO public.youtube_canais VALUES ('UCz0bTBtvhXucu4Mt0uv4BPg', 'Sonar music');
INSERT INTO public.youtube_canais VALUES ('UCxE5jEls-T0QtlTHT8lI1lw', 'OliviaRodrigoVEVO');
INSERT INTO public.youtube_canais VALUES ('UChEYVadfkMCfrKUi6qr3I1Q', 'Kodak Black');
INSERT INTO public.youtube_canais VALUES ('UCr2xjaS7CIx1OY7hYwrXb8A', 'TylaVEVO');
INSERT INTO public.youtube_canais VALUES ('UCiQtJ9wVv8R-x7GKHzgZu8A', 'MorganWallenVEVO');
INSERT INTO public.youtube_canais VALUES ('UCrFB54bqp8sda4udJyNswlA', 'DJKhaledVEVO');
INSERT INTO public.youtube_canais VALUES ('UCpFUD5sd3RV-Dcw_sof3AOw', 'Kid Rock Videos');
INSERT INTO public.youtube_canais VALUES ('UCveWMJeHgcIUPMnFzd7Vxjg', 'Disturbed');
INSERT INTO public.youtube_canais VALUES ('UCs8ynQgjoKZblUXosXoeOEQ', 'Lukas Graham');
INSERT INTO public.youtube_canais VALUES ('UCj2GTFekdV3EUsTVN8oaEqA', 'kevingatesTV');
INSERT INTO public.youtube_canais VALUES ('UC6pjHMC4QXMi4llCCjtDXWg', 'Lil Pump');
INSERT INTO public.youtube_canais VALUES ('UCDDmukrq0bwckrp09bNt-Rw', 'EvanescenceVEVO');
INSERT INTO public.youtube_canais VALUES ('UCpoShuhB7tOW-HkyjEvcNfA', 'MIIA');
INSERT INTO public.youtube_canais VALUES ('UC28rc3PHWPJib68G-VqpJ3w', 'Sexyy Red');
INSERT INTO public.youtube_canais VALUES ('UChjLIA7wFY5JgGEO2IjgZIQ', 'JN Gakuhi ');
INSERT INTO public.youtube_canais VALUES ('UCJEgEKxyyoM8K1jpzfmZz-A', 'BrooksandDunnVEVO');
INSERT INTO public.youtube_canais VALUES ('UCoehRqkqt8QGZCWPrXxltXg', 'journeyVEVO');
INSERT INTO public.youtube_canais VALUES ('UCAkIMkEaa9sZmjcy7mfd5lQ', 'Gunna');
INSERT INTO public.youtube_canais VALUES ('UCSomIwKuzh9QOMKsLTHemcg', 'cheaptrickVEVO');
INSERT INTO public.youtube_canais VALUES ('UCFNosi99Sp0_eLilBiXmmXA', 'FutureVEVO');
INSERT INTO public.youtube_canais VALUES ('UCiE5dPVpnFpPl8ki4QjLH5Q', 'Al Green');
INSERT INTO public.youtube_canais VALUES ('UCulYu1HEIa7f70L2lYZWHOw', 'michaeljacksonVEVO');
INSERT INTO public.youtube_canais VALUES ('UCm1dsgJNnhaLkY3uAdqN4mA', 'ChrisBrownVEVO');
INSERT INTO public.youtube_canais VALUES ('UC8T-7tlQRA_IEk_VTc8kKig', 'Chê Lokedo');
INSERT INTO public.youtube_canais VALUES ('UCIW4y9tEpVmx_iezUVA9blQ', 'João Gomes Cantor');
INSERT INTO public.youtube_canais VALUES ('UCmSwWtFDjIw9m3gaNnnjMMQ', 'Mattos Nascimento Oficial ♪');
INSERT INTO public.youtube_canais VALUES ('UCXnRIJaU0hpaEJfFWphHJ-g', 'EBONY');
INSERT INTO public.youtube_canais VALUES ('UCnJoUTYXU142gxoyDzp-KRQ', 'Luísa Sonza');
INSERT INTO public.youtube_canais VALUES ('UC56fUQZBWr99e3t88E60RHw', 'Maya Kids');
INSERT INTO public.youtube_canais VALUES ('UC5b8vtiacMXVij1euJ2USeQ', 'Antônio e JP');
INSERT INTO public.youtube_canais VALUES ('UC5PTvkiV9Buv7pb_OtxLbaQ', 'ImaginAline TV');
INSERT INTO public.youtube_canais VALUES ('UCgaJRWSfQbc-48c5f63pgWg', 'T-Sia');
INSERT INTO public.youtube_canais VALUES ('UCWZ3i_eR28M8aFBKxOt0_AA', 'Funk de BH');
INSERT INTO public.youtube_canais VALUES ('UC7skCV2_5lmzY4wDVO5aT6g', 'phonk_music');
INSERT INTO public.youtube_canais VALUES ('UC2ueaijlcU0rk1oYYJOYReQ', 'deejayFDB');
INSERT INTO public.youtube_canais VALUES ('UCEPcRzWmOfGKyD6bSXt0G0Q', 'Maelo Mix');
INSERT INTO public.youtube_canais VALUES ('UCz-rxehhsrMAyBEJdf4NG2w', 'TheGoodVibe');
INSERT INTO public.youtube_canais VALUES ('UC6na0K81s8Ean-rTE-zbtLg', 'MC BUZZZ');
INSERT INTO public.youtube_canais VALUES ('UCS1uxC6jyjQuUes3L6ySXsA', 'JO.TTAMUSIC');
INSERT INTO public.youtube_canais VALUES ('UCBRWI1h-efdTbVZK6RQdGqA', 'Borges');
INSERT INTO public.youtube_canais VALUES ('UCTR_tkH-7XWytiLHGJnWspQ', 'Rincon Sapiência');
INSERT INTO public.youtube_canais VALUES ('UCExVBY3EKgwqrVcAnH9ttnw', 'Dj Victor Lopes');
INSERT INTO public.youtube_canais VALUES ('UCe1HjlqnaxERsqpw0ZnLXvA', 'Zé Felipe');
INSERT INTO public.youtube_canais VALUES ('UCWz3PdN6UqW9u72UObR0h3A', 'Playon');
INSERT INTO public.youtube_canais VALUES ('UCDX3MD1sjB_OKAoWMfSfMmw', 'João Bosco & Vinícius');
INSERT INTO public.youtube_canais VALUES ('UCTf9OwhI5Os1F1A4W02K73Q', 'BB Records Produções');
INSERT INTO public.youtube_canais VALUES ('UCGQXnXP9ut8J9O20tz7J8Ag', 'Samuka Perfect');
INSERT INTO public.youtube_canais VALUES ('UCSZO9oGGHsjvyEvNem7qAOw', 'Os Caipira Top (Oficial)');
INSERT INTO public.youtube_canais VALUES ('UCRD1ypvmK7e_05Rtu9zHOfQ', 'Ana Castela');
INSERT INTO public.youtube_canais VALUES ('UCIzAIM-zatIDHErC0Z23hbQ', 'Música Multishow');
INSERT INTO public.youtube_canais VALUES ('UCOUqW2QqiOFK9fXA5cAOENA', 'Péricles');
INSERT INTO public.youtube_canais VALUES ('UC_7GiQOND1GwDXNn5rgbeew', 'Ferrari Produções');
INSERT INTO public.youtube_canais VALUES ('UCB_K7fledSSBoRcl2O38b-Q', 'TurmadoPagodeVEVO');
INSERT INTO public.youtube_canais VALUES ('UCM_RLbU3eA0AyLenx4cJ7bg', 'Quinteto S.A.');
INSERT INTO public.youtube_canais VALUES ('UCAbn3JX6JiMZuPId8EpmaxQ', 'Vou Zuar');
INSERT INTO public.youtube_canais VALUES ('UCTihF8dW95hPDTSyxbJVczA', 'Turma do Pagode');
INSERT INTO public.youtube_canais VALUES ('UCKMUZJmtA6SAC2LRyPXq7nQ', 'Studio Entre Nós');
INSERT INTO public.youtube_canais VALUES ('UCL4cty81pHxPxZjRavDPZwQ', 'Juliana Bonde');
INSERT INTO public.youtube_canais VALUES ('UCM90FaSFuIXwj6-oZMrbNsA', 'Mastruz com Leite');
INSERT INTO public.youtube_canais VALUES ('UCJNjiZ0oPI9neh3ztrza9rg', 'Chicote De Luxo Oficial');
INSERT INTO public.youtube_canais VALUES ('UCmoLE2e5yFnjuBOYAlW-DKg', 'André Teclas');
INSERT INTO public.youtube_canais VALUES ('UC60lJFb-zjnqzeZHraWGwqg', 'GABRIEL AIRES - Topic');
INSERT INTO public.youtube_canais VALUES ('UCqi7xixGSL6RD-_o5GeaR5w', 'OSV');
INSERT INTO public.youtube_canais VALUES ('UC3NVx_KUpGC8VQvfCkOIYcQ', 'Jubilee Christ');
INSERT INTO public.youtube_canais VALUES ('UCR_-mB5w-jw_AYbRwSUiYyQ', 'viokpoplaylists');
INSERT INTO public.youtube_canais VALUES ('UCYDmx2Sfpnaxg488yBpZIGg', 'STARSHIP');
INSERT INTO public.youtube_canais VALUES ('UCmth4hMyizG-_W9jidBqs_A', 'Jaeguchi');
INSERT INTO public.youtube_canais VALUES ('UCcEi5yS6xzaUj-FFgUTCnOg', 'Thalios');
INSERT INTO public.youtube_canais VALUES ('UCvEEeBssb4XxIfWWIB8IjMw', 'KISS OF LIFE');
INSERT INTO public.youtube_canais VALUES ('UChXOPc0mKel-E9aI9ECMSKQ', 'Qantajo Music Channel');
INSERT INTO public.youtube_canais VALUES ('UCBvcWWAWhDT2dtFs7d0zGwA', 'Music Box VUTV');
INSERT INTO public.youtube_canais VALUES ('UCHTIZElRhf4LMnG5N9yHQdA', 'ElvisCrespoVEVO');
INSERT INTO public.youtube_canais VALUES ('UCzWC1TkgyBxxrHkqb6aZf1g', 'PLAYGRND SERIES');
INSERT INTO public.youtube_canais VALUES ('UCDaQK4nrsvz27YzufrhJfgg', 'Aventura - Topic');
INSERT INTO public.youtube_canais VALUES ('UCbgB3pKVBcSksa6gVIU278w', 'MUSICOLOGXST');
INSERT INTO public.youtube_canais VALUES ('UC2Ynl82iZzds8sMqp5nM6bg', 'Rhythm Media');
INSERT INTO public.youtube_canais VALUES ('UCTC7fJvs0rAemFa8Q9qDl1w', 'Jessica Baio');
INSERT INTO public.youtube_canais VALUES ('UCZZ752e54Fmtgsv42jGlWgg', 'Awesome Quiz');
INSERT INTO public.youtube_canais VALUES ('UCIOED-ebUKXRUaslb62-x5g', 'Jades Goudreault');
INSERT INTO public.youtube_canais VALUES ('UC62rsNhxdkTbf9H6jXk5_SQ', 'Vibe Factory');
INSERT INTO public.youtube_canais VALUES ('UCL_IGbp3VlN55wH8R_u8EQw', 'CRXSH');
INSERT INTO public.youtube_canais VALUES ('UCG4ooaRC8dhxzFevWglvaVg', 'SiaViral');
INSERT INTO public.youtube_canais VALUES ('UCJquYOG5EL82sKTfH9aMA9Q', 'Rick Beato');
INSERT INTO public.youtube_canais VALUES ('UC1OonTKPPxIePNloWczYoig', 'EvoLee Music');
INSERT INTO public.youtube_canais VALUES ('UC-nBFyu05sYC5IzeSsfmNvA', 'DJ UNLTD');
INSERT INTO public.youtube_canais VALUES ('UCRWu77ldqaQboq3JXLd5waQ', 'Daniel Wall');
INSERT INTO public.youtube_canais VALUES ('UCltPs2FtZtBn94Gk1dV_Uzw', 'VelVybe');
INSERT INTO public.youtube_canais VALUES ('UCGjclqow7gzi5XFXz0HzZ6g', 'Infinity EDM Mix');
INSERT INTO public.youtube_canais VALUES ('UC1qRCLETiCOIfnMPC9X-ngQ', 'SVNTRAXX 🎶');
INSERT INTO public.youtube_canais VALUES ('UCVfi_UYv_ZES-BIdFqmrMuQ', 'Infinity EDM');
INSERT INTO public.youtube_canais VALUES ('UCnFzvGNpxvk40m4cTggUdQg', 'Melodic techno room');
INSERT INTO public.youtube_canais VALUES ('UC7_ZheFoWjNb-HZpeU02X2Q', 'VoceLab Music');
INSERT INTO public.youtube_canais VALUES ('UCQ-cprb_gOizENTgmZwZPkw', 'Diamond Music');
INSERT INTO public.youtube_canais VALUES ('UCPk3RMMXAfLhMJPFpQhye9g', 'Tiësto');
INSERT INTO public.youtube_canais VALUES ('UCSJns3RK3eyMm-oMRQiB20w', 'Del Sol Music');
INSERT INTO public.youtube_canais VALUES ('UCl_KZtpJbHrYehhzMuDXafA', 'EDM Christian Music');
INSERT INTO public.youtube_canais VALUES ('UCG6QEHCBfWZOnv7UVxappyw', 'DubstepGutter');
INSERT INTO public.youtube_canais VALUES ('UCPKT_csvP72boVX0XrMtagQ', 'Cercle');
INSERT INTO public.youtube_canais VALUES ('UCO8ZT9Mvml76dyo-I6W8ppA', 'H3adband - Topic');
INSERT INTO public.youtube_canais VALUES ('UCJDFBaUcOVUtT8nrKSkAzAQ', 'AURA - Music');
INSERT INTO public.youtube_canais VALUES ('UCWgc7Q3S4zfNzVWWR_iE6_g', 'Liso');
INSERT INTO public.youtube_canais VALUES ('UCvki_74y_I76cYEdnzcejPg', 'Lyrics_editzs ');
INSERT INTO public.youtube_canais VALUES ('UCoUgSXusnKADcOxmtxpQevg', 'Odetari');
INSERT INTO public.youtube_canais VALUES ('UCC6XuDtfec7DxZdUa7ClFBQ', 'AvrilLavigneVEVO');
INSERT INTO public.youtube_canais VALUES ('UCe3yZzUwpmy2eKKmF9svX0Q', 'Jason Derulo');
INSERT INTO public.youtube_canais VALUES ('UCMC5uYIx8vsx4Zx-6giJf7A', 'AlanParsonsVEVO');
INSERT INTO public.youtube_canais VALUES ('UCAOiVaJJlH0Oduv48NN0mMA', 'Ghost');
INSERT INTO public.youtube_canais VALUES ('UCAdN9VApym_qAQirG-kROvg', 'Luan Pereira LP');
INSERT INTO public.youtube_canais VALUES ('UCTrrz9IkZNi7d_0LjjFWkwA', 'Spaghetti Boom Boom');
INSERT INTO public.youtube_canais VALUES ('UCnJ2vT0lpvF6sQ8iKa_0O7A', 'FIRENOM');
INSERT INTO public.youtube_canais VALUES ('UC7t0atou0kLsSlD-3lAO_CQ', 'KayArchon');
INSERT INTO public.youtube_canais VALUES ('UC2fMPNTHKc1sxsRdJsMSdYQ', 'BOBBY VANDAMME');
INSERT INTO public.youtube_canais VALUES ('UCQdCIrTpkhEH5Z8KPsn7NvQ', 'Mixmag');
INSERT INTO public.youtube_canais VALUES ('UCHHP7y894YzzrYexL3TRr7g', 'BAKA K E N');
INSERT INTO public.youtube_canais VALUES ('UCDvQkGVlOO0fZIwCkLtX1tQ', 'DJ Plaga');
INSERT INTO public.youtube_canais VALUES ('UC7xlfeOdS1_T_2GYuoOvrmA', 'Tholo Music');
INSERT INTO public.youtube_canais VALUES ('UC12JTPZnteeNaum4epyijwA', 'SUNSHINE GROOVES');
INSERT INTO public.youtube_canais VALUES ('UCkn2ReWhqBfUIvRz6Y23C2g', 'Epidemic77');
INSERT INTO public.youtube_canais VALUES ('UCpOdPfjjxpEAzATZJQX4_Hg', 'Real Kayblack');
INSERT INTO public.youtube_canais VALUES ('UCtZUzVps0T-VvWx4IfaPnJQ', 'Face da Morte Oficial');
INSERT INTO public.youtube_canais VALUES ('UC6ldKmPZ4S_WvdhknGHQavw', 'Ndee Naldinho - Topic');
INSERT INTO public.youtube_canais VALUES ('UCU6vCe3PKV4Fd1yGWgD1mCw', 'Abbot');
INSERT INTO public.youtube_canais VALUES ('UCcMSZoQ6DczRejxVlRT31lg', 'Sertanejo RAIZ IA Brazil');
INSERT INTO public.youtube_canais VALUES ('UCfG0o17SqRg8qAjlpTdxZag', 'Guilherme e Benuto');
INSERT INTO public.youtube_canais VALUES ('UCzQzpEfdPCCwkG10cU5rceA', 'Fred e Fabrício');
INSERT INTO public.youtube_canais VALUES ('UC86Mk3Ws-jTqEQMhlyzpqWg', 'Samba De Dom');
INSERT INTO public.youtube_canais VALUES ('UCEspDpj50kjtYaQtsCkb5_Q', 'SEGUNDA SEM LEI');
INSERT INTO public.youtube_canais VALUES ('UC8iY8EK1YTjwkGgR4IzbZ7Q', 'Arruda');
INSERT INTO public.youtube_canais VALUES ('UCUZyctCGqfYdAYqKn3EoRKA', 'Kaique Almeida Oficial');
INSERT INTO public.youtube_canais VALUES ('UCcCVfj8TKgMWQ2hzxgwQtrQ', 'Ariel Skinny');
INSERT INTO public.youtube_canais VALUES ('UCNaJzRIhHmQTfchQ54V53Iw', 'Passos Sertanejos');
INSERT INTO public.youtube_canais VALUES ('UC6vtlzETLYFG1ieFy4ocW2w', 'FÁBRICA DE TALENTOS ');
INSERT INTO public.youtube_canais VALUES ('UCv2a0Tia9n1kARcexZtIUKw', 'Galícia');
INSERT INTO public.youtube_canais VALUES ('UCA61H4fWOMHikLcUFKyQUog', 'KATSEYE');
INSERT INTO public.youtube_canais VALUES ('UCkdzFl_tW5mdDVmrOhnTsxQ', 'AmosPoop Music');
INSERT INTO public.youtube_canais VALUES ('UCE_w1tFCS5gEBcMaLm7wnCA', 'TOWA');
INSERT INTO public.youtube_canais VALUES ('UCOvCud7r6XILh0U_Qy1BFDQ', 'capoVEVO');
INSERT INTO public.youtube_canais VALUES ('UCu59H8LNti6mwvcGRMge5PA', 'NATTI NATASHA ');
INSERT INTO public.youtube_canais VALUES ('UCpjm6cd08zTDHfCaSuM-k8w', 'Latin Pulse Club');
INSERT INTO public.youtube_canais VALUES ('UCfJNmhaMLZ6NRbXlzz1qMLQ', 'EMPIRE PHONK');
INSERT INTO public.youtube_canais VALUES ('UC5k0BNf8_UljOYqy8Kh8hlA', 'OPM Wish 2025');
INSERT INTO public.youtube_canais VALUES ('UC5s9Nmg_BYKY3nwUrOTBg_Q', 'Deep Horizon');
INSERT INTO public.youtube_canais VALUES ('UCY6WN_Njr5yNrrQQSi-NvMQ', 'VK Love Notes');
INSERT INTO public.youtube_canais VALUES ('UCQZOGGqGYzbTviRonDNsYdg', 'KARLUDO');
INSERT INTO public.youtube_canais VALUES ('UCmfFGTSsfJVu6CGvL8r75qg', 'MarkRonsonVEVO');
INSERT INTO public.youtube_canais VALUES ('UCIWo95f_YWHB0pYXbFV0n4g', 'bavikon');
INSERT INTO public.youtube_canais VALUES ('UCoANIG5PuFrEbxtyXgst8jw', 'WILL DIVINE');
INSERT INTO public.youtube_canais VALUES ('UC9HnKwLco0wfmmHJT4KOjJw', 'keshaVEVO');
INSERT INTO public.youtube_canais VALUES ('UCMFyw0Y05HGdc9kL0jfVdIQ', 'lil''babe');
INSERT INTO public.youtube_canais VALUES ('UCnZBreGKMYsBpE5Vqxevewg', 'Tyla - Topic');
INSERT INTO public.youtube_canais VALUES ('UCqAil6_A1dWHdFXzOwVLqlg', 'Sub Urban');
INSERT INTO public.youtube_canais VALUES ('UC6fF6g8Sm_Qrj0H1TCvX3lg', 'r u s s e l b u c k');
INSERT INTO public.youtube_canais VALUES ('UCWWajG_gixxYdJf1ClazNUg', 'Dj Ivis');
INSERT INTO public.youtube_canais VALUES ('UCTktZm0puTzzSOlHl3FcfVw', 'Victor e Leo');
INSERT INTO public.youtube_canais VALUES ('UCphr4yejnGroAUGAPuxvSow', 'Raí Saia Rodada');
INSERT INTO public.youtube_canais VALUES ('UCz5ZxMPd8Fvb7fkFQl_xjHA', 'MAX LEONEL - TR4P VID3OS');
INSERT INTO public.youtube_canais VALUES ('UC4rasfm9J-X4jNl9SvXp8xA', 'Ultra Records');
INSERT INTO public.youtube_canais VALUES ('UC2zN9KTBX4_toWdoWEPiqlA', 'Bl4ckBird1995');
INSERT INTO public.youtube_canais VALUES ('UCwVAo1JB1kq9d3CrQnqqX3g', 'Dreamyy lo-fi');
INSERT INTO public.youtube_canais VALUES ('UClHVfgvsjtFdY-yUGkPX88g', 'DJ Nelsinho');
INSERT INTO public.youtube_canais VALUES ('UCX79Y80sAOG5cNpXdmrwPdA', 'Cidinho & Doca - Topic');
INSERT INTO public.youtube_canais VALUES ('UCq2QQO2WR5wz2IfLwt3SYfw', 'TIVEVO');
INSERT INTO public.youtube_canais VALUES ('UCl_fKKHW-XeT-Hb-vtYV5wA', 'Jlfreestyle');
INSERT INTO public.youtube_canais VALUES ('UC24DI0Su8B3ivrczd1oeJ7g', 'Pablo Ramirez vivero Jesús');
INSERT INTO public.youtube_canais VALUES ('UCdTX5ycRKPvTUiGu1519u4g', 'Bruno & Marrone');
INSERT INTO public.youtube_canais VALUES ('UCFmhjWPGw--zFyDLBYxnnqA', 'Diego e Arnaldo');
INSERT INTO public.youtube_canais VALUES ('UC7pQ7EHmaeLCMUh8IYq58Jg', 'TremyxBR');
INSERT INTO public.youtube_canais VALUES ('UCs11lqGV02Y-gu2f6G1r4ug', 'FM O Dia');
INSERT INTO public.youtube_canais VALUES ('UCBIDd5IZ9d-4Qi7QbpdIm7Q', 'HerculaTV');
INSERT INTO public.youtube_canais VALUES ('UCZrUsMvgl2cqG0CavOxeJtA', 'Alice Araujo ');
INSERT INTO public.youtube_canais VALUES ('UCi66R6vyZOm6Dc7FERb_kdg', 'MrHelioFaria - DanceFunFitness');
INSERT INTO public.youtube_canais VALUES ('UCmJ1g6j-MIKEdLK_31YO9Rw', 'Luiz Poderoso Chefão');
INSERT INTO public.youtube_canais VALUES ('UCcr-6f6DtWoS8Sf77vdWVkQ', 'Encantos do Nordeste');
INSERT INTO public.youtube_canais VALUES ('UCaGhecql2HclGTL8N2ELmAA', 'Washington Brasileiro');
INSERT INTO public.youtube_canais VALUES ('UCHsL1w9ZWYEZ6ZBNRVKeLzQ', 'Universal Music Chile');
INSERT INTO public.youtube_canais VALUES ('UCF4nVf4UzUQuDW6Spu_0Vuw', 'Alfredo Larin Music ');
INSERT INTO public.youtube_canais VALUES ('UCz9yS18zJGQObwUL_K-ICnw', 'KarolGVEVO');
INSERT INTO public.youtube_canais VALUES ('UCK_5EsfTiG3e09dl06kRtnw', 'PALO!');
INSERT INTO public.youtube_canais VALUES ('UCy2bCk5KnIfjmWYFHMZcd5w', 'RosaliaVEVO');
INSERT INTO public.youtube_canais VALUES ('UCjVR6cfsFdkPhbQ7MaDbOqA', 'Mujer Latina');
INSERT INTO public.youtube_canais VALUES ('UC9TO_oo4c_LrOiKNaY6aysA', 'Daddy Yankee');
INSERT INTO public.youtube_canais VALUES ('UCL9BBo92IF5jwDhYIuCeg8g', 'Dj Victor Reyna');
INSERT INTO public.youtube_canais VALUES ('UCXvdfNKdIeIvCmgBaC0BK2A', 'Cele Arrabal');
INSERT INTO public.youtube_canais VALUES ('UCIgYGREZG7Sk_W7wF3231wA', 'Nel’s Music');
INSERT INTO public.youtube_canais VALUES ('UCdWiLsuoZPVfXBVPEZoAerw', '𝐋𝐎𝐅𝐈 𝐍𝐀𝐓𝐈𝐎𝐍');
INSERT INTO public.youtube_canais VALUES ('UCKsHD-leOlL7zK9iPWgY9Ug', 'itsAirLow');
INSERT INTO public.youtube_canais VALUES ('UC5XvkNgesb2zs2kljVG_3Zw', 'Jai Cuzco');
INSERT INTO public.youtube_canais VALUES ('UC6MfFxrAK-e4HcgJROvDJDg', 'ZaraLarssonMusicVEVO');
INSERT INTO public.youtube_canais VALUES ('UCbQRdVWiM19azF8xcM9u2Kg', 'Thomas Bergersen');
INSERT INTO public.youtube_canais VALUES ('UCLYHckv6c8Eky4Z02B6v34w', 'Ana Vilela');
INSERT INTO public.youtube_canais VALUES ('UCoSjEys1pqH_8Th9_lIINVQ', 'RD Bass');
INSERT INTO public.youtube_canais VALUES ('UCtCfgBZMjpduJYGwdmPtxng', 'BittRec');
INSERT INTO public.youtube_canais VALUES ('UCDiQ-LZ8dfc3cmoGBxMDS7Q', 'Mainstreet Records');
INSERT INTO public.youtube_canais VALUES ('UCkfnJK1jy2wYMX0Pr0cpUzQ', 'MD Chefe');
INSERT INTO public.youtube_canais VALUES ('UC__Ddt9F1S_yi5oOGgEv6cw', 'Thiago Soares');
INSERT INTO public.youtube_canais VALUES ('UCyCf4m5E0O8UeOQmkOt-FtQ', 'FABINHO');
INSERT INTO public.youtube_canais VALUES ('UC2i2M2U5tQMqAxULG21WT5A', 'Heitor Santos - Topic');
INSERT INTO public.youtube_canais VALUES ('UCmCOoNLsYoQnHJHTa_Yv_lA', 'Sâmya Maia');
INSERT INTO public.youtube_canais VALUES ('UCPenxNkvYv3x3fNkm-RJzlQ', 'Fala Sério - Topic');
INSERT INTO public.youtube_canais VALUES ('UCqHRyH0V2TrUMTskEM2vlDA', 'N4meX - Topic');
INSERT INTO public.youtube_canais VALUES ('UCxmL8AfG0_ufDr1hb_dj3QQ', 'Neul Piseiro');
INSERT INTO public.youtube_canais VALUES ('UCmBA_wu8xGg1OfOkfW13Q0Q', 'Bad Bunny');
INSERT INTO public.youtube_canais VALUES ('UCpb_iJuhFe8V6rQdbNqfAlQ', 'NickyJamTV');
INSERT INTO public.youtube_canais VALUES ('UCdQnhQjug7EyWn0u_VpeoyA', 'NoireSol');
INSERT INTO public.youtube_canais VALUES ('UCzfgB1mwA2agCi6WJtReCpg', 'Shaheen Record');
INSERT INTO public.youtube_canais VALUES ('UCm9SZAl03Rev9sFwloCdz1g', 'Rehaan Records');
INSERT INTO public.youtube_canais VALUES ('UC8MyBFjXbTezvZgMTEBFwgA', 'Guru Randhawa');
INSERT INTO public.youtube_canais VALUES ('UCNApqoVYJbYSrni4YsbXzyQ', 'Aditya Music');
INSERT INTO public.youtube_canais VALUES ('UCNsBK3q-eYKKBOhgBw1up5A', 'Cybermode Beats');
INSERT INTO public.youtube_canais VALUES ('UCrhNjae2abWsOIqZVAYLZtw', 'daveepa');
INSERT INTO public.youtube_canais VALUES ('UCdzMxI2LSMHV_fr5En-WSdQ', 'DDD.');
INSERT INTO public.youtube_canais VALUES ('UCWIF9O-NipM4UKeGKdF3soA', 'ListenUpJames');
INSERT INTO public.youtube_canais VALUES ('UCnr8XmfD3_2Hib3U0mGPWgQ', 'YOUNA');


--
-- Data for Name: youtube_categorias; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.youtube_categorias VALUES ('1', 'Filmes e desenhos');
INSERT INTO public.youtube_categorias VALUES ('2', 'Automóveis');
INSERT INTO public.youtube_categorias VALUES ('10', 'Música');
INSERT INTO public.youtube_categorias VALUES ('15', 'Animais');
INSERT INTO public.youtube_categorias VALUES ('17', 'Esportes');
INSERT INTO public.youtube_categorias VALUES ('18', 'Curtas');
INSERT INTO public.youtube_categorias VALUES ('19', 'Viagens e eventos');
INSERT INTO public.youtube_categorias VALUES ('20', 'Jogos');
INSERT INTO public.youtube_categorias VALUES ('21', 'Videoblog');
INSERT INTO public.youtube_categorias VALUES ('22', 'Pessoas e blogs');
INSERT INTO public.youtube_categorias VALUES ('23', 'Comédia');
INSERT INTO public.youtube_categorias VALUES ('24', 'Entretenimento');
INSERT INTO public.youtube_categorias VALUES ('25', 'Notícias e política');
INSERT INTO public.youtube_categorias VALUES ('26', 'Tutoriais e estilo');
INSERT INTO public.youtube_categorias VALUES ('27', 'Educação');
INSERT INTO public.youtube_categorias VALUES ('28', 'Ciência e tecnologia');
INSERT INTO public.youtube_categorias VALUES ('30', 'Filmes');
INSERT INTO public.youtube_categorias VALUES ('31', 'Desenho/animação');
INSERT INTO public.youtube_categorias VALUES ('32', 'Ação/aventura');
INSERT INTO public.youtube_categorias VALUES ('33', 'Clássicos');
INSERT INTO public.youtube_categorias VALUES ('34', 'Comédia');
INSERT INTO public.youtube_categorias VALUES ('35', 'Documentário');
INSERT INTO public.youtube_categorias VALUES ('36', 'Drama');
INSERT INTO public.youtube_categorias VALUES ('37', 'Família');
INSERT INTO public.youtube_categorias VALUES ('38', 'Estrangeiro');
INSERT INTO public.youtube_categorias VALUES ('39', 'Terror');
INSERT INTO public.youtube_categorias VALUES ('40', 'Ficção científica/fantasia');
INSERT INTO public.youtube_categorias VALUES ('41', 'Suspense');
INSERT INTO public.youtube_categorias VALUES ('42', 'Curtas');
INSERT INTO public.youtube_categorias VALUES ('43', 'Séries');
INSERT INTO public.youtube_categorias VALUES ('44', 'Trailers');


--
-- Data for Name: youtube_video_estatisticas; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.youtube_video_estatisticas VALUES (1, 'tigPF7zhElk', 169678, 10398, 598, '2026-05-05 20:17:11.257774');
INSERT INTO public.youtube_video_estatisticas VALUES (2, 'NJV9Pw2kXc4', 72490, 7541, 529, '2026-05-05 20:17:11.257774');
INSERT INTO public.youtube_video_estatisticas VALUES (3, 'q9P3y3y2KKw', 501820, 44824, 2077, '2026-05-05 20:17:11.257774');
INSERT INTO public.youtube_video_estatisticas VALUES (4, 'WNuuYqRzqDI', 53556, 677, 19, '2026-05-05 20:17:11.257774');
INSERT INTO public.youtube_video_estatisticas VALUES (5, '7s0fcLuo4P0', 55082, 6484, 522, '2026-05-05 20:17:11.257774');
INSERT INTO public.youtube_video_estatisticas VALUES (6, 'mocN7Hdj5HQ', 280133, 7454, 718, '2026-05-05 20:17:11.257774');
INSERT INTO public.youtube_video_estatisticas VALUES (7, 'RjXzYmFE7ZU', 7007, 3069, 176, '2026-05-05 20:17:11.257774');
INSERT INTO public.youtube_video_estatisticas VALUES (8, 'T2MP_T2e-aU', 314304, 21250, 4208, '2026-05-05 20:17:11.257774');
INSERT INTO public.youtube_video_estatisticas VALUES (9, 'Vu7Fho0Q7sE', 155374, 7032, 2, '2026-05-05 20:17:11.257774');
INSERT INTO public.youtube_video_estatisticas VALUES (10, 'J9-vnds90wQ', 228193, 1679, 8, '2026-05-05 20:17:11.257774');
INSERT INTO public.youtube_video_estatisticas VALUES (11, 'TLiAJgX9MVA', 12372, 1639, 145, '2026-05-05 20:17:11.257774');
INSERT INTO public.youtube_video_estatisticas VALUES (12, 'Lehpq9dxyXc', 66159, 9713, 822, '2026-05-05 20:17:11.257774');
INSERT INTO public.youtube_video_estatisticas VALUES (13, 'dCY_QyPtGw0', 369678, 578, 2, '2026-05-05 20:17:11.257774');
INSERT INTO public.youtube_video_estatisticas VALUES (14, 'ILzMOGDTKCs', 84004, 10803, 141, '2026-05-05 20:17:11.257774');
INSERT INTO public.youtube_video_estatisticas VALUES (15, 'o6WBhVjBXgo', 160623, 2713, 57, '2026-05-05 20:17:11.257774');
INSERT INTO public.youtube_video_estatisticas VALUES (16, 'qgb0HI4geBI', 4783, 485, 20, '2026-05-05 20:17:11.257774');
INSERT INTO public.youtube_video_estatisticas VALUES (17, 'dQuxJmOxTSA', 36381, 3396, 359, '2026-05-05 20:17:11.257774');
INSERT INTO public.youtube_video_estatisticas VALUES (18, 'sHnNoHmLbfs', 20860, 210, 1, '2026-05-05 20:17:11.257774');
INSERT INTO public.youtube_video_estatisticas VALUES (19, 'OYdHSvHDkcI', 896210, 20036, 1457, '2026-05-05 20:17:11.257774');
INSERT INTO public.youtube_video_estatisticas VALUES (20, '1W4nI_JylhM', 44928, 2298, 67, '2026-05-05 20:17:11.257774');
INSERT INTO public.youtube_video_estatisticas VALUES (21, 'nsYhffqZbd4', 80154, 533, 0, '2026-05-05 20:17:11.257774');
INSERT INTO public.youtube_video_estatisticas VALUES (22, 'LIitsptu7RM', 11259, 1783, 204, '2026-05-05 20:17:11.257774');
INSERT INTO public.youtube_video_estatisticas VALUES (23, 'wKZb3YKvRyQ', 200475, 8683, 748, '2026-05-05 20:17:11.257774');
INSERT INTO public.youtube_video_estatisticas VALUES (24, 'x3eqqoZPV_E', 17533229, 849807, 61614, '2026-05-05 20:17:11.257774');
INSERT INTO public.youtube_video_estatisticas VALUES (25, 'M4FspH3s9wo', 30270, 3227, 161, '2026-05-05 20:17:11.257774');
INSERT INTO public.youtube_video_estatisticas VALUES (26, 'osY6jekNczM', 16667, 512, 35, '2026-05-05 20:17:11.257774');
INSERT INTO public.youtube_video_estatisticas VALUES (27, 'yAhcQs9g62k', 9536, 85, 0, '2026-05-05 20:17:11.257774');
INSERT INTO public.youtube_video_estatisticas VALUES (28, 'LpoVS2SUB20', 14888, 1030, 94, '2026-05-05 20:17:11.257774');
INSERT INTO public.youtube_video_estatisticas VALUES (29, 'ceUYsF_4Drk', 63282, 2305, 222, '2026-05-05 20:17:11.257774');
INSERT INTO public.youtube_video_estatisticas VALUES (30, 'h8s4XmWAnfA', 104166, 396, 13, '2026-05-05 20:17:11.257774');
INSERT INTO public.youtube_video_estatisticas VALUES (31, 'C0IpL4jW3JE', 3417, 684, 51, '2026-05-05 20:17:11.257774');
INSERT INTO public.youtube_video_estatisticas VALUES (32, 'hh0MvQk4DBA', 34313, 1342, 45, '2026-05-05 20:17:11.257774');
INSERT INTO public.youtube_video_estatisticas VALUES (33, 'RrbezC7PoRU', 109219, 1889, 42, '2026-05-05 20:17:11.257774');
INSERT INTO public.youtube_video_estatisticas VALUES (34, 'y7GiJyVkC_8', 5161, 573, 136, '2026-05-05 20:17:11.257774');
INSERT INTO public.youtube_video_estatisticas VALUES (35, 'JEOyeHHm5FM', 366915, 16108, 2744, '2026-05-05 20:17:11.257774');
INSERT INTO public.youtube_video_estatisticas VALUES (36, 'xba6s-xhj8Q', 550701, 2779, 86, '2026-05-05 20:17:11.257774');
INSERT INTO public.youtube_video_estatisticas VALUES (37, 'kTCsczXlJwE', 4706, 444, 48, '2026-05-05 20:17:11.257774');
INSERT INTO public.youtube_video_estatisticas VALUES (38, '-Lkg6JQ107s', 107382, 1545, 46, '2026-05-05 20:17:11.257774');
INSERT INTO public.youtube_video_estatisticas VALUES (39, 'XUxWl0vpZDc', 164107, 336, 5, '2026-05-05 20:17:11.257774');
INSERT INTO public.youtube_video_estatisticas VALUES (40, 'k1MVnzd2aVc', 362799, 15291, 856, '2026-05-05 20:17:11.257774');
INSERT INTO public.youtube_video_estatisticas VALUES (41, 'Bp5gSkmgDa4', 100387, 7840, 9, '2026-05-05 20:17:11.257774');
INSERT INTO public.youtube_video_estatisticas VALUES (42, 'brfJIxPE5VQ', 423433, 1719, 51, '2026-05-05 20:17:11.257774');
INSERT INTO public.youtube_video_estatisticas VALUES (43, 'QUm6MRxsAL8', 5232, 881, 123, '2026-05-05 20:17:11.257774');
INSERT INTO public.youtube_video_estatisticas VALUES (44, 'TyfwZnrZcik', 240977, 10267, 909, '2026-05-05 20:17:11.257774');
INSERT INTO public.youtube_video_estatisticas VALUES (45, 'qUx8zo1d9nI', 4829, 90, 1, '2026-05-05 20:17:11.257774');
INSERT INTO public.youtube_video_estatisticas VALUES (46, '_cU98qboHO0', 7004, 483, 40, '2026-05-05 20:17:11.257774');
INSERT INTO public.youtube_video_estatisticas VALUES (47, 'qtTLudtHpKc', 19132, 1617, 194, '2026-05-05 20:17:11.257774');
INSERT INTO public.youtube_video_estatisticas VALUES (48, 'uVpUFMySPFQ', 9180, 729, 33, '2026-05-05 20:17:11.257774');
INSERT INTO public.youtube_video_estatisticas VALUES (49, '9xUeiovIn8A', 248884, 30413, 1550, '2026-05-05 20:17:11.257774');
INSERT INTO public.youtube_video_estatisticas VALUES (50, 'Cxl52-1LW_k', 2875, 586, 76, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (51, 'XeNibQZwp00', 244491, 11723, 2296, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (52, 'qiOGfrte_Lg', 26776, 4474, 572, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (53, 'oI51J1tjUBs', 5236, 1018, 129, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (54, '-RuSsuxZjIg', 6128, 391, 81, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (55, 'NcP5zbMA0QU', 6718, 1496, 271, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (56, 'pkE_H8yEdl8', 12173, 1173, 237, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (57, 'R1WQVeCq0Hs', 2136847, 136805, 9417, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (58, 'V9PVRfjEBTI', 809797806, 5299072, 143073, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (59, 'WXBHCQYxwr0', 1037735331, 7627508, 155771, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (60, '-eGKhLZfkaU', 137266, 8519, 0, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (61, 'fLexgOxsZu0', 3206481890, 16529858, 676948, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (62, 'kF4MVeWFiDs', 2805730, 94435, 3789, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (63, 'd-aa-dZZmF8', 64831, 3920, 561, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (64, 'qOcZBlLdsXg', 44507, 4801, 721, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (65, 'CcS1fsuT10M', 22039027, 217825, 7424, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (66, 'KFMYx1TibeQ', 86165429, 554626, 15781, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (67, 'aYMCeWO7D7k', 88558, 3371, 766, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (68, '09R8_2nJtjg', 4374490178, 16995520, 441325, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (69, 'm__b5iBYP1Y', 11970891, 22002, 329, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (70, 'ko70cExuzZM', 386868720, 3371990, 138515, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (71, 'GRiJXn0rgCQ', 4983, 702, 50, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (72, 'bGx7sOyTRTA', 16819, 1765, 84, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (73, '9qI2-UijNOo', 96737, 1666, 530, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (74, 'PEnDh9CkLUc', 11262, 632, 116, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (75, 'dgzN94w1lLE', 8558, 878, 52, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (76, 'Ra_bioBGzUg', 3008, 241, 29, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (77, '2aJUnltwsqs', 210724645, 1392167, 50977, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (78, 'qgaRVvAKoqQ', 94429184, 567829, 15814, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (79, 'fHI8X4OXluQ', 865679068, 6364240, 172545, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (80, 'a7fzkqLozwA', 448036654, 2900175, 47547, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (81, 'vGJTaP6anOU', 471544373, 4230254, 141160, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (82, 'G23iLGhh9lo', 38009430, 274739, 18123, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (83, 'oqv35UZepIM', 309071672, 2291339, 36620, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (84, 'r58GQYFZeLE', 52352215, 345731, 13271, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (85, '1vrEljMfXYo', 567181344, 3609395, 177055, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (86, 'QhW3P7_jvWY', 29996995, 192522, 10693, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (87, 'x47TgeRJtH0', 81086718, 849304, 9533, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (88, 'W7nmB20qJv4', 59689195, 611079, 14292, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (89, '9wT1s96JIb0', 22303344, 270758, 5765, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (90, 'ZRHHOttkM1A', 164768780, 1814249, 26644, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (91, 'F5eEvfOyb7k', 23926890, 211675, 12925, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (92, 'RNOTF-znQyw', 49449790, 292289, 17435, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (93, 'ifWOSnoCS0M', 8777195, 83754, 4415, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (94, 'rTKpYJ80OVQ', 50315735, 404732, 7852, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (95, 'oacaq_1TkMU', 92474931, 438286, 10696, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (96, 'DmNfT-B7nlA', 210343130, 1425653, 32534, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (97, '4FitbJ3oqww', 77764302, 1040514, 52315, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (98, 'xy3AcmW0lrQ', 140509101, 1051037, 18284, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (99, 'AeZRYhLDLeU', 46136952, 303999, 10457, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (100, 'JNNKOkcojEc', 34204, 3817, 140, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (101, 'KXJpP0jd9Lk', 110823193, 513167, 16242, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (102, '-FVrYTPBqxg', 30996, 828, 102, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (103, 'mAlFutzMbGI', 1207, 189, 39, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (104, '5CxknorIHQ4', 10507, 1264, 79, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (105, '81GaF34veWA', 503048062, 1634260, 39380, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (106, '93TXfW3MT4o', 358225252, 1267346, 34336, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (107, 'yxwnCxnUVlw', 336176274, 1660624, 50282, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (108, 'dANcAGydlsM', 450348863, 3978807, 91596, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (109, '49LvI-Y_ScY', 9263321, 22503, 0, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (110, 'q0u47Nl7N7M', 4697803, 92540, 3390, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (111, 'agr3esH33SU', 6979, 1482, 271, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (112, '1ouf1Dt7H2A', 1876262, 20138, 1520, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (113, 'ZDW9eJOtZ3s', 16595316, 307359, 49155, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (114, 'tigPF7zhElk', 379169, 17227, 782, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (115, 'FZm2Ci1jLe0', 49419, 215, 10, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (116, 'xCuqr0PO0_8', 9051643, 56605, 1579, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (117, 'WiNYFwIfg4w', 196455920, 1106972, 11826, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (118, 'QrtoMb-o7b8', 91191622, 329163, 3875, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (119, 'hpn23IVQTbY', 16229, 1822, 121, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (120, 'ieTE4-Xy9xg', 36571232, 199003, 5642, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (121, 'Lny-RiAKQ1Q', 14081536, 56735, 1940, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (122, 'ug5IBOYCUzQ', 80269226, 270125, 4619, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (123, '9TYOtiHgQTA', 63750476, 218964, 11297, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (124, '5IWRU8k0qaU', 18363638, 96214, 3595, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (125, 'M_eOUE6pFKY', 74393023, 312013, 2108, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (126, 'upCptHeThio', 476457877, 4623335, 107345, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (127, '0VNARs1fbrQ', 2350846, 30578, 66, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (128, '_P7S2lKif-A', 1947204659, 15504388, 413633, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (129, 'CogD1olVZYk', 103369179, 563283, 7501, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (130, 'EWcOY14GWwM', 749726636, 5572108, 217194, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (131, '4N2iMmHcHys', 546127862, 3371457, 83925, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (132, 'uF_w5PjpuKI', 4680018, 22893, 219, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (133, 'kxVm97f25VA', 184630276, 468934, 4677, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (134, 'aHBW_Nd_z8k', 189208854, 1091839, 12764, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (135, 'kzOkza_u3Z8', 260916181, 2463502, 152335, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (136, '-UDWqs7TsTg', 148556016, 686597, 11209, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (137, 'tnyJXbPrGN8', 142789742, 1082991, 12338, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (138, 'kDhptBT_-VI', 471976970, 4490481, 257571, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (139, 'iaXt5shHFL8', 18465406, 275565, 23538, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (140, 'gEAXyEUQPUs', 65259763, 485038, 0, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (141, 'buZm0R1qWgU', 840441, 6033, 40, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (142, '3yd_eoMOvqk', 1293725289, 9019773, 282132, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (143, 'iEenugG_y6c', 132033840, 437135, 6286, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (144, 'uQPu_XgV2iU', 11559716, 177753, 2826, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (145, '9QASL0SjNGQ', 1199671, 28842, 668, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (146, 'RKb9WiYcfLM', 142186953, 801486, 11313, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (147, 'ENHwrVK0wn8', 175222578, 1059225, 12108, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (148, 'udVRjFnmeX4', 136658, 2421, 48, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (149, 'VpJKsoMWnZM', 210168699, 2304361, 51338, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (150, 'OFwLmOlaeV0', 2294, 60, 1, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (151, 'PaQGJV4AHYg', 8065, 175, 1, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (152, 'yv2i9s6c69g', 23554, 179, 7, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (153, 'WQ3wmf8KyFo', 474594, 2617, 29, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (154, '0nHHZZRYNf4', 191276277, 990577, 11333, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (155, '4lH4Rk4iwBA', 32550, 386, 2, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (156, '0QULuVbkGEU', 6636462, 70722, 1041, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (157, 'XPs5XS5CtIw', 823467, 7383, 87, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (158, 'QfzMtZ3HSG0', 109855, 618, 9, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (159, 'OQODghPUIqg', 153981, 1556, 27, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (160, 'Bb6nkSz8ThA', 5942376, 34177, 731, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (161, 'nRbw5SCKD8M', 414, 13, 2, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (162, 'hfwmSryJi98', 66433, 456, 2, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (163, 'z5R9JzNpvPc', 8878391, 51692, 0, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (164, '4NpT4hCgoB0', 202613, 4297, 90, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (165, '63XyWeKWI0M', 204520562, 1623377, 36881, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (166, 'MIjLD8KB2gs', 632342, 4874, 38, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (167, 'yyq2L2Ws5Ow', 75411, 685, 5, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (168, 'q-uWWNcu724', 14879061, 171625, 2915, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (169, '_urlIWLDvrA', 6996965, 126962, 2170, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (170, 'BZjxRqWBeHU', 2417161, 23734, 408, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (171, 'Quc3PUKyGCA', 542727, 5723, 30, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (172, 'Pes_L2tdrG8', 999562, 6714, 91, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (173, 'gQreU1BGMmw', 16113624, 176118, 1669, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (174, 'PI23ldAvdHY', 18328786, 251503, 6424, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (175, 'vKRAmLTQ9Dk', 39163200, 490070, 6776, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (176, 'ICkFEA5eunU', 625163, 4678, 183, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (177, 'UZxnSc6VKog', 88267097, 1378465, 43038, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (178, 'cIUSxV9J45w', 14606, 227, 3, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (179, '7pD8k2zaLqk', 44679277, 393219, 8671, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (180, 'e_xGeZDk3Sw', 214517806, 3377566, 143796, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (181, '4Y_5uJpSOZM', 15111041, 715221, 17348, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (182, 'vlZ9MGgC1NI', 56512454, 449159, 9498, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (183, 'xAM51Ovpr9M', 243136414, 3302321, 61698, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (184, 'iZq0u3quAqo', 731558230, 3826354, 87184, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (185, 'Ibfm0yE5O_8', 17568385, 121050, 3461, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (186, 'GA7LcSX8tYE', 89457065, 830487, 26022, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (187, 'WF7LLl7r4Os', 72530234, 606184, 18416, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (188, 's6dIjPBECXw', 26419484, 304585, 3916, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (189, 'TwkKp-BBChg', 86240693, 1143743, 55438, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (190, 'gUnpHJgLyRs', 91302348, 746881, 4067, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (191, 'P-W2JmG9vtQ', 18414654, 119047, 4087, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (192, 'o50J2xg8-sU', 132325244, 952024, 6414, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (193, 'XpvSubMyL0k', 3751521, 200568, 6578, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (194, 'Wu-HUG7ORt8', 101304755, 761144, 16488, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (195, 'CWqoY1RK5lU', 777516, 63849, 3458, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (196, 'fAHcrVZhLIA', 16371573, 151150, 11188, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (197, 'G2huIPUuUQc', 97813837, 559038, 10346, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (198, 'rC9vmpQRR40', 33209322, 242776, 5929, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (199, '10XarNSkw0s', 289605421, 646453, 17694, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (200, 'V2RgfAC0Mz8', 606722, 2213, 26, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (201, 'YrvU5E-iF_s', 2198073, 6922, 68, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (202, 'BEz8l69aI8Y', 739695241, 1778116, 21450, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (203, 'Dt13Wv6Opeo', 129282826, 762584, 25111, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (204, 'yZh9a-QX3Yo', 328261, 1004, 33, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (205, 'UsEhWFeiCnA', 302733, 991, 12, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (206, 'T67WZx7CxY8', 62507054, 307520, 7855, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (207, 'BOn-sXalHxI', 1704219, 4201, 59, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (208, 'J_jJhHhYW9w', 324758399, 2446857, 51054, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (209, '8blgJSoAVBc', 4441909, 18699, 282, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (210, 'veSzGDdQ_Ok', 21688542, 78790, 1066, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (211, 'GVSS3lh_lCY', 94980975, 79294, 1255, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (212, 'kI6ywewtYkc', 126401525, 220601, 3769, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (213, 'PtJDSomNoUM', 253448, 879, 17, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (214, 'ToabLkXUotM', 92009463, 127016, 4962, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (215, 'jPwCxjJqHGw', 115328494, 227994, 4053, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (216, 'o4SIXV3OKeY', 241032953, 589164, 13341, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (217, 'OcKwmWEBi1I', 82490660, 115528, 659, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (218, 'MO37-1KgcI4', 66637209, 356685, 28136, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (219, 's9IlAyHO6EQ', 63333028, 144900, 5763, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (220, 'uEtGTq92Cmk', 161390933, 327576, 8097, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (221, 'ZIiQ1jMqhVM', 232878158, 1992590, 54086, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (222, 'E7UBYWn_69c', 880421, 1479, 22, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (223, 'lBDDMrUCz1A', 16822535, 34403, 7300, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (224, 'eAIivxKZYZw', 388135311, 1161887, 14866, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (225, 'n5wxZ_OBUXk', 414238717, 1316712, 16130, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (226, 'h3nyYuevzi8', 8786, 34, 0, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (227, 'qPgwDlqdiD0', 51106989, 293958, 3103, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (228, 'Vvfs44wnHH0', 10917915, 61477, 859, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (229, 'CgkLC1mcCE0', 153874873, 293709, 4743, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (230, 'CGOKwddW7uo', 7744176, 41041, 640, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (231, 'AAZmC2EcNng', 49388930, 106656, 1381, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (232, 'iYjz1Ap1VvU', 142373673, 383502, 4128, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (233, 'WrwEIKj7KB0', 8943250, 37875, 409, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (234, 'ozLE7N5uEfw', 49537682, 104012, 1378, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (235, 'iL_ljx5eXQc', 45029098, 80088, 1795, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (236, 'lKsfbr_F6ho', 335110, 1482, 30, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (237, 'TxCOdjTyY94', 56675629, 104373, 1537, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (238, 'AA-sNG6eIyI', 2923510, 15343, 354, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (239, 'eCdTbCf4EMM', 2739333, 14661, 299, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (240, 'exTC-KFUJrM', 40505397, 47782, 353, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (241, 'EEoqV07KXck', 1421486, 8282, 181, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (242, 'QWgqN_oD934', 238746, 3175, 133, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (243, 'wJPicWv_SGU', 97116326, 109347, 579, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (244, 'WQyKuEsLpRY', 205787000, 1162323, 17854, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (245, 'lRt16Y_ys7g', 1266531, 10523, 460, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (246, 'KjdmmvEzGoc', 157666143, 277080, 2417, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (247, 'I5Rl73wFmWs', 220818244, 915710, 9039, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (248, 'VrTm4M6qAA4', 41501912, 189100, 3932, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (249, 'HD2sMiAwpCQ', 189285985, 687877, 8939, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (250, 'ox9zGoiJcKg', 234852481, 865780, 17126, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (251, 'PvM_YAabhkk', 69583797, 293295, 6967, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (252, 'g2o3CZaVVCo', 131399854, 767498, 9981, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (253, 'KzPau_0Ad7o', 142662760, 395237, 4894, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (254, 'aDDBdW8-PZo', 12506467, 43524, 524, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (255, 'UtTDrO9arqI', 34664295, 238325, 5036, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (256, 'tptkdXcBlzY', 2307815, 10051, 314, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (257, 'ewnUjJkdeNI', 6876157, 23707, 633, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (258, 'tvPSPkugS7A', 124256471, 340387, 4918, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (259, 'lYv3IGKab44', 328413, 4638, 60, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (260, '0692WFAqRxs', 13828299, 164199, 4240, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (261, 'bjvLAQLl2xw', 15434879, 81521, 2924, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (262, 'fp6p7-yxNeQ', 793695, 9959, 109, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (263, 'skAvBJPTfSA', 24542097, 104943, 1, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (264, 'W_jywiZmd-c', 9234611, 65950, 1634, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (265, '_d3jWdIdRHQ', 268107, 2246, 21, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (266, 'CVTWjpx8_YA', 4511100, 41130, 0, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (267, '2HXbHjLJhAk', 184796, 4802, 201, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (268, '8tzhHzV05_0', 40345984, 127981, 1984, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (269, 'KzhZd3BcbWQ', 1017831, 9606, 250, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (270, 'JCf4x_ODbhA', 21551365, 87015, 1203, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (271, 'EToVcmE8RHQ', 597936, 7006, 91, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (272, 'a9R7JuPdMLo', 539524, 9758, 297, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (273, 'xNmehcf7bqI', 193882, 2710, 0, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (274, 'eHHQaoEW30Q', 120655745, 1884332, 228091, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (275, 'NYyNHZPeQ4I', 14576085, 21970, 228, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (276, 'w7-SyTTulAw', 7833, 2053, 56, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (277, 'qUxgHHiqGg0', 17377113, 29000, 683, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (278, 'zDv9qV7PABI', 32702110, 59619, 1000, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (279, '5L5eSTYX6wc', 45083654, 94413, 1489, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (280, '-SEKt_0pdHM', 2897717, 225863, 11246, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (281, 'bMhDJ0S0OBA', 19021006, 413213, 24677, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (282, '_kS7F4VpJa0', 52019544, 880316, 25208, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (283, 'TvVtYaqCni8', 116344971, 1874157, 79987, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (284, 'z0Xc_rzYZV8', 11323606, 31903, 923, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (285, 'vqkfEUqjl6Y', 48243688, 544220, 51385, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (286, 'F7sGJVUrkjQ', 92732358, 1106473, 86313, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (287, 'FEfPbOnE7VM', 3338007, 14559, 517, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (288, 'yd_uG3TtREs', 181284045, 1403835, 64041, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (289, 'nL2bLcCtXcM', 33818852, 90343, 1092, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (290, '42wfEs7oIP8', 70842747, 1400341, 36778, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (291, '2GJfWMYCWY0', 74313088, 3657809, 354714, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (292, 'MoU3TctXBvs', 27774866, 61010, 1080, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (293, 'GkG60kISnfc', 62137136, 721006, 20539, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (294, 'AYQNN7OAHpM', 8448044, 17486, 0, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (295, 'NED7nev2ywQ', 105436177, 1929523, 162154, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (296, 'x_RYZsOfpKY', 53197336, 815825, 29165, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (297, 'L3sOnIfU0QM', 36906088, 219929, 8877, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (298, 'Ve_a9CXjlQc', 42090684, 173456, 5413, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (299, 'GMFewiplIbw', 2661527783, 8959837, 328586, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (300, 'Us2ZvSRUB1k', 9264611, 39235, 560, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (301, 'kJQP7kiw5Fk', 9010480726, 56173595, 4363523, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (302, 'WB9Egi9leWA', 1858588, 23590, 733, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (303, 'yH1fk7WLiMc', 12534967, 108608, 3587, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (304, 'BZIqOKGmDV4', 1549774, 21527, 220, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (305, 'Xtt78SW-mgg', 2701690, 108543, 3901, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (306, 'VMp55KH_3wo', 1737200027, 4508875, 175276, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (307, '_NwcW2GwFGY', 14147715, 149479, 1528, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (308, 'TyHvyGVs42U', 2503870379, 10701969, 337966, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (309, 'dkGnWUfweUQ', 974839, 12731, 206, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (310, 'nD3e_CQQwmM', 1441898, 10773, 609, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (311, 'wnJ6LuUFpMo', 3643659046, 19133403, 531616, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (312, 'hKwCRJfiHBo', 335390, 14028, 252, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (313, 'QuSEbo03fc4', 99626768, 591036, 13752, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (314, 'n7OUYLY5DG4', 1622043, 64681, 2066, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (315, 'NUsoVlDFqZg', 3825543878, 11914047, 300095, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (316, '2ZSAAI2BC1U', 2226351, 22596, 838, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (317, 'YXnjy5YlDwk', 1303924400, 3777447, 100750, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (318, 'FOtvRp-VEO0', 10551890, 107351, 1413, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (319, 'RGNv4XI0jgI', 1679648, 5101, 94, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (320, 'z1g_WMMFs88', 36705, 250, 2, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (321, 'TgJY0UcmtCA', 747979, 11937, 175, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (322, 'BXGYJPUAbMM', 2684299, 73764, 411, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (323, 'c7l7Fnl0Oqo', 1610374, 11118, 237, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (324, 'fTKqtvXjkvo', 38350375, 87591, 4850, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (325, 'MKaPVvXXhxk', 4599218, 61556, 282, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (326, 'zm4C9rx5fGY', 13166940, 30918, 1386, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (327, 'LuzXr3He9NI', 13584504, 45868, 2879, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (328, 'Y5lrZeDf1T4', 992810, 13493, 938, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (329, 'uRiB1tsFIkE', 35950208, 165178, 6791, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (330, 'rIt4pBtu0QA', 570434, 4364, 104, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (331, 'cdTNj3y6G8I', 6383137, 42784, 418, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (332, 'ed1RJCuNWAo', 3240010, 15286, 387, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (333, 'DD2rp9pe6n4', 1071464, 20475, 84, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (334, 'k6aqTBFpPl0', 411691, 3746, 61, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (335, '7H3DiVmLG74', 952172, 7582, 101, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (336, '2lnLrCo4bdY', 1012606, 21247, 310, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (337, 'wBcptk5YWQI', 32119825, 357609, 19105, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (338, 'ZvNnfTmBcME', 1626674, 6278, 325, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (339, '4UWwpyYF4lo', 2704615, 27227, 144, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (340, 'IMf9O3x6KzM', 5137, 206, 33, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (341, 'CDBoHKXtrjs', 850752, 11051, 484, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (342, 'yZL_C-Kcxf0', 20005898, 819263, 20169, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (343, 't1MnvH6GPJ4', 147678125, 4123658, 6425, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (344, 'q0I-N1wlwdE', 4044377, 53766, 1089, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (345, 'z985Q4eTnks', 14575611, 0, 1900, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (346, 'mQwdGdMGQNo', 16376526, 43583, 1977, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (347, 'DVxpjW99ueQ', 697591, 19466, 760, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (348, 'yFmkfJOOzE4', 8716591, 383126, 4041, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (349, 'E0Y8OEo_zOc', 1893781, 4344, 232, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (350, 'XXYlFuWEuKI', 2130987802, 10815858, 332165, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (351, 'gPoiv0sZ4s4', 15468450, 206749, 12627, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (352, 'nXeEQTnfljo', 6263031, 18733, 449, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (353, 'aSugSGCC12I', 175232231, 1910521, 66355, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (354, 'eVli-tstM5E', 591684708, 4252319, 88504, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (355, '5GL9JoH4Sws', 3073044859, 13134605, 484088, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (356, 'plNmaCuPSYw', 7754118, 103979, 1437, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (357, '6GT7qDORxAE', 4051, 0, 3, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (358, 'JGpQwM9fYnQ', 95869, 953, 33, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (359, 'kPa7bsKwL-c', 1667008843, 13728884, 571709, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (360, 'q5D2ZlBuG7g', 2090089, 18456, 1143, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (361, 'Oa_RSwwpPaA', 997891994, 6607773, 143824, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (362, 'NtTdainRvQ8', 5504809, 194281, 2632, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (363, 'Rg0fyvTDfu8', 2397198, 9260, 300, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (364, '9cZ7Nl3Ynxo', 13928054, 24965, 433, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (365, 'M11SvDtPBhA', 1138498400, 4992150, 463911, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (366, 'cQuJn-d0KOY', 179676, 476, 15, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (367, 'Bk5_aL3y4ig', 3713663, 20267, 247, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (368, 'WBy8ETk_Fqs', 4545067, 0, 240, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (369, 'byxFUKxhT3s', 154870408, 696720, 24157, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (370, '9Vti9E-TASg', 13936472, 80840, 1128, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (371, '2UCBbcBT5Es', 10131742, 80378, 1772, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (372, 'gCYcHz2k5x0', 1859798714, 13033673, 352691, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (373, 'FC9MtWYShzg', 95103735, 399796, 5840, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (374, 'wJnBTPUQS5A', 1290196163, 11042119, 500964, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (375, 'WHHmiWUqIZA', 47418548, 425568, 4696, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (376, 'zeHTVxkycgE', 55151684, 394682, 11922, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (377, 'a4fv-BtzNmY', 15438875, 95519, 4069, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (378, 'UScyjLs_XNU', 1318936, 17151, 673, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (379, 'ZgvJgqi_DFk', 8689748, 62448, 1927, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (380, 'z_7F9q7EIoI', 1408740, 20146, 1224, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (381, 'R2KeQqLzr00', 31768685, 239747, 2154, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (382, 'EJqFjvKF8HU', 1516404, 36653, 1009, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (383, 'HFvjFC-YmHE', 4416761, 24060, 341, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (384, 'mC_eGKko9FA', 1008629, 36279, 1456, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (385, 'N6DW31S_oyI', 15018376, 126260, 1426, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (386, '2z8GIdGkWnE', 85499, 781, 43, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (387, 'hum1d7yvmXU', 4202102, 76368, 4659, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (388, 'mdpSxWU4mv0', 608098, 4371, 84, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (389, 'HvkAfj1QnK8', 509707, 9225, 957, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (390, 'qAIy8godTy4', 16923946, 130944, 1387, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (391, 'CE5i5Sf56vY', 4936423, 17574, 164, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (392, 'b20j_p5_dwI', 936003, 11188, 346, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (393, 'V6I7-39fn2Y', 6137367, 26721, 565, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (394, 'E8xJaL_tMjw', 293337, 13690, 362, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (395, 'YNVU7r0qVhU', 331394, 984, 52, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (396, 'wPCMekJog4o', 1931513, 6725, 125, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (397, 'TAx7x0rBdnY', 509435, 1436, 61, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (398, 'N-prD5sprfs', 417312, 1184, 33, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (399, 'yoZy2E17-50', 365049751, 4391924, 125029, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (400, 'PImxg_WTtSc', 198191, 1241, 28, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (401, '8inug0w8sXI', 85298393, 531270, 4597, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (402, 'pO1XzKWCLIs', 2078537, 4912, 172, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (403, 'reKQO4zrG64', 1165070, 34926, 308, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (404, 'msZ0znCqn-0', 2048024, 28568, 146, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (405, 'Slq4aeE8FoE', 14533733, 163058, 3934, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (406, 'zMOWE6m4iP0', 1718571, 26082, 200, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (407, 'PqF4QhB7IIU', 183937, 1923, 26, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (408, 'mpk4ih1PNjM', 289389, 6879, 109, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (409, 'vhodXy0A-Es', 12837155, 674948, 9947, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (410, '4NOXfqO0l9g', 1624160, 20903, 98, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (411, 'jEPqUxSDadI', 774623, 10426, 298, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (412, 'GkHgQB4Wm7k', 4803299, 1541, 54, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (413, 'a5Dn9XiChTk', 3112288, 6481, 269, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (414, '1RhiEJqsyLI', 101458, 793, 55, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (415, 'mw7R4RLmBg4', 13019, 326, 19, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (416, 'gLYFLd88Xu4', 880525, 2583, 72, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (417, '78wrful9cVU', 25617689, 871989, 43866, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (418, '1FVF-9KQiPo', 22642306, 641745, 28999, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (419, 'kiB9qk4gnt4', 402241397, 2485223, 57642, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (420, 'rtwpk9rb1Dc', 10533723, 381759, 16114, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (421, 'hwUixddbmrQ', 35481844, 192130, 8766, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (422, '7gKpREE5Z3w', 3532411, 74687, 5022, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (423, 'aSkFygPCTwE', 172972729, 629064, 19618, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (424, 'lY5V4hSLWY8', 85513706, 1289672, 42586, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (425, 'u9Dg-g7t2l4', 1172652381, 6979110, 270756, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (426, 'LHCob76kigA', 1767030055, 12672329, 414198, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (427, 'bkNaPl4kg7g', 9168710, 150879, 6477, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (428, 'XXIX2WnfbpE', 11680263, 537696, 25523, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (429, 'KWoTyfPsqbE', 24459923, 821078, 24395, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (430, '4LfJnj66HVQ', 1204242204, 12501428, 756121, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (431, '5anLPw0Efmo', 1094578359, 6175994, 240099, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (432, '5-ZiKXrnvog', 180392324, 1861345, 48612, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (433, 'xPLGXQr7_vs', 2652017, 39353, 2311, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (434, 'cgH0vpl4nQk', 1706, 147, 29, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (435, 'AxFdeZER8Eg', 90935353, 522006, 11203, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (436, 'mjaayCARwro', 381711446, 3111910, 104171, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (437, '3ByIYof4mqo', 10402440, 108429, 4068, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (438, '9g08kucPQtE', 46005704, 358033, 10511, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (439, 'T_Km11HNzUY', 5054910, 60330, 2589, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (440, 'X2DTROC4JCI', 33398190, 234651, 5755, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (441, 'XXx6RDzR6eM', 38699873, 364112, 6156, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (442, '_n9HhmX36Gk', 7033489, 83348, 4094, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (443, 'emjLXdsj6xA', 47462804, 393010, 8574, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (444, 'pmrTPAejtAw', 75220816, 516155, 15897, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (445, 'NL7fgnv_VlQ', 1429, 183, 3, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (446, 'vuzCHdN9Okk', 25998849, 136295, 637, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (447, 's49rOuVY3s0', 8010652, 152370, 14469, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (448, 'P2LopW59duA', 8558, 627, 39, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (449, '7IoSkJ-gnzM', 3368397, 69383, 1163, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (450, 'TBeGecLND84', 50506299, 287744, 4417, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (451, 'QcS9ZndErHc', 256586810, 3300761, 231502, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (452, 'OLVIwchMHxc', 1104873, 9822, 799, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (453, 'xcrf_RKjaB4', 412, 0, 0, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (454, 'gQihxm0-U64', 2175755, 42364, 6736, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (455, 'yKfhCPaVyYg', 438694, 9280, 368, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (456, '6vOrbsVLPlg', 4774, 159, 0, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (457, 'xJuVY0o7mak', 4016913, 85459, 2256, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (458, 'vqKsHbyjjjI', 87560952, 673293, 8746, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (459, '1fdv0OIhzzA', 527204537, 3669753, 101919, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (460, 'bKKRNscf5c4', 4798293, 74043, 1276, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (461, 'FY3m6hMyh3g', 235022811, 2583379, 201875, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (462, '3dBfojujJiQ', 698547, 9879, 395, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (463, '5SMmxqA6-58', 9365428, 89978, 1012, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (464, 'JjPtDl6EJ3o', 111376323, 883674, 20117, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (465, 'a9MyzWfv4WU', 4784766, 68840, 919, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (466, 'NWEd-92QkU8', 1180694, 11378, 201, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (467, 'crJNdgAqTRQ', 17537438, 386277, 8015, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (468, 'vau8mq3KcRw', 43781712, 618627, 11796, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (469, '3WQPW2OuUvk', 423537, 52889, 3745, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (470, 'i6fy_hdZ62I', 30877, 1097, 75, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (471, 'FCMyTR1SJM8', 87400493, 1031767, 61802, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (472, 'owjosMjFas0', 1583994, 8726, 108, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (473, '8y5wbqEbj8Q', 35840987, 220155, 3895, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (474, 'eAmNdjkT5wU', 18784, 138, 0, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (475, 'wxLE0V9EFqg', 168844284, 732529, 10240, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (476, 'YsL6eRCIwqw', 6422141, 31760, 570, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (477, '6qwNoI2aVGo', 503587, 1632, 12, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (478, 'yvTSFJWFMvs', 809441, 9882, 82, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (479, 'aPqYwUPyZN0', 5755329, 47758, 937, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (480, 'dzxjvHWocLA', 2394196, 28468, 133, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (481, 'EMKupc9_FfM', 3357579, 33775, 1349, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (482, 'M_p_LUseXGk', 2556976, 19736, 287, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (483, 'ydJ7JGC9jVM', 3458474, 32755, 1494, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (484, 'F0aus83qTW0', 306940, 3090, 228, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (485, 'T4tKkfBQRAY', 31697445, 92933, 1068, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (486, '6p3ETYgcEN8', 108537924, 366760, 3115, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (487, 'pLKlUP_BF70', 25356315, 76206, 1363, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (488, 'wTArapD8l0w', 738965, 8832, 232, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (489, 'sJuLi84tZy8', 31428199, 73051, 692, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (490, 'GYoUeBjOCZQ', 554201, 3422, 41, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (491, 'DosMGo4wNec', 2648556, 12637, 329, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (492, 'sh_5wKArt-o', 3935534, 23544, 304, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (493, '0j2dBAlv9lQ', 1393737, 10845, 150, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (494, 'y0E96wDzm-I', 7084270, 112189, 1080, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (495, '0GdwfDhRzLY', 2200523, 18716, 955, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (496, 'KfrPqx5J4F8', 37002924, 74988, 1198, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (497, 'w1eiO6QkQDY', 6771274, 30146, 502, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (498, 'G4F7xkPK59o', 267773, 4650, 157, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (499, 'KvrYmPp0IXY', 35934757, 106589, 1498, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (500, 'p_-VnONVoOQ', 751948, 11152, 605, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (501, 'hGD_KsvTxfo', 104615, 1556, 9, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (502, 'pLtIr7j-eX8', 307287, 2941, 3, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (503, 'mHdcwc9eNjc', 11414680, 62132, 0, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (504, 'o3FYn6Hsdyw', 16887943, 14763, 0, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (505, 'fESREcUo9ik', 17628665, 84969, 1177, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (506, 'a2grcJdfXmY', 7201712, 360279, 16581, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (507, 'cvczHB0W4BY', 25212, 324, 18, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (508, 'U6BDbXIah-Y', 14577883, 883058, 61311, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (509, '9qkpcLK422o', 47697101, 628680, 31630, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (510, '1LpU_nXky40', 3155957, 20028, 747, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (511, 'oK5-nnngqA4', 2325432, 9578, 316, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (512, 'ygYPwsjyCzQ', 38015059, 251236, 22058, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (513, 'Qrpq9iP9sg4', 5381925, 40407, 1171, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (514, 'WZcLWx4fhKs', 163289, 1770, 37, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (515, 'CEhLhiaygI0', 335048, 9597, 87, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (516, 'd5q1ApthovU', 4361016, 35255, 441, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (517, '_T_SIDKGRjs', 48668447, 324126, 7368, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (518, 'G4rKTHSkfGE', 1723738, 20200, 358, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (519, 'h54vH4ILDvc', 206780, 3113, 77, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (520, 'yQd4xQBlBa0', 215575958, 1425885, 3593, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (521, 'N0nK0XjA3Tk', 751291, 16546, 97, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (522, 'ZDswWrrCGXk', 8673805, 87419, 2908, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (523, 'pTAbOvv4vd8', 15998913, 588127, 14623, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (524, 'oMTrz_Ym02A', 647949, 5985, 383, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (525, 'x7lJb5mLTSM', 6047133, 176333, 7502, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (526, 'fTVvhkhCMuo', 232773, 1388, 87, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (527, 'EuTsDjyjpJE', 12170789, 453807, 9538, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (528, 'm1y28JAEqN8', 4884685, 94435, 958, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (529, 'KHKJ1vFpXDs', 14837279, 79688, 4455, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (530, 'Z6l90pTXTSY', 1123705, 11987, 248, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (531, 'tWdlIHl8pnY', 2803138, 0, 135, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (532, 'l93JOUJZEoA', 4662081, 159717, 25424, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (533, 'CLLpSmaof4E', 2656000, 5317, 172, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (534, 'HL_9LIiGgj0', 52254, 307, 7, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (535, 'nfWlot6h_JM', 3675644166, 14215053, 604352, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (536, 'MEX3XzL2YRc', 21461415, 133560, 3777, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (537, 'dWix43csap4', 58304, 2341, 21, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (538, 'EJ9Jc9blzBA', 36425, 594, 14, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (539, 'sBJT1BpOcvg', 4490844, 41827, 1141, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (540, '7YYBqjpmi-c', 5597674, 59049, 774, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (541, 'sTmgaP2gYsk', 16312592, 123334, 3673, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (542, 'CU1Nmb9_-dI', 392219, 5886, 202, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (543, '71Nv50JG6RI', 1426924, 13421, 500, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (544, '5-EuMi9-nSw', 3945690, 19114, 242, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (545, 'r6fO-Ki9LzE', 7714567, 91801, 5284, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (546, 'OPQmOutTmyo', 1206992, 13209, 491, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (547, 'HYIl_xHF5r4', 308817, 7329, 653, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (548, 'l6gRKrU1swA', 661659, 13068, 244, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (549, 'cVFzblT5VPE', 18166957, 247576, 7320, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (550, 'OF04pKp-r9o', 69113361, 438213, 12691, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (551, 'jaPGexY1l5A', 11691009, 179902, 1602, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (552, '-tIVsACI4mI', 1200, 52, 3, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (553, '7zUFWXx9X_c', 50174365, 189330, 8750, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (554, 'cce0lMgyrKc', 3875690, 0, 324, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (555, '7bKTvsC7GUU', 1120027, 601, 28, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (556, 'xBNYnpo4xVg', 1100010, 31989, 419, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (557, 'BfQyu09_08w', 24113671, 975928, 7528, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (558, 'YZJZm119nCI', 909305, 3570, 1117, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (559, '5NPBIwQyPWE', 875217981, 5444604, 180580, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (560, 'wlS6Ix7mA0w', 944472073, 5377308, 166281, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (561, 'hiP14ED28CA', 1029221570, 5984965, 128517, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (562, '56hqrlQxMMI', 71114702, 504863, 12080, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (563, 'XfMVF-o7g1o', 823797, 40534, 1903, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (564, 'hk24Oj-Txsw', 250, 56, 17, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (565, 'Uf-PyfpJCfI', 9938882, 226854, 11375, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (566, 'H6hEO4jwpuA', 3020, 317, 37, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (567, 'MDxSeWwpyJ0', 2910, 245, 60, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (568, 'yfIPC-Erjbg', 1648407, 12611, 204, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (569, 'mQ5wP0YazOE', 1297511, 8287, 255, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (570, 'N441ZM2VHv4', 1979379, 12441, 1372, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (571, 'Wc6iLg3mL7g', 2986572, 70687, 1465, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (572, 'ZiEyxl1bVr0', 11578526, 100547, 5294, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (573, 'XQIBSlB8MAc', 167763, 6535, 212, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (574, 'eVz10_sCHJw', 17196134, 212347, 2531, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (575, 'wKycFNLaxFU', 466544, 0, 159, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (576, 'uqY-3RS-V0Y', 29608941, 154034, 1297, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (577, 'ZDmrqzOFEjc', 2695673, 54576, 617, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (578, 'D60K8BU6lsY', 33320152, 442252, 6314, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (579, 'RtTf76WAO6s', 10294050, 329502, 7093, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (580, 'oGCu47JESi0', 1534941, 25899, 250, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (581, 'aDl44-M6M0E', 6333290, 152013, 8911, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (582, 'uuoL1k_gaeA', 217865311, 4088203, 148798, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (583, '0lgAIjua6pA', 143657253, 604541, 5058, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (584, 'hbm-DXoQhcg', 88942, 788, 14, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (585, 'eWa95Ym9sZ0', 11108830, 70259, 3086, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (586, 'xfpFe7CZ4Do', 25004485, 170737, 2513, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (587, 'idDCk4RTx4g', 50858901, 1047718, 25723, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (588, 'H97EFhNUADY', 636205, 10594, 775, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (589, '5ymK_qr474k', 15891827, 22036, 10108, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (590, 'Vai1oBXCiiA', 3014458, 11963, 1635, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (591, 'hRcYZVuQtjA', 791088, 12856, 109, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (592, 'of6fAGawnUc', 114618670, 175528, 2184, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (593, 'fBNW09FVtEA', 56577154, 144360, 1255, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (594, 'JmfRmK-v7UU', 12387232, 50674, 1630, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (595, '-Y1k19Z06iQ', 1006880, 16497, 277, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (596, '8_bs7PKJuO0', 317248, 4717, 51, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (597, 'gfuJOymXwH4', 2627692, 75469, 820, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (598, 'P4UViMg6ofY', 35356, 262, 1, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (599, '2xCYS4TjLJM', 7247210, 190536, 3130, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (600, 'UKx8bw1mP2E', 391401, 5018, 63, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (601, 'mjEtZsq-rEA', 2544, 199, 6, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (602, 'nvtGsaMv9yc', 32014271, 57521, 1444, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (603, 'Wm97ow7T8J8', 14654833, 27524, 989, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (604, 'RIdSu-q46Y0', 43350609, 244494, 3876, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (605, 'co-TFLbaZAE', 263766622, 2436870, 91903, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (606, 'FGrbMP4ksk8', 16334516, 78718, 255, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (607, 'jWQx2f-CErU', 283856971, 2537985, 95487, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (608, 'iojQFPplbic', 24508378, 106596, 894, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (609, 'jCY6d1F16eQ', 593856, 6438, 135, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (610, 'iHy9WrnYnlA', 273155, 1845, 26, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (611, '1_zgKRBrT0Y', 3130673122, 14232514, 388675, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (612, 'VqEbCxg2bNI', 2822293539, 9393850, 283391, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (613, '9im7yVc_jGA', 95371, 1202, 22, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (614, 'S0lx-sIjbHA', 36313, 416, 22, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (615, 'k3cZ6qaqkMo', 13006, 37, 0, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (616, 'gLDQ7Yvww7Q', 51957, 143, 5, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (617, 'UOrCIg_Qu3o', 4141449, 37253, 542, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (618, 'mS95hDkYEJc', 694, 47, 2, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (619, 'OPf0YbXqDm0', 5806754432, 23316272, 651219, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (620, 'V7Wc2O6HUsM', 1711578, 10194, 221, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (621, 'gU2Jzsa9Q_Y', 1356162, 11207, 169, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (622, 'iP6XpLQM2Cs', 755690169, 5223813, 221543, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (623, 'X2Nv4KqRGK0', 567635, 6696, 36, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (624, 'GJ2v96T9xOk', 97842210, 1165644, 15075, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (625, 'wZTIdnooV-s', 315219144, 1901338, 46481, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (626, 'a-SX4DDjD2E', 22045, 3195, 345, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (627, 'KUWLUGtEkMo', 739872, 6870, 636, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (628, 'MG_cjByleYI', 145698201, 702624, 0, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (629, '69JAoslGYI8', 321948777, 2217388, 47307, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (630, 'y4rD8gOe7yg', 604195, 6400, 525, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (631, 'qTjjBequjGY', 92841013, 536890, 15082, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (632, 'aKlepLWOh3Q', 913268, 9908, 886, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (633, 'cuIVkdwm2SE', 762057, 8116, 847, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (634, 'FnjexNf7Pdo', 407640505, 2660513, 34181, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (635, '-PH4S7IPQxU', 713793484, 5344309, 169387, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (636, 'g2kz4sykhgk', 335252, 4818, 72, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (637, 'Ws_fR1oMN9c', 42862, 351, 5, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (638, 'Rj-Q-cgG70I', 5020056, 63535, 2329, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (639, '60DvFz6jMgY', 1678433, 14667, 554, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (640, 'gpxa9q_kPKQ', 1356760, 12119, 188, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (641, 'klQ8uzsm938', 550815, 9338, 320, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (642, '4JYSkt3qsKI', 2268837, 32785, 10, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (643, 'qdsTUfDTEhQ', 423560096, 2258618, 44536, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (644, 'TPomzwIYsLQ', 1189730, 18768, 165, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (645, 'e1MHLJsv6Ks', 18732331, 101257, 2283, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (646, 'lnsWe87Q9yY', 8292, 273, 4, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (647, 'lgjayJik2n4', 5578639, 36568, 654, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (648, 'fLE53xD9h_s', 1316, 23, 0, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (649, 'FIXFq7wtMEI', 3548891, 36315, 1175, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (650, 'S_SXl-ETXRI', 355502018, 1458241, 21655, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (651, 'qsCxSb1Qato', 4912716, 25704, 363, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (652, 'XUTFBdw7Vqk', 29635358, 44920, 273, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (653, '62zBQ2vbxLo', 124100, 1460, 61, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (654, 'NSbS-8oB7Z0', 2707402, 32270, 2125, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (655, '832-ygXkNJE', 118682, 819, 8, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (656, 'vudZL4_uqLo', 245937, 2994, 47, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (657, 'zAV3_mg941w', 40501, 1527, 28, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (658, '3pWWNxUeODQ', 10313, 217, 6, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (659, 'PhJ09yDQKJ0', 1000989, 17552, 243, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (660, 'nsS-j9He_Wg', 18338575, 121904, 788, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (661, 'bbBAMe92Btg', 6227495, 70036, 696, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (662, '3-VwlTqxH-0', 24805836, 109615, 1197, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (663, 'nWWtiRHEaV4', 48772909, 136674, 3697, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (664, 'BgMU9Vuj17Y', 86515460, 703406, 30890, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (665, 'T2JnyCuAQMg', 41220988, 330202, 4865, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (666, 'e-CEd6xrRQc', 320597470, 2122059, 46728, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (667, 'UMWhHWgXJdg', 4818255, 8534, 343, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (668, 'DiItGE3eAyQ', 3156363490, 15015508, 408605, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (669, 'Bo0xYL7hbAA', 6394116, 28278, 406, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (670, 'ZRJipL32oCA', 6029691, 44857, 670, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (671, 'pkqHgo-3lpA', 3402215, 44827, 583, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (672, 'Sgl_T2zoIQU', 948392, 4495, 416, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (673, 'AJCzsLXrpao', 107890, 900, 4, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (674, 'QCuUAClm-hQ', 7795714, 77605, 779, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (675, 'WjPUgEDQ4yE', 508424, 15453, 736, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (676, 'Paddtn5IdCk', 4814778, 98401, 3963, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (677, 'sySB31z9RRQ', 4120, 510, 29, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (678, 'sWhy1VcvvgY', 290609489, 2745747, 81851, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (679, '-wEhzTTdsS8', 44157192, 173866, 1282, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (680, 'UhyFCJJgzL4', 2176877, 34682, 309, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (681, 'H88WuHdzAwg', 47999, 842, 20, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (682, 'QIVnz6hZmME', 83034, 877, 11, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (683, '2PRAiVs3MVc', 477900377, 3172653, 51099, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (684, 'iOM20kM2gOQ', 115525744, 1733073, 28535, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (685, 'Hv53XBYeK7E', 20749745, 126206, 14221, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (686, 'Z4zCDg7GDuw', 7439, 38, 0, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (687, 'wcBsG24gouw', 9008, 39, 0, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (688, 'NwIvYGn3ca4', 8067028, 31137, 364, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (689, 'xLwmpWkav8E', 24857037, 131409, 3771, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (690, 'hd5ysbUDYF8', 12725143, 32691, 534, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (691, 'NsvbWEvCsjI', 10026576, 34189, 842, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (692, 'r5kO1hpnJwU', 9000586, 78265, 337, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (693, '1vrM6cOQgcg', 12465034, 28779, 516, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (694, '6GNdiKjFm4k', 1456021, 12792, 0, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (695, 'VydmHcmCBeU', 388860, 6976, 71, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (696, 'QfXSL60kFaM', 197627, 4505, 34, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (697, '6ZUIwj3FgUY', 381656838, 2702724, 136637, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (698, 'KNexS61fjus', 187061338, 1834974, 34326, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (699, 'OSUxrSe5GbI', 1689393298, 8765339, 209310, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (700, '_I_D_8Z4sJE', 2339759013, 10722850, 267558, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (701, 'T0Zw6fYCIWU', 424755, 6235, 71, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (702, 'hkdtBztPUjg', 23257, 323, 2, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (703, '-YlmnPh-6rE', 300008619, 1857118, 32630, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (704, 'vB0V3iCSzQw', 296751460, 1929201, 51876, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (705, 'c2nHxn2P5EU', 70811735, 645389, 5665, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (706, '-CXDKsZY80I', 6017182, 0, 485, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (707, 'VJtg7pJO3hQ', 949527, 17428, 351, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (708, 'Nylxb9lSDxk', 78495, 531, 28, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (709, 'Il-ZpBuC8tA', 1648116, 7132, 0, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (710, 'M5Df0ugyV2o', 787002, 34211, 586, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (711, 'UIJiuOguxeI', 984243, 48182, 416, '2026-05-06 22:05:02.315393');
INSERT INTO public.youtube_video_estatisticas VALUES (712, 'lsduGj42ZJA', 7345821, 162884, 4746, '2026-05-06 22:05:02.315393');


--
-- Data for Name: youtube_videos; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.youtube_videos VALUES ('tigPF7zhElk', 'MEDLEY DE IGARATA 9 - Mc Negão Original (Video Clipe Oficial) DJ David LP, DJ Japa NK', '2026-05-05 15:00:06', 'UCuRGk7Q3-HzP036f6iCGwGg', '10');
INSERT INTO public.youtube_videos VALUES ('NJV9Pw2kXc4', 'A Odisseia | Trailer Oficial Dublado', '2026-05-05 11:14:28', 'UC5XG4yYM-_DQ-3HPRuam76Q', '1');
INSERT INTO public.youtube_videos VALUES ('q9P3y3y2KKw', 'COMECEI A FAZER LIVES, MAS EU FAÇO TUDO POR VIEWS! (até cometer crimes)', '2026-05-05 16:09:12', 'UCIXguhHCl8eDTkXpEuiGPUA', '20');
INSERT INTO public.youtube_videos VALUES ('WNuuYqRzqDI', 'Louvores de Adoração 2026,Top Músicas Gospel Mais Tocadas,Top Gospel,As Melhores Músicas Gospel 2026', '2026-05-04 08:54:45', 'UChzfdc3Nx_FQhXMXu2RprUQ', '10');
INSERT INTO public.youtube_videos VALUES ('7s0fcLuo4P0', 'A Morte do Demônio: Em Chamas | Trailer Oficial Legendado', '2026-05-05 16:00:00', 'UC9NXpIA01HVRhYgcEbs80Nw', '1');
INSERT INTO public.youtube_videos VALUES ('mocN7Hdj5HQ', 'Preciso de Mais Velocidade para Evoluir a LuckyBlock de MOBS!  👾', '2026-05-05 13:00:44', 'UCrcBZDofBltcgGxphNia2tw', '20');
INSERT INTO public.youtube_videos VALUES ('RjXzYmFE7ZU', 'NÃO CHORE JOÃO (AO VIVO) | MORADA', '2026-05-05 21:00:06', 'UCQp4yrRCGdGWi4TrF6xJyfg', '10');
INSERT INTO public.youtube_videos VALUES ('T2MP_T2e-aU', 'UFC 6 Official Reveal Trailer', '2026-05-05 14:55:06', 'UC86X0tzvfk12eAG9JYMp99w', '20');
INSERT INTO public.youtube_videos VALUES ('Vu7Fho0Q7sE', 'TÊNIS DE MESA | TIME BRASIL NO MUNDIAL POR EQUIPES | FASE MATA-MATA', '2026-04-25 12:00:02', 'UCZiYbVptd3PVPf4f6eR6UaQ', '17');
INSERT INTO public.youtube_videos VALUES ('J9-vnds90wQ', 'Alphaville - Forever Young (Sub. Español + Lyrics)', '2026-05-04 19:00:14', 'UCaxjS8mdF402rdn1hP6_1_Q', '10');
INSERT INTO public.youtube_videos VALUES ('TLiAJgX9MVA', 'JULIE DESCOBRIU TUDO! TRAILER EP. 4 DE FROM (ORIGEM) 4ª TEMPORADA EXPLICADO!', '2026-05-05 15:00:47', 'UCTK443WemZxmW-hqYMe_2gA', '24');
INSERT INTO public.youtube_videos VALUES ('Lehpq9dxyXc', 'CONSTRUÍMOS um BUNKER SECRETO ⚒️ PARA PROTEGER a BABY ZÖE!', '2026-05-05 14:00:36', 'UCYkjBwZBgKTPuTLf_o4qcqw', '20');
INSERT INTO public.youtube_videos VALUES ('dCY_QyPtGw0', 'Enrique Iglesias - Bailando ft. Descemer Bueno, Gente De Zona (Letra/Lyrics)', '2026-05-01 17:01:02', 'UCedwIM6dmZy-f90HTzE1P-g', '22');
INSERT INTO public.youtube_videos VALUES ('ILzMOGDTKCs', 'SPIDER-NOIR: ANÁLISE COMPLETA DO NOVO TRAILER', '2026-05-04 21:00:16', 'UCt_4wzTQqmcUvemNkeO0plA', '24');
INSERT INTO public.youtube_videos VALUES ('o6WBhVjBXgo', 'Louvores e Adoração 2026, Top 100 Melhores Músicas Gospel Mais Tocadas 2026, Nova Hinos Evangélicos', '2026-05-04 09:00:07', 'UC0pQd2kmeo-bOL8JHB2dDLg', '10');
INSERT INTO public.youtube_videos VALUES ('qgb0HI4geBI', 'Rancho Dutton | Trailer oficial | Paramount+ Brasil', '2026-05-05 15:06:03', 'UCAnCxJ1Weh2pUAKJW0bro0Q', '24');
INSERT INTO public.youtube_videos VALUES ('dQuxJmOxTSA', 'CRIEI UMA CONTA DE BRAWL STARS PRO PROBLEMS...', '2026-05-05 20:52:22', 'UCUouM5ZRqZoFNzUvpDeYNGQ', '20');
INSERT INTO public.youtube_videos VALUES ('sHnNoHmLbfs', 'O AMOR NÃO PAGA AS CONTA - MC Ryan SP, MC Lele JP, MC Meno K, MC Tuto, MC Negão Original (DJ Oreia)', '2026-05-04 18:54:13', 'UChFSlUTSJNQK3v79abpQP4w', '10');
INSERT INTO public.youtube_videos VALUES ('OYdHSvHDkcI', 'The Boys Season 5 Episode 6 Trailer', '2026-05-04 16:38:08', 'UCz1GPotHecuLngiLuY739QQ', '1');
INSERT INTO public.youtube_videos VALUES ('1W4nI_JylhM', 'Prendendo BANDIDOS com VOLANTE, GASOLINA e FREIO de AVIÃO!! (GTA 5 RP)', '2026-05-05 15:30:01', 'UCHDV3JN5aqxAy9hwTTVHJow', '20');
INSERT INTO public.youtube_videos VALUES ('nsYhffqZbd4', 'Ficar Por Ficar', '2026-04-17 10:02:01', 'UCUcYZfWtTmNCHZf__dYkPHA', '10');
INSERT INTO public.youtube_videos VALUES ('LIitsptu7RM', '🤔 #REAÇÃO AO POLÊMICO A ODISSEIA DE NOLAN QUE PARECE ÉPICO, MAS A GALERA TEM RAZÃO EM RECLAMAR?!', '2026-05-05 15:15:06', 'UCP0GI-IbEZV59oExPioxeHw', '1');
INSERT INTO public.youtube_videos VALUES ('wKZb3YKvRyQ', 'SOBREVIVA NESSE PARKOUR DE TECLADOS NO ROBLOX', '2026-05-04 23:01:05', 'UCdK8veAN0I3-9gs2Xqa7v9A', '22');
INSERT INTO public.youtube_videos VALUES ('x3eqqoZPV_E', 'BABYMONSTER - ''춤 (CHOOM)'' M/V', '2026-05-04 09:21:33', 'UCqwUnggBBct-AY2lAdI88jQ', '10');
INSERT INTO public.youtube_videos VALUES ('M4FspH3s9wo', 'Brasil 70: A Saga do Tri | Trailer oficial | Netflix Brasil', '2026-05-05 13:00:00', 'UCc1l5mTmAv2GC_PXrBpqyKQ', '24');
INSERT INTO public.youtube_videos VALUES ('osY6jekNczM', 'JOGAMOS A TORRE TROLL SEM PULAR NO ROBLOX ', '2026-05-05 20:08:02', 'UCH27Wi4vlk2inrM8PLz02AQ', '24');
INSERT INTO public.youtube_videos VALUES ('yAhcQs9g62k', 'FAMOSO IMÃ - O PODEROSO CHATÃO - MC Lele JP, MC Leozinho ZS, MC Poze do Rodo (Web Clipe)', '2026-05-04 15:10:12', 'UCxD5vCH031B-ifASKaTL9Sw', '22');
INSERT INTO public.youtube_videos VALUES ('LpoVS2SUB20', 'A MAIOR MENTIRA DA SÉRIE: SOLDIER BOY NUNCA FOI O PAI DO CAPITÃO PÁTRIA - 12 NOVAS TEORIAS THE BOYS', '2026-05-05 13:38:01', 'UCWO8fCsyihQ9G8TdL_dS14w', '24');
INSERT INTO public.youtube_videos VALUES ('ceUYsF_4Drk', 'SOBREVIVI A TEMPESTADE DE NEVE no BROOKHAVEN', '2026-05-05 14:00:57', 'UCf36H4Zhcv6k5R0C7hKZMxg', '22');
INSERT INTO public.youtube_videos VALUES ('h8s4XmWAnfA', 'Alok, Zeeba, Bruno Martini - Hear Me Now (Lyrics)', '2026-04-30 12:51:54', 'UCn7Z0uhzGS1KjnO-sWml_dw', '10');
INSERT INTO public.youtube_videos VALUES ('C0IpL4jW3JE', 'A ODISSEIA: TRAILER COMPLETO + REACT E PRIMEIRAS IMPRESSÕES', '2026-05-05 18:43:51', 'UCX9AkKp_kixtLvIILx2EewA', '24');
INSERT INTO public.youtube_videos VALUES ('hh0MvQk4DBA', 'O Que tem na CASA mais LONGA do Minecraft?!', '2026-05-05 14:45:11', 'UC9Qu6o04oTf-b2acahQVk1g', '20');
INSERT INTO public.youtube_videos VALUES ('RrbezC7PoRU', 'TOP GOSPEL 2026 – 100 Louvores Para Momentos com Deus - Adoração, Paz e Presença de Deus', '2026-05-04 08:52:29', 'UCzUYxHzLGAOtrdMFzb3inIQ', '22');
INSERT INTO public.youtube_videos VALUES ('y7GiJyVkC_8', 'FINALMENTE! SAIU O TRAILER DO UFC 6 - O JOGO MUDOU COMPLETAMENTE? (REACT)', '2026-05-05 16:16:32', 'UCGHFaCYLsfrK2uLNDRNZKOA', '20');
INSERT INTO public.youtube_videos VALUES ('JEOyeHHm5FM', 'TROQUEI UM PET 1/1 DO MUNDO… E NÃO ACREDITEI NO QUE RECEBI 😳🔥 (BRAINROT)', '2026-05-04 21:15:04', 'UCR-Y4lWmrCYbr1XavmNMlvQ', '20');
INSERT INTO public.youtube_videos VALUES ('xba6s-xhj8Q', 'Mami Mami - DJ XOXO | Dance Music Hit 2026', '2026-04-29 15:01:45', 'UCgDOgC29exQffRL2jJxHfEA', '10');
INSERT INTO public.youtube_videos VALUES ('kTCsczXlJwE', 'A MORTE DO DEMÔNIO: EM CHAMAS Trailer Legendado Oficial (2026) Terror', '2026-05-05 16:28:32', 'UC2eb58Gxb613nJDjpuwWmgg', '1');
INSERT INTO public.youtube_videos VALUES ('-Lkg6JQ107s', '100 DIAS PARA SOBREVIVER TSUNAMI GIGANTE DE AVARITIA NO MINECRAFT', '2026-05-05 13:30:01', 'UC6P6SvP2arhEdJ9Pg8qwP2A', '20');
INSERT INTO public.youtube_videos VALUES ('XUxWl0vpZDc', 'Enrique Iglesias, Descemer Bueno, Gente De Zona - Bailando (Lyrics)', '2026-05-03 16:56:06', 'UCRmPovMeLZDTig34yDBZy4A', '22');
INSERT INTO public.youtube_videos VALUES ('k1MVnzd2aVc', 'Tony | Official Trailer HD | A24', '2026-05-05 13:00:00', 'UCuPivVjnfNo4mb3Oog_frZg', '1');
INSERT INTO public.youtube_videos VALUES ('Bp5gSkmgDa4', '🔴 COPA MOBILE GWL - GRUPOS A x B #freefire', '2026-05-05 18:53:20', 'UCWh1rB6PKbMp2AkCMR4E_-Q', '20');
INSERT INTO public.youtube_videos VALUES ('brfJIxPE5VQ', 'Toto - Africa (Lyrics)', '2026-04-27 22:06:14', 'UCvfRnJ72k-PrCzUmDdeaX-Q', '22');
INSERT INTO public.youtube_videos VALUES ('QUm6MRxsAL8', 'A ODISSEIA (2026): REAGINDO AO NOVO TRAILER OFICIAL DA JOGADA ARRISCADA DE CHRISTOPHER NOLAN!', '2026-05-05 12:51:27', 'UCQsRkagAnkyMoY6lOLN3EVA', '24');
INSERT INTO public.youtube_videos VALUES ('TyfwZnrZcik', 'NOVA ATUALIZAÇÃO CASA PINK EM BROOKHAVEN ', '2026-05-04 22:00:36', 'UCABon3LeMfnU5ajXaOYC1oA', '20');
INSERT INTO public.youtube_videos VALUES ('qUx8zo1d9nI', 'Músicas Católicas para Agradecer ao Senhor pela Vida do nosso Querido Pai', '2026-05-05 09:00:17', 'UCcufmrPiSes5KceDFmVsEKA', '22');
INSERT INTO public.youtube_videos VALUES ('_cU98qboHO0', '🚨A Odisseia (2026) | Trailer Oficial', '2026-05-05 04:57:15', 'UCaSAM5kna2KyX-uVLSGr8PQ', '24');
INSERT INTO public.youtube_videos VALUES ('qtTLudtHpKc', '100 Jogos para JOGAR COM SEU AMIGO (ou inimigo)', '2026-05-05 21:01:02', 'UCymE80p2pHiTP4Xye327CVA', '24');
INSERT INTO public.youtube_videos VALUES ('uVpUFMySPFQ', 'De Nada Tenho Falta | Get Worship (Clipe Oficial)', '2026-05-05 15:00:06', 'UCQRNBXeiOQqdg4z3Fs2xw-Q', '10');
INSERT INTO public.youtube_videos VALUES ('9xUeiovIn8A', 'O Trailer do TÃO AGUARDADO “Resident Evil” | Análise e Expectativas ', '2026-05-03 11:30:00', 'UCferfyAeOJAjS9GoI4td6gg', '1');
INSERT INTO public.youtube_videos VALUES ('Cxl52-1LW_k', 'DISOBEY (Official Music Video)', '2026-05-06 17:28:07', 'UCQYcCfKYfYMcuCsem8z5CyQ', '10');
INSERT INTO public.youtube_videos VALUES ('XeNibQZwp00', 'Ariel NOAH - Ancika (OST. Dilan ITB 1997) | Official Music Video', '2026-05-05 17:00:06', 'UCNlU3oSU8UnJ_V9uMB-cPOg', '10');
INSERT INTO public.youtube_videos VALUES ('qiOGfrte_Lg', 'AZ - "Uniqueness" (Official Music Video)', '2026-05-06 14:00:06', 'UCjwIVogi9H0SYNuV8ZKPoxg', '10');
INSERT INTO public.youtube_videos VALUES ('oI51J1tjUBs', 'Nini Music – Longma II (Official Music Video) | Taiwanese Folk Metal', '2026-05-06 16:00:06', 'UCUUIp1k0tywKM1oGMkkuFvw', '10');
INSERT INTO public.youtube_videos VALUES ('-RuSsuxZjIg', 'Gravity Omutujju - Fena Tufiilwe (official Music Video)', '2026-05-06 14:51:01', 'UCugdDigC_MdbHulqsdmTrDA', '10');
INSERT INTO public.youtube_videos VALUES ('NcP5zbMA0QU', 'Shawn Storm - Live Fi See Me (Official Music Video)', '2026-05-06 14:18:33', 'UCuRYugT7op_l3_DTTHFxLKw', '10');
INSERT INTO public.youtube_videos VALUES ('pkE_H8yEdl8', 'Mt. Kizito Makuburi - Mshindi (Official Music Video)', '2026-05-06 09:57:52', 'UCQRvC3Y_lvGpVBz-swkd3oA', '10');
INSERT INTO public.youtube_videos VALUES ('R1WQVeCq0Hs', 'Anitta, Shakira - Choka Choka (Official Music Video)', '2026-04-30 21:00:06', 'UCqjjyPUghDSSKFBABM_CXMw', '10');
INSERT INTO public.youtube_videos VALUES ('V9PVRfjEBTI', 'Billie Eilish - BIRDS OF A FEATHER (Official Music Video)', '2024-09-27 15:00:38', 'UCDGmojLIoWpXok597xYo8cg', '10');
INSERT INTO public.youtube_videos VALUES ('WXBHCQYxwr0', 'Ava Max - Sweet but Psycho [Official Music Video]', '2018-08-27 16:26:25', 'UCOwgc8DswjoBMuuUU2ScPvQ', '10');
INSERT INTO public.youtube_videos VALUES ('-eGKhLZfkaU', 'Jul - Parasites [Clip officiel 2026 ]', '2026-05-06 14:00:02', 'UC-GI5LST5T3Gw93yZxjdFaw', '10');
INSERT INTO public.youtube_videos VALUES ('fLexgOxsZu0', 'Bruno Mars - The Lazy Song (Official Music Video)', '2011-04-15 22:08:07', 'UCoUM-UJ7rirJYP8CQ0EIaHA', '10');
INSERT INTO public.youtube_videos VALUES ('kF4MVeWFiDs', 'Latto, GloRilla - GOMF (Official Music Video)', '2026-04-24 16:00:03', 'UCRQ6wJbGwbF9Wmvp5HfT7Pg', '10');
INSERT INTO public.youtube_videos VALUES ('d-aa-dZZmF8', 'PELAMPIASAN 2 1/2 - La Tasya Feat. Nayla Fardila (OFFICIAL MUSIC VIDEO)', '2026-05-05 09:00:06', 'UCGocLgVQxEPvgIdIf299dkQ', '10');
INSERT INTO public.youtube_videos VALUES ('qOcZBlLdsXg', 'Wada Du Game - Donald Trump ( Official Music Video Disstrack )', '2026-05-06 17:33:44', 'UCbLXmxUM4ed7ls1Jwk0AT8w', '10');
INSERT INTO public.youtube_videos VALUES ('CcS1fsuT10M', 'Multo - Cup of Joe (Official Music Video)', '2025-03-06 15:00:07', 'UCPq0kgKjpNzryoNbRp5eUyQ', '10');
INSERT INTO public.youtube_videos VALUES ('KFMYx1TibeQ', 'Kehlani - Folded [Official Music Video]', '2025-06-26 16:00:06', 'UCuE1A4MDBt8YkgUkRAKMtjw', '10');
INSERT INTO public.youtube_videos VALUES ('aYMCeWO7D7k', 'KARI CERITO - Syahiba Saufa (Official Music Video)', '2026-05-04 09:30:07', 'UCv_GqVskWN79P-mfkGT8KXw', '10');
INSERT INTO public.youtube_videos VALUES ('09R8_2nJtjg', 'Maroon 5 - Sugar (Official Music Video)', '2015-01-14 15:00:11', 'UCN1hnUccO4FD5WfM7ithXaw', '10');
INSERT INTO public.youtube_videos VALUES ('m__b5iBYP1Y', 'SXYBIT – Love You (Official Music Video)', '2026-05-04 14:30:37', 'UC6X1L21saoUvtnFsq_tI4Xw', '10');
INSERT INTO public.youtube_videos VALUES ('ko70cExuzZM', 'Taylor Swift - The Fate of Ophelia (Official Music Video)', '2025-10-05 23:00:06', 'UCqECaJ8Gagnn7YCbPEzWH6g', '10');
INSERT INTO public.youtube_videos VALUES ('GRiJXn0rgCQ', 'Jonny Hawkins & Nathan James - Power (Official Music Video)', '2026-05-06 16:00:06', 'UC0OgDWBWWo6Psopj6130G7Q', '10');
INSERT INTO public.youtube_videos VALUES ('bGx7sOyTRTA', 'Belly Gang Kushington - Call Back Kush (Official Music Video)', '2026-05-06 19:00:35', 'UCxw78-TUwaA2xqQkmjVHGLw', '10');
INSERT INTO public.youtube_videos VALUES ('9qI2-UijNOo', 'Κατερίνα - Τα Παράπονα Μου | Katerina - Ta Parapona Mou (Official Music Video)', '2026-05-04 14:59:05', 'UC5r_oKHytA_qIFwguEbmRHA', '10');
INSERT INTO public.youtube_videos VALUES ('PEnDh9CkLUc', 'Nabila Maharani - Kita Dan Kenangan (Official Music Video)', '2026-05-05 10:00:06', 'UCsX6KBGngxQNW6By9VVPBuw', '10');
INSERT INTO public.youtube_videos VALUES ('dgzN94w1lLE', 'FullyChop - Debo (Official Audio)', '2026-05-06 04:00:00', 'UCdJoimz0uTe9bmvvf9G3s9A', '10');
INSERT INTO public.youtube_videos VALUES ('Ra_bioBGzUg', 'โชคดีนะที่รัก - MrSad17 (Official Audio)', '2026-05-06 05:00:22', 'UCGUS15deGIm934CuenQueAg', '10');
INSERT INTO public.youtube_videos VALUES ('2aJUnltwsqs', 'Skillet - Awake and Alive (Official Audio)', '2010-09-27 19:46:23', 'UCe4LM_eKc9ywRmVuBm5pjQg', '10');
INSERT INTO public.youtube_videos VALUES ('qgaRVvAKoqQ', 'Pearl Jam - Black (Official Audio)', '2021-08-27 07:00:12', 'UCqSQvq0K7rtRL8hX175LkMA', '10');
INSERT INTO public.youtube_videos VALUES ('fHI8X4OXluQ', 'The Weeknd - Blinding Lights (Official Audio)', '2019-11-29 05:00:08', 'UCF_fDSgPpBQuh1MsUTgIARQ', '10');
INSERT INTO public.youtube_videos VALUES ('a7fzkqLozwA', 'Lauv - I Like Me Better [Official Audio]', '2017-05-19 04:09:54', 'UCfLdIEPs1tYj4ieEdJnyNyw', '10');
INSERT INTO public.youtube_videos VALUES ('vGJTaP6anOU', 'Elvis Presley - Can''t Help Falling In Love (Official Audio)', '2013-04-23 07:00:10', 'UCSEmH1YyFWltSBYkfLMtkcg', '10');
INSERT INTO public.youtube_videos VALUES ('G23iLGhh9lo', 'Alice In Chains - Nutshell (Official Audio)', '2024-01-25 08:00:08', 'UChf0Knt-e9Pw8VywfuTZCjA', '10');
INSERT INTO public.youtube_videos VALUES ('oqv35UZepIM', 'Doja Cat - Streets (Official Audio)', '2019-11-07 05:00:09', 'UCpTaAz_BxtkUB1qc8JTU_7g', '10');
INSERT INTO public.youtube_videos VALUES ('r58GQYFZeLE', 'Earth, Wind & Fire - Fantasy (Official Audio)', '2013-08-15 16:27:50', 'UC72IXi6wx33LdltVkdwtLpw', '10');
INSERT INTO public.youtube_videos VALUES ('1vrEljMfXYo', 'John Denver - Take Me Home, Country Roads (Official Audio)', '2013-04-05 22:45:52', 'UCB2ADTh5dbYcI46S-_ju7ww', '10');
INSERT INTO public.youtube_videos VALUES ('QhW3P7_jvWY', 'Earth, Wind & Fire - That''s the Way of the World (Official Audio)', '2013-05-03 07:00:16', 'UC72IXi6wx33LdltVkdwtLpw', '10');
INSERT INTO public.youtube_videos VALUES ('x47TgeRJtH0', 'The Neighbourhood - Reflections (Official Audio)', '2018-03-09 05:01:01', 'UCJRqaM_C1asb8fq-zeSps0w', '10');
INSERT INTO public.youtube_videos VALUES ('W7nmB20qJv4', 'Paramore - All I Wanted (Official Audio)', '2015-01-17 22:00:08', 'UCc7_woMAIVIW2mAr1rPCsFQ', '10');
INSERT INTO public.youtube_videos VALUES ('9wT1s96JIb0', 'Santana - Black Magic Woman (Official Audio)', '2020-10-23 18:06:11', 'UCty_FzLdVEPlsUMg1O8eEgA', '10');
INSERT INTO public.youtube_videos VALUES ('ZRHHOttkM1A', 'Doja Cat - Candy (Official Audio)', '2018-03-23 07:00:02', 'UCpTaAz_BxtkUB1qc8JTU_7g', '10');
INSERT INTO public.youtube_videos VALUES ('F5eEvfOyb7k', 'Elvis Presley - The Wonder of You (Official Audio)', '2014-03-16 03:03:03', 'UCSEmH1YyFWltSBYkfLMtkcg', '10');
INSERT INTO public.youtube_videos VALUES ('RNOTF-znQyw', 'John Denver - Annie''s Song (Official Audio)', '2013-04-05 19:53:41', 'UCB2ADTh5dbYcI46S-_ju7ww', '10');
INSERT INTO public.youtube_videos VALUES ('ifWOSnoCS0M', 'Barbra Streisand - The Way We Were (Official Audio)', '2020-06-11 07:00:14', 'UCzSMLQdgZwTE4emG7teJ5lw', '10');
INSERT INTO public.youtube_videos VALUES ('rTKpYJ80OVQ', 'Mobb Deep - Shook Ones, Pt. II (Official Audio)', '2015-10-16 07:00:01', 'UCppDTVlStRaBhBrifooOOWg', '10');
INSERT INTO public.youtube_videos VALUES ('oacaq_1TkMU', 'Bruno Mars - Chunky (Official Audio)', '2016-11-18 04:08:44', 'UCoUM-UJ7rirJYP8CQ0EIaHA', '10');
INSERT INTO public.youtube_videos VALUES ('DmNfT-B7nlA', 'A Boogie Wit Da Hoodie - Look Back At It [Official Audio]', '2018-12-07 05:00:01', 'UCfgsFOdVScKetBXYrFNr5LQ', '10');
INSERT INTO public.youtube_videos VALUES ('4FitbJ3oqww', 'Cardi B & Bruno Mars - Please Me (Official Audio)', '2019-02-15 05:00:00', 'UCxMAbVFmxKUVGAll0WVGpFw', '10');
INSERT INTO public.youtube_videos VALUES ('xy3AcmW0lrQ', 'Djo - End Of Beginning (Official Audio)', '2022-09-16 04:00:22', 'UChwJDTqACGvdzI7-BI_BX5w', '10');
INSERT INTO public.youtube_videos VALUES ('AeZRYhLDLeU', 'Johnny Cash - Folsom Prison Blues (Official Audio)', '2021-03-26 07:00:02', 'UCp_8NqIsZVAaGiVi3im7A8Q', '10');
INSERT INTO public.youtube_videos VALUES ('JNNKOkcojEc', 'Valesca Mayssa | Um Dia de Cada Vez [Clipe Oficial]', '2026-05-06 15:00:07', 'UCpf5YXmzGHC4m5uLCdlrrfA', '10');
INSERT INTO public.youtube_videos VALUES ('KXJpP0jd9Lk', 'Sarah Farias - Se Eu Não Te Ouvir (Ao Vivo) (Clipe Oficial MK Music)', '2024-08-16 13:00:07', 'UCbVwJCxsVbmaP1PFmbGQDeQ', '10');
INSERT INTO public.youtube_videos VALUES ('-FVrYTPBqxg', 'Pamela - Desde o Primeiro Momento "From This Moment On" [Clipe Oficial]', '2026-05-05 15:00:06', 'UCX4avjbYsDZasQPfYST1kJQ', '10');
INSERT INTO public.youtube_videos VALUES ('mAlFutzMbGI', 'Nayara Calais | Recebe Vida [Clipe Oficial]', '2026-05-06 15:00:07', 'UCBP7b1xKoI-ahduavsqeLCQ', '10');
INSERT INTO public.youtube_videos VALUES ('5CxknorIHQ4', 'Larissa Santos - É Deus Quem Vai Fazer (Clipe Oficial MK Music)', '2026-05-05 13:00:06', 'UCbVwJCxsVbmaP1PFmbGQDeQ', '10');
INSERT INTO public.youtube_videos VALUES ('81GaF34veWA', 'Samuel Messias - Todavia me Alegrarei (Clipe Oficial MK Music)', '2019-12-19 13:00:10', 'UCbVwJCxsVbmaP1PFmbGQDeQ', '10');
INSERT INTO public.youtube_videos VALUES ('93TXfW3MT4o', 'Maria Marçal - Deixa (Clipe Oficial MK Music)', '2023-03-21 14:00:08', 'UCbVwJCxsVbmaP1PFmbGQDeQ', '10');
INSERT INTO public.youtube_videos VALUES ('yxwnCxnUVlw', 'Sarah Farias - Sobrevivi (Clipe Oficial MK Music)', '2018-02-22 18:54:04', 'UCbVwJCxsVbmaP1PFmbGQDeQ', '10');
INSERT INTO public.youtube_videos VALUES ('dANcAGydlsM', 'Midian Lima - Não Pare (Clipe Oficial MK Music)', '2019-06-10 21:13:14', 'UCbVwJCxsVbmaP1PFmbGQDeQ', '10');
INSERT INTO public.youtube_videos VALUES ('49LvI-Y_ScY', '✨🎵 CLIPE OFICIAL de Shine Together 🎵✨ Talking Angela', '2022-07-08 15:00:02', 'UCY9xIaF8CIdS23e0W6nHAmg', '10');
INSERT INTO public.youtube_videos VALUES ('q0u47Nl7N7M', 'Marina Sena - Lua Cheia (Clipe Oficial)', '2025-09-11 00:00:07', 'UC2mT7quMGAx5wPsARspOGIA', '10');
INSERT INTO public.youtube_videos VALUES ('agr3esH33SU', 'BC Raff "Bugatti Gatti" feat 512 Dahkidd [VIDEO CLIPE OFICIAL]', '2026-05-06 16:50:56', 'UChGlhi8jkPmZWC_YzoZavDw', '10');
INSERT INTO public.youtube_videos VALUES ('1ouf1Dt7H2A', 'BEIJA-FLOR 2026 - CLIPE OFICIAL RIO CARNAVAL', '2025-10-22 15:00:07', 'UCNauntDSSJY2kSODiVBg4jQ', '10');
INSERT INTO public.youtube_videos VALUES ('ZDW9eJOtZ3s', 'Só Confie em Mim 🍉 - Clipe Oficial', '2025-10-10 21:00:06', 'UCEUsbKNdilM6Z-HMJDpo-yQ', '10');
INSERT INTO public.youtube_videos VALUES ('FZm2Ci1jLe0', 'Theuzinho - Trovão (Clipe Oficial)', '2026-05-05 14:34:39', 'UCyPw7nYWFQ4kS9GdcZKKFUg', '10');
INSERT INTO public.youtube_videos VALUES ('xCuqr0PO0_8', 'Midian Lima - Jonas (Ao Vivo) (Clipe Oficial MK Music)', '2024-12-06 13:00:07', 'UCbVwJCxsVbmaP1PFmbGQDeQ', '10');
INSERT INTO public.youtube_videos VALUES ('WiNYFwIfg4w', 'Tem cabaré essa noite - Nivaldo Marques | Nattan (Clipe Oficial)', '2022-07-14 14:00:09', 'UC3EPFEI1TdOtPdDPS1nRt2w', '10');
INSERT INTO public.youtube_videos VALUES ('QrtoMb-o7b8', 'Clipe Oficial - Tu Xera? - Anderson e o Vei da Pisadinha', '2024-12-14 21:00:11', 'UCwSE3LmfzUsVzhWHVGE9Bog', '10');
INSERT INTO public.youtube_videos VALUES ('hpn23IVQTbY', 'Arianne e @BrunaKarlaOficial - Jerusalém e Eu [Clipe Oficial]', '2026-05-05 14:00:06', 'UC6rYtBoPD6pmI06POwKij-g', '10');
INSERT INTO public.youtube_videos VALUES ('ieTE4-Xy9xg', 'Gisele Nascimento - O Sonho Não Acabou (Clipe Oficial MK Music)', '2013-07-04 19:20:42', 'UCbVwJCxsVbmaP1PFmbGQDeQ', '10');
INSERT INTO public.youtube_videos VALUES ('Lny-RiAKQ1Q', 'Eliane Fernandes - Adorador (Clipe Oficial)', '2025-07-15 14:00:19', 'UCBuxb0TFYFzbKcDxs1pwV1Q', '10');
INSERT INTO public.youtube_videos VALUES ('ug5IBOYCUzQ', 'BUIU - Diego Souza Pisadinha De Luxo (Clipe Oficial)', '2023-01-26 18:00:11', 'UCYZ5mprkRCja8rHBlZEwp-Q', '10');
INSERT INTO public.youtube_videos VALUES ('9TYOtiHgQTA', 'Bruna Karla - Não Acabou (Ao Vivo) (Clipe Oficial MK Music)', '2022-12-13 13:00:07', 'UCbVwJCxsVbmaP1PFmbGQDeQ', '10');
INSERT INTO public.youtube_videos VALUES ('5IWRU8k0qaU', 'Antônia Gomes - Fala Deus | Clipe Oficial', '2023-04-25 14:00:12', 'UCS9gMdk-A9MQbCk9k_1NFoQ', '10');
INSERT INTO public.youtube_videos VALUES ('M_eOUE6pFKY', 'TIPO NINO ABRAVANEL - TAPA NA CARA DA P (Clipe Oficial) DJ Dozabri, DJ Gouveia e MC Rodrigo do CN', '2025-03-27 15:00:28', 'UCIcC20Zdy6PYASADaGQV_Eg', '10');
INSERT INTO public.youtube_videos VALUES ('upCptHeThio', 'MC L Da Vinte e MC Gury - Parado no Bailão  (Funk Explode)', '2018-07-23 22:01:01', 'UC5U4MfVveoRxlMx0czbPGqw', '10');
INSERT INTO public.youtube_videos VALUES ('0VNARs1fbrQ', 'Melô Do Bêbado', '2020-09-04 03:19:29', 'UCSuSIGBs8xTkPID0maXgydg', '10');
INSERT INTO public.youtube_videos VALUES ('_P7S2lKif-A', 'MC Fioti - Bum Bum Tam Tam (KondZilla) | Official Music Video', '2017-03-08 22:00:01', 'UCffDXn7ycAzwL2LDlbyWOTw', '10');
INSERT INTO public.youtube_videos VALUES ('CogD1olVZYk', 'Os Menino Tá Com o Pacote - MC PH (GR6 Explode) DJ Murillo e LT, Solanno e Frank', '2023-11-30 01:00:08', 'UCNUQK9mQoqi4yNXw2_Rj6SA', '10');
INSERT INTO public.youtube_videos VALUES ('EWcOY14GWwM', 'Bumbum Granada - MCs Zaac e Jerry (KondZilla) | Official Music Video', '2016-05-02 22:00:01', 'UCffDXn7ycAzwL2LDlbyWOTw', '10');
INSERT INTO public.youtube_videos VALUES ('4N2iMmHcHys', 'Fuleragem - MC WM (KondZilla) | Official Music Video', '2018-02-21 20:00:00', 'UCffDXn7ycAzwL2LDlbyWOTw', '10');
INSERT INTO public.youtube_videos VALUES ('uF_w5PjpuKI', 'SET FUNK 2025 - MC Tuto, MC Joãozinho VT, MC CEBEZINHO, MC Kadu - MIX DE FUNK 2025', '2025-01-17 19:01:41', 'UCaQZ8fVbivr6hHtaTgGvQ-g', '10');
INSERT INTO public.youtube_videos VALUES ('kxVm97f25VA', 'A DANADA ME LIGANDO - MC Cebezinho, MC Tuto e MC Kako (Love Funk | Web Clipe) DJ Oreia', '2024-08-27 22:01:21', 'UCW25ko4WmwfDKht1Vy8ujaQ', '10');
INSERT INTO public.youtube_videos VALUES ('aHBW_Nd_z8k', 'Dennis e Kevin O Chris - TÁ OK (Clipe Oficial)', '2023-05-05 14:00:07', 'UCrPMM16a2XymtrPJwFW4kAQ', '10');
INSERT INTO public.youtube_videos VALUES ('kzOkza_u3Z8', 'MC João - Baile de Favela (KondZilla)', '2015-09-16 22:04:30', 'UCffDXn7ycAzwL2LDlbyWOTw', '10');
INSERT INTO public.youtube_videos VALUES ('-UDWqs7TsTg', 'VAMO DE PAGODIN / SAMBA DE MALANDRO - DJ WN, DJ GM, MC Paulin da Capital, Ryan SP, Piedro e Daniel', '2024-03-14 15:01:11', 'UC9OMsuaqvGdF0MtK3gYYNkA', '10');
INSERT INTO public.youtube_videos VALUES ('tnyJXbPrGN8', 'MC Lipi - Anota Aí (Love Funk) DJ Guh Mix', '2021-12-16 22:07:25', 'UC9OMsuaqvGdF0MtK3gYYNkA', '10');
INSERT INTO public.youtube_videos VALUES ('kDhptBT_-VI', 'Anitta, Mc Zaac, Maejor feat. Tropkillaz & DJ Yuri Martins - Vai Malandra [Official Music Video]', '2017-12-18 14:09:13', 'UCqjjyPUghDSSKFBABM_CXMw', '10');
INSERT INTO public.youtube_videos VALUES ('iaXt5shHFL8', 'Anitta - Funk Generation – A Baile Funk Experience', '2024-05-01 16:00:08', 'UCqjjyPUghDSSKFBABM_CXMw', '10');
INSERT INTO public.youtube_videos VALUES ('gEAXyEUQPUs', 'FAMOSINHA', '2025-02-27 10:05:03', 'UC51rMi7DcZmStoQH91Adveg', '10');
INSERT INTO public.youtube_videos VALUES ('buZm0R1qWgU', '🎭SELEÇÃO DE FUNK POP COM ANITTA,LUÍSA SONZA,LUDMILA,PEDRO SAMPAIO E MAIS!!CARNAVAL 2023 !🎭', '2023-02-20 14:04:19', 'UCUk_if2zqfCvPFz3jydYrjA', '10');
INSERT INTO public.youtube_videos VALUES ('3yd_eoMOvqk', 'MC Kevinho - Olha a Explosão (KondZilla) | Official Music Video', '2016-12-26 21:00:00', 'UCffDXn7ycAzwL2LDlbyWOTw', '10');
INSERT INTO public.youtube_videos VALUES ('iEenugG_y6c', '365 DIAS, 325 NA ÁGUA - MC Marks, MC Ryan SP e MC JVila (DJ Dael e DJ Japa NK)', '2024-09-11 13:52:50', 'UCxiHdOFRj1uT_vzZmdmNtXw', '10');
INSERT INTO public.youtube_videos VALUES ('uQPu_XgV2iU', 'Brazilian Funk 🇧🇷 & Dembow PARTY MIX 2025 🎉  BY ROBIN ROXETTE', '2025-02-17 20:00:37', 'UCa1Bc6MEwQjMYJx1nar2DIQ', '10');
INSERT INTO public.youtube_videos VALUES ('9QASL0SjNGQ', 'Furacão 2000 | Boiler Room Rio De Janeiro: Carnaval', '2025-05-23 19:27:06', 'UCGBpxWJr9FNOcFYA5GkKrMg', '10');
INSERT INTO public.youtube_videos VALUES ('RKb9WiYcfLM', 'MARIA MARIAH VOCÊ NÃO SAI DA MINHA CABEÇA (Clipe Oficial) MC Meno Dani, Silva MC, JC no Beat e DJ F7', '2024-01-01 14:50:51', 'UCIcC20Zdy6PYASADaGQV_Eg', '10');
INSERT INTO public.youtube_videos VALUES ('ENHwrVK0wn8', 'QUEBRADAS - MC Paulin da Capital, MC Lipi, MC Cabelinho e DJ GM (Love Funk)', '2021-12-02 21:00:09', 'UC9OMsuaqvGdF0MtK3gYYNkA', '10');
INSERT INTO public.youtube_videos VALUES ('udVRjFnmeX4', 'FUNK DAS ANTIGAS DJ MARLBORO FUNK BRASIL', '2022-12-17 03:00:20', 'UCgDXShbFfBWHWbzv2p_2M7A', '10');
INSERT INTO public.youtube_videos VALUES ('VpJKsoMWnZM', 'Mila, Menor Nico e Petter Ferraz - "Amor ou o Litrão" Brega Funk (KondZilla)', '2020-12-04 15:00:24', 'UCffDXn7ycAzwL2LDlbyWOTw', '10');
INSERT INTO public.youtube_videos VALUES ('OFwLmOlaeV0', 'SET TRAP 2026 LANÇAMENTO - Filipe Ret, Caio Luccas, Orochi, Oruam e Borges', '2026-05-06 14:09:27', 'UCXX14DhKp9FsTo50osm-KUw', '10');
INSERT INTO public.youtube_videos VALUES ('PaQGJV4AHYg', 'SET TRAP BRASIL 2026 - Oruam, Tz da Coronel, Chefin, Cabelinho e Poze do Rodo', '2026-05-05 15:09:41', 'UCXX14DhKp9FsTo50osm-KUw', '10');
INSERT INTO public.youtube_videos VALUES ('yv2i9s6c69g', 'TRAP BRASIL 2024 - MC POZE, ORUAM, MC CABELINHO, OROCHI - PLAYLIST TRAP BR MELHORES 2024', '2024-01-05 22:00:09', 'UCPW7syVY4Xt52Fhn6NxWFSQ', '10');
INSERT INTO public.youtube_videos VALUES ('WQ3wmf8KyFo', 'PLAYLIST DE TRAP BR 2025 - FILIPE RET, MC POZE, MC CABELINHO, ORUAM - AS MELHORES 2025 #trapbr', '2025-09-22 22:00:41', 'UCR1bQTKTuTm99nDQUo9BgPg', '10');
INSERT INTO public.youtube_videos VALUES ('0nHHZZRYNf4', 'Vulgo FK, MC PH, Veigh - Ballena (Clipe Oficial)', '2023-07-14 15:12:10', 'UCYOpPILQDfJdQP3zCX3aVfQ', '10');
INSERT INTO public.youtube_videos VALUES ('4lH4Rk4iwBA', 'TRAP BRASIL 2026 - Filipe Ret | Orochi | Oruam | Caio Luccas | Borges', '2026-04-29 20:34:49', 'UCXX14DhKp9FsTo50osm-KUw', '10');
INSERT INTO public.youtube_videos VALUES ('0QULuVbkGEU', 'WIU - Eu Não Ouço Mais Trap', '2024-07-11 00:50:07', 'UCoHV8LxUFKeIvifJsB3c7Ww', '10');
INSERT INTO public.youtube_videos VALUES ('XPs5XS5CtIw', 'TRAP 2025 DO MOMENTO - Chefin, Caio Luccas, Orochi, MC Poze do Rodo, Bielzin e MC Ryan SP', '2025-05-27 18:55:56', 'UCXX14DhKp9FsTo50osm-KUw', '10');
INSERT INTO public.youtube_videos VALUES ('QfzMtZ3HSG0', 'PLAYLIST DE TRAP BR 2025 - FILIPE RET, MC POZE, MC CABELINHO, ORUAM - AS MELHORES 2025 #trapbr', '2025-10-03 03:00:26', 'UCR1bQTKTuTm99nDQUo9BgPg', '10');
INSERT INTO public.youtube_videos VALUES ('OQODghPUIqg', 'TRAP BRASIL 2026 - Cabelinho, Chefin, Filipe Ret, Oruam e Poze do Rodo e Borges', '2025-12-15 14:21:33', 'UCXX14DhKp9FsTo50osm-KUw', '10');
INSERT INTO public.youtube_videos VALUES ('Bb6nkSz8ThA', 'Teto - M4 feat. Matuê | LYRICS - LEGENDADO | MAS REALMENTE ENTRA O DESENHO ANIMADO', '2023-02-24 00:00:38', 'UCWSQbyw6p43P1w2gyKsyH1w', '10');
INSERT INTO public.youtube_videos VALUES ('nRbw5SCKD8M', 'SET TRAP BRASIL 2024 - FILIPE RET,ORUAM ,MC POZE ,TZ DA CORONEL - PLAYLIST TRAP BR MELHORES 2024', '2024-11-11 14:51:59', 'UCH8pCpWTijJeDxi-8zM2F-w', '10');
INSERT INTO public.youtube_videos VALUES ('hfwmSryJi98', 'PLAYLIST DE TRAP BR 2026 - MC CABELINHO, FILIPE RET, TZ DA CORO, MC POZE - AS MELHORES 2026 #trapbr', '2026-03-20 03:00:50', 'UCR1bQTKTuTm99nDQUo9BgPg', '10');
INSERT INTO public.youtube_videos VALUES ('z5R9JzNpvPc', 'Eu Não Ouço Mais Trap', '2024-07-11 00:03:40', 'UCq6oOchdrstuKgv8d3kV3Dw', '10');
INSERT INTO public.youtube_videos VALUES ('4NpT4hCgoB0', 'NGC Daddy - Glockada (Official Music Video)', '2021-03-23 06:07:03', 'UCxpQLDqF5sl1mGuy3609NrQ', '10');
INSERT INTO public.youtube_videos VALUES ('63XyWeKWI0M', 'Hungria - Beijo Com Trap (Official Vídeo)', '2018-06-21 18:00:03', 'UCAI8SmRbXgSpP8Zo3xZbxzQ', '10');
INSERT INTO public.youtube_videos VALUES ('MIjLD8KB2gs', 'SET TRAP TRANQULIDADE - MC Cabelinho, Caio Luccas, Filipe Ret, Borges e Orochi', '2025-09-26 16:19:00', 'UCXX14DhKp9FsTo50osm-KUw', '10');
INSERT INTO public.youtube_videos VALUES ('yyq2L2Ws5Ow', 'PLAYLIST TRAP 2026 BRASIL - Oruam, Orochi, Borges, Chefin e MC Poze do Rodo', '2026-04-08 21:40:46', 'UCXX14DhKp9FsTo50osm-KUw', '10');
INSERT INTO public.youtube_videos VALUES ('q-uWWNcu724', 'Long Beatz, MC Kevin, MC Cabelinho feat. Meno Tody - Trap de Bandido (Clipe Oficial)', '2021-09-04 19:06:39', 'UCYxLlKfySq3RVLKdNSQ1Gug', '10');
INSERT INTO public.youtube_videos VALUES ('_urlIWLDvrA', 'DEREK feat. LEVIANO, BRANDÃO85 - Trap The Fato (Official Music Video)', '2022-12-13 23:00:10', 'UCu7O9lAbeZp3WW96Lf5Xk7g', '10');
INSERT INTO public.youtube_videos VALUES ('BZjxRqWBeHU', 'Oruam - Freestyle Depois da Cadeia - Tipo Homem Aranha', '2025-10-06 15:51:21', 'UCCrz2yNyIsxpPe2rhJR2zjA', '10');
INSERT INTO public.youtube_videos VALUES ('Quc3PUKyGCA', 'SET TRAP BRASIL 2025 - Oruam, Orochi, Poze do Rodo, Chefin, Filipe Ret e Cabelinho', '2025-05-10 15:02:26', 'UCXX14DhKp9FsTo50osm-KUw', '10');
INSERT INTO public.youtube_videos VALUES ('Pes_L2tdrG8', 'TRAP 2025 LIGHT SEM PALAVRÃO PRA OUVIR SEM RECLAMAÇÃO - 16 MINUTINHOS DE TRAP ( TZ , RET,OROCHI )', '2024-12-19 16:02:27', 'UCEio9P7qw32d5pnLKJQWJUA', '10');
INSERT INTO public.youtube_videos VALUES ('gQreU1BGMmw', 'Duquesa - 99 Problemas feat. Mc Luanna (Official Visualizer)', '2023-07-01 15:41:24', 'UCKh2WhQRJ5RkAQ9_TIKQGcg', '10');
INSERT INTO public.youtube_videos VALUES ('PI23ldAvdHY', 'Leviano - Matéria', '2023-05-23 22:00:10', 'UCm_ScSW5MFcTLLh4pzch7JQ', '10');
INSERT INTO public.youtube_videos VALUES ('vKRAmLTQ9Dk', 'A Vida é Um Sopro - Tribo da Periferia ft. @MCHarielOriginal (Acústico Vivências)', '2021-09-09 14:00:12', 'UCe5pPUSFEajlij-LrxUl19A', '10');
INSERT INTO public.youtube_videos VALUES ('ICkFEA5eunU', 'rap brasil-eu so quero é ser feliz.', '2011-03-18 20:09:58', 'UC6dtGRUp-ZhaICs0qz2l0Fw', '10');
INSERT INTO public.youtube_videos VALUES ('UZxnSc6VKog', 'Borges - AK DO FLAMENGO ft. Flacko (Prod. Flacko / Official Music Video)', '2019-12-09 20:30:23', 'UC2EBMe1AVltGzvL7UpXCMmw', '10');
INSERT INTO public.youtube_videos VALUES ('cIUSxV9J45w', 'SÓ PEDRADA! CLÁSSICOS DO RAP BRASIL PARA SUA FESTA', '2025-09-11 21:00:42', 'UC6eIJRyB8MvcqdwF6ZFUnqQ', '10');
INSERT INTO public.youtube_videos VALUES ('7pD8k2zaLqk', 'Cidinho & Doca - Rap da Felicidade (Video Oficial)', '2017-12-06 18:52:49', 'UCDT5YhWTMwdyWTJC2QsZp5g', '10');
INSERT INTO public.youtube_videos VALUES ('e_xGeZDk3Sw', 'Haikaiss - RAP LORD part. Jonas Bento (Prod. NeoBeats) [VIDEOCLIPE OFICIAL]', '2017-03-20 14:57:33', 'UCqhmlFknRAuBvT1grx1jZPw', '10');
INSERT INTO public.youtube_videos VALUES ('4Y_5uJpSOZM', 'Mc Sid - Brasil de Quem ?', '2018-05-27 20:07:00', 'UCAe6HU3wR0FCdIzkg22TgWw', '10');
INSERT INTO public.youtube_videos VALUES ('vlZ9MGgC1NI', 'RAP DO SILVA - BOB RUM (Original)', '2019-10-10 07:39:17', 'UCLgLOu_gWyumG83paac3nTw', '10');
INSERT INTO public.youtube_videos VALUES ('xAM51Ovpr9M', 'MC Poze do Rodo - Vida Louca (prod. Neobeats)', '2021-04-02 17:00:16', 'UCsyd_nnNNDxlOs9TYrDvCoQ', '10');
INSERT INTO public.youtube_videos VALUES ('iZq0u3quAqo', 'Hungria - Amor e Fé (Official Music Video) #CheiroDoMato', '2020-08-21 17:59:44', 'UCAI8SmRbXgSpP8Zo3xZbxzQ', '10');
INSERT INTO public.youtube_videos VALUES ('Ibfm0yE5O_8', 'Thaide e DJ Hum - Sr. Tempo Bom - Oficial Video', '2016-07-08 04:34:20', 'UCRApI5JQ8oA9r5NxZXX8O9w', '10');
INSERT INTO public.youtube_videos VALUES ('GA7LcSX8tYE', 'Sabotage - Um Bom Lugar (Clipe Oficial)', '2017-01-29 20:11:19', 'UCHJZxi3jW7iT-5Ae5xWXE5Q', '10');
INSERT INTO public.youtube_videos VALUES ('WF7LLl7r4Os', 'Sabotage - Canão Foi Tão Bom (2016)', '2016-10-18 21:02:54', 'UCHJZxi3jW7iT-5Ae5xWXE5Q', '10');
INSERT INTO public.youtube_videos VALUES ('s6dIjPBECXw', 'Tasha & Tracie - Amina (prod. Retroboy)', '2025-07-10 22:00:06', 'UCaqFH2lGTICD9iWi8NCdbBw', '10');
INSERT INTO public.youtube_videos VALUES ('TwkKp-BBChg', 'Rap Do Solitário', '2009-05-28 23:41:42', 'UCr3DvQcWm5ljd-c68cu1wZw', '10');
INSERT INTO public.youtube_videos VALUES ('gUnpHJgLyRs', 'A Vida É Desafio', '2015-01-28 15:52:25', 'UC0-clSqGiArqh1CaskKiu3g', '10');
INSERT INTO public.youtube_videos VALUES ('P-W2JmG9vtQ', 'Planet Hemp - Mantenha o Respeito', '2008-11-11 19:40:28', 'UCFiCa9ecf-jGAGQuHbcoOLw', '10');
INSERT INTO public.youtube_videos VALUES ('o50J2xg8-sU', 'Negro Drama', '2015-01-28 18:47:41', 'UC0-clSqGiArqh1CaskKiu3g', '10');
INSERT INTO public.youtube_videos VALUES ('XpvSubMyL0k', 'Esses 2 Cantaram a Verdade do Brasil (Clipe Oficial)', '2017-07-30 19:00:05', 'UCe6pKugTDyOPT1Md2DTybbQ', '10');
INSERT INTO public.youtube_videos VALUES ('Wu-HUG7ORt8', 'Insanou - Renascer (Official Music Video)', '2021-11-18 19:02:00', 'UC81qZMkuX_kaJytab4wKqng', '10');
INSERT INTO public.youtube_videos VALUES ('CWqoY1RK5lU', 'Mc Sid - Brasil de Quem? ZERO', '2024-12-02 15:41:31', 'UCAe6HU3wR0FCdIzkg22TgWw', '10');
INSERT INTO public.youtube_videos VALUES ('fAHcrVZhLIA', 'CL APARECIDA - CL a Posse (Official Music Video)', '2007-03-20 21:48:00', 'UCPIImx-7tGVN50o5EsyUGhg', '10');
INSERT INTO public.youtube_videos VALUES ('G2huIPUuUQc', 'Edi Rock e Seu Jorge - That''s My Way (Clipe Oficial)', '2015-12-03 17:32:21', 'UCxcJlObi1B4hKPY-so-4myw', '10');
INSERT INTO public.youtube_videos VALUES ('rC9vmpQRR40', 'Sabotage - "Rap é Compromisso" - Rap é Compromisso', '2014-11-18 03:40:52', 'UCHJZxi3jW7iT-5Ae5xWXE5Q', '10');
INSERT INTO public.youtube_videos VALUES ('10XarNSkw0s', 'Diego e Victor Hugo - Tubarões (Ao Vivo) (Vídeo Oficial)', '2025-02-14 00:01:10', 'UCJZMKO4pCeNf8jVifCGxFjw', '10');
INSERT INTO public.youtube_videos VALUES ('V2RgfAC0Mz8', 'AS MAIS TOCADAS 2026 - PLAYLIST SERTANEJO - Top Sertanejo 2026 || Top Sertanejo 2026 Mais Tocadas', '2026-04-17 10:00:55', 'UCn0NUsrqao9WNBO6A-hIEOg', '10');
INSERT INTO public.youtube_videos VALUES ('YrvU5E-iF_s', 'Sertanejo 2025 Mais Tocadas - Top Sertanejo 2025 - As Melhores Do Sertanejo Universitário', '2025-09-24 09:58:02', 'UCn0NUsrqao9WNBO6A-hIEOg', '10');
INSERT INTO public.youtube_videos VALUES ('BEz8l69aI8Y', 'Matheus & Kauan - Quarta Cadeira (Ao Vivo Em Goiânia / 2018) ft. Jorge & Mateus', '2019-04-17 14:00:03', 'UCVjsKYd_OXTP1M2Kbmcz64g', '10');
INSERT INTO public.youtube_videos VALUES ('Dt13Wv6Opeo', 'Marília Mendonça - Foi Por Conveniência (Não Foi Por Amor) (Vídeo Oficial)', '2021-01-15 14:00:12', 'UCwfEOn0O1DWcyTgzVVu28ig', '10');
INSERT INTO public.youtube_videos VALUES ('yZh9a-QX3Yo', 'TOP SERTANEJO 2026 - As Melhores do Sertanejo Universitário (Mais Tocadas) - Top 30 Sertanejo 2026', '2026-04-10 11:17:01', 'UCn0NUsrqao9WNBO6A-hIEOg', '10');
INSERT INTO public.youtube_videos VALUES ('UsEhWFeiCnA', 'TOP Sertanejo 2026 🌟 Top Sertanejo 2026 Mais Tocadas 🌟 As Melhores Musicas Sertanejas 2026 HD', '2026-04-24 12:25:35', 'UCn0NUsrqao9WNBO6A-hIEOg', '10');
INSERT INTO public.youtube_videos VALUES ('T67WZx7CxY8', 'Gusttavo Lima - Retrovisor | DVD "Feito à Mão"', '2025-08-14 00:00:07', 'UCXooz9whNJZBRTHi9AqdjPw', '10');
INSERT INTO public.youtube_videos VALUES ('BOn-sXalHxI', 'MIX SERTANEJO 2025 || As Melhores Musicas Sertanejas 2025 HD || Sertanejo 2025 Mais Tocadas', '2025-10-15 14:54:48', 'UCn0NUsrqao9WNBO6A-hIEOg', '10');
INSERT INTO public.youtube_videos VALUES ('J_jJhHhYW9w', 'Tierry - CABEÇA BRANCA ( DVD / O Pai das Crianças)', '2021-10-01 15:00:13', 'UCPdHWqkyXG7JBcsOv0sT6Bg', '10');
INSERT INTO public.youtube_videos VALUES ('8blgJSoAVBc', 'Show de Modão Sertanejo - Renan Miler e Raphael no Celeiro da Granja Ao Vivo.', '2025-03-16 14:25:16', 'UCOIg-wxSLlZJi6hHddtO8-A', '10');
INSERT INTO public.youtube_videos VALUES ('veSzGDdQ_Ok', 'Guilherme e Santiago, Ana Castela - Meia Noite E Meia (Vídeo Oficial)', '2025-09-24 21:59:25', 'UC-QoZ0V193UMCLFaK-usjqw', '10');
INSERT INTO public.youtube_videos VALUES ('GVSS3lh_lCY', 'Panda, Gusttavo Lima - Calcinha de Renda  [ Panda fora do Padrão ]', '2025-11-28 00:00:02', 'UCpxck6bZZZ44S7VcKZ1Ub9A', '10');
INSERT INTO public.youtube_videos VALUES ('kI6ywewtYkc', 'Panda - Eu te seguro  [ Panda sem Moderação 2 ]', '2025-09-18 23:59:14', 'UCpxck6bZZZ44S7VcKZ1Ub9A', '10');
INSERT INTO public.youtube_videos VALUES ('PtJDSomNoUM', 'Melhores Musicas 2026 🎼 Sertanejo 2026 Mais Tocadas 🎼 As Melhores Do Sertanejo Universitário', '2026-05-01 09:57:58', 'UCn0NUsrqao9WNBO6A-hIEOg', '10');
INSERT INTO public.youtube_videos VALUES ('ToabLkXUotM', 'Murilo Huff - Deixa Eu (ACÚSTICO)', '2025-08-15 14:39:13', 'UCMZKcLkNw1AMgfusg3Mjutw', '10');
INSERT INTO public.youtube_videos VALUES ('jPwCxjJqHGw', 'Matheus & Kauan, Jorge & Mateus - Pactos', '2022-10-14 14:00:07', 'UCVjsKYd_OXTP1M2Kbmcz64g', '10');
INSERT INTO public.youtube_videos VALUES ('o4SIXV3OKeY', 'Mari Fernandez - PÁGINA DE EX (Mari No Barzinho)', '2024-04-26 14:59:19', 'UC4GQcpSxXmvhjn8bAfUubgg', '10');
INSERT INTO public.youtube_videos VALUES ('OcKwmWEBi1I', 'Pedro Sanchez e Thiago,  @LuanPereiraLP - Pinta o Cabelo de Preto (DVD Entre Um Bar e Outro) Ao Vivo', '2023-09-08 14:00:08', 'UCP7kEjy0tpXY0A20qy-lUMQ', '10');
INSERT INTO public.youtube_videos VALUES ('MO37-1KgcI4', 'Gustavo Mioto - Princesa feat. @anacastelaoficial (Atemporal)', '2025-06-06 13:57:35', 'UCCCIzjqbX7psrn0HYG50phg', '10');
INSERT INTO public.youtube_videos VALUES ('s9IlAyHO6EQ', 'Ícaro e Gilmar  - M de mulher [ Ao Vivo em Barretos ]', '2022-09-23 13:00:29', 'UC55hzEBczDivH31zVueh8Gg', '10');
INSERT INTO public.youtube_videos VALUES ('uEtGTq92Cmk', 'Simone Mendes - SAUDADE PROIBIDA (Cantando Sua História 2)', '2025-04-04 14:54:37', 'UCH7vP1JyEwTy-D-ikZUoCww', '10');
INSERT INTO public.youtube_videos VALUES ('ZIiQ1jMqhVM', 'Luan Santana - MORENA (Clipe Oficial)', '2021-06-18 15:00:10', 'UC6rwiIxv0w2fbmmr66wl1rA', '10');
INSERT INTO public.youtube_videos VALUES ('E7UBYWn_69c', 'Melhores Musicas 2026 - Sertanejo 2026 Mais Tocadas - As Melhores Do Sertanejo Universitário', '2026-01-16 10:15:51', 'UCn0NUsrqao9WNBO6A-hIEOg', '10');
INSERT INTO public.youtube_videos VALUES ('lBDDMrUCz1A', 'Zé Neto e Cristiano - Cadeira Cativa (Vocês e Deus)', '2026-04-10 15:00:27', 'UCRRu9OXVYd5clj2Bs29gUVQ', '10');
INSERT INTO public.youtube_videos VALUES ('eAIivxKZYZw', 'Grupo Menos É Mais, Simone Mendes - P do Pecado (Ao Vivo)', '2025-05-01 00:00:06', 'UCmkSzYG4ykYKFE4Ow0030zw', '10');
INSERT INTO public.youtube_videos VALUES ('n5wxZ_OBUXk', 'Grupo Menos é Mais - Coração Partido (Clipe Oficial)', '2024-08-30 14:00:07', 'UCmkSzYG4ykYKFE4Ow0030zw', '10');
INSERT INTO public.youtube_videos VALUES ('h3nyYuevzi8', 'Grupo Menos é Mais - Só As Melhores Pagode 2026 - Samba e Pagode', '2026-05-06 20:30:29', 'UCJjq3bUli6GPgH2ebLcsdcA', '10');
INSERT INTO public.youtube_videos VALUES ('qPgwDlqdiD0', 'Grupo Menos é Mais - Churrasquinho Menos é Mais 3 (DVD Completo)', '2024-11-15 00:00:06', 'UCmkSzYG4ykYKFE4Ow0030zw', '10');
INSERT INTO public.youtube_videos VALUES ('Vvfs44wnHH0', 'Uma Mesa e Um Pagode - 1 HORA DE PAGODE COM DOZE POR OITO NA PRAÇA DOS PRAZERES', '2025-05-29 20:00:06', 'UCvOHHWVKwPd_oCH73I1ukKQ', '10');
INSERT INTO public.youtube_videos VALUES ('CgkLC1mcCE0', 'Ela - Sorriso Maroto, Ferrugem (Sorriso Eu Gosto No Pagode)', '2023-09-15 15:00:11', 'UClqmzNx7-xd-5_MzdSotYKw', '10');
INSERT INTO public.youtube_videos VALUES ('CGOKwddW7uo', 'Pagode Mais Tocados 2025 🎶 | As Melhores do Pagode – 1 Hora Só de Hit | Grupo TeDeJoTa', '2025-07-14 13:46:06', 'UCMEmGaZIImpsI7Jn6Mh1WtA', '10');
INSERT INTO public.youtube_videos VALUES ('AAZmC2EcNng', 'Pagode do Adame, Gamadinho - Não Tem Hora, Nem Lugar / Amor a Três / Instinto I Entre Amigos', '2024-01-27 17:25:09', 'UCdldpvtnXURuU7NNeyhLBwg', '10');
INSERT INTO public.youtube_videos VALUES ('iYjz1Ap1VvU', 'Grupo Menos É Mais, NATTAN - Pela Última Vez (Ao Vivo)', '2025-08-22 00:00:06', 'UCmkSzYG4ykYKFE4Ow0030zw', '10');
INSERT INTO public.youtube_videos VALUES ('WrwEIKj7KB0', 'Grupo Menos É Mais - Quero Ser Feliz Também / Será / Tempo Perdido (Ao Vivo)', '2025-12-23 15:00:07', 'UCmkSzYG4ykYKFE4Ow0030zw', '10');
INSERT INTO public.youtube_videos VALUES ('ozLE7N5uEfw', 'Pagode do Zero19 - Boa Noite / Eu Não Sou de Me Entregar / Engano / Faz Assim / Primeira Namorada', '2023-02-18 15:00:10', 'UCXY8-t6n8CxCRtH9kcPPYkA', '10');
INSERT INTO public.youtube_videos VALUES ('iL_ljx5eXQc', 'Yan e Sorriso Maroto -  Fica com Deus (Ao Vivo no PagodYANdo)', '2025-07-18 15:01:54', 'UC8OSnmaf9DJI11Dy2VP5yLg', '10');
INSERT INTO public.youtube_videos VALUES ('lKsfbr_F6ho', 'Menos É Mais, Dilsinho, Sorriso Maroto, Ferrugem, Péricles, Thiaguinho, Turma do Pagode e mais', '2025-11-21 12:01:37', 'UCFInGcq6uwEPRnAF0SaXwTA', '10');
INSERT INTO public.youtube_videos VALUES ('TxCOdjTyY94', 'LUDMILLA - Se Não Chorar com Pagode - Numanice #3', '2024-02-20 23:59:30', 'UCSCB1IQUmNa8Gn5VfSUAUpg', '10');
INSERT INTO public.youtube_videos VALUES ('AA-sNG6eIyI', 'Renan Oliveira - Os Pagodes Que A Gente Gosta Vol.2 (Parte 2)', '2025-02-28 16:35:41', 'UCCccwoGbhxh5iA_Diu6-aSw', '10');
INSERT INTO public.youtube_videos VALUES ('eCdTbCf4EMM', 'Marvvila - Só Vvamo Sunset (DVD Completo - 50 minutos de pagode)', '2025-10-15 15:00:07', 'UC3vSHJGkAqiNgN5FovH7BKQ', '10');
INSERT INTO public.youtube_videos VALUES ('exTC-KFUJrM', 'Saudade da Gente - Ludmilla Part. Grupo Balacobaco (Numanice Ao Vivo no Pagode do Chinelo)', '2024-07-09 21:00:06', 'UC_XtzPwdBLInyyxNRId4hjw', '10');
INSERT INTO public.youtube_videos VALUES ('EEoqV07KXck', 'Pagode Mais Tocados 2025 | As Melhores do Pagode – 1 Hora Só de Hit | Grupo TeDeJoTa', '2025-10-24 21:26:45', 'UCMEmGaZIImpsI7Jn6Mh1WtA', '10');
INSERT INTO public.youtube_videos VALUES ('QWgqN_oD934', '1 Hora de Pagode do Leleco no RIO DE JANEIRO ☀️ (Praia do Recreio)', '2026-04-12 14:00:41', 'UCIbM7_vOcqn4ApWtQlKrOSA', '10');
INSERT INTO public.youtube_videos VALUES ('wJPicWv_SGU', 'DE FÉRIAS COM PRESENÇA | Perfume - Reinventar - Supera | Ao Vivo - Samba e Pagode', '2023-12-28 15:00:12', 'UCKTsmTjpzWuCoFcdaJ4GnSA', '10');
INSERT INTO public.youtube_videos VALUES ('WQyKuEsLpRY', 'Pixote - Insegurança (15 Anos)(Ao Vivo)(Vídeo Oficial)', '2013-05-06 22:05:40', 'UCwuBNS7gH0rguuRj80VTeEw', '10');
INSERT INTO public.youtube_videos VALUES ('lRt16Y_ys7g', '1 Hora de Sucessos do Pagode 90 🔥 | Só As Melhores e Os Clássicos | Pagode na Praia - Leleco', '2025-12-21 14:01:16', 'UCIbM7_vOcqn4ApWtQlKrOSA', '10');
INSERT INTO public.youtube_videos VALUES ('KjdmmvEzGoc', 'Grupo Menos é Mais - Página de Amigos / Inevitável / Flor (Ao Vivo)', '2024-12-03 14:00:07', 'UCmkSzYG4ykYKFE4Ow0030zw', '10');
INSERT INTO public.youtube_videos VALUES ('I5Rl73wFmWs', 'Churrasquinho do Menos é Mais - Fatalmente/ Separação/ Temporal', '2019-11-15 15:00:57', 'UCmkSzYG4ykYKFE4Ow0030zw', '10');
INSERT INTO public.youtube_videos VALUES ('VrTm4M6qAA4', 'Sorriso Eu Gosto No Pagode - DVD Completo (Sem Cortes)', '2024-02-08 15:00:13', 'UClqmzNx7-xd-5_MzdSotYKw', '10');
INSERT INTO public.youtube_videos VALUES ('HD2sMiAwpCQ', 'EU ME APAIXONEI - VITINHO IMPERADOR', '2025-08-05 15:00:07', 'UC5nczbo5SMeTmAMDanQxeGA', '10');
INSERT INTO public.youtube_videos VALUES ('ox9zGoiJcKg', 'Alemão do Forró - Fica Amor', '2015-10-14 09:44:16', 'UCCrT2C0TsEyz8KVv_ztktog', '10');
INSERT INTO public.youtube_videos VALUES ('PvM_YAabhkk', 'Wesley Safadão - Seis Cordas - Baião de Dois - Cavalo Lampião - Forró e Vaquejada', '2025-03-07 15:00:28', 'UCciJLMuECsXuOyhA4FO48Sg', '10');
INSERT INTO public.youtube_videos VALUES ('g2o3CZaVVCo', 'FORRÓ E DESMANTELO - Manim Vaqueiro (Clipe Oficial)', '2023-12-15 20:00:11', 'UCS-NH1TPhpzYNCI5gj_reog', '10');
INSERT INTO public.youtube_videos VALUES ('KzPau_0Ad7o', 'Natanzinho Lima - Me Apaixonei Nessa Morena - EM BH', '2025-07-04 14:59:01', 'UCIy12y9x1XhfFhqqfACsVeg', '10');
INSERT INTO public.youtube_videos VALUES ('aDDBdW8-PZo', 'Leãozinho do Forró - VESTIDINHO PRETO (DVD Ao Vivo em Goiânia)', '2025-10-03 19:00:08', 'UCVjB_lvGGBByw0yHJot61JA', '10');
INSERT INTO public.youtube_videos VALUES ('UtTDrO9arqI', 'De Mala e Cuia - Flávio Leandro e Flávio José @DaviLeandroOficial', '2016-04-28 19:42:02', 'UCcko8s0ABbz_46T8qACOt5A', '10');
INSERT INTO public.youtube_videos VALUES ('tptkdXcBlzY', 'Pam Pam Forro + Tóys - Clipe Oficial', '2024-05-07 15:00:06', 'UCdR-R3gUP7LmkxdK7b-DeWQ', '10');
INSERT INTO public.youtube_videos VALUES ('ewnUjJkdeNI', 'MESA 14 -  Forró Cintura de Mola (AO VIVO NO NERES SHOW 2025)', '2025-03-27 20:54:00', 'UCiaaVxbrsY3W64mDeJPtDdg', '10');
INSERT INTO public.youtube_videos VALUES ('tvPSPkugS7A', 'Xand Avião e @TalitaMelll - Melzinho (Vídeo Oficial)', '2025-07-12 15:00:07', 'UCfuRRJ76VluLiHW2pqwZNwg', '10');
INSERT INTO public.youtube_videos VALUES ('lYv3IGKab44', '100KM de Forró', '2026-04-13 10:04:16', 'UCfbOVqyATpdSyaJDFZ2x_Cw', '10');
INSERT INTO public.youtube_videos VALUES ('0692WFAqRxs', 'Meu Pai Paga Minha Faculdade - Filho do Piseiro e Claudio Ney & Juliana (Show Completo)', '2026-01-28 13:00:05', 'UCtuGSMqrYY6kvq2CWvJ3FbA', '10');
INSERT INTO public.youtube_videos VALUES ('bjvLAQLl2xw', 'Cavaleiros do Forró - A Vontade Que Eu Tenho (DVD Cavaleiros Inesquecível - Ao Vivo em Natal)', '2020-01-17 14:35:18', 'UC24eqcXucH3sdxlD-y6I-kg', '10');
INSERT INTO public.youtube_videos VALUES ('fp6p7-yxNeQ', 'Wesley Safadão, Xand Avião e Zé Vaqueiro - Forrobodó - Meu Forró É Mundo', '2026-04-24 15:57:51', 'UCciJLMuECsXuOyhA4FO48Sg', '10');
INSERT INTO public.youtube_videos VALUES ('skAvBJPTfSA', 'Olha o Tirinho', '2023-06-14 10:01:38', 'UC9iSCrkcRGmxMHyl67AedsQ', '10');
INSERT INTO public.youtube_videos VALUES ('W_jywiZmd-c', 'RALA O COCO - Forró Cintura de Mola E NEGONA (AO VIVO NO NERES SHOW 2025)', '2025-03-27 20:58:00', 'UCiaaVxbrsY3W64mDeJPtDdg', '10');
INSERT INTO public.youtube_videos VALUES ('_d3jWdIdRHQ', 'FORRÓ 2026 - MÚSICAS NOVAS 2026 - MAIS TOCADAS DO FORRÓ - MELHORES DO FORRÓ - ALTA QUALIDADE ', '2026-01-14 13:10:45', 'UCu3RDAFOTJVDCQ75nX05Dpg', '10');
INSERT INTO public.youtube_videos VALUES ('CVTWjpx8_YA', 'De Mini Saia Eu Danço (Caçulas Do Forró)', '2025-09-23 07:30:10', 'UCoSNIGPdZNpqBjBApohGKWg', '10');
INSERT INTO public.youtube_videos VALUES ('2HXbHjLJhAk', 'FORROZINHO TRADICIONAL PARA VC SE DIVERTIR', '2026-04-08 13:00:09', 'UCansSGlIQZHVEUEvQiPiR8Q', '10');
INSERT INTO public.youtube_videos VALUES ('8tzhHzV05_0', 'ME USA - Banda Magníficos (DVD A Preferida do Brasil)', '2024-01-19 15:00:10', 'UCOSTZL7J8WjEZGAtzQHtuEA', '10');
INSERT INTO public.youtube_videos VALUES ('KzhZd3BcbWQ', 'A MINHA HISTÓRIA - Conde do Forró (Clipe Oficial)', '2025-04-11 15:00:37', 'UChbVeRtv-cDsM9-PO4Mxltw', '10');
INSERT INTO public.youtube_videos VALUES ('JCf4x_ODbhA', 'Aviões do Forró - No Toque Do Celular (Ao Vivo)', '2015-02-05 13:49:09', 'UCEATCATai_oafDuqKssZITw', '10');
INSERT INTO public.youtube_videos VALUES ('EToVcmE8RHQ', 'SOU DO MARANHÃO - FLAGUIM MORAL (CLIPE OFICIAL)', '2026-04-22 21:30:06', 'UCGDngB0sA3CGLcktUOkdAEw', '10');
INSERT INTO public.youtube_videos VALUES ('a9R7JuPdMLo', '10 Minutos de Forró - Walkyria Santos (Vídeo Oficial)', '2026-04-04 16:45:00', 'UCbFd5vmueW5bynE7HndCRTw', '10');
INSERT INTO public.youtube_videos VALUES ('xNmehcf7bqI', 'Forró da Aracuã', '2026-03-26 20:00:04', 'UCszJJVN1OUjYmBHWwOA5dmQ', '10');
INSERT INTO public.youtube_videos VALUES ('eHHQaoEW30Q', 'TWICE "THIS IS FOR" M/V', '2025-07-11 03:59:06', 'UCaO6TYtlC8U5ttz62hTrZgg', '10');
INSERT INTO public.youtube_videos VALUES ('NYyNHZPeQ4I', 'What Halloween Sounds Like Song (Kpop Demon Hunters) | Animated Music Video | Dj GG', '2025-10-19 15:49:31', 'UCfYafi2D0Z_IF3SJjp3qK1w', '10');
INSERT INTO public.youtube_videos VALUES ('w7-SyTTulAw', 'VISITEI A LOJA DA SM ENT NA COREIA ❤️ #snsd #kpop #coreiadosul', '2026-05-06 15:26:43', 'UCZaTZL0I081HoXWVIy9H9Mg', '10');
INSERT INTO public.youtube_videos VALUES ('qUxgHHiqGg0', 'KPOP Demon Hunters | Saja Boys - SODA POP [Female Version] (Cover Español Latino) @HitomiFlor', '2025-08-12 21:30:06', 'UCLWqX5BVDidcfByzyyY_XGg', '10');
INSERT INTO public.youtube_videos VALUES ('zDv9qV7PABI', '[Yokai Kabuki 2025] PARTY HARD - KPop Demon Hunters', '2025-12-14 04:27:35', 'UC5glVtzzbPwzXwqdRIFHwjg', '10');
INSERT INTO public.youtube_videos VALUES ('5L5eSTYX6wc', 'Soda Pop (Huntrix Version) | KPop Demon Hunters Animation |【Female Cover by MilkyyMelodies】', '2025-12-27 17:00:10', 'UCouD8uM_hrbWtVdDIWf4LFg', '10');
INSERT INTO public.youtube_videos VALUES ('-SEKt_0pdHM', 'NMIXX(엔믹스) “Crescendo” M/V', '2026-04-28 09:00:01', 'UCaO6TYtlC8U5ttz62hTrZgg', '10');
INSERT INTO public.youtube_videos VALUES ('bMhDJ0S0OBA', 'ILLIT (아일릿) ‘It’s Me’ Official MV', '2026-04-30 08:58:06', 'UC3IZKseVpdzPSBaWxBxundA', '10');
INSERT INTO public.youtube_videos VALUES ('_kS7F4VpJa0', 'Travis Scott, Bad Bunny, The Weeknd - K-POP (Official Music Video)', '2023-07-21 16:00:26', 'UClRx3MMyYUyqOxyEqA5F2nQ', '10');
INSERT INTO public.youtube_videos VALUES ('TvVtYaqCni8', 'LE SSERAFIM (르세라핌) ''SPAGHETTI (feat. j-hope of BTS)'' OFFICIAL MV', '2025-10-24 03:58:08', 'UC3IZKseVpdzPSBaWxBxundA', '10');
INSERT INTO public.youtube_videos VALUES ('z0Xc_rzYZV8', 'How It’s Done (Saja Boys Version) | KPop Demon Hunters Animation |【Male Cover Milkyy ft. ForticGX】', '2026-02-07 17:03:24', 'UCouD8uM_hrbWtVdDIWf4LFg', '10');
INSERT INTO public.youtube_videos VALUES ('vqkfEUqjl6Y', 'ATEEZ(에이티즈) - ''Adrenaline'' Official MV', '2026-02-06 05:00:01', 'UCQdq-lqPEq_yZ_wP_kuVB9Q', '10');
INSERT INTO public.youtube_videos VALUES ('F7sGJVUrkjQ', 'Hearts2Hearts 하츠투하츠 ''RUDE!'' MV', '2026-02-20 09:00:21', 'UCEf_Bc-KVd7onSeifS3py9g', '10');
INSERT INTO public.youtube_videos VALUES ('FEfPbOnE7VM', 'What It Sounds Like (Saja Boys Version) | KPop Demon Hunters Animation |【Male Cover Milkyy & Fortic】', '2026-04-25 16:00:13', 'UCouD8uM_hrbWtVdDIWf4LFg', '10');
INSERT INTO public.youtube_videos VALUES ('yd_uG3TtREs', 'BABYMONSTER - ‘PSYCHO’ M/V', '2025-11-18 15:00:01', 'UCqwUnggBBct-AY2lAdI88jQ', '10');
INSERT INTO public.youtube_videos VALUES ('nL2bLcCtXcM', 'Kpop Demon Hunters Song Compilation | Marble Music', '2025-11-01 11:59:15', 'UClD6WONO_a-N0dusWg1yH8Q', '10');
INSERT INTO public.youtube_videos VALUES ('42wfEs7oIP8', 'CORTIS (코르티스) ''FaSHioN'' Official MV', '2025-09-08 08:58:06', 'UC3IZKseVpdzPSBaWxBxundA', '10');
INSERT INTO public.youtube_videos VALUES ('2GJfWMYCWY0', 'BLACKPINK - ‘GO’ M/V', '2026-02-27 05:00:07', 'UCOmHUn--16B90oW2L6FRR3A', '10');
INSERT INTO public.youtube_videos VALUES ('MoU3TctXBvs', 'Golden (Saja Boys Version) | KPop Demon Hunters Animation |【Male Cover MilkyyMelodies ft. ForticGX】', '2025-12-13 17:00:25', 'UCouD8uM_hrbWtVdDIWf4LFg', '10');
INSERT INTO public.youtube_videos VALUES ('GkG60kISnfc', 'ILLIT (아일릿) ''jellyous’ Official MV', '2025-07-07 13:00:00', 'UC3IZKseVpdzPSBaWxBxundA', '10');
INSERT INTO public.youtube_videos VALUES ('AYQNN7OAHpM', 'HUNTRIX - GOLDEN (Saint Perez Remix) | KPOP DEMON HUNTERS', '2026-01-03 02:29:49', 'UCq3lYlgl7Uhl5Wq2f-BHXrw', '10');
INSERT INTO public.youtube_videos VALUES ('NED7nev2ywQ', 'Stray Kids "Do It" M/V', '2025-11-21 04:59:56', 'UCaO6TYtlC8U5ttz62hTrZgg', '10');
INSERT INTO public.youtube_videos VALUES ('x_RYZsOfpKY', 'ILLIT (아일릿) ''NOT CUTE ANYMORE’ Official MV', '2025-11-24 08:58:07', 'UC3IZKseVpdzPSBaWxBxundA', '10');
INSERT INTO public.youtube_videos VALUES ('L3sOnIfU0QM', 'Your Idol (HUNTR/X Version) | KPop Demon Hunters Animation |【Female Cover by MilkyyMelodies】', '2025-08-09 16:00:09', 'UCouD8uM_hrbWtVdDIWf4LFg', '10');
INSERT INTO public.youtube_videos VALUES ('Ve_a9CXjlQc', '“Takedown” KPop Demon Hunters (Soundtrack from the Netflix Film) | HUNTR/X', '2025-06-26 21:33:01', 'UCE4pdOAge35Ylr-DJgvllbQ', '10');
INSERT INTO public.youtube_videos VALUES ('GMFewiplIbw', 'Becky G, Bad Bunny - Mayores (Official Video)', '2017-07-14 04:00:00', 'UCJrREGJ2R1mMuKJkZ8SMCcA', '10');
INSERT INTO public.youtube_videos VALUES ('Us2ZvSRUB1k', 'MIX LATIN POP 🎉 Clásicos (Lil Silvio & El Vega, Chino & Nacho, Bacilos, Etc..)EN VIVO / DJ PHILLIP', '2022-04-06 18:00:18', 'UCNKGkgPvTgIykSU6Cs9acWQ', '10');
INSERT INTO public.youtube_videos VALUES ('kJQP7kiw5Fk', 'Luis Fonsi - Despacito ft. Daddy Yankee', '2017-01-13 05:00:02', 'UCLp8RBhQHu9wSsq62j_Md6A', '10');
INSERT INTO public.youtube_videos VALUES ('WB9Egi9leWA', 'Cuban Music Mix 🎶 Son Cubano, Cha Cha & Latin Jazz | Havana Love Songs Café Cubano | La Clave', '2025-09-21 05:00:36', 'UCPr_qJ3txALVZw8zcns3gcA', '10');
INSERT INTO public.youtube_videos VALUES ('yH1fk7WLiMc', 'Maluma - BRONCEADOR (Official Video)', '2025-07-18 00:00:06', 'UCFkoPRmuxqr37jvGmmpzhzQ', '10');
INSERT INTO public.youtube_videos VALUES ('BZIqOKGmDV4', 'Fiesta Latina Mix 2026 | The Best Latin Party Hits | KARYO & LOVUMBA LIVESET', '2025-12-04 16:00:06', 'UCDon__fFmiP4b5pUmbtzsKA', '10');
INSERT INTO public.youtube_videos VALUES ('Xtt78SW-mgg', 'Everybody wants to rule the world cover in Classical Latin (SOFTBARDCORE)', '2024-12-14 15:28:27', 'UCbVcb9puAsOhXBT2_XPFf-A', '10');
INSERT INTO public.youtube_videos VALUES ('VMp55KH_3wo', 'Gente de Zona - La Gozadera (Official Video) ft. Marc Anthony', '2015-06-05 22:00:00', 'UCfNRJSZ9FpkYK0ghVHDUuJQ', '10');
INSERT INTO public.youtube_videos VALUES ('_NwcW2GwFGY', 'LATINO PARTY MIX 2022 | LATIN CLUB MIX | REGGAETON GUARACHA DEMBOW 2022 4K DJ SET', '2022-05-13 18:42:52', 'UCOYewhdZ1yy0U_IZMSb7g3A', '10');
INSERT INTO public.youtube_videos VALUES ('TyHvyGVs42U', 'Luis Fonsi, Demi Lovato - Échame La Culpa', '2017-11-17 05:00:01', 'UCLp8RBhQHu9wSsq62j_Md6A', '10');
INSERT INTO public.youtube_videos VALUES ('dkGnWUfweUQ', 'Cuban Background Music – Son Cubano Classics - Buena Vista Social Club Inspired Vintage Vibes', '2025-07-21 20:09:03', 'UCD-Cf3w7_T12qa8xPHytEOA', '10');
INSERT INTO public.youtube_videos VALUES ('nD3e_CQQwmM', 'Latin song''s/Bésame mucho/Quién será/more cover/Masa miura', '2024-03-04 21:36:49', 'UCF0bSIx6OvPNwkLYXL3nzVQ', '10');
INSERT INTO public.youtube_videos VALUES ('wnJ6LuUFpMo', 'J Balvin, Willy William - Mi Gente (Official Video)', '2017-06-30 04:00:05', 'UCrHL_BF5lHyK43BxLU8-vBQ', '10');
INSERT INTO public.youtube_videos VALUES ('hKwCRJfiHBo', 'Classic Latin Romance, Baladas, Boleros, Grupo Romántico [Vinyl Studio Session] with DJ Pax', '2025-01-13 15:24:16', 'UCKKezBu7Y4onrE3E-xaVpfw', '10');
INSERT INTO public.youtube_videos VALUES ('QuSEbo03fc4', 'Becky G, Bad Bunny - Mayores (2017 Latin American Music Awards)', '2017-11-14 22:04:50', 'UCJrREGJ2R1mMuKJkZ8SMCcA', '10');
INSERT INTO public.youtube_videos VALUES ('n7OUYLY5DG4', 'Linkin Park - In The End cover in Classical Latin (Bardcore/Medieval Style Cover)', '2023-06-18 17:43:24', 'UCbVcb9puAsOhXBT2_XPFf-A', '10');
INSERT INTO public.youtube_videos VALUES ('NUsoVlDFqZg', 'Enrique Iglesias - Bailando ft. Descemer Bueno, Gente De Zona', '2014-04-11 07:00:01', 'UCVttQE6tS_agDSAU61Q65aA', '10');
INSERT INTO public.youtube_videos VALUES ('2ZSAAI2BC1U', 'Soft Slow Spanish Guitar Music w/ Piano Cafe Lounge Latin Relaxing Music', '2025-02-26 20:21:47', 'UCoKJ6OCoKl0ytVFBNp7bbwA', '10');
INSERT INTO public.youtube_videos VALUES ('YXnjy5YlDwk', 'Marc Anthony - Vivir Mi Vida (Official Video)', '2013-09-10 07:00:08', 'UCQhOf1GhzkMsyLAFwrnG8XQ', '10');
INSERT INTO public.youtube_videos VALUES ('FOtvRp-VEO0', 'Latin Party Mix | Workout Mix | Musica Latina para Bailar | Latin Dancing Music', '2023-06-09 23:00:07', 'UCUMYSG5KRHZajl9YIzIeqVw', '10');
INSERT INTO public.youtube_videos VALUES ('RGNv4XI0jgI', 'MIX LATIN POP #HITS (Victor Muñoz, Carlos Vives, Danni Ubeda, Fonseca, Chino y Nacho, BIP)', '2024-11-04 23:00:06', 'UCWUk7MGQfRCtLiKzlX9t_xA', '10');
INSERT INTO public.youtube_videos VALUES ('z1g_WMMFs88', '4 Hour Latin Instrumental Music Mix – Salsa, Bachata & Cumbia Fusion', '2025-11-01 23:00:05', 'UC46tz51bm2_7lX1mZeS_cmA', '10');
INSERT INTO public.youtube_videos VALUES ('TgJY0UcmtCA', 'Tropical House Mix | Latin, Brazilian & Afro House | Adam Port, Trinix, Hugel, Keinemusik & More…', '2025-05-15 20:30:06', 'UC_OOuK8shEVRkwAyspMcw6A', '10');
INSERT INTO public.youtube_videos VALUES ('BXGYJPUAbMM', 'Bossa Nova Covers 2026 – Relaxing Latin Jazz Covers for Work, Study & Evening Vibes 🎶🌿', '2025-06-06 10:59:48', 'UC4V1qDl2dlzXnomwbdJMWtQ', '10');
INSERT INTO public.youtube_videos VALUES ('c7l7Fnl0Oqo', '🔥 Summer Vibes Mix Latin 2026 🔥 - Latin Pop Electro x Reggaeton Hits x Dancehall 🔥', '2025-09-23 18:39:47', 'UCuWvwU6qYCizRhaWVq5FbEw', '10');
INSERT INTO public.youtube_videos VALUES ('fTKqtvXjkvo', 'Top Hits 2026 ~ Trending Songs 2026 ~ Top Songs 2026 Top Music 🎶🎧', '2025-06-27 18:54:01', 'UCYXIviXPAaaaU_AOotpXTAw', '10');
INSERT INTO public.youtube_videos VALUES ('MKaPVvXXhxk', 'Songs That Went Viral On Tik Tok That You Didn’t Know The Name Of, Pt. 2!🔥', '2022-08-27 20:07:15', 'UCb-iETlsaXr3fEG8znQjmZA', '10');
INSERT INTO public.youtube_videos VALUES ('zm4C9rx5fGY', 'The Brainrot Band - Ding Dong (Viral Song) (official song)', '2025-06-27 20:15:05', 'UCTjF8TNC7blVsBtWyMrsj4A', '10');
INSERT INTO public.youtube_videos VALUES ('LuzXr3He9NI', 'Top Hits 2026 Playlist ~ Trending Music 2026 🎵 Spotify Mix ~ Best TikTok Songs (Hits Collection)', '2025-10-29 11:58:50', 'UCci3lozteCexkJ4g0xj-9NQ', '10');
INSERT INTO public.youtube_videos VALUES ('Y5lrZeDf1T4', 'Best Emotional Viral Songs 2025 | TikTok Hits That Touched Millions /EverHits-moritabari ', '2025-12-20 16:16:17', 'UC0TTUIXCEWzqh66i65VGKgA', '10');
INSERT INTO public.youtube_videos VALUES ('uRiB1tsFIkE', 'KATSEYE - Gabriela (Lyrics)', '2025-07-26 13:17:05', 'UCNqFDjYTexJDET3rPDrmJKg', '10');
INSERT INTO public.youtube_videos VALUES ('rIt4pBtu0QA', 'Viral Spotify Song 2026🔥🎵| Newest English Love Song That Hit Deep | Soft Acoustic Playlist', '2026-02-20 21:00:56', 'UCpVkPcSVe4TWa91lj0s7Eaw', '10');
INSERT INTO public.youtube_videos VALUES ('cdTNj3y6G8I', 'Songs That Get Stuck in Your Head 🗣️🔥', '2025-10-25 17:14:37', 'UC1ovynwy4rDu3Yh1SIYewdg', '10');
INSERT INTO public.youtube_videos VALUES ('ed1RJCuNWAo', 'Positive Vibes Music 💗🎧|| New English Songs That Will Make You Feel Everything - Top Trending TikTok', '2025-10-04 23:19:18', 'UCL6LeUgTnxt1XsJVS71RTAQ', '10');
INSERT INTO public.youtube_videos VALUES ('DD2rp9pe6n4', 'Viral Songs On Tik Tok You Didn’t Know The Name of!🔥', '2023-01-28 06:22:18', 'UCb-iETlsaXr3fEG8znQjmZA', '10');
INSERT INTO public.youtube_videos VALUES ('k6aqTBFpPl0', 'VIRAL PHONK/FUNK SONGS 2025 🎵 PLAYLIST', '2025-12-23 06:45:04', 'UC0V5TmyzmC8-CGIBtyNAI7w', '10');
INSERT INTO public.youtube_videos VALUES ('7H3DiVmLG74', 'Libianca - People (Lyrics) did you check on me ? #people #libianca #lyrics #viral #trending #song', '2024-03-08 09:37:27', 'UC3Ioyv0BDo4DZlgB9WrynWQ', '10');
INSERT INTO public.youtube_videos VALUES ('2lnLrCo4bdY', 'Viral songs you CAN’T escape in 2025 🫣 (Bohahaha, Rock That Body, Pretty Little Baby & more)', '2025-06-26 07:03:16', 'UC9Vkr0WmRzVGxxIakJM8kQw', '10');
INSERT INTO public.youtube_videos VALUES ('wBcptk5YWQI', 'TOP VIRAL PHONK/FUNK PLAYLIST 🔥 | TIKTOK PHONK 2025🔥', '2026-01-29 13:01:45', 'UCz8UKjeBLJfxI6MgkAvj-UA', '10');
INSERT INTO public.youtube_videos VALUES ('ZvNnfTmBcME', 'Viral Song FEMALE version #trending Original Song of Bern Marzan ', '2025-09-14 09:16:38', 'UCJ8X6dgebxD00iJZ-mXjWog', '10');
INSERT INTO public.youtube_videos VALUES ('4UWwpyYF4lo', 'MOST VIRAL SONGS OF JULY 2025', '2025-07-02 15:14:34', 'UC_KcoTPA9EfXoM8uOo3vrpw', '10');
INSERT INTO public.youtube_videos VALUES ('IMf9O3x6KzM', 'VIRAL CHINESE FUNK/PHONK SONGS 2026 🎶 PLAYLIST', '2026-05-06 13:07:52', 'UCQ4lJJ8IcgycVm1FFYnkCIQ', '10');
INSERT INTO public.youtube_videos VALUES ('CDBoHKXtrjs', 'Try NOT To Sing 🤫 (2025 Top Viral Songs)', '2025-12-31 10:24:37', 'UC9Vkr0WmRzVGxxIakJM8kQw', '10');
INSERT INTO public.youtube_videos VALUES ('yZL_C-Kcxf0', 'Try not to sing! Most streamed songs of all time', '2023-02-12 16:49:58', 'UCgSZsQtFCXNmxB5irju2AOw', '10');
INSERT INTO public.youtube_videos VALUES ('t1MnvH6GPJ4', 'Ssc Exam Preparation Viral _ video 🥰Ankita Bhattacharya #short #viral', '2024-05-19 15:30:13', 'UCVpHD1Sk5Ixa7US7eWCrTSw', '10');
INSERT INTO public.youtube_videos VALUES ('q0I-N1wlwdE', 'Viral Songs Latest 🍓 Trending Tiktok Songs 2021', '2021-09-27 13:15:03', 'UCvt5p3A11M8zd8iJPCC5XvQ', '10');
INSERT INTO public.youtube_videos VALUES ('z985Q4eTnks', 'VIRAL PHONK/FUNK SONGS 2026', '2026-01-13 11:28:00', 'UCJaL41_6q8xgvBUqxyRGvPw', '10');
INSERT INTO public.youtube_videos VALUES ('mQwdGdMGQNo', 'VIRAL 2 SONGS OF ROLAND ABANTE BUNOT', '2023-06-20 00:13:45', 'UChGfvO911vVH2KeJjFWUw8Q', '10');
INSERT INTO public.youtube_videos VALUES ('DVxpjW99ueQ', 'Older rock & metal songs viral on TikTok - part 1', '2022-08-18 23:14:39', 'UC0EiruGxdY9xNUk-8ddrtgQ', '10');
INSERT INTO public.youtube_videos VALUES ('yFmkfJOOzE4', 'Singers Sing Their Songs Without Autotune (part 4) #viral #autotune #music #singing #WithoutAutotune', '2025-10-08 12:01:56', 'UC9qUY3XMOenRdJ4VvpoFlnA', '10');
INSERT INTO public.youtube_videos VALUES ('E0Y8OEo_zOc', 'Pop Music 2025 - Top Pop Songs 2025 - Billboard Top 100 🎧🔥 Justin Bieber Billie Eilish Miley Cyrus', '2025-07-12 17:51:04', 'UCYXIviXPAaaaU_AOotpXTAw', '10');
INSERT INTO public.youtube_videos VALUES ('XXYlFuWEuKI', 'The Weeknd - Save Your Tears (Official Music Video)', '2021-01-05 17:00:12', 'UCF_fDSgPpBQuh1MsUTgIARQ', '10');
INSERT INTO public.youtube_videos VALUES ('gPoiv0sZ4s4', 'M - Pop Muzik (Official HD Video)', '2011-09-06 13:02:00', 'UCgYxUOF2QRkHjThQouNoRVw', '10');
INSERT INTO public.youtube_videos VALUES ('nXeEQTnfljo', 'Spotify Pop Hits 2025 🔥 Lady Gaga, Bruno Mars, Ed Sheeran, Billie Eilish, Miley Cyrus, Tate McRae #1', '2025-08-08 10:00:54', 'UCq4LI1nsSdyUNdgPxfwJ2BA', '10');
INSERT INTO public.youtube_videos VALUES ('aSugSGCC12I', 'Sabrina Carpenter - Manchild (Official Video)', '2025-06-06 14:00:06', 'UC4mYKePIas5YgGfYZ2J2OxQ', '10');
INSERT INTO public.youtube_videos VALUES ('eVli-tstM5E', 'Sabrina Carpenter - Espresso', '2024-04-12 14:00:07', 'UC4mYKePIas5YgGfYZ2J2OxQ', '10');
INSERT INTO public.youtube_videos VALUES ('5GL9JoH4Sws', 'Fifth Harmony - Work from Home (Official Video) ft. Ty Dolla $ign', '2016-02-26 12:05:00', 'UC09d82usokACH1z5YeKnfiA', '10');
INSERT INTO public.youtube_videos VALUES ('plNmaCuPSYw', '2 Chainz - Pop Music ft. Moneybagg Yo, Beatking', '2022-01-21 05:00:31', 'UCeTDWSJawSuNbBEURTC6w_A', '10');
INSERT INTO public.youtube_videos VALUES ('6GT7qDORxAE', 'Top 20 Pop Songs 2026 ♫ Bruno Mars, Lady Gaga, Dua Lipa, Adele, Ed Sheeran, The Weeknd #32', '2026-05-06 10:00:04', 'UC0_cyKup0lzAh2yLNB_7Wog', '10');
INSERT INTO public.youtube_videos VALUES ('JGpQwM9fYnQ', 'Best Pop Hits Mix 2026 Vol. 3 🔥 Bruno Mars, The Weeknd, Ariana Grande, Justin Bieber, Ed Sheeran', '2026-03-03 05:00:31', 'UCdVxII5mXw0bBZXZ4R-sMxw', '10');
INSERT INTO public.youtube_videos VALUES ('kPa7bsKwL-c', 'Lady Gaga, Bruno Mars - Die With A Smile (Official Music Video)', '2024-08-16 04:00:36', 'UC07Kxew-cMIaykMOkzqHtBQ', '10');
INSERT INTO public.youtube_videos VALUES ('q5D2ZlBuG7g', '80s Greatest Hits Collection | Legendary Pop, Rock and Dance Classics', '2026-03-09 12:01:22', 'UC9VbclDBCTPprd223zbDKeg', '10');
INSERT INTO public.youtube_videos VALUES ('Oa_RSwwpPaA', 'Benson Boone - Beautiful Things (Official Music Video)', '2024-01-18 23:00:13', 'UCvILah8hAWYhYOmAG3ZjvBA', '10');
INSERT INTO public.youtube_videos VALUES ('NtTdainRvQ8', 'THE BEST 80S SONGS 💿 #80smusic #popmusic #80s', '2025-03-13 21:00:19', 'UCgezh1PRAAHcwXGvNXFtjVA', '10');
INSERT INTO public.youtube_videos VALUES ('Rg0fyvTDfu8', 'Rainy Days & Coffee 🎶 Relaxing Acoustic Pop Ballads Full Album to Calm Your Anxiety', '2025-12-21 23:00:39', 'UCslAPmeF_jQ8yPB074AvfTA', '10');
INSERT INTO public.youtube_videos VALUES ('9cZ7Nl3Ynxo', '“Soda Pop” KPop Demon Hunters (Soundtrack from the Netflix Film) | Saja Boys', '2025-06-26 21:32:54', 'UCE4pdOAge35Ylr-DJgvllbQ', '10');
INSERT INTO public.youtube_videos VALUES ('M11SvDtPBhA', 'Miley Cyrus - Party In The U.S.A. (Official Video)', '2009-09-25 22:56:39', 'UCpPwodiYc4ceaqEBB54trHQ', '10');
INSERT INTO public.youtube_videos VALUES ('cQuJn-d0KOY', 'Clean Pop Hits 🌈 Clean Music, Safe for Work, Family Friendly, School & Kids Music - Clean Mix 2026', '2026-03-05 11:00:54', 'UCq4zhQqEaUg7-OpXUSQn45A', '10');
INSERT INTO public.youtube_videos VALUES ('Bk5_aL3y4ig', '🎉 Pop Party Hits Mix #03 | Middle 2000s & Early 2010s Mix - Dj StarSunglasses', '2024-12-27 18:53:10', 'UCYtwkahMdrGeSQNyEe7IdEw', '10');
INSERT INTO public.youtube_videos VALUES ('WBy8ETk_Fqs', 'Spotify Pop Hits 2026 ♫ Lady Gaga, Bruno Mars, Ed Sheeran, Billie Eilish, Miley Cyrus, Tate McRae#13', '2025-10-08 10:00:17', 'UC0_cyKup0lzAh2yLNB_7Wog', '10');
INSERT INTO public.youtube_videos VALUES ('byxFUKxhT3s', 'Alex Warren - Ordinary (Lyrics)', '2025-04-30 13:17:52', 'UCNqFDjYTexJDET3rPDrmJKg', '10');
INSERT INTO public.youtube_videos VALUES ('9Vti9E-TASg', 'Tomorrowland 2025 (David Guetta, Martin Garrix, Tiesto, Meduza, Avicii, Axwell, Gigi D''Agostino)', '2025-07-22 16:29:45', 'UCjLpcmZgoxZGWAehyqYwO6g', '10');
INSERT INTO public.youtube_videos VALUES ('2UCBbcBT5Es', 'Rüfüs Du Sol Sunset Mix on the Desert', '2025-04-05 14:38:14', 'UCgwG7Tb7WohCHrDwLxB6JQQ', '10');
INSERT INTO public.youtube_videos VALUES ('gCYcHz2k5x0', 'Martin Garrix - Animals (Official Video)', '2013-06-17 14:30:09', 'UCB-7IEpKGIdXkgGUObE5D5A', '10');
INSERT INTO public.youtube_videos VALUES ('FC9MtWYShzg', 'Music For Soul - Ameno - Euro & Dance ft. Danekoo1', '2024-01-16 15:16:48', 'UCtby3goA8evD4vAiVzZtbpQ', '10');
INSERT INTO public.youtube_videos VALUES ('wJnBTPUQS5A', 'Alan Walker - The Spectre', '2017-09-15 07:02:57', 'UCJrOtniJ0-NWz37R30urifQ', '10');
INSERT INTO public.youtube_videos VALUES ('WHHmiWUqIZA', 'Argy & Omnya - Aria (Extended Mix)', '2023-09-21 23:00:23', 'UCH3RGiX9bimOPwQmEgrMAtg', '10');
INSERT INTO public.youtube_videos VALUES ('zeHTVxkycgE', 'MIX TECHNO DANCE 90''s( ATB, WHAT IS LOVE,  TONIGHT IS NIGHT, CORONA, RUN TO ME)#EURODANCE #PURODANCE', '2023-09-27 14:00:07', 'UCW3a1sQ28Q9KLp2eYIDcDww', '10');
INSERT INTO public.youtube_videos VALUES ('a4fv-BtzNmY', 'Electronic Music for Studying Concentration | Chill Out Electronic Study Music Instrumental Mix |', '2017-01-10 16:07:42', 'UC6mmtc9CwL6_-2Xq1cAg1Tg', '10');
INSERT INTO public.youtube_videos VALUES ('UScyjLs_XNU', 'Deep Melodic Techno & Trance Mix — Music for Focus, Drive, and Chill', '2025-08-05 21:00:06', 'UCHBfQT8w01kthXFNMURsxrw', '10');
INSERT INTO public.youtube_videos VALUES ('ZgvJgqi_DFk', 'MÚSICA ELETRÔNICA 2025 🔥 ELETRÔNICAS 2025 MAIS TOCADAS 🔥 Alok, Vintage Culture & David Guetta', '2024-12-26 18:05:56', 'UCxM51ORxYHWULncNyfpTa3w', '10');
INSERT INTO public.youtube_videos VALUES ('z_7F9q7EIoI', 'Deep Melodic Techno & Trance Journey – Hypnotic Mix for Travel', '2025-09-28 05:44:27', 'UCIFh-_62PuXdMkvGhVYZZ5g', '10');
INSERT INTO public.youtube_videos VALUES ('R2KeQqLzr00', 'Kato & Jon - Turn The Lights Off (UNKNX, Zylarion, Adrian Vale) TRANCE VERSION - Elite Trance Music', '2025-12-22 15:36:46', 'UCNwskcb3I_iDDd5D56ozpXw', '10');
INSERT INTO public.youtube_videos VALUES ('EJqFjvKF8HU', 'DARK HOUSE 2025 🖤 Deep Hypnotic Electronic Experience', '2025-12-30 19:00:18', 'UCilF9-bqOHHJwJZlnlQYIrw', '10');
INSERT INTO public.youtube_videos VALUES ('HFvjFC-YmHE', 'Alan Walker, Dua Lipa, Coldplay, Martin Garrix & Kygo, The Chainsmokers Style 🔥 Summer Vibes #1', '2025-02-14 09:00:31', 'UCSU6XsiztZxbP-oSHmsfWpw', '10');
INSERT INTO public.youtube_videos VALUES ('mC_eGKko9FA', 'TOP 5 Techno songs of the Month 🔥', '2024-09-05 17:54:58', 'UC04BY9XdbTltt3PYOaGGMkA', '10');
INSERT INTO public.youtube_videos VALUES ('N6DW31S_oyI', 'Mega Hits 2025 🌱 The Best Of Vocal Deep House Music Mix 2025 🌱 Summer Music Mix 2025 #4', '2025-01-17 08:14:40', 'UCw527CsYYlcRVR3W2ywMV0A', '10');
INSERT INTO public.youtube_videos VALUES ('2z8GIdGkWnE', 'TECHNO MIX 2026 💣 Remixes Of Popular Songs 💣 Only Techno Bangers', '2026-05-01 15:00:07', 'UCPVNT9hahuwpVwEpAgO0BtQ', '10');
INSERT INTO public.youtube_videos VALUES ('hum1d7yvmXU', '90s Trance Classics Mix (Vinyl DJ Set) | A STATE OF TRANCE | Armin van Buuren, Paul van Dyk, Tiesto', '2025-03-26 12:00:06', 'UCZujT6fgrvbRGdBj24q_ZDA', '10');
INSERT INTO public.youtube_videos VALUES ('mdpSxWU4mv0', 'La Mejor Música Electrónica 2026 ️🎵 LOS MAS ESCUCHADOS ️🎵 Lo Mas Nuevo 🎶 Electronic Music Mix 2026', '2025-12-18 20:21:53', 'UCxM51ORxYHWULncNyfpTa3w', '10');
INSERT INTO public.youtube_videos VALUES ('HvkAfj1QnK8', 'Korolova @ Tulum(Mexico) [Melodic Techno & Progressive House Mix]', '2026-02-26 18:00:07', 'UC0VG86SRO2X47HU20nQtDeA', '10');
INSERT INTO public.youtube_videos VALUES ('qAIy8godTy4', 'Electro Pop 2000 | The Best Electro Music 2021 | Electro Pop Party | Dj Roll Perú 🔥', '2021-07-17 23:45:18', 'UCj81KaRVv7hBbM8qqv4Kh1g', '10');
INSERT INTO public.youtube_videos VALUES ('CE5i5Sf56vY', 'Música SUMMER Alegre para Trabajar en Oficinas, Tiendas, Cafés | Música SUMMER En Inglés 2025 #29', '2025-04-29 10:28:36', 'UCNnQqoYFCqLID3GAMkGtS6A', '10');
INSERT INTO public.youtube_videos VALUES ('b20j_p5_dwI', 'EDM Relax #14: Ocean Vibes 🎧 Chill EDM for Peaceful Everyday Flow', '2025-10-07 10:45:09', 'UCvbRrx-ASjO4HT5sgUez1Ag', '10');
INSERT INTO public.youtube_videos VALUES ('V6I7-39fn2Y', 'Ibiza Summer Mix 2023 🍓 Best Of Tropical Deep House Music Chill Out Mix 2023🍓 Chillout Lounge #117', '2023-12-21 20:17:18', 'UC_IleaoZ0fgSbDrnWoFdTDA', '10');
INSERT INTO public.youtube_videos VALUES ('E8xJaL_tMjw', 'Vivaldi & Mozart & Beethoven Techno Session | MIX Historical Techno | 3 LEGENDS', '2026-04-10 18:49:39', 'UC3yYq-Q4kOBMGUKXJXreO2A', '10');
INSERT INTO public.youtube_videos VALUES ('YNVU7r0qVhU', 'New Tiktok Mashup 2026 Philippines Party Music Viral Dance Trends May 6th', '2026-05-05 23:00:07', 'UCEplDDv2Vs6PI25pY-A9ATg', '10');
INSERT INTO public.youtube_videos VALUES ('wPCMekJog4o', 'TikTok Songs 2025 ~ Top TikTok Songs Playlist ~ Top Songs 2025 🎶🎧', '2025-06-21 13:45:11', 'UCYXIviXPAaaaU_AOotpXTAw', '10');
INSERT INTO public.youtube_videos VALUES ('TAx7x0rBdnY', 'New Tiktok Mashup 2026 Philippines Party Music Viral Dance Trends May 4th', '2026-05-03 23:00:06', 'UCEplDDv2Vs6PI25pY-A9ATg', '10');
INSERT INTO public.youtube_videos VALUES ('N-prD5sprfs', 'New Tiktok Mashup 2026 Philippines Party Music Viral Dance Trends May 5th', '2026-05-04 23:00:06', 'UCEplDDv2Vs6PI25pY-A9ATg', '10');
INSERT INTO public.youtube_videos VALUES ('yoZy2E17-50', 'Phao - 2 Phut Hon (KAIZ Remix) | TikTok Vietnamese Music 2020', '2020-11-28 14:03:16', 'UCviq8Ih6BhHmlLEtcXEG_XQ', '10');
INSERT INTO public.youtube_videos VALUES ('PImxg_WTtSc', 'Tiktok mashup 2025 📀 Best tiktok songs 2025 ~ Tiktok viral songs', '2025-07-24 11:00:46', 'UCvt5p3A11M8zd8iJPCC5XvQ', '10');
INSERT INTO public.youtube_videos VALUES ('8inug0w8sXI', 'The Black Eyed Peas - Rock That Body (Zusebi Remix) [TikTok]', '2025-07-03 14:14:10', 'UCjw1oJ4kNmyVWiU858O0WmQ', '10');
INSERT INTO public.youtube_videos VALUES ('pO1XzKWCLIs', 'NEW🔥BEST HAWAK MO ANG BEAT LATEST TIKTOK VIRAL TREND DANCE NONSTOP REMIX 2026,🇵🇭', '2026-03-16 23:25:25', 'UCiaSWS6dgEp3135QV1jmdCw', '10');
INSERT INTO public.youtube_videos VALUES ('reKQO4zrG64', 'Best tiktok Songs Mashup 2025 - Tiktok songs 2025 playlist #tiktokhits', '2025-01-19 00:12:16', 'UCOUqaKtbHHL7F1zOsYL0R6g', '10');
INSERT INTO public.youtube_videos VALUES ('msZ0znCqn-0', 'TOP 5 TIKTOK VIRAL SONGS MAY', '2025-05-23 00:49:12', 'UC_KcoTPA9EfXoM8uOo3vrpw', '10');
INSERT INTO public.youtube_videos VALUES ('Slq4aeE8FoE', 'Alma Zarza - Tutu (Lyrics) tutututu tutututu [tiktok song]', '2021-07-22 20:47:20', 'UC-AlofdKECUdhXrbJQZ6iEg', '10');
INSERT INTO public.youtube_videos VALUES ('zMOWE6m4iP0', 'What It Is - Doechii | lyrics | aesthetic | english songs | Slowed | whatsapp status | speed up 🎶', '2025-08-31 20:11:03', 'UClosTbsE0_rJWxih0BtRwaw', '10');
INSERT INTO public.youtube_videos VALUES ('PqF4QhB7IIU', 'Trending TikTok Songs 2026', '2026-02-18 14:00:41', 'UCKgwCnviw2cTzWTe3pOO52g', '10');
INSERT INTO public.youtube_videos VALUES ('mpk4ih1PNjM', 'how long have you  been on TiKTOK? #songs #unholy #fyp #TiKTOK #nostalgia #2020 #2021 #2022 #2023', '2025-06-09 07:37:33', 'UC6_muGdOkCSgLtaW6frnvgA', '10');
INSERT INTO public.youtube_videos VALUES ('vhodXy0A-Es', 'Top TikTok Songs of 2022', '2022-12-30 15:27:03', 'UCM_D1Gw5StkOffHbSId-1Rw', '10');
INSERT INTO public.youtube_videos VALUES ('4NOXfqO0l9g', 'Sped Up TikTok Audios ♡ (Not My Problem - Laila!)', '2024-07-14 02:10:43', 'UC7_8w5vHeMPli0A0QA3g8RQ', '10');
INSERT INTO public.youtube_videos VALUES ('jEPqUxSDadI', '100 TIKTOK Songs You DON´T KNOW the NAME (2025)', '2025-06-28 14:01:14', 'UCUEmIc6QOle3caUN--BGPyQ', '10');
INSERT INTO public.youtube_videos VALUES ('GkHgQB4Wm7k', 'TIKTOK songs by The Moonies Official ⭐️ Compilation of your favorite hits', '2022-07-26 16:00:12', 'UCI7BklpY2s6rd_5RN1c3f1Q', '10');
INSERT INTO public.youtube_videos VALUES ('a5Dn9XiChTk', '🚀 Only 1% Know All 20 Songs! 🚀 Mega Tik Tok Mashup 2026 | March', '2026-03-10 17:00:01', 'UCNoipNKdYgkTeYfYndii43Q', '10');
INSERT INTO public.youtube_videos VALUES ('1RhiEJqsyLI', 'TikTok Nomoa Umi Rawa Folom', '2026-02-19 22:55:17', 'UCUh6KxkFhnELALvKKaDzaPw', '10');
INSERT INTO public.youtube_videos VALUES ('mw7R4RLmBg4', 'Top Edit Audios 🎧 Viral TikTok Sounds for Edits 2026', '2026-05-03 13:38:16', 'UCz0bTBtvhXucu4Mt0uv4BPg', '10');
INSERT INTO public.youtube_videos VALUES ('gLYFLd88Xu4', 'New Tiktok Mashup 2026 Philippines Party Music Viral Dance Trends May 2nd', '2026-05-01 23:00:06', 'UCEplDDv2Vs6PI25pY-A9ATg', '10');
INSERT INTO public.youtube_videos VALUES ('78wrful9cVU', 'Olivia Rodrigo - drop dead (Official Music Video)', '2026-04-17 04:00:06', 'UCxE5jEls-T0QtlTHT8lI1lw', '10');
INSERT INTO public.youtube_videos VALUES ('1FVF-9KQiPo', 'Taylor Swift - Opalite (Official Music Video)', '2026-02-08 13:00:02', 'UCqECaJ8Gagnn7YCbPEzWH6g', '10');
INSERT INTO public.youtube_videos VALUES ('kiB9qk4gnt4', 'Kodak Black - Super Gremlin [Official Music Video]', '2021-11-01 19:00:15', 'UChEYVadfkMCfrKUi6qr3I1Q', '10');
INSERT INTO public.youtube_videos VALUES ('rtwpk9rb1Dc', 'Tyla - SHE DID IT AGAIN (Official Music Video) ft. Zara Larsson', '2026-04-17 04:00:06', 'UCr2xjaS7CIx1OY7hYwrXb8A', '10');
INSERT INTO public.youtube_videos VALUES ('hwUixddbmrQ', 'Morgan Wallen - I Got Better (Official Music Video)', '2025-10-01 17:00:07', 'UCiQtJ9wVv8R-x7GKHzgZu8A', '10');
INSERT INTO public.youtube_videos VALUES ('7gKpREE5Z3w', 'DJ Khaled, Future, Lil Baby - One of Them (Official Music Video)', '2026-04-10 04:00:06', 'UCrFB54bqp8sda4udJyNswlA', '10');
INSERT INTO public.youtube_videos VALUES ('aSkFygPCTwE', 'Kid Rock - All Summer Long [Official Music Video]', '2009-10-29 21:24:40', 'UCpFUD5sd3RV-Dcw_sof3AOw', '10');
INSERT INTO public.youtube_videos VALUES ('lY5V4hSLWY8', 'Bruno Mars - Risk It All [Official Music Video]', '2026-02-27 05:00:08', 'UCoUM-UJ7rirJYP8CQ0EIaHA', '10');
INSERT INTO public.youtube_videos VALUES ('u9Dg-g7t2l4', 'Disturbed  - The Sound Of Silence (Official Music Video) [4K UPGRADE]', '2015-12-08 15:28:55', 'UCveWMJeHgcIUPMnFzd7Vxjg', '10');
INSERT INTO public.youtube_videos VALUES ('LHCob76kigA', 'Lukas Graham - 7 Years [Official Music Video]', '2015-12-15 15:01:55', 'UCs8ynQgjoKZblUXosXoeOEQ', '10');
INSERT INTO public.youtube_videos VALUES ('bkNaPl4kg7g', 'Kevin Gates - Dangerous (Official Music Video)', '2026-01-14 05:00:07', 'UCj2GTFekdV3EUsTVN8oaEqA', '10');
INSERT INTO public.youtube_videos VALUES ('XXIX2WnfbpE', 'Lady Gaga, Doechii - RUNWAY (Official Music Video)', '2026-04-27 19:00:23', 'UC07Kxew-cMIaykMOkzqHtBQ', '10');
INSERT INTO public.youtube_videos VALUES ('KWoTyfPsqbE', 'Sabrina Carpenter - House Tour (Official Video)', '2026-04-06 15:00:06', 'UC4mYKePIas5YgGfYZ2J2OxQ', '10');
INSERT INTO public.youtube_videos VALUES ('4LfJnj66HVQ', 'Lil Pump - Gucci Gang [Official Music Video]', '2017-10-23 16:05:47', 'UC6pjHMC4QXMi4llCCjtDXWg', '10');
INSERT INTO public.youtube_videos VALUES ('5anLPw0Efmo', 'Evanescence - My Immortal (Official HD Music Video)', '2009-12-02 09:48:59', 'UCDDmukrq0bwckrp09bNt-Rw', '10');
INSERT INTO public.youtube_videos VALUES ('5-ZiKXrnvog', 'Dynasty (Official Music Video) | MIIA', '2016-02-04 18:21:27', 'UCpoShuhB7tOW-HkyjEvcNfA', '10');
INSERT INTO public.youtube_videos VALUES ('xPLGXQr7_vs', 'Sexyy Red - If You Want It (Official Music Video)', '2026-03-06 21:00:06', 'UC28rc3PHWPJib68G-VqpJ3w', '10');
INSERT INTO public.youtube_videos VALUES ('cgH0vpl4nQk', 'MARIAMU BY J.N GAKUHI (OFFICIAL AUDIO)', '2026-05-06 05:54:45', 'UChjLIA7wFY5JgGEO2IjgZIQ', '10');
INSERT INTO public.youtube_videos VALUES ('AxFdeZER8Eg', 'Brooks & Dunn - Neon Moon (Official Audio)', '2021-09-24 07:00:02', 'UCJEgEKxyyoM8K1jpzfmZz-A', '10');
INSERT INTO public.youtube_videos VALUES ('mjaayCARwro', 'Kodak Black - ZEZE (feat. Travis Scott & Offset) [Official Audio]', '2018-10-12 04:00:03', 'UChEYVadfkMCfrKUi6qr3I1Q', '10');
INSERT INTO public.youtube_videos VALUES ('3ByIYof4mqo', 'Journey - Open Arms (Official Audio)', '2013-09-15 07:25:43', 'UCoehRqkqt8QGZCWPrXxltXg', '10');
INSERT INTO public.youtube_videos VALUES ('9g08kucPQtE', 'Gunna & Future - pushin P (feat. Young Thug) [Official Audio]', '2022-01-07 05:00:56', 'UCAkIMkEaa9sZmjcy7mfd5lQ', '10');
INSERT INTO public.youtube_videos VALUES ('T_Km11HNzUY', 'Cheap Trick - Surrender (Official Audio)', '2017-05-19 20:42:06', 'UCSomIwKuzh9QOMKsLTHemcg', '10');
INSERT INTO public.youtube_videos VALUES ('X2DTROC4JCI', 'Future - Solo (Official Audio)', '2023-09-22 07:00:13', 'UCFNosi99Sp0_eLilBiXmmXA', '10');
INSERT INTO public.youtube_videos VALUES ('XXx6RDzR6eM', 'Al Green - Let''s Stay Together (Official Audio)', '2017-02-02 19:37:06', 'UCiE5dPVpnFpPl8ki4QjLH5Q', '10');
INSERT INTO public.youtube_videos VALUES ('_n9HhmX36Gk', 'Michael Jackson - Human Nature (Official Audio)', '2022-11-22 08:00:12', 'UCulYu1HEIa7f70L2lYZWHOw', '10');
INSERT INTO public.youtube_videos VALUES ('emjLXdsj6xA', 'Elvis Presley - (You''re The) Devil in Disguise (Official Audio)', '2013-11-08 08:00:01', 'UCSEmH1YyFWltSBYkfLMtkcg', '10');
INSERT INTO public.youtube_videos VALUES ('pmrTPAejtAw', 'Chris Brown - Grass Ain''t Greener (Official Audio)', '2016-05-05 07:00:01', 'UCm1dsgJNnhaLkY3uAdqN4mA', '10');
INSERT INTO public.youtube_videos VALUES ('NL7fgnv_VlQ', 'CHÊ LOKEDO - DA MODA VÉIA (CLIPE OFICIAL)', '2026-05-06 14:00:06', 'UC8T-7tlQRA_IEk_VTc8kKig', '10');
INSERT INTO public.youtube_videos VALUES ('vuzCHdN9Okk', 'PISEIRO HAWAIANO - COLOCADINHA VAI VAI (Clipe Oficial) MC GW, DJ Marcão 019 e DJ Dédda', '2024-10-06 15:00:54', 'UCIcC20Zdy6PYASADaGQV_Eg', '10');
INSERT INTO public.youtube_videos VALUES ('s49rOuVY3s0', 'João Gomes Cantor - VIRA LATA - João Gomes e Pabllo Vittar (Clipe Oficial)', '2024-12-13 21:00:08', 'UCIW4y9tEpVmx_iezUVA9blQ', '10');
INSERT INTO public.youtube_videos VALUES ('P2LopW59duA', 'Mattos Nascimento - É Mentira Dele (Clipe Oficial)', '2026-05-05 14:00:06', 'UCmSwWtFDjIw9m3gaNnnjMMQ', '10');
INSERT INTO public.youtube_videos VALUES ('7IoSkJ-gnzM', 'EBONY - Extraordinária (Clipe Oficial)', '2025-11-21 13:00:29', 'UCXnRIJaU0hpaEJfFWphHJ-g', '10');
INSERT INTO public.youtube_videos VALUES ('TBeGecLND84', 'DENNIS, Luísa Sonza - MOTINHA 2.0 (Mete Marcha) CLIPE OFICIAL', '2025-02-14 00:00:06', 'UCrPMM16a2XymtrPJwFW4kAQ', '10');
INSERT INTO public.youtube_videos VALUES ('QcS9ZndErHc', 'Luísa Sonza, Pabllo Vittar, Anitta - MODO TURBO (Clipe Oficial)', '2020-12-22 00:00:10', 'UCnJoUTYXU142gxoyDzp-KRQ', '10');
INSERT INTO public.youtube_videos VALUES ('OLVIwchMHxc', 'PARAÍSO DO TUIUTI 2026 - CLIPE OFICIAL RIO CARNAVAL', '2025-09-15 15:00:07', 'UCNauntDSSJY2kSODiVBg4jQ', '10');
INSERT INTO public.youtube_videos VALUES ('xcrf_RKjaB4', 'CRESCE, ÁRVOREZINHA!☀️🌱(Clipe Oficial Maya Kids)', '2026-05-06 20:30:00', 'UC56fUQZBWr99e3t88E60RHw', '10');
INSERT INTO public.youtube_videos VALUES ('gQihxm0-U64', 'Luísa Sonza - Loira Gelada (Clipe Oficial)', '2026-04-08 15:00:06', 'UCnJoUTYXU142gxoyDzp-KRQ', '10');
INSERT INTO public.youtube_videos VALUES ('yKfhCPaVyYg', 'XUXU - Antônio e JP (Clipe Oficial) ', '2026-05-01 21:00:07', 'UC5b8vtiacMXVij1euJ2USeQ', '10');
INSERT INTO public.youtube_videos VALUES ('6vOrbsVLPlg', 'Aline Barros e ImaginAline | Dança Do Pinguim - Ao Vivo (Clipe Oficial)', '2026-05-05 14:00:29', 'UC5PTvkiV9Buv7pb_OtxLbaQ', '10');
INSERT INTO public.youtube_videos VALUES ('xJuVY0o7mak', 'Brazilian Funk Mix 2024 🇧🇷 | The Best of Brazilian Funk 🔥 | Vaïbz Party #7 🎉 | By DJ T-Sia 🎧', '2024-09-25 08:52:35', 'UCgaJRWSfQbc-48c5f63pgWg', '10');
INSERT INTO public.youtube_videos VALUES ('vqKsHbyjjjI', 'VEM QUEBRANDO - MC Danone (Funk De BH) Prod. Dj THG e HM Oliveira', '2023-07-21 15:06:19', 'UCWZ3i_eR28M8aFBKxOt0_AA', '10');
INSERT INTO public.youtube_videos VALUES ('1fdv0OIhzzA', 'MC Livinho - Cheia de Marra (KondZilla) | Official Music Video', '2016-05-23 22:52:30', 'UCffDXn7ycAzwL2LDlbyWOTw', '10');
INSERT INTO public.youtube_videos VALUES ('bKKRNscf5c4', 'LOS VOLTAJE [ ULTRA SLOWED ] [BRAZILIAN FUNK] 💀🥶🥵', '2025-06-01 14:28:18', 'UC7skCV2_5lmzY4wDVO5aT6g', '10');
INSERT INTO public.youtube_videos VALUES ('FY3m6hMyh3g', 'Nego do Borel - Me Solta (kondzilla.com) | Official Music Video', '2018-07-09 22:00:13', 'UCffDXn7ycAzwL2LDlbyWOTw', '10');
INSERT INTO public.youtube_videos VALUES ('3dBfojujJiQ', 'BRAZILIAN 🇧🇷 BAILE FUNK MIX | #03 | Remixes of Popular Songs - Mixed by Deejay FDB', '2024-12-18 14:59:27', 'UC2ueaijlcU0rk1oYYJOYReQ', '10');
INSERT INTO public.youtube_videos VALUES ('5SMmxqA6-58', 'MIX TOP FUNK BRASILERO 1 - MAELO MIX 2023', '2023-07-25 02:14:33', 'UCEPcRzWmOfGKyD6bSXt0G0Q', '10');
INSERT INTO public.youtube_videos VALUES ('JjPtDl6EJ3o', 'MONTAGEM XONADA', '2025-07-05 22:01:40', 'UCz-rxehhsrMAyBEJdf4NG2w', '10');
INSERT INTO public.youtube_videos VALUES ('a9MyzWfv4WU', 'MC Buzzz - Bota Bota (Official Video)', '2019-09-26 14:24:10', 'UC6na0K81s8Ean-rTE-zbtLg', '10');
INSERT INTO public.youtube_videos VALUES ('NWEd-92QkU8', 'TRAP NACIONAL 2024 -  #PLAYLIST - FELIPE RET, ORUAM, CHEFIN, TZ DA CORONEL, CABELINHO, L7', '2024-04-26 09:00:07', 'UCS1uxC6jyjQuUes3L6ySXsA', '10');
INSERT INTO public.youtube_videos VALUES ('crJNdgAqTRQ', 'Real Trap - Borges x Flacko x Meno Tody', '2020-03-22 22:15:11', 'UCBRWI1h-efdTbVZK6RQdGqA', '10');
INSERT INTO public.youtube_videos VALUES ('vau8mq3KcRw', 'Rincon Sapiência - Ponta de Lança (Verso Livre)', '2016-12-26 20:51:53', 'UCTR_tkH-7XWytiLHGJnWspQ', '10');
INSERT INTO public.youtube_videos VALUES ('3WQPW2OuUvk', 'Mc Sid - Brasil de Quem: Até Quando? (Prod. Lerym)', '2026-01-22 21:00:07', 'UCAe6HU3wR0FCdIzkg22TgWw', '10');
INSERT INTO public.youtube_videos VALUES ('i6fy_hdZ62I', 'Dj Victor Lopes - Rap Nacional Brasil/Brazilian Hip Hop - Home Session #5', '2024-04-15 07:28:02', 'UCExVBY3EKgwqrVcAnH9ttnw', '10');
INSERT INTO public.youtube_videos VALUES ('FCMyTR1SJM8', 'Zé Felipe, Ana Castela - Sua Boca Mente (Clipe Oficial) | You’re Still the One', '2025-10-03 15:00:07', 'UCe1HjlqnaxERsqpw0ZnLXvA', '10');
INSERT INTO public.youtube_videos VALUES ('owjosMjFas0', 'MEGAMIX ｜ SERTANEJO + PISEIRO ｜ ForróNejo 2025  SAMUK A NO BEAT  03', '2025-07-18 15:00:06', 'UCWz3PdN6UqW9u72UObR0h3A', '10');
INSERT INTO public.youtube_videos VALUES ('8y5wbqEbj8Q', 'João Bosco e Vinícius - Amiga Linda (oficial)', '2017-09-15 14:11:59', 'UCDX3MD1sjB_OKAoWMfSfMmw', '10');
INSERT INTO public.youtube_videos VALUES ('eAmNdjkT5wU', 'Sertanejo 2026 💔 Mix 1 Hora As Mais Tocadas (Pra Chorar)', '2026-04-30 23:00:51', 'UCTf9OwhI5Os1F1A4W02K73Q', '10');
INSERT INTO public.youtube_videos VALUES ('wxLE0V9EFqg', 'Zé Neto e Cristiano - POR NOSSOS FILHOS - DVD Um Novo Sonho', '2017-01-20 18:00:04', 'UCRRu9OXVYd5clj2Bs29gUVQ', '10');
INSERT INTO public.youtube_videos VALUES ('YsL6eRCIwqw', 'MEGAMIX | SERTANEJO + PISEIRO | ForróNejo 2025 [ SAMUK-A NO BEAT ] 03', '2025-06-05 13:01:05', 'UCGQXnXP9ut8J9O20tz7J8Ag', '10');
INSERT INTO public.youtube_videos VALUES ('6qwNoI2aVGo', 'MIX SERTANEJO 2026 || As Melhores Musicas Sertanejas 2026 HD || Sertanejo 2026 Mais Tocadas', '2026-03-27 10:28:58', 'UCn0NUsrqao9WNBO6A-hIEOg', '10');
INSERT INTO public.youtube_videos VALUES ('yvTSFJWFMvs', 'FLOR DESTRUÍDA - Silveira e Silverinha  (HOMENAGENS) #sertanejo #musica #sertanejoraiz  #modao', '2025-08-04 20:45:02', 'UCSZO9oGGHsjvyEvNem7qAOw', '10');
INSERT INTO public.youtube_videos VALUES ('aPqYwUPyZN0', 'Ana Castela ft. @zezedicamargoeluciano  Você Vai Ver (DVD Herança Boiadeira Rodeio)', '2026-02-27 00:00:07', 'UCRD1ypvmK7e_05Rtu9zHOfQ', '10');
INSERT INTO public.youtube_videos VALUES ('dzxjvHWocLA', 'Gino & Geno - Coração Cigano #sertanejo #modao #modaoraiz #classico #aovivo #raiz', '2025-02-06 21:00:29', 'UCwuBNS7gH0rguuRj80VTeEw', '10');
INSERT INTO public.youtube_videos VALUES ('EMKupc9_FfM', '🔥 1 Hora de PAGODE 90 na Praia - PAGODE DO LELECO', '2025-08-30 14:00:31', 'UCIbM7_vOcqn4ApWtQlKrOSA', '10');
INSERT INTO public.youtube_videos VALUES ('M_p_LUseXGk', 'Playlist de PAGODE e SAMBA com PÉRICLES, THIAGUINHO, ZECA PAGODINHO e mais! | Top Playlist', '2022-01-16 14:00:07', 'UCIzAIM-zatIDHErC0Z23hbQ', '10');
INSERT INTO public.youtube_videos VALUES ('ydJ7JGC9jVM', '3 HORAS DE PAGODE NA PRAIA SEM PARAR - PAGODE DO LELECO', '2025-06-01 14:30:07', 'UCIbM7_vOcqn4ApWtQlKrOSA', '10');
INSERT INTO public.youtube_videos VALUES ('F0aus83qTW0', '10 Horas de Pagode SEM PARAR 🔥 | Só Sucessos e Clássicos do Samba e Pagode (Raíz + Atual) 🎶 Leleco', '2025-12-28 14:06:40', 'UCIbM7_vOcqn4ApWtQlKrOSA', '10');
INSERT INTO public.youtube_videos VALUES ('T4tKkfBQRAY', 'Pagode na Praia - Essa Tal Liberdade / Que Se Chama Amor / Marrom Bombom / É Tarde Demais', '2024-08-24 14:02:43', 'UCIbM7_vOcqn4ApWtQlKrOSA', '10');
INSERT INTO public.youtube_videos VALUES ('6p3ETYgcEN8', 'Péricles - Supera  (Pagode do Pericão)  [VIDEO OFICIAL]', '2019-05-03 21:57:44', 'UCOUqW2QqiOFK9fXA5cAOENA', '10');
INSERT INTO public.youtube_videos VALUES ('pLKlUP_BF70', 'Pagode 90 na Praia - Cheia de Manias / Vida Cigana / Quando Te Encontrei / Deus Me Livre', '2025-07-19 14:01:30', 'UCIbM7_vOcqn4ApWtQlKrOSA', '10');
INSERT INTO public.youtube_videos VALUES ('wTArapD8l0w', 'Relíquias do Samba 🔥 Pagode das Antigas Ao Vivo no Bar do Celso com Bruno Camilo', '2025-06-21 20:00:40', 'UC_7GiQOND1GwDXNn5rgbeew', '10');
INSERT INTO public.youtube_videos VALUES ('sJuLi84tZy8', 'Turma do Pagode - Só um Pagode (Ao Vivo)', '2022-11-11 15:00:09', 'UCB_K7fledSSBoRcl2O38b-Q', '10');
INSERT INTO public.youtube_videos VALUES ('GYoUeBjOCZQ', 'Pagodes de verão 2026! 😎🏖️', '2025-12-17 23:38:15', 'UCM_RLbU3eA0AyLenx4cJ7bg', '10');
INSERT INTO public.youtube_videos VALUES ('DosMGo4wNec', 'Vou Zuar, Grupo Menos é Mais I Na Mesma Roda (COMPLETO)', '2025-07-04 21:50:59', 'UCAbn3JX6JiMZuPId8EpmaxQ', '10');
INSERT INTO public.youtube_videos VALUES ('sh_5wKArt-o', 'Péricles - Pagode do Pericão Ao Vivo em São Paulo - Parte 1 COMPLETA (Vídeo Oficial)', '2025-04-16 23:00:08', 'UCOUqW2QqiOFK9fXA5cAOENA', '10');
INSERT INTO public.youtube_videos VALUES ('0j2dBAlv9lQ', 'Turma do Pagode - Mixturadin 3 (Show Completo)', '2025-05-17 15:00:03', 'UCTihF8dW95hPDTSyxbJVczA', '10');
INSERT INTO public.youtube_videos VALUES ('y0E96wDzm-I', 'Forró Com Piseiro', '2024-07-21 21:21:07', 'UCKMUZJmtA6SAC2LRyPXq7nQ', '10');
INSERT INTO public.youtube_videos VALUES ('0GdwfDhRzLY', 'Djavú & Bonde do Forró - DVD O ENCONTRO ( As antigas )', '2025-05-19 14:17:00', 'UCL4cty81pHxPxZjRavDPZwQ', '10');
INSERT INTO public.youtube_videos VALUES ('KfrPqx5J4F8', 'Djavú & Bonde do Forró - Pra Não Pensar em Vc', '2025-04-20 14:19:15', 'UCL4cty81pHxPxZjRavDPZwQ', '10');
INSERT INTO public.youtube_videos VALUES ('w1eiO6QkQDY', 'Alemão do Forró ao vivo - SISTEMA BRUTO ', '2024-10-25 21:00:07', 'UCCrT2C0TsEyz8KVv_ztktog', '10');
INSERT INTO public.youtube_videos VALUES ('G4F7xkPK59o', 'Brincar de amar - Mastruz com Leite / Audiovisual Vem Dançar Forró (Parte 01)', '2026-04-03 15:00:00', 'UCM90FaSFuIXwj6-oZMrbNsA', '10');
INSERT INTO public.youtube_videos VALUES ('KvrYmPp0IXY', 'DVD - Chicote De Luxo- Morena Bonitona Ao Vivo  2025', '2025-01-17 13:11:41', 'UCJNjiZ0oPI9neh3ztrza9rg', '10');
INSERT INTO public.youtube_videos VALUES ('p_-VnONVoOQ', 'FORRÓ PRA CHURRASCO - HENRIQUE E JULIANO AS MELHORES NO XOTE', '2025-12-24 21:30:08', 'UCmoLE2e5yFnjuBOYAlW-DKg', '10');
INSERT INTO public.youtube_videos VALUES ('hGD_KsvTxfo', '100Km de Forró', '2026-02-15 10:03:17', 'UC60lJFb-zjnqzeZHraWGwqg', '10');
INSERT INTO public.youtube_videos VALUES ('pLtIr7j-eX8', '100 Km De Forró', '2025-12-02 02:09:43', 'UC60lJFb-zjnqzeZHraWGwqg', '10');
INSERT INTO public.youtube_videos VALUES ('mHdcwc9eNjc', '“What It Sounds Like” Mix | HUNTRIX | KPop Demon Hunters | Beautiful Emotional Cinematic Music', '2025-11-24 19:00:51', 'UCqi7xixGSL6RD-_o5GeaR5w', '10');
INSERT INTO public.youtube_videos VALUES ('o3FYn6Hsdyw', 'Soda Pop - KPop Demon Hunters | The Moonies Cover', '2026-04-01 11:30:35', 'UCI7BklpY2s6rd_5RN1c3f1Q', '10');
INSERT INTO public.youtube_videos VALUES ('fESREcUo9ik', 'Heels, Nails, Blade, Mascara - Jubilee''s Version - "KPop Demon Hunters (케이팝 데몬 헌터스)"', '2025-10-23 23:30:12', 'UC3NVx_KUpGC8VQvfCkOIYcQ', '10');
INSERT INTO public.youtube_videos VALUES ('a2grcJdfXmY', 'LE SSERAFIM (르세라핌) ''CELEBRATION'' OFFICIAL MV', '2026-04-24 03:58:06', 'UC3IZKseVpdzPSBaWxBxundA', '10');
INSERT INTO public.youtube_videos VALUES ('cvczHB0W4BY', 'KPOP PLAYLIST 2026 🌸 Jan–Mar Girl Group MVs [4K] 최신 여자 아이돌 노래모음', '2026-04-04 04:00:39', 'UCR_-mB5w-jw_AYbRwSUiYyQ', '10');
INSERT INTO public.youtube_videos VALUES ('U6BDbXIah-Y', 'CORTIS (코르티스) ''REDRED'' Official MV', '2026-04-20 08:58:06', 'UC3IZKseVpdzPSBaWxBxundA', '10');
INSERT INTO public.youtube_videos VALUES ('9qkpcLK422o', 'IVE 아이브 ''BANG BANG'' MV', '2026-02-09 09:01:11', 'UCYDmx2Sfpnaxg488yBpZIGg', '10');
INSERT INTO public.youtube_videos VALUES ('1LpU_nXky40', 'IVE (아이브) ''Bang Bang'' (Color Coded Lyrics)', '2026-02-09 09:46:40', 'UCmth4hMyizG-_W9jidBqs_A', '10');
INSERT INTO public.youtube_videos VALUES ('oK5-nnngqA4', 'KPop Demon Hunters - ZOO (COVER)', '2026-01-07 11:45:17', 'UCcEi5yS6xzaUj-FFgUTCnOg', '10');
INSERT INTO public.youtube_videos VALUES ('ygYPwsjyCzQ', 'KISS OF LIFE (키스오브라이프) ''Who is she'' Official Music Video', '2026-04-06 09:00:07', 'UCvEEeBssb4XxIfWWIB8IjMw', '10');
INSERT INTO public.youtube_videos VALUES ('Qrpq9iP9sg4', 'Real-Life Rumi - "What It Sounds Like" - "KPop Demon Hunters (케이팝 데몬 헌터스)" - Part 1', '2025-09-19 01:30:19', 'UC3NVx_KUpGC8VQvfCkOIYcQ', '10');
INSERT INTO public.youtube_videos VALUES ('WZcLWx4fhKs', 'Fiesta Latina Mix 2026 | The Best Latin Party Hits PT.2 | KARYO & LOVUMBA LIVESET', '2026-03-13 19:15:11', 'UCDon__fFmiP4b5pUmbtzsKA', '10');
INSERT INTO public.youtube_videos VALUES ('CEhLhiaygI0', 'Café Narcos | Latin Bolero & Gangster Vibes | Moody Latin Background Music', '2025-08-11 21:51:10', 'UChXOPc0mKel-E9aI9ECMSKQ', '10');
INSERT INTO public.youtube_videos VALUES ('d5q1ApthovU', 'The Hi-Fi Sound of Latin Guitar - High Quality Sound - Antonio Carlos Bonfa - Vol 1', '2023-01-18 05:29:19', 'UCBvcWWAWhDT2dtFs7d0zGwA', '10');
INSERT INTO public.youtube_videos VALUES ('_T_SIDKGRjs', 'Elvis Crespo - Suavemente (Cover Audio)', '2014-10-03 07:00:04', 'UCHTIZElRhf4LMnG5N9yHQdA', '10');
INSERT INTO public.youtube_videos VALUES ('G4rKTHSkfGE', 'REGGAETON, SALSA, LATIN HITS (BAD BUNNY, FEID, YANDEL, RAUW) | PLAYGRND SERIES | JAY RAMIS', '2025-02-08 14:00:13', 'UCzWC1TkgyBxxrHkqb6aZf1g', '10');
INSERT INTO public.youtube_videos VALUES ('h54vH4ILDvc', 'Havana Soul Mix 💃 Cuban Music, Latin Jazz & Buena Vista Sound', '2025-07-27 04:00:52', 'UCPr_qJ3txALVZw8zcns3gcA', '10');
INSERT INTO public.youtube_videos VALUES ('yQd4xQBlBa0', 'Obsesion', '2017-05-16 21:46:38', 'UCDaQK4nrsvz27YzufrhJfgg', '10');
INSERT INTO public.youtube_videos VALUES ('N0nK0XjA3Tk', 'Top 10 MOST STREAMED Latin songs of 2024 so far 📈🎶 #shorts #latinmusic #latinartist #latino #latina', '2024-10-17 17:44:22', 'UCbgB3pKVBcSksa6gVIU278w', '10');
INSERT INTO public.youtube_videos VALUES ('ZDswWrrCGXk', 'The ORIGINAL stop and wait song? #viral #trend #stopandwait #music', '2025-06-01 18:24:10', 'UC2Ynl82iZzds8sMqp5nM6bg', '10');
INSERT INTO public.youtube_videos VALUES ('pTAbOvv4vd8', 'he said he had an idea to make my song VIRAL', '2025-02-04 00:28:11', 'UCTC7fJvs0rAemFa8Q9qDl1w', '10');
INSERT INTO public.youtube_videos VALUES ('oMTrz_Ym02A', 'FINISH THE LYRICS 🔥 TikTok Viral Songs 2026 Edition', '2026-04-04 15:01:29', 'UCZZ752e54Fmtgsv42jGlWgg', '10');
INSERT INTO public.youtube_videos VALUES ('x7lJb5mLTSM', 'music in comments 💖 #original #newmusic  #independent #kids #song #reaction #viral #singing #pop', '2022-11-11 23:28:32', 'UCIOED-ebUKXRUaslb62-x5g', '10');
INSERT INTO public.youtube_videos VALUES ('fTVvhkhCMuo', 'Trending songs 2026 – Spotify playlist 2026 🎧 Viral Songs 2025 || Trending TikTok Songs 2025', '2026-02-11 09:49:46', 'UCci3lozteCexkJ4g0xj-9NQ', '10');
INSERT INTO public.youtube_videos VALUES ('EuTsDjyjpJE', 'Can you pass this VIRAL song challenge? 🤫🤐 (Adele, Rosé, Bruno Mars, Mariah Carey & more)', '2024-12-13 09:09:51', 'UC9Vkr0WmRzVGxxIakJM8kQw', '10');
INSERT INTO public.youtube_videos VALUES ('m1y28JAEqN8', '🎵 The 10 Most Popular Pop Songs in History 🎶', '2025-04-24 17:00:56', 'UC62rsNhxdkTbf9H6jXk5_SQ', '10');
INSERT INTO public.youtube_videos VALUES ('KHKJ1vFpXDs', 'TOP 10 SONG VIRAL PHONK/FUNK 2025 🎵', '2025-12-30 19:17:51', 'UCL_IGbp3VlN55wH8R_u8EQw', '10');
INSERT INTO public.youtube_videos VALUES ('Z6l90pTXTSY', 'Top 10 Viral Rap Songs Of 2025 #rap #viralmusic #2025', '2025-04-18 17:00:52', 'UCgezh1PRAAHcwXGvNXFtjVA', '10');
INSERT INTO public.youtube_videos VALUES ('tWdlIHl8pnY', 'J Balvin - Azul TikTok 🔥🎵 Viral Video  #lyrics #translation #edit #music #español #song #english', '2025-04-26 10:08:59', 'UCG4ooaRC8dhxzFevWglvaVg', '10');
INSERT INTO public.youtube_videos VALUES ('l93JOUJZEoA', 'How Do People NOT Know This About Pop Music?', '2025-06-24 17:54:25', 'UCJquYOG5EL82sKTfH9aMA9Q', '10');
INSERT INTO public.youtube_videos VALUES ('CLLpSmaof4E', 'Clean Pop Music 2025 - Clean Pop Music for Classrooms - Clean Music Playlist', '2025-08-27 18:10:41', 'UCYXIviXPAaaaU_AOotpXTAw', '10');
INSERT INTO public.youtube_videos VALUES ('HL_9LIiGgj0', 'Best Pop Songs Playlist | 2000s & 2010s Pop Hits', '2026-01-11 13:00:37', 'UC1OonTKPPxIePNloWczYoig', '10');
INSERT INTO public.youtube_videos VALUES ('nfWlot6h_JM', 'Taylor Swift - Shake It Off', '2014-08-18 21:18:00', 'UCqECaJ8Gagnn7YCbPEzWH6g', '10');
INSERT INTO public.youtube_videos VALUES ('MEX3XzL2YRc', '90''s Pop Party Mix | Britney x BSB x NSYNC x Spice Girls | @djunltd', '2022-10-04 06:10:28', 'UC-nBFyu05sYC5IzeSsfmNvA', '10');
INSERT INTO public.youtube_videos VALUES ('dWix43csap4', 'The Truth About Pop Music', '2025-10-05 05:14:00', 'UCRWu77ldqaQboq3JXLd5waQ', '10');
INSERT INTO public.youtube_videos VALUES ('EJ9Jc9blzBA', 'Deep House 2026 | Electronic Music You’ll Replay Again - VELVYBE', '2026-02-11 07:00:12', 'UCltPs2FtZtBn94Gk1dV_Uzw', '10');
INSERT INTO public.youtube_videos VALUES ('sBJT1BpOcvg', 'Music That Make You Feel BADASS 🎧 EDM Remixes of Popular Songs 🎧 EDM Music Mix ​| Bass Boosted', '2025-02-27 11:00:06', 'UCGjclqow7gzi5XFXz0HzZ6g', '10');
INSERT INTO public.youtube_videos VALUES ('7YYBqjpmi-c', '!!!!ELECTRONICAS CLASICAS MIX EXTENDIDO!!!!!  Los Éxitos más sonados en México ☣️☣️🇲🇽🇲🇽🇲🇽🇲🇽😎😎☣️☣️', '2024-09-28 02:00:21', 'UC1qRCLETiCOIfnMPC9X-ngQ', '10');
INSERT INTO public.youtube_videos VALUES ('sTmgaP2gYsk', 'Music Mix 2026 🎧 EDM Remixes of Popular Songs 🎧 EDM Gaming Music Mix ​', '2024-02-29 07:00:29', 'UCVfi_UYv_ZES-BIdFqmrMuQ', '10');
INSERT INTO public.youtube_videos VALUES ('CU1Nmb9_-dI', 'Melodic Techno 2026 — Deep, Atmospheric & Driving | Night Drive + Focus Mix', '2026-01-24 11:00:31', 'UCnFzvGNpxvk40m4cTggUdQg', '10');
INSERT INTO public.youtube_videos VALUES ('71Nv50JG6RI', 'In Dreams We Dance — Electronic Music | Progressive Trance | Female Vocal', '2025-09-20 14:55:00', 'UC7_ZheFoWjNb-HZpeU02X2Q', '10');
INSERT INTO public.youtube_videos VALUES ('5-EuMi9-nSw', 'TOMORROWLAND 2026 🔥 La Mejor Música Electrónica 2026 🔥 Lo Mas Nuevo - Electronica Mix', '2023-09-02 08:15:54', 'UCQ-cprb_gOizENTgmZwZPkw', '10');
INSERT INTO public.youtube_videos VALUES ('r6fO-Ki9LzE', 'Tiësto - Live at the Great Pyramids of Giza 2025 (Full Set)', '2025-12-26 16:13:37', 'UCPk3RMMXAfLhMJPFpQhye9g', '10');
INSERT INTO public.youtube_videos VALUES ('OPQmOutTmyo', 'Best Of EDM 2010 - 2020 Megamix ┃Best EDM Songs Of All Time - DJ Mix 2023', '2022-12-30 17:00:17', 'UCSJns3RK3eyMm-oMRQiB20w', '10');
INSERT INTO public.youtube_videos VALUES ('HYIl_xHF5r4', 'EDM Techno Christian Music Playlist✝️🎧 Best Uplifting EDM Worship / Praise / Gospel / Dance', '2025-10-19 02:00:15', 'UCl_KZtpJbHrYehhzMuDXafA', '10');
INSERT INTO public.youtube_videos VALUES ('l6gRKrU1swA', 'YOO 🤯 #edm #music #breakdance #dance #dancemusic #edmmusic #rave #shorts #dubstep #electronicmusic', '2025-10-07 20:07:17', 'UCG6QEHCBfWZOnv7UVxappyw', '10');
INSERT INTO public.youtube_videos VALUES ('cVFzblT5VPE', 'Einmusik b2b Jonas Saalbach live at Preikestolen in Norway for Cercle', '2019-09-06 13:00:02', 'UCPKT_csvP72boVX0XrMtagQ', '10');
INSERT INTO public.youtube_videos VALUES ('OF04pKp-r9o', 'Kesha - TiK ToK (Lyrics)', '2020-06-29 19:35:08', 'UCNqFDjYTexJDET3rPDrmJKg', '10');
INSERT INTO public.youtube_videos VALUES ('jaPGexY1l5A', 'BOO', '2026-01-15 16:39:38', 'UCO8ZT9Mvml76dyo-I6W8ppA', '10');
INSERT INTO public.youtube_videos VALUES ('-tIVsACI4mI', '100 Songs YOU KNOW Because of TIKTOK (2026)', '2026-05-06 14:31:17', 'UCJDFBaUcOVUtT8nrKSkAzAQ', '10');
INSERT INTO public.youtube_videos VALUES ('7zUFWXx9X_c', 'TikTok mashup 2019-2023/ respect to you if you know 10 or more of these songs', '2023-08-11 18:02:15', 'UCWgc7Q3S4zfNzVWWR_iE6_g', '10');
INSERT INTO public.youtube_videos VALUES ('cce0lMgyrKc', 'Talk - Salvatore Ganacci | lyrics | aesthetic | whatsapp Status | English songs | slowed | speed up', '2025-05-02 12:49:34', 'UCvki_74y_I76cYEdnzcejPg', '10');
INSERT INTO public.youtube_videos VALUES ('7bKTvsC7GUU', 'TOP TIKTOK SONGS by The Moonies Official ⭐️ Compilation of our favorite trending hits', '2022-12-14 11:00:05', 'UCI7BklpY2s6rd_5RN1c3f1Q', '10');
INSERT INTO public.youtube_videos VALUES ('xBNYnpo4xVg', 'Sped Up Tiktok Audios ♡ (GOOD LOYAL THOTS - Odetari)', '2023-05-10 02:14:40', 'UC7_8w5vHeMPli0A0QA3g8RQ', '10');
INSERT INTO public.youtube_videos VALUES ('e-CEd6xrRQc', 'ROSALÍA - LA FAMA (Official Video) ft. The Weeknd', '2021-11-11 17:00:09', 'UCy2bCk5KnIfjmWYFHMZcd5w', '10');
INSERT INTO public.youtube_videos VALUES ('BfQyu09_08w', '😂 #odetari #HD #odecore #odetarigetsomesleep #anime #shorts Credits: @maesbunniespace', '2024-01-16 06:00:09', 'UCoUgSXusnKADcOxmtxpQevg', '10');
INSERT INTO public.youtube_videos VALUES ('YZJZm119nCI', 'FINISH THE LYRICS 🎤 Viral TikTok Songs 2025 Edition 🔥 Music Quiz', '2025-10-21 15:01:05', 'UCZZ752e54Fmtgsv42jGlWgg', '10');
INSERT INTO public.youtube_videos VALUES ('5NPBIwQyPWE', 'Avril Lavigne - Complicated (Official Video)', '2010-02-25 00:29:17', 'UCC6XuDtfec7DxZdUa7ClFBQ', '10');
INSERT INTO public.youtube_videos VALUES ('wlS6Ix7mA0w', 'Anitta & J Balvin - Downtown [Official Music Video]', '2017-11-20 16:00:30', 'UCqjjyPUghDSSKFBABM_CXMw', '10');
INSERT INTO public.youtube_videos VALUES ('hiP14ED28CA', 'Jason Derulo - Wiggle feat. Snoop Dogg [Official Music Video]', '2014-05-21 22:03:26', 'UCe3yZzUwpmy2eKKmF9svX0Q', '10');
INSERT INTO public.youtube_videos VALUES ('56hqrlQxMMI', 'The Alan Parsons Project - Eye in the Sky (Official Audio)', '2013-11-14 17:42:03', 'UCMC5uYIx8vsx4Zx-6giJf7A', '10');
INSERT INTO public.youtube_videos VALUES ('XfMVF-o7g1o', 'Ghost - It''s A Sin (Official Audio)', '2026-01-16 05:00:07', 'UCAOiVaJJlH0Oduv48NN0mMA', '10');
INSERT INTO public.youtube_videos VALUES ('hk24Oj-Txsw', 'Edriana Silva | Não Se Entregue [Clipe Oficial]', '2026-05-06 23:00:07', 'UCBP7b1xKoI-ahduavsqeLCQ', '10');
INSERT INTO public.youtube_videos VALUES ('Uf-PyfpJCfI', 'De Antes Pra Hoje - Luan Pereira (Clipe Oficial)', '2024-11-22 15:03:51', 'UCAdN9VApym_qAQirG-kROvg', '10');
INSERT INTO public.youtube_videos VALUES ('H6hEO4jwpuA', 'MOÇO CUIDADO (Clipe Oficial) DJ Gustavo da VS, MC Luiggi, MC Thata e MC Talibã', '2026-05-06 15:00:36', 'UCIcC20Zdy6PYASADaGQV_Eg', '10');
INSERT INTO public.youtube_videos VALUES ('MDxSeWwpyJ0', 'Daniela Alves | Tirai a Pedra [Clipe Oficial]', '2026-05-05 23:00:06', 'UCBP7b1xKoI-ahduavsqeLCQ', '10');
INSERT INTO public.youtube_videos VALUES ('yfIPC-Erjbg', 'Brainrot Brazil Funk Song #brainrot #brainrotsong #brazil #phonk', '2025-09-01 16:43:38', 'UCTrrz9IkZNi7d_0LjjFWkwA', '10');
INSERT INTO public.youtube_videos VALUES ('mQ5wP0YazOE', 'Kenan e Kel | Boiler Room x Ballantine''s True Music Studio: São Paulo', '2025-02-05 17:21:06', 'UCGBpxWJr9FNOcFYA5GkKrMg', '10');
INSERT INTO public.youtube_videos VALUES ('N441ZM2VHv4', 'Sprunki OC Brazilian Funk Phase 2 #sprunki #sprunkioc #incredibox #incrediboxsprunki #funk #brazil', '2025-10-29 12:41:07', 'UCnJ2vT0lpvF6sQ8iKa_0O7A', '10');
INSERT INTO public.youtube_videos VALUES ('Wc6iLg3mL7g', 'Jennifer - Brazilian funk Remix “Beat By. Kayarchon”', '2025-05-04 06:31:31', 'UC7t0atou0kLsSlD-3lAO_CQ', '10');
INSERT INTO public.youtube_videos VALUES ('ZiEyxl1bVr0', 'BOBBY VANDAMME - BRAZIL FUNK FREESTYLE [official Video]', '2023-07-13 22:00:09', 'UC2fMPNTHKc1sxsRdJsMSdYQ', '10');
INSERT INTO public.youtube_videos VALUES ('XQIBSlB8MAc', 'Mu540 Brazilian funk & house set | Burn Energy Tour x Mixmag | Valencia', '2025-10-23 16:20:41', 'UCQdCIrTpkhEH5Z8KPsn7NvQ', '10');
INSERT INTO public.youtube_videos VALUES ('eVz10_sCHJw', 'NUNCA MUDA [ ULTRA SLOWED ] [BRAZILIAN PHONK] 💀🥵🥶', '2025-05-28 15:22:28', 'UC7skCV2_5lmzY4wDVO5aT6g', '10');
INSERT INTO public.youtube_videos VALUES ('wKycFNLaxFU', '🎧// FUNK UNIVERSO (Brazilian + Funk) 💀 #phonkytrapslowedbassboosted #funkmusic #phonk #audio', '2024-09-21 10:02:04', 'UCHHP7y894YzzrYexL3TRr7g', '10');
INSERT INTO public.youtube_videos VALUES ('uqY-3RS-V0Y', 'Movimento - DJ Plaga, MC Tota (Video Oficial)', '2024-12-12 23:00:08', 'UCDvQkGVlOO0fZIwCkLtX1tQ', '10');
INSERT INTO public.youtube_videos VALUES ('ZDmrqzOFEjc', 'FUNK DE BELEZA (SLOWED) #phonk #phonkmusic #phonkdrift #bass #aveeplayer #slowed', '2025-02-19 09:40:33', 'UCHHP7y894YzzrYexL3TRr7g', '10');
INSERT INTO public.youtube_videos VALUES ('D60K8BU6lsY', 'PARA COMEÇAR O FINAL DE SEMANA - FORTE FORTE DE LACOSTE - DJ Arana,Jeeh FDC,Menezes,LCKaiique,CeloBK', '2023-06-09 14:50:07', 'UCIcC20Zdy6PYASADaGQV_Eg', '10');
INSERT INTO public.youtube_videos VALUES ('RtTf76WAO6s', 'Which country has the best Phonk / Funk music? 😱 #phonk #phonkmusic', '2024-11-06 16:32:48', 'UC7xlfeOdS1_T_2GYuoOvrmA', '10');
INSERT INTO public.youtube_videos VALUES ('oGCu47JESi0', 'CHILL BRAZIL | Samba, Bossa Nova, Latin Funk, and Soul Vibes [Playlist 2]', '2025-04-15 12:58:51', 'UC12JTPZnteeNaum4epyijwA', '10');
INSERT INTO public.youtube_videos VALUES ('aDl44-M6M0E', 'Ichiss - Whine in Brazil', '2024-07-24 15:28:11', 'UCz-rxehhsrMAyBEJdf4NG2w', '10');
INSERT INTO public.youtube_videos VALUES ('uuoL1k_gaeA', 'TRAP DE AMARELLA (VIDEO OFICIAL😂)💛🇧🇷', '2020-10-26 00:50:18', 'UCkn2ReWhqBfUIvRz6Y23C2g', '10');
INSERT INTO public.youtube_videos VALUES ('0lgAIjua6pA', 'Kayblack e Baco Exu do Blues - Melhor só  [Faixa 6 - EP CONTRADIÇÕES]', '2023-03-31 22:00:10', 'UCpOdPfjjxpEAzATZJQX4_Hg', '10');
INSERT INTO public.youtube_videos VALUES ('hbm-DXoQhcg', 'PLAYLIST TRAP 2026 BRASIL - MC Cabelinho, TZ da Coronel, Poze do Rodo, Oruam e Orochi', '2026-03-05 12:40:42', 'UCXX14DhKp9FsTo50osm-KUw', '10');
INSERT INTO public.youtube_videos VALUES ('eWa95Ym9sZ0', 'Face da Morte - A Vingança (Ao Vivo) | DVD Espaço Rap Especial', '2019-03-21 12:18:53', 'UCtZUzVps0T-VvWx4IfaPnJQ', '10');
INSERT INTO public.youtube_videos VALUES ('xfpFe7CZ4Do', 'O Povo da Periferia (Expressão Ativa)', '2021-03-31 20:01:31', 'UC6ldKmPZ4S_WvdhknGHQavw', '10');
INSERT INTO public.youtube_videos VALUES ('idDCk4RTx4g', 'Abbot ft.Somynem.grin -"HYLANDER"- 🐀', '2020-09-18 14:00:09', 'UCU6vCe3PKV4Fd1yGWgD1mCw', '10');
INSERT INTO public.youtube_videos VALUES ('H97EFhNUADY', 'Pra Quem Sofre Calado… 🍺 Sertanejo Antigo de Boteco', '2026-03-27 18:49:05', 'UCcMSZoQ6DczRejxVlRT31lg', '10');
INSERT INTO public.youtube_videos VALUES ('5ymK_qr474k', 'Guilherme e Benuto, Panda - Eu Duvido | Deu Rolo No Barretão', '2026-03-26 23:59:29', 'UCfG0o17SqRg8qAjlpTdxZag', '10');
INSERT INTO public.youtube_videos VALUES ('Vai1oBXCiiA', 'Fred & Fabrício - TE AMAR É MEU TALENTO - Sertanejo Respira Goiânia', '2026-02-20 13:59:56', 'UCzQzpEfdPCCwkG10cU5rceA', '10');
INSERT INTO public.youtube_videos VALUES ('hRcYZVuQtjA', 'Lourenço & Lourival - A Sementinha (Parte 3) #sertanejo #sertanejoraiz #modao #raiz #classico', '2025-04-12 13:30:36', 'UCwuBNS7gH0rguuRj80VTeEw', '10');
INSERT INTO public.youtube_videos VALUES ('of6fAGawnUc', 'Ainda Gosto de Você/Já Era - Sorriso Maroto, Ludmilla, Belo [Sorriso Eu Gosto no Pagode]', '2023-09-21 15:00:10', 'UClqmzNx7-xd-5_MzdSotYKw', '10');
INSERT INTO public.youtube_videos VALUES ('fBNW09FVtEA', 'Problema Emocional / Volta de Vez Pra Mim / Pra Ser Minha Musa - Samba De Dom', '2021-07-26 15:00:30', 'UC86Mk3Ws-jTqEQMhlyzpqWg', '10');
INSERT INTO public.youtube_videos VALUES ('JmfRmK-v7UU', 'SEGUNDA SEM LEI - Pagode Solidário part. Doce Encontro', '2020-02-05 14:01:43', 'UCEspDpj50kjtYaQtsCkb5_Q', '10');
INSERT INTO public.youtube_videos VALUES ('-Y1k19Z06iQ', 'Pagode da Arruda 20 anos - Bloco Macumba e Samba de Roda (Ao Vivo na Base do Samba) - Bloco 2', '2025-10-04 22:00:07', 'UC8iY8EK1YTjwkGgR4IzbZ7Q', '10');
INSERT INTO public.youtube_videos VALUES ('8_bs7PKJuO0', 'Que casal bom de forro 👌👏😍 #viralvideo #dance   #foryoupage  #fyp', '2026-05-02 15:00:00', 'UCUZyctCGqfYdAYqKn3EoRKA', '10');
INSERT INTO public.youtube_videos VALUES ('gfuJOymXwH4', 'No piseiro ele se garante Via: @leozinho_bsb01 @Kelinhaaof #forró #dança #piseiro', '2025-04-24 13:59:12', 'UCcCVfj8TKgMWQ2hzxgwQtrQ', '10');
INSERT INTO public.youtube_videos VALUES ('P4UViMg6ofY', 'Vamos dança Forro #passossertanejos #Mamonas #roça #vidanaroça #minasgerais #vidareal  #mulherbonita', '2026-05-05 14:17:40', 'UCNaJzRIhHmQTfchQ54V53Iw', '10');
INSERT INTO public.youtube_videos VALUES ('2xCYS4TjLJM', 'Ela dança muito bem! Via: @fabiohenriquebarret #forró #dança #piseiro', '2025-04-28 14:48:01', 'UCcCVfj8TKgMWQ2hzxgwQtrQ', '10');
INSERT INTO public.youtube_videos VALUES ('UKx8bw1mP2E', 'Forró puxado no interior só presta desse jeito gildenes Araújo #amaisforrozeiradomeu #musica', '2024-04-22 19:58:13', 'UC6vtlzETLYFG1ieFy4ocW2w', '10');
INSERT INTO public.youtube_videos VALUES ('mjEtZsq-rEA', 'Me esquecerás...🪗💥Guenta Coração!! é uma pancada de forró!! #galícia #issoégalícia', '2026-05-06 20:06:56', 'UCv2a0Tia9n1kARcexZtIUKw', '10');
INSERT INTO public.youtube_videos VALUES ('nvtGsaMv9yc', 'KPOP Demon Hunters / Las Guerreras KPOP | Huntrix - GOLDEN (Cover Español Latino) @HitomiFlor', '2025-07-01 20:00:06', 'UCLWqX5BVDidcfByzyyY_XGg', '10');
INSERT INTO public.youtube_videos VALUES ('Wm97ow7T8J8', 'KPOP Demon Hunters / Las Guerreras KPOP | TAKEDOWN / NOCAUT (Cover Español Latino) @HitomiFlor', '2025-07-26 20:15:06', 'UCLWqX5BVDidcfByzyyY_XGg', '10');
INSERT INTO public.youtube_videos VALUES ('RIdSu-q46Y0', 'Cartoon Huntr/x vs. Real-Life Huntr/x - "Golden" - "KPop Demon Hunters" - Part 2', '2025-09-29 00:00:24', 'UC3NVx_KUpGC8VQvfCkOIYcQ', '10');
INSERT INTO public.youtube_videos VALUES ('co-TFLbaZAE', '“Gabriela” Performance Video | KATSEYE', '2025-07-09 15:01:09', 'UCA61H4fWOMHikLcUFKyQUog', '10');
INSERT INTO public.youtube_videos VALUES ('FGrbMP4ksk8', 'Golden Kpop Demon Hunters - Blob Opera', '2025-09-04 07:29:51', 'UCkdzFl_tW5mdDVmrOhnTsxQ', '10');
INSERT INTO public.youtube_videos VALUES ('jWQx2f-CErU', 'aespa 에스파 ''Whiplash'' MV', '2024-10-21 09:00:42', 'UCEf_Bc-KVd7onSeifS3py9g', '10');
INSERT INTO public.youtube_videos VALUES ('iojQFPplbic', 'Who Should Wednesday Be for Halloween? - "KPop Demon Hunters (케이팝 데몬 헌터스)"', '2025-10-10 13:01:32', 'UC3NVx_KUpGC8VQvfCkOIYcQ', '10');
INSERT INTO public.youtube_videos VALUES ('jCY6d1F16eQ', 'Latin Pop Mix | Radio Hits & Latin Classics | Los Exitos Mas Grande | Greatest Hits | Live DJ Set', '2026-04-03 23:00:06', 'UCUMYSG5KRHZajl9YIzIeqVw', '10');
INSERT INTO public.youtube_videos VALUES ('iHy9WrnYnlA', 'LATIN POP SAN VALENTIN 2026 - TOWA (DANNY OCEAN, RAWAYANA, KAPO, BEELE, KAROL G)', '2026-02-14 19:00:07', 'UCE_w1tFCS5gEBcMaLm7wnCA', '10');
INSERT INTO public.youtube_videos VALUES ('1_zgKRBrT0Y', 'Pedro Capó, Farruko - Calma (Remix - Official Video)', '2018-10-05 04:00:00', 'UCOvCud7r6XILh0U_Qy1BFDQ', '10');
INSERT INTO public.youtube_videos VALUES ('VqEbCxg2bNI', 'Natti Natasha ❌ Ozuna - Criminal [Official Video]', '2017-08-18 14:32:42', 'UCu59H8LNti6mwvcGRMge5PA', '10');
INSERT INTO public.youtube_videos VALUES ('9im7yVc_jGA', 'The BEST Latin Party Mix 2026 Reggaeton EDM & Pop Latino #3', '2026-04-16 23:00:19', 'UCpjm6cd08zTDHfCaSuM-k8w', '10');
INSERT INTO public.youtube_videos VALUES ('S0lx-sIjbHA', 'AURA = ♾️ | 1 HOUR VIRAL AURA MUSIC PLAYLIST 2026 🔥 TRENDING PHONK HITS', '2026-05-06 09:15:02', 'UCfJNmhaMLZ6NRbXlzz1qMLQ', '10');
INSERT INTO public.youtube_videos VALUES ('k3cZ6qaqkMo', '(Top 1 Viral) OPM Acoustic Love Songs 2026 Playlist 💗 Best Of Wish 107.5 Song Playlist 2026', '2026-05-06 13:22:38', 'UC5k0BNf8_UljOYqy8Kh8hlA', '10');
INSERT INTO public.youtube_videos VALUES ('gLDQ7Yvww7Q', 'Spotify Playlist 2026 🎧 Trending Music 2026 🎶 Top Songs 2026 ~ Best Viral Songs Mix Hits', '2026-05-05 14:38:54', 'UC5s9Nmg_BYKY3nwUrOTBg_Q', '10');
INSERT INTO public.youtube_videos VALUES ('UOrCIg_Qu3o', '🎵 Top FREE Background Music Tracks for Viral Shorts – Full Video Link in Description! 🚀🎬', '2025-05-23 10:49:49', 'UCY6WN_Njr5yNrrQQSi-NvMQ', '10');
INSERT INTO public.youtube_videos VALUES ('mS95hDkYEJc', 'Céline Dion | Encore un soir  #popmusic #musica', '2026-05-06 21:30:19', 'UCQZOGGqGYzbTviRonDNsYdg', '10');
INSERT INTO public.youtube_videos VALUES ('OPf0YbXqDm0', 'Mark Ronson - Uptown Funk (Official Video) ft. Bruno Mars', '2014-11-19 14:00:18', 'UCmfFGTSsfJVu6CGvL8r75qg', '10');
INSERT INTO public.youtube_videos VALUES ('V7Wc2O6HUsM', 'Pop En Español 2000s Mix | Latin Pop Clasicos | Pop Latino Retro Exitos by bavikon', '2025-07-26 22:00:26', 'UCIWo95f_YWHB0pYXbFV0n4g', '10');
INSERT INTO public.youtube_videos VALUES ('gU2Jzsa9Q_Y', 'Clásicos Eternos del Electrónico | Las Mejores Joyas de la música electrónica | XDJ-AZ', '2025-07-06 08:27:09', 'UCoANIG5PuFrEbxtyXgst8jw', '10');
INSERT INTO public.youtube_videos VALUES ('iP6XpLQM2Cs', 'Ke$ha - TiK ToK (Official HD Video)', '2009-11-14 13:10:59', 'UC9HnKwLco0wfmmHJT4KOjJw', '10');
INSERT INTO public.youtube_videos VALUES ('X2Nv4KqRGK0', 'Spanish/Latin Playlist Song | Popular On TikTok 2026', '2025-12-08 03:01:30', 'UCMFyw0Y05HGdc9kL0jfVdIQ', '10');
INSERT INTO public.youtube_videos VALUES ('GJ2v96T9xOk', 'CHANEL', '2025-10-23 10:05:28', 'UCnZBreGKMYsBpE5Vqxevewg', '10');
INSERT INTO public.youtube_videos VALUES ('wZTIdnooV-s', 'Sub Urban - UH OH! (feat. BENEE) [Official Music Video]', '2022-04-22 04:00:12', 'UCqAil6_A1dWHdFXzOwVLqlg', '10');
INSERT INTO public.youtube_videos VALUES ('a-SX4DDjD2E', 'JUST BE COMPETENT - @Verplex321  REMIX (Official Audio)', '2026-05-05 21:37:41', 'UC6fF6g8Sm_Qrj0H1TCvX3lg', '10');
INSERT INTO public.youtube_videos VALUES ('KUWLUGtEkMo', 'MANGUEIRA 2026 - CLIPE OFICIAL RIO CARNAVAL', '2025-10-30 15:00:07', 'UCNauntDSSJY2kSODiVBg4jQ', '10');
INSERT INTO public.youtube_videos VALUES ('MG_cjByleYI', 'ESQUEMA PREFERIDO - Dj Ivis e Tarcísio do Acordeon (CLIPE OFICIAL)', '2021-02-20 08:00:16', 'UCWWajG_gixxYdJf1ClazNUg', '10');
INSERT INTO public.youtube_videos VALUES ('69JAoslGYI8', 'Ana Castela - Pipoco ft. @MELODYOFICIAL  e @djchrisnobeat (Clipe Oficial)', '2022-05-20 14:00:14', 'UCRD1ypvmK7e_05Rtu9zHOfQ', '10');
INSERT INTO public.youtube_videos VALUES ('y4rD8gOe7yg', 'PORTELA 2026 - CLIPE OFICIAL RIO CARNAVAL', '2025-10-29 15:00:07', 'UCNauntDSSJY2kSODiVBg4jQ', '10');
INSERT INTO public.youtube_videos VALUES ('qTjjBequjGY', 'Victor e Leo - O tempo não apaga (clipe oficial)', '2014-03-24 01:17:42', 'UCTktZm0puTzzSOlHl3FcfVw', '10');
INSERT INTO public.youtube_videos VALUES ('aKlepLWOh3Q', 'IMPERATRIZ LEOPOLDINENSE 2026 - CLIPE OFICIAL RIO CARNAVAL', '2025-10-14 15:00:07', 'UCNauntDSSJY2kSODiVBg4jQ', '10');
INSERT INTO public.youtube_videos VALUES ('cuIVkdwm2SE', 'VILA ISABEL 2026 - CLIPE OFICIAL RIO CARNAVAL', '2025-10-07 15:00:06', 'UCNauntDSSJY2kSODiVBg4jQ', '10');
INSERT INTO public.youtube_videos VALUES ('FnjexNf7Pdo', 'Raí Saia Rodada - Tapão Na Raba (Clipe Oficial)', '2021-02-10 23:00:17', 'UCphr4yejnGroAUGAPuxvSow', '10');
INSERT INTO public.youtube_videos VALUES ('-PH4S7IPQxU', 'MC Kevinho - O Grave Bater  [Sintonia Soundtrack] (KondZilla)', '2017-03-21 22:00:01', 'UCffDXn7ycAzwL2LDlbyWOTw', '10');
INSERT INTO public.youtube_videos VALUES ('g2kz4sykhgk', 'MATUÊ, WIU, TETO - AS MELHORES MUSICAS 2022 / 30PRAUM PLAYLIST 2022 MATUE PLAYLIST , TETO PLAYLIST', '2022-09-01 19:00:27', 'UCz5ZxMPd8Fvb7fkFQl_xjHA', '10');
INSERT INTO public.youtube_videos VALUES ('Ws_fR1oMN9c', 'TRAP BRASIL 2025 - Cabelinho, Chefin, Filipe Ret, Oruam e Poze do Rodo', '2025-11-25 16:24:49', 'UCXX14DhKp9FsTo50osm-KUw', '10');
INSERT INTO public.youtube_videos VALUES ('Rj-Q-cgG70I', 'Cidinho E Doca - Rap Das Armas (Original)', '2009-03-18 21:51:37', 'UC4rasfm9J-X4jNl9SvXp8xA', '10');
INSERT INTO public.youtube_videos VALUES ('60DvFz6jMgY', 'Rap das armas - B.O.P.E Tropa de Elite', '2012-01-28 04:30:19', 'UC2zN9KTBX4_toWdoWEPiqlA', '10');
INSERT INTO public.youtube_videos VALUES ('gpxa9q_kPKQ', 'Mafuuuuu  (brazilian) music #brazilianmusic #brazil #funk #musicvideo #cristianoronaldo', '2025-05-24 11:15:49', 'UCwVAo1JB1kq9d3CrQnqqX3g', '10');
INSERT INTO public.youtube_videos VALUES ('klQ8uzsm938', 'FUNK ANTIGO | RAP BRASIL | AS MELHORES', '2024-07-12 21:00:12', 'UClHVfgvsjtFdY-yUGkPX88g', '10');
INSERT INTO public.youtube_videos VALUES ('4JYSkt3qsKI', 'Rap Da Felicidade', '2014-12-25 20:25:31', 'UCX79Y80sAOG5cNpXdmrwPdA', '10');
INSERT INTO public.youtube_videos VALUES ('qdsTUfDTEhQ', 'T.I. - No Mediocre ft. Iggy Azalea', '2014-06-19 04:01:00', 'UCq2QQO2WR5wz2IfLwt3SYfw', '10');
INSERT INTO public.youtube_videos VALUES ('TPomzwIYsLQ', 'ASI RAPEA LA "PROMESA" DE ARGENTINA (Monkey J)#freestylerap #FMS #Rap #freestyle', '2025-05-10 02:13:41', 'UCl_fKKHW-XeT-Hb-vtYV5wA', '10');
INSERT INTO public.youtube_videos VALUES ('e1MHLJsv6Ks', 'Enganchado sertanejo , misiones', '2015-09-27 01:44:00', 'UC24DI0Su8B3ivrczd1oeJ7g', '10');
INSERT INTO public.youtube_videos VALUES ('lnsWe87Q9yY', 'Esse é o problema 🥲😂 #zenetoecristiano #sertanejo', '2026-05-06 11:01:32', 'UCRRu9OXVYd5clj2Bs29gUVQ', '10');
INSERT INTO public.youtube_videos VALUES ('lgjayJik2n4', 'Bruno & Marrone - Revivem Sua História  Vol. 3 (Ao Vivo em Uberlândia - Parte 1)', '2025-08-08 14:38:16', 'UCdTX5ycRKPvTUiGu1519u4g', '10');
INSERT INTO public.youtube_videos VALUES ('fLE53xD9h_s', 'A fila tem que continuar ! 😂#diegoearnaldo #sertanejo #paravocê #caminhoneteinteira', '2026-05-06 14:01:10', 'UCFmhjWPGw--zFyDLBYxnnqA', '10');
INSERT INTO public.youtube_videos VALUES ('FIXFq7wtMEI', 'Sertanejo Anos 90 – 30 Minutos de Modão Raiz e Sucessos (“Pra ouvir dirigindo”)', '2025-09-22 20:54:49', 'UC7pQ7EHmaeLCMUh8IYq58Jg', '10');
INSERT INTO public.youtube_videos VALUES ('S_SXl-ETXRI', 'Turma do Pagode - Lancinho ((O Som das Multidões Ao Vivo) [Clipe Oficial])', '2012-06-19 00:29:44', 'UCB_K7fledSSBoRcl2O38b-Q', '10');
INSERT INTO public.youtube_videos VALUES ('qsCxSb1Qato', 'Uma Mesa e Um Pagode 2 - 18 MINUTOS DE PAGODE PARA MACHUCAR O CORAÇÃO COM DOZE POR OITO', '2025-06-19 15:00:06', 'UCvOHHWVKwPd_oCH73I1ukKQ', '10');
INSERT INTO public.youtube_videos VALUES ('XUTFBdw7Vqk', 'DE FÉRIAS COM PRESENÇA | Erro Gostoso - Mal Acostumado - A Gente Se Entrega | Samba e Pagode', '2023-12-31 14:00:10', 'UCKTsmTjpzWuCoFcdaJ4GnSA', '10');
INSERT INTO public.youtube_videos VALUES ('62zBQ2vbxLo', 'Nego Damoé - Bloco 1 (FM O Dia No Meu Pagode) #AoVivo', '2026-03-17 21:28:06', 'UCs11lqGV02Y-gu2f6G1r4ug', '10');
INSERT INTO public.youtube_videos VALUES ('NSbS-8oB7Z0', 'Pagode do Cavaco e Voz, Vol.2 (Ao Vivo)', '2025-08-01 21:00:06', 'UCBIDd5IZ9d-4Qi7QbpdIm7Q', '10');
INSERT INTO public.youtube_videos VALUES ('832-ygXkNJE', 'Ele conseguiu dançar com as duas 💃🏻👀😂 #forro #dance #saojoao', '2026-05-03 09:00:09', 'UCZrUsMvgl2cqG0CavOxeJtA', '10');
INSERT INTO public.youtube_videos VALUES ('vudZL4_uqLo', 'How to dance Forró - Basic Steps', '2019-12-28 23:06:12', 'UCi66R6vyZOm6Dc7FERb_kdg', '10');
INSERT INTO public.youtube_videos VALUES ('zAV3_mg941w', '🌵 FORRÓ 2026 | CLÁSSICOS DO SÃO JOÃO | SET EXCLUSIVO | Luiz Poderoso Chefão', '2026-04-29 22:01:21', 'UCmJ1g6j-MIKEdLK_31YO9Rw', '10');
INSERT INTO public.youtube_videos VALUES ('3pWWNxUeODQ', '1 HORA DE FORRÓ PÉ DE SERRA 🪗 Músicas que Tocam Fundo na Alma', '2026-05-04 07:00:04', 'UCcr-6f6DtWoS8Sf77vdWVkQ', '10');
INSERT INTO public.youtube_videos VALUES ('PhJ09yDQKJ0', 'Todos se apaixonam quando ouvem essa!😍❤️...#washingtonbrasileiro #musica #piseiro #danca #forró', '2025-10-21 21:15:22', 'UCaGhecql2HclGTL8N2ELmAA', '10');
INSERT INTO public.youtube_videos VALUES ('nsS-j9He_Wg', 'Rumi Takes Down Jinu', '2025-09-25 23:30:32', 'UC3NVx_KUpGC8VQvfCkOIYcQ', '10');
INSERT INTO public.youtube_videos VALUES ('bbBAMe92Btg', '''GOLDEN'' Kpop Demon Hunters en The Tonight Show✨🎶 #LYRICS', '2025-10-27 13:54:28', 'UCHsL1w9ZWYEZ6ZBNRVKeLzQ', '10');
INSERT INTO public.youtube_videos VALUES ('3-VwlTqxH-0', 'Who''s Your Favorite? - "KPop Demon Hunters (케이팝 데몬 헌터스)"', '2025-10-04 01:30:01', 'UC3NVx_KUpGC8VQvfCkOIYcQ', '10');
INSERT INTO public.youtube_videos VALUES ('nWWtiRHEaV4', 'El Baile del CHILITO - Alfredo Larin (videoclip oficial)', '2025-07-01 22:01:02', 'UCF4nVf4UzUQuDW6Spu_0Vuw', '10');
INSERT INTO public.youtube_videos VALUES ('BgMU9Vuj17Y', 'KAROL G - LATINA FOREVA (Official Video)', '2025-05-23 00:00:07', 'UCz9yS18zJGQObwUL_K-ICnw', '10');
INSERT INTO public.youtube_videos VALUES ('T2JnyCuAQMg', 'PALO! "Al Monte" • Musica Cubana Salsa Jazz Funk', '2016-06-25 18:39:44', 'UCK_5EsfTiG3e09dl06kRtnw', '10');
INSERT INTO public.youtube_videos VALUES ('UMWhHWgXJdg', 'Bad Bunny - Ojitos Lindos [ Letra/Lyrics ] \\\ Mujer Latina', '2024-05-25 19:30:02', 'UCjVR6cfsFdkPhbQ7MaDbOqA', '10');
INSERT INTO public.youtube_videos VALUES ('DiItGE3eAyQ', 'Daddy Yankee & Snow - Con Calma (Video Oficial)', '2019-01-24 04:06:52', 'UC9TO_oo4c_LrOiKNaY6aysA', '10');
INSERT INTO public.youtube_videos VALUES ('Bo0xYL7hbAA', 'MIX LATIN POP🔥 Clásicos ( Bacilos, Mike Bahia, Chino & Nacho, Carlos Vives, Etc..) Dj Victor Reyna', '2023-03-05 07:04:01', 'UCL9BBo92IF5jwDhYIuCeg8g', '10');
INSERT INTO public.youtube_videos VALUES ('ZRJipL32oCA', 'Mega Mix Latino | Mix Para Bailar | Salsa, Cumbia, Bachata, Merengue y Vallenato | Éxitos Latinos', '2025-03-01 00:00:07', 'UCUMYSG5KRHZajl9YIzIeqVw', '10');
INSERT INTO public.youtube_videos VALUES ('pkqHgo-3lpA', 'LATIN HOUSE Y TECHENGUE  | CELE ARRABAL | PREVIA MIX LO NUEVO', '2025-05-22 22:32:21', 'UCXvdfNKdIeIvCmgBaC0BK2A', '10');
INSERT INTO public.youtube_videos VALUES ('Sgl_T2zoIQU', 'Viral song | Mga Mapanakit na mga kanta ni Nel’s Music 2026', '2026-03-08 15:23:00', 'UCIgYGREZG7Sk_W7wF3231wA', '10');
INSERT INTO public.youtube_videos VALUES ('AJCzsLXrpao', '#music #singer #popmusic #trending #trending #dualipaviral #dualipafans #dualipa #shortvideo', '2026-05-05 19:00:15', 'UCdWiLsuoZPVfXBVPEZoAerw', '10');
INSERT INTO public.youtube_videos VALUES ('QCuUAClm-hQ', 'Kato Feat. Jon - Turn The Lights Off (Techno Remix) | Jon Hamm - Club Dance Scene', '2026-02-07 16:00:27', 'UCKsHD-leOlL7zK9iPWgY9Ug', '10');
INSERT INTO public.youtube_videos VALUES ('WjPUgEDQ4yE', 'Howl - Chill Electronic Live Session', '2026-02-03 13:00:57', 'UC5XvkNgesb2zs2kljVG_3Zw', '10');
INSERT INTO public.youtube_videos VALUES ('Paddtn5IdCk', 'Zara Larsson - Pretty Ugly (Official Music Video)', '2025-04-25 04:00:06', 'UC6MfFxrAK-e4HcgJROvDJDg', '10');
INSERT INTO public.youtube_videos VALUES ('sySB31z9RRQ', 'Thomas Bergersen - Memoria (Official Audio)', '2026-05-04 16:01:32', 'UCbQRdVWiM19azF8xcM9u2Kg', '10');
INSERT INTO public.youtube_videos VALUES ('sWhy1VcvvgY', 'Ana Vilela - Trem-Bala - (Clipe Oficial)', '2017-07-03 17:53:33', 'UCLYHckv6c8Eky4Z02B6v34w', '10');
INSERT INTO public.youtube_videos VALUES ('-wEhzTTdsS8', 'Zé Felipe, Mc Ryan SP,  Kew, DJ LK da Escócia - Viciado Em Ver Ela Descer (Videoclipe Oficial)', '2025-02-28 18:00:06', 'UCe1HjlqnaxERsqpw0ZnLXvA', '10');
INSERT INTO public.youtube_videos VALUES ('UhyFCJJgzL4', 'VIDRADO EM VOCÊ | DJ GUUGA & MC LIVINHO //🔥#phonk #phonk_music #funk #bassboosted #avee_player', '2025-03-05 04:55:32', 'UCoSjEys1pqH_8Th9_lIINVQ', '10');
INSERT INTO public.youtube_videos VALUES ('H88WuHdzAwg', 'NÃO MEXE COM MINHA MÃE 🔥 Eu Aviso Só Uma Vez… #trapbrasil', '2026-03-16 18:52:14', 'UCtCfgBZMjpduJYGwdmPtxng', '10');
INSERT INTO public.youtube_videos VALUES ('QIVnz6hZmME', 'SET TRAP 2026 BRASIL - MC Cabelinho, TZ da Coronel, Oruam, MC Poze do Rodo, Chefin', '2026-03-20 20:26:44', 'UCXX14DhKp9FsTo50osm-KUw', '10');
INSERT INTO public.youtube_videos VALUES ('2PRAiVs3MVc', 'A Cara do Crime "NÓS INCOMODA"- MC Poze do Rodo | Bielzin | PL Quest | MC Cabelinho (prod. Neobeats)', '2021-05-27 17:00:11', 'UCDiQ-LZ8dfc3cmoGBxMDS7Q', '10');
INSERT INTO public.youtube_videos VALUES ('iOM20kM2gOQ', 'MD Chefe - Tiffany', '2021-09-15 22:30:11', 'UCkfnJK1jy2wYMX0Pr0cpUzQ', '10');
INSERT INTO public.youtube_videos VALUES ('Hv53XBYeK7E', 'Gustavo Mioto - Pedido de Socorro', '2025-12-05 15:01:58', 'UCCCIzjqbX7psrn0HYG50phg', '10');
INSERT INTO public.youtube_videos VALUES ('Z4zCDg7GDuw', 'Pagode Ao Vivo 2026 | Os Melhores Pagodes de 2026🔥Dilsinho, Ferrugem, Ludmilla, Pericles, ...', '2026-05-06 08:27:15', 'UCJjq3bUli6GPgH2ebLcsdcA', '10');
INSERT INTO public.youtube_videos VALUES ('wcBsG24gouw', 'Pagode Ao Vivo 2026 | Os Melhores Pagodes de 2026🔥Dilsinho, Ferrugem, Ludmilla, Pericles, ...', '2026-05-06 23:16:56', 'UCJjq3bUli6GPgH2ebLcsdcA', '10');
INSERT INTO public.youtube_videos VALUES ('NwIvYGn3ca4', 'Pagode na Praia - Não Deixe o Samba Morrer / Mel na Boca / Ex Amor', '2024-08-31 14:00:19', 'UCIbM7_vOcqn4ApWtQlKrOSA', '10');
INSERT INTO public.youtube_videos VALUES ('xLwmpWkav8E', 'Feijoada do Thiago Soares - 2 horas de pagode', '2022-12-17 18:11:19', 'UC__Ddt9F1S_yi5oOGgEv6cw', '10');
INSERT INTO public.youtube_videos VALUES ('hd5ysbUDYF8', 'FABINHO - Nossa vida parou / Metade vai, metade fica- Marra de durão-Alucinado - PAGOBINHO - Bloco 2', '2023-09-15 15:00:39', 'UCyCf4m5E0O8UeOQmkOt-FtQ', '10');
INSERT INTO public.youtube_videos VALUES ('NsvbWEvCsjI', 'Juliana Bonde do Forró - Porque Brigamos ( DVD TBT )', '2024-04-17 22:14:12', 'UCL4cty81pHxPxZjRavDPZwQ', '10');
INSERT INTO public.youtube_videos VALUES ('r5kO1hpnJwU', 'Sina de Ofélia', '2026-02-28 03:04:30', 'UC2i2M2U5tQMqAxULG21WT5A', '10');
INSERT INTO public.youtube_videos VALUES ('1vrM6cOQgcg', 'Sâmya Maia - Nosso Amor é Maior / Vamos Falar de Amor / Moldura - Pra Recordar 4  (Bloco 01)', '2024-05-28 15:00:06', 'UCmCOoNLsYoQnHJHTa_Yv_lA', '10');
INSERT INTO public.youtube_videos VALUES ('6GNdiKjFm4k', 'Sinto Falta Dela', '2023-03-18 03:46:25', 'UCPenxNkvYv3x3fNkm-RJzlQ', '10');
INSERT INTO public.youtube_videos VALUES ('VydmHcmCBeU', 'Máquina do Tempo (Forró)', '2026-04-23 18:49:05', 'UCqHRyH0V2TrUMTskEM2vlDA', '10');
INSERT INTO public.youtube_videos VALUES ('QfXSL60kFaM', 'TOME FORRÓ DO AMAURY JÚNIOR #dança #piseiro #forró', '2024-06-21 22:55:47', 'UCxmL8AfG0_ufDr1hb_dj3QQ', '10');
INSERT INTO public.youtube_videos VALUES ('6ZUIwj3FgUY', 'IVE 아이브 ''I AM'' MV', '2023-04-10 09:00:10', 'UCYDmx2Sfpnaxg488yBpZIGg', '10');
INSERT INTO public.youtube_videos VALUES ('KNexS61fjus', 'LE SSERAFIM (르세라핌) ''Smart'' OFFICIAL MV', '2024-03-05 14:58:08', 'UC3IZKseVpdzPSBaWxBxundA', '10');
INSERT INTO public.youtube_videos VALUES ('OSUxrSe5GbI', 'BAD BUNNY x DRAKE - MÍA (Video Oficial)', '2018-10-11 16:02:47', 'UCmBA_wu8xGg1OfOkfW13Q0Q', '10');
INSERT INTO public.youtube_videos VALUES ('_I_D_8Z4sJE', 'X (EQUIS) - Nicky Jam x J. Balvin | Video Oficial  (Prod. Afro Bros & Jeon)', '2018-03-02 05:00:19', 'UCpb_iJuhFe8V6rQdbNqfAlQ', '10');
INSERT INTO public.youtube_videos VALUES ('T0Zw6fYCIWU', 'Afro-Cubano Deep House | Latin Night Lounge & Spanish Vocals', '2025-12-15 21:00:35', 'UCdQnhQjug7EyWn0u_VpeoyA', '10');
INSERT INTO public.youtube_videos VALUES ('hkdtBztPUjg', 'Sada Dil | Nisha Khan | Dance Performance Tik Tok Viral Song', '2026-05-05 13:58:23', 'UCzfgB1mwA2agCi6WJtReCpg', '10');
INSERT INTO public.youtube_videos VALUES ('-YlmnPh-6rE', 'For A Reason (Official Video) Karan Aujla | Tania  | Ikky | Latest Punjabi Songs 2025', '2025-08-22 08:30:05', 'UCm9SZAl03Rev9sFwloCdz1g', '10');
INSERT INTO public.youtube_videos VALUES ('vB0V3iCSzQw', 'GURU RANDHAWA - "AZUL"  MV', '2025-08-06 05:30:04', 'UC8MyBFjXbTezvZgMTEBFwgA', '10');
INSERT INTO public.youtube_videos VALUES ('c2nHxn2P5EU', 'Viral Vayyari Full Video Song | Junior Movie | Kireeti, Sreeleela | Radha Krishna | Devi Sri Prasad', '2025-08-04 04:06:10', 'UCNApqoVYJbYSrni4YsbXzyQ', '10');
INSERT INTO public.youtube_videos VALUES ('-CXDKsZY80I', 'Top 20 Pop Songs 2025 ♫ Bruno Mars, Lady Gaga, Dua Lipa, Adele, Ed Sheeran, The Weeknd #18', '2025-09-16 10:00:26', 'UC0_cyKup0lzAh2yLNB_7Wog', '10');
INSERT INTO public.youtube_videos VALUES ('VJtg7pJO3hQ', '1 Hour Dark Techno / EBM / Industrial Mix “Shadow Hunter”', '2024-02-12 15:30:15', 'UCNsBK3q-eYKKBOhgBw1up5A', '10');
INSERT INTO public.youtube_videos VALUES ('Nylxb9lSDxk', 'EDM Mashup Mix 2026 | Best Mashups & Remixes of Popular Songs - Electro House & Techno Music', '2026-04-29 13:21:53', 'UCrhNjae2abWsOIqZVAYLZtw', '10');
INSERT INTO public.youtube_videos VALUES ('Il-ZpBuC8tA', 'Best of Deep House [2026] | Melodic House & Progressive Flow', '2026-02-14 11:30:58', 'UCdzMxI2LSMHV_fr5En-WSdQ', '10');
INSERT INTO public.youtube_videos VALUES ('M5Df0ugyV2o', 'Majed reacts to Indian electronic music', '2023-09-21 18:27:21', 'UC04BY9XdbTltt3PYOaGGMkA', '10');
INSERT INTO public.youtube_videos VALUES ('UIJiuOguxeI', 'HOW TO MAKE AN EDM TRACK COMPLETELY FROM SCRATCH ON FL STUDIO! #flstudio #musicproduction #edm', '2024-07-22 15:03:44', 'UCWIF9O-NipM4UKeGKdF3soA', '10');
INSERT INTO public.youtube_videos VALUES ('lsduGj42ZJA', 'YOUNA - Melodic Techno & Progressive House DJ Mix 13 @ Red Sand Desert I Dubai', '2025-01-28 11:30:41', 'UCnr8XmfD3_2Hib3U0mGPWgQ', '10');


--
-- Name: engajamento_regional_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.engajamento_regional_id_seq', 1831, true);


--
-- Name: musica_video_correlacao_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.musica_video_correlacao_id_seq', 49, true);


--
-- Name: regioes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.regioes_id_seq', 5, true);


--
-- Name: spotify_playlist_musicas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spotify_playlist_musicas_id_seq', 137, true);


--
-- Name: youtube_video_estatisticas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.youtube_video_estatisticas_id_seq', 712, true);


--
-- Name: engajamento_regional engajamento_regional_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.engajamento_regional
    ADD CONSTRAINT engajamento_regional_pkey PRIMARY KEY (id);


--
-- Name: musica_video_correlacao musica_video_correlacao_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.musica_video_correlacao
    ADD CONSTRAINT musica_video_correlacao_pkey PRIMARY KEY (id);


--
-- Name: regioes regioes_codigo_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.regioes
    ADD CONSTRAINT regioes_codigo_unique UNIQUE (codigo);


--
-- Name: regioes regioes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.regioes
    ADD CONSTRAINT regioes_pkey PRIMARY KEY (id);


--
-- Name: spotify_albuns spotify_albuns_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spotify_albuns
    ADD CONSTRAINT spotify_albuns_pkey PRIMARY KEY (id);


--
-- Name: spotify_artistas spotify_artistas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spotify_artistas
    ADD CONSTRAINT spotify_artistas_pkey PRIMARY KEY (id);


--
-- Name: spotify_generos spotify_generos_nome_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spotify_generos
    ADD CONSTRAINT spotify_generos_nome_key UNIQUE (nome);


--
-- Name: spotify_generos spotify_generos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spotify_generos
    ADD CONSTRAINT spotify_generos_pkey PRIMARY KEY (id);


--
-- Name: spotify_musicas spotify_musicas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spotify_musicas
    ADD CONSTRAINT spotify_musicas_pkey PRIMARY KEY (id);


--
-- Name: spotify_playlist_musicas spotify_playlist_musicas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spotify_playlist_musicas
    ADD CONSTRAINT spotify_playlist_musicas_pkey PRIMARY KEY (id);


--
-- Name: spotify_playlists spotify_playlists_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spotify_playlists
    ADD CONSTRAINT spotify_playlists_pkey PRIMARY KEY (id);


--
-- Name: youtube_canais youtube_canais_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.youtube_canais
    ADD CONSTRAINT youtube_canais_pkey PRIMARY KEY (id);


--
-- Name: youtube_categorias youtube_categorias_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.youtube_categorias
    ADD CONSTRAINT youtube_categorias_pkey PRIMARY KEY (id);


--
-- Name: youtube_video_estatisticas youtube_video_estatisticas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.youtube_video_estatisticas
    ADD CONSTRAINT youtube_video_estatisticas_pkey PRIMARY KEY (id);


--
-- Name: youtube_videos youtube_videos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.youtube_videos
    ADD CONSTRAINT youtube_videos_pkey PRIMARY KEY (id);


--
-- Name: engajamento_regional engajamento_regional_regiao_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.engajamento_regional
    ADD CONSTRAINT engajamento_regional_regiao_id_fkey FOREIGN KEY (regiao_id) REFERENCES public.regioes(id);


--
-- Name: engajamento_regional engajamento_regional_video_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.engajamento_regional
    ADD CONSTRAINT engajamento_regional_video_id_fkey FOREIGN KEY (video_id) REFERENCES public.youtube_videos(id);


--
-- Name: musica_video_correlacao musica_video_correlacao_musica_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.musica_video_correlacao
    ADD CONSTRAINT musica_video_correlacao_musica_id_fkey FOREIGN KEY (musica_id) REFERENCES public.spotify_musicas(id);


--
-- Name: musica_video_correlacao musica_video_correlacao_video_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.musica_video_correlacao
    ADD CONSTRAINT musica_video_correlacao_video_id_fkey FOREIGN KEY (video_id) REFERENCES public.youtube_videos(id);


--
-- Name: spotify_musicas spotify_musicas_album_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spotify_musicas
    ADD CONSTRAINT spotify_musicas_album_id_fkey FOREIGN KEY (album_id) REFERENCES public.spotify_albuns(id);


--
-- Name: spotify_musicas spotify_musicas_artista_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spotify_musicas
    ADD CONSTRAINT spotify_musicas_artista_id_fkey FOREIGN KEY (artista_id) REFERENCES public.spotify_artistas(id);


--
-- Name: spotify_musicas spotify_musicas_genero_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spotify_musicas
    ADD CONSTRAINT spotify_musicas_genero_id_fkey FOREIGN KEY (genero_id) REFERENCES public.spotify_generos(id);


--
-- Name: spotify_playlist_musicas spotify_playlist_musicas_musica_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spotify_playlist_musicas
    ADD CONSTRAINT spotify_playlist_musicas_musica_id_fkey FOREIGN KEY (musica_id) REFERENCES public.spotify_musicas(id);


--
-- Name: spotify_playlist_musicas spotify_playlist_musicas_playlist_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spotify_playlist_musicas
    ADD CONSTRAINT spotify_playlist_musicas_playlist_id_fkey FOREIGN KEY (playlist_id) REFERENCES public.spotify_playlists(id);


--
-- Name: youtube_video_estatisticas youtube_video_estatisticas_video_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.youtube_video_estatisticas
    ADD CONSTRAINT youtube_video_estatisticas_video_id_fkey FOREIGN KEY (video_id) REFERENCES public.youtube_videos(id);


--
-- Name: youtube_videos youtube_videos_canal_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.youtube_videos
    ADD CONSTRAINT youtube_videos_canal_id_fkey FOREIGN KEY (canal_id) REFERENCES public.youtube_canais(id);


--
-- Name: youtube_videos youtube_videos_categoria_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.youtube_videos
    ADD CONSTRAINT youtube_videos_categoria_id_fkey FOREIGN KEY (categoria_id) REFERENCES public.youtube_categorias(id);


--
-- PostgreSQL database dump complete
--

\unrestrict QKfXFEiQHJkdatrLj8FWalHNvJwbKL4cCc5fLsOXkgwfRbd58IfSwOwQdIU4aIM

