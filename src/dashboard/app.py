import os
import pandas as pd
from dotenv import load_dotenv
from sqlalchemy import create_engine

import dash
from dash import dcc, html, dash_table, Input, Output
import dash_bootstrap_components as dbc
import plotly.express as px

# =========================================================
# CONFIG BANCO
# =========================================================

load_dotenv()

DB_USER = os.getenv("DB_USER")
DB_PASSWORD = os.getenv("DB_PASSWORD")
DB_HOST = os.getenv("DB_HOST")
DB_PORT = os.getenv("DB_PORT")
DB_NAME = os.getenv("DB_NAME")

DB_SSLMODE = os.getenv("DB_SSLMODE")

DATABASE_URL = (
    f"postgresql+psycopg2://{DB_USER}:{DB_PASSWORD}"
    f"@{DB_HOST}:{DB_PORT}/{DB_NAME}"
    f"?sslmode={DB_SSLMODE}"
)

engine = create_engine(DATABASE_URL)

# =========================================================
# QUERIES
# =========================================================

query_kpis = """
SELECT
    (SELECT COUNT(*) FROM spotify_musicas) AS total_musicas,
    (SELECT COUNT(*) FROM spotify_artistas) AS total_artistas,
    (SELECT COUNT(*) FROM youtube_videos) AS total_videos,
    (SELECT COUNT(*) FROM musica_video_correlacao) AS total_correlacoes,
    (SELECT COUNT(*) FROM regioes) AS total_regioes
"""

query_top_artistas = """
SELECT
    a.nome,
    COUNT(m.id) AS total_musicas
FROM spotify_artistas a
JOIN spotify_musicas m
    ON a.id = m.artista_id
GROUP BY a.nome
ORDER BY total_musicas DESC
LIMIT 10
"""

query_artistas_duracao = """
SELECT
    a.nome,
    ROUND((AVG(m.duracao_ms) / 60000.0)::numeric, 2) AS media_duracao_min
FROM spotify_artistas a
JOIN spotify_musicas m
    ON a.id = m.artista_id
WHERE m.duracao_ms IS NOT NULL
  AND m.duracao_ms BETWEEN 30000 AND 600000
GROUP BY a.nome
ORDER BY media_duracao_min DESC
LIMIT 10
"""

query_duracao = """
SELECT
    ROUND((duracao_ms / 60000.0)::numeric, 2) AS duracao_min
FROM spotify_musicas
WHERE duracao_ms IS NOT NULL
  AND duracao_ms BETWEEN 30000 AND 600000
"""

query_top_videos = """
SELECT
    v.titulo,
    MAX(e.views) AS views
FROM youtube_videos v
JOIN youtube_video_estatisticas e
    ON v.id = e.video_id
GROUP BY v.titulo
ORDER BY views DESC
LIMIT 10
"""

query_top_canais = """
SELECT
    c.nome,
    SUM(e.views) AS total_views
FROM youtube_canais c
JOIN youtube_videos v
    ON c.id = v.canal_id
JOIN youtube_video_estatisticas e
    ON v.id = e.video_id
GROUP BY c.nome
ORDER BY total_views DESC
LIMIT 10
"""

query_views_likes = """
SELECT
    views,
    likes,
    comentarios
FROM youtube_video_estatisticas
WHERE views > 0
"""

query_correlacao = """
SELECT
    score_correlacao
FROM musica_video_correlacao
"""

query_top_correlacoes = """
SELECT
    m.nome AS musica,
    v.titulo AS video,
    mvc.score_correlacao
FROM musica_video_correlacao mvc
JOIN spotify_musicas m
    ON mvc.musica_id = m.id
JOIN youtube_videos v
    ON mvc.video_id = v.id
ORDER BY mvc.score_correlacao DESC
LIMIT 30
"""

