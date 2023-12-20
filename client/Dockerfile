# Establecemos la imagen base con Python
# De esta manera, evitamos tener que instalar manualmente Python.
# FROM python:latest
FROM golang:1.16 as builder

# Establecemos el directorio de trabajo en el contenedor,
# es decir, a partir de ahora, trabajaremos sobre este directorio.
# Debemos considerar que esto hará un cambio de directorio.
# FROM alpine:latest 
WORKDIR /app 
# para ambas WORKDIR /app 

# Instalamos las dependencias de la aplicacion
# En este caso, solo necesitaremos Flask y el conector a MySQL.
# RUN pip install requests
# Compila la aplicación
RUN go mod init example.com/greetings

# Copiamos el codigo fuente de la aplicacion al contenedor
# Esto incluye tanto el archivo app.py como formulario.html
# Copia el ejecutable compilado desde la imagen de construcción
# COPY --from=builder /app/ .
COPY main.go .
RUN CGO_ENABLED=0 GOOS=linux go build -o app

FROM scratch
COPY --from=builder /app/app /
# Finalmente, declaramos el comando a ejecutar por defecto al lanzar el contenedor.
# Comando por defecto al ejecutar el contenedor
# CMD ["python", "app/client.py"]
CMD ["/app"]

