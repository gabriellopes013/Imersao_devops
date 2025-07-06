FROM python:3.13.4-alpine3.22

# Define o diretório de trabalho no contêiner
WORKDIR /app

# Copia o arquivo de dependências para o diretório de trabalho.
# Isso é feito primeiro para aproveitar o cache do Docker. A camada de
# dependências só será reconstruída se o requirements.txt mudar.
COPY requirements.txt .

# Instala as dependências da aplicação
RUN pip install --no-cache-dir -r requirements.txt

# Copia o restante do código da aplicação para o diretório de trabalho
COPY . .

# Comando para iniciar a aplicação quando o contêiner for executado
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]