query_regioes = """
SELECT
    r.nome AS regiao,
    r.codigo,
    SUM(er.views) AS total_views,
    SUM(er.likes) AS total_likes,
    SUM(er.comentarios) AS total_comentarios,
    ROUND(AVG(er.taxa_engajamento), 4) AS media_engajamento
FROM engajamento_regional er
JOIN regioes r
    ON er.regiao_id = r.id
GROUP BY r.nome, r.codigo
ORDER BY total_views DESC
"""

query_3d = """
SELECT
    er.views,
    er.likes,
    er.comentarios,
    r.nome AS regiao
FROM engajamento_regional er
JOIN regioes r
    ON er.regiao_id = r.id
WHERE er.views > 0
"""

query_correlacao_views = """
SELECT
    m.nome AS musica,
    v.titulo AS video,
    mvc.score_correlacao,
    MAX(e.views) AS views,
    MAX(e.likes) AS likes,
    MAX(e.comentarios) AS comentarios
FROM musica_video_correlacao mvc
JOIN spotify_musicas m
    ON mvc.musica_id = m.id
JOIN youtube_videos v
    ON mvc.video_id = v.id
JOIN youtube_video_estatisticas e
    ON v.id = e.video_id
GROUP BY m.nome, v.titulo, mvc.score_correlacao
ORDER BY views DESC
LIMIT 30
"""

# =========================================================
# DATAFRAMES
# =========================================================

df_kpis = pd.read_sql(query_kpis, engine)
df_top_artistas = pd.read_sql(query_top_artistas, engine)
df_artistas_duracao = pd.read_sql(query_artistas_duracao, engine)
df_duracao = pd.read_sql(query_duracao, engine)

df_videos = pd.read_sql(query_top_videos, engine)
df_canais = pd.read_sql(query_top_canais, engine)
df_views_likes = pd.read_sql(query_views_likes, engine)

df_correlacao = pd.read_sql(query_correlacao, engine)
df_top_correlacoes = pd.read_sql(query_top_correlacoes, engine)
df_correlacao_views = pd.read_sql(query_correlacao_views, engine)

df_regioes = pd.read_sql(query_regioes, engine)
df_3d = pd.read_sql(query_3d, engine)

# Corrige códigos para o mapa
MAPA_ISO3 = {
    "BR": "BRA",
    "US": "USA",
    "MX": "MEX",
    "AR": "ARG",
    "PT": "PRT"
}

df_regioes["codigo_iso3"] = df_regioes["codigo"].map(MAPA_ISO3)

# =========================================================
# KPIS
# =========================================================

total_musicas = int(df_kpis["total_musicas"][0])
total_artistas = int(df_kpis["total_artistas"][0])
total_videos = int(df_kpis["total_videos"][0])
total_correlacoes = int(df_kpis["total_correlacoes"][0])
total_regioes = int(df_kpis["total_regioes"][0])

# =========================================================
# TEMA DOS GRÁFICOS
# =========================================================

def aplicar_layout(fig):
    fig.update_layout(
        template="plotly_dark",
        paper_bgcolor="#111827",
        plot_bgcolor="#111827",
        font=dict(color="white"),
        title=dict(font=dict(size=18)),
        margin=dict(l=40, r=40, t=60, b=40),
        height=430
    )
    return fig


# =========================================================
# APP
# =========================================================

app = dash.Dash(
    __name__,
    external_stylesheets=[dbc.themes.CYBORG],
    suppress_callback_exceptions=True
)

app.title = "Spotify + YouTube ETL Dashboard"

server = app.server

# =========================================================
# COMPONENTES
# =========================================================

def kpi_card(titulo, valor, classe):
    return dbc.Card(
        dbc.CardBody([
            html.P(titulo, className="kpi-title"),
            html.H2(f"{valor:,}".replace(",", "."), className="kpi-value")
        ]),
        className=f"kpi-card {classe}"
    )


def graph_card(grafico):
    return dbc.Card(
        dbc.CardBody([
            dcc.Graph(figure=grafico, config={"displayModeBar": True})
        ]),
        className="graph-card"
    )


# =========================================================
# LAYOUT PRINCIPAL
# =========================================================

