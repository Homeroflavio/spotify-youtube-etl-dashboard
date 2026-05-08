import os
from dotenv import load_dotenv
from sqlalchemy import create_engine, text
from models import Base

#  Carrega as variáveis do arquivo .env para o ambiente do Python, permitindo que o código acesse as configurações do banco de dados sem depender de valores fixos no código-fonte:

load_dotenv()
 
DB_USER = os.getenv("DB_USER")
DB_PASSWORD = os.getenv("DB_PASSWORD")
DB_HOST = os.getenv("DB_HOST")
DB_PORT = os.getenv("DB_PORT")
DB_NAME = os.getenv("DB_NAME")

# Validação básica das variáveis

if not all([DB_USER, DB_PASSWORD, DB_HOST, DB_PORT, DB_NAME]):
    raise ValueError("Alguma variável de ambiente não foi definida no .env")


# Construção da URL de conexão usando as variáveis de ambiente:

DATABASE_URL = (
    f"postgresql+psycopg2://{DB_USER}:{DB_PASSWORD}"
    f"@{DB_HOST}:{DB_PORT}/{DB_NAME}"
)

# criação do engine(gerenciador de conexões , não é a conexão ainda) do SQLAlchemy, que é a interface principal para interagir com o banco de dados, usando a URL de conexão construída:

engine = create_engine(DATABASE_URL)

# Função para criar as tabelas no banco de dados com base nos modelos definidos em src/database/models.py:

def create_tables():
    Base.metadata.create_all(engine)
    print("Tabelas criadas com sucesso!")
    
# Função de teste para verificar se a conexão com o banco de dados está funcionando corretamente:(use python connection.py para rodar esse teste)

def test_connection():
    try:
        with engine.connect() as connection:
            result = connection.execute(text("SELECT 1"))
            print("Sucesso! Conexão com o banco de dados estabelecida.")
            print("Resultado:", result.scalar())
    except Exception as error:
        print("Falha ao conectar ao banco de dados:")
        print(error)


if __name__ == "__main__":
    test_connection()
    create_tables()