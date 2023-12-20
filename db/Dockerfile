# FROM mysql:latest

# Establecemos variables de entorno para MySQL
# ENV MYSQL_DATABASE=mydatabase
# ENV MYSQL_ROOT_PASSWORD=ejemplo
# ENV MYSQL_USER=test
# ENV MYSQL_PASSWORD=ejemplo

# Copiamos el script de SQL a la imagen
# COPY init.sql /docker-entrypoint-initdb.d/
FROM postgres:latest

# Establecemos variables de entorno para PostgreSQL
ENV POSTGRES_DB=mydatabase
ENV POSTGRES_USER=test
ENV POSTGRES_PASSWORD=ejemplo

# Copiamos el script de SQL a la imagen
COPY init.sql /docker-entrypoint-initdb.d/