app.layout = dbc.Container([

    html.Div([
        html.H1("Spotify + YouTube ETL Dashboard", className="dashboard-title"),
        html.P(
            "Análise integrada de músicas, vídeos, correlação e engajamento regional",
            className="dashboard-subtitle"
        )
    ], className="header"),

    dbc.Row([
        dbc.Col(kpi_card("Músicas Spotify", total_musicas, "blue"), md=2),
        dbc.Col(kpi_card("Artistas", total_artistas, "green"), md=2),
        dbc.Col(kpi_card("Vídeos YouTube", total_videos, "red"), md=2),
        dbc.Col(kpi_card("Correlações", total_correlacoes, "orange"), md=3),
        dbc.Col(kpi_card("Regiões", total_regioes, "purple"), md=3),
    ], className="kpi-row"),

    dcc.Tabs(
        id="tabs-dashboard",
        value="tab-overview",
        className="custom-tabs",
        children=[
            dcc.Tab(label="Visão Geral", value="tab-overview", className="custom-tab", selected_className="custom-tab-selected"),
            dcc.Tab(label="Spotify", value="tab-spotify", className="custom-tab", selected_className="custom-tab-selected"),
            dcc.Tab(label="YouTube", value="tab-youtube", className="custom-tab", selected_className="custom-tab-selected"),
            dcc.Tab(label="Correlação", value="tab-correlacao", className="custom-tab", selected_className="custom-tab-selected"),
            dcc.Tab(label="Regiões", value="tab-regioes", className="custom-tab", selected_className="custom-tab-selected"),
        ]
    ),

    html.Div(id="conteudo-tabs", className="tab-content-area")

], fluid=True, className="main-container")

# =========================================================
# CALLBACK DAS ABAS
# =========================================================

