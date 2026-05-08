# Spotify + YouTube ETL Dashboard

Projeto completo de Engenharia e Análise de Dados utilizando processos ETL com integração entre Spotify e YouTube, armazenamento em PostgreSQL e visualização interativa com Dash + Plotly.

---

# Preview do Dashboard

## Dashboard Principal

> Adicione aqui um print do dashboard

![Dashboard](images/dashboard.png)

---

# Objetivo do Projeto

Este projeto foi desenvolvido com foco em Engenharia de Dados e Visualização Interativa, realizando extração, transformação e carregamento (ETL) de dados do Spotify e YouTube para análise de tendências musicais, vídeos populares e padrões de engajamento regional.

O sistema integra APIs reais, banco PostgreSQL em nuvem e dashboards interativos para análise dos dados processados.

---

# Temas ETL Implementados

## 1. Análise de Playlists e Faixas Populares no Spotify

- Extração de músicas populares
- Artistas
- Álbuns
- Playlists
- Gêneros
- Duração das músicas

---

## 2. Tendências de Vídeos Populares no YouTube

- Extração de vídeos populares
- Views
- Likes
- Comentários
- Categorias
- Estatísticas de engajamento

---

## 3. Correlação entre Música e Vídeos Populares

Sistema de correlação entre:
- músicas do Spotify
- vídeos do YouTube

Utilizando:
- limpeza textual
- similaridade de strings
- matching de palavras
- análise de score de correlação

---

## 4. Análise de Engajamento por Região

Análise regional baseada em:
- Brasil
- Estados Unidos
- México
- Argentina
- Portugal

Métricas:
- views
- likes
- comentários
- taxa de engajamento

---

## 5. Dashboard Interativo

Dashboard moderno desenvolvido com:
- Dash
- Plotly
- CSS customizado

Com:
- gráficos 3D
- mapas globais
- treemap
- scatter plots
- filtros interativos
- tabelas dinâmicas

---

# Tecnologias Utilizadas

## Linguagem

- Python 3

---

## Bibliotecas

- Pandas
- SQLAlchemy
- Psycopg2
- Requests
- Plotly
- Dash
- Dash Bootstrap Components
- Python Dotenv

---

## Banco de Dados

- PostgreSQL
- Neon PostgreSQL (Cloud Database)

---

## APIs Utilizadas

## Spotify API

Utilizada para:
- músicas
- artistas
- playlists
- álbuns
- gêneros

---

## YouTube Data API v3

Utilizada para:
- vídeos populares
- estatísticas
- canais
- categorias

---

# Arquitetura do Projeto

```text
Spotify API                 YouTube API
      │                           │
      ▼                           ▼
================= EXTRACT =================
      │
      ▼
================ TRANSFORM ================
      │
      ▼
=================== LOAD ==================
      │
      ▼
PostgreSQL (Neon Cloud Database)
      │
      ▼
Dash + Plotly Dashboard
