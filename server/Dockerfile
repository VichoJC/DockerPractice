FROM python:3.8-slim

# Instala las dependencias necesarias para psycopg2-binary
RUN apt-get update && apt-get install -y libpq-dev gcc && apt-get clean

# Copia los archivos de requisitos y los instala
COPY requirements.txt .
RUN pip install -r requirements.txt

# Copia el resto de tu aplicación Flask al contenedor
COPY . /app
WORKDIR /app

# Expone el puerto en el que se ejecutará la aplicación
EXPOSE 5000

# El comando para iniciar la aplicación
CMD ["python", "app.py"]