@app.callback(
    Output("conteudo-tabs", "children"),
    Input("tabs-dashboard", "value")
)
def renderizar_tabs(tab):

    # =====================================================
    # VISÃO GERAL
    # =====================================================

    if tab == "tab-overview":

        fig_3d = aplicar_layout(px.scatter_3d(
            df_3d,
            x="views",
            y="likes",
            z="comentarios",
            color="regiao",
            title="Engajamento Regional em 3D",
            opacity=0.75
        ))

        fig_mapa = aplicar_layout(px.choropleth(
            df_regioes,
            locations="codigo_iso3",
            color="total_views",
            hover_name="regiao",
            hover_data={
                "total_views": ":,.0f",
                "total_likes": ":,.0f",
                "total_comentarios": ":,.0f",
                "codigo_iso3": False
            },
            projection="natural earth",
            color_continuous_scale="Turbo",
            title="Mapa Global de Views por Região"
        ))

        fig_funil = aplicar_layout(px.funnel(
            pd.DataFrame({
                "etapa": ["Músicas", "Vídeos", "Engajamento Regional", "Correlações"],
                "total": [total_musicas, total_videos, len(df_3d), total_correlacoes]
            }),
            x="total",
            y="etapa",
            title="Funil do Pipeline ETL"
        ))

        return dbc.Row([
            dbc.Col(graph_card(fig_3d), md=7),
            dbc.Col(graph_card(fig_mapa), md=5),
            dbc.Col(graph_card(fig_funil), md=12),
        ])

    # =====================================================
    # SPOTIFY
    # =====================================================

    if tab == "tab-spotify":

        fig_top_artistas = aplicar_layout(px.bar(
            df_top_artistas.sort_values("total_musicas"),
            x="total_musicas",
            y="nome",
            orientation="h",
            title="Top Artistas por Quantidade de Músicas"
        ))

        fig_duracao_artistas = aplicar_layout(px.bar(
            df_artistas_duracao.sort_values("media_duracao_min"),
            x="media_duracao_min",
            y="nome",
            orientation="h",
            title="Artistas por Duração Média das Músicas (min)"
        ))

        fig_duracao = aplicar_layout(px.histogram(
            df_duracao,
            x="duracao_min",
            nbins=20,
            title="Distribuição da Duração das Músicas (minutos)"
        ))

        return dbc.Row([
            dbc.Col(graph_card(fig_top_artistas), md=6),
            dbc.Col(graph_card(fig_duracao_artistas), md=6),
            dbc.Col(graph_card(fig_duracao), md=12),
        ])

    # =====================================================
    # YOUTUBE
    # =====================================================

    if tab == "tab-youtube":

        fig_top_videos = aplicar_layout(px.bar(
            df_videos.sort_values("views"),
            x="views",
            y="titulo",
            orientation="h",
            title="Top Vídeos por Views"
        ))

        fig_canais = aplicar_layout(px.treemap(
            df_canais,
            path=["nome"],
            values="total_views",
            title="Treemap dos Canais por Views"
        ))

        fig_scatter = aplicar_layout(px.scatter(
            df_views_likes,
            x="views",
            y="likes",
            size="comentarios",
            color="comentarios",
            title="Relação entre Views, Likes e Comentários",
            hover_data=["comentarios"]
        ))

        return dbc.Row([
            dbc.Col(graph_card(fig_top_videos), md=6),
            dbc.Col(graph_card(fig_canais), md=6),
            dbc.Col(graph_card(fig_scatter), md=12),
        ])

    # =====================================================
    # CORRELAÇÃO
    # =====================================================

    if tab == "tab-correlacao":

        fig_score = aplicar_layout(px.histogram(
            df_correlacao,
            x="score_correlacao",
            nbins=10,
            title="Distribuição dos Scores de Correlação"
        ))

        fig_score_views = aplicar_layout(px.scatter(
            df_correlacao_views,
            x="views",
            y="score_correlacao",
            size="likes",
            color="comentarios",
            hover_name="musica",
            hover_data=["video"],
            title="Score de Correlação x Views dos Vídeos"
        ))

        return dbc.Row([
            dbc.Col(graph_card(fig_score), md=5),
            dbc.Col(graph_card(fig_score_views), md=7),

            dbc.Col([
                html.H3("Top Correlações Música ↔ Vídeo", className="section-title"),

                dash_table.DataTable(
                    data=df_top_correlacoes.to_dict("records"),
                    columns=[
                        {"name": i, "id": i}
                        for i in df_top_correlacoes.columns
                    ],
                    page_size=10,
                    filter_action="native",
                    sort_action="native",
                    style_table={
                        "overflowX": "auto",
                        "borderRadius": "14px"
                    },
                    style_cell={
                        "backgroundColor": "#111827",
                        "color": "white",
                        "padding": "12px",
                        "textAlign": "left",
                        "fontFamily": "Segoe UI",
                        "maxWidth": "420px",
                        "whiteSpace": "normal"
                    },
                    style_header={
                        "backgroundColor": "#1f2937",
                        "fontWeight": "bold",
                        "color": "#38bdf8"
                    }
                )
            ], md=12)
        ])

    # =====================================================
    # REGIÕES
    # =====================================================

    if tab == "tab-regioes":

        fig_donut = aplicar_layout(px.pie(
            df_regioes,
            names="regiao",
            values="total_views",
            hole=0.55,
            title="Distribuição de Views por Região"
        ))

        fig_engajamento = aplicar_layout(px.bar(
            df_regioes.sort_values("media_engajamento"),
            x="media_engajamento",
            y="regiao",
            orientation="h",
            color="media_engajamento",
            title="Taxa Média de Engajamento por Região",
            color_continuous_scale="Viridis"
        ))

        fig_likes_comentarios = aplicar_layout(px.scatter(
            df_regioes,
            x="total_likes",
            y="total_comentarios",
            size="total_views",
            color="regiao",
            title="Likes x Comentários por Região",
            hover_name="regiao"
        ))

        return dbc.Row([
            dbc.Col(graph_card(fig_donut), md=4),
            dbc.Col(graph_card(fig_engajamento), md=4),
            dbc.Col(graph_card(fig_likes_comentarios), md=4),
        ])

    return html.Div("Aba não encontrada.")


# =========================================================
# RUN
# =========================================================

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8050, debug=True)