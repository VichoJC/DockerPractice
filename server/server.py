from flask import Flask, request, render_template
import logging as log
import psycopg2

log.basicConfig(level=log.INFO)

app = Flask(__name__)

# Configura la conexion a la base de datos PostgreSQL
db_config = {
    'host': 'postgres',  # Definido en el docker-compose en seccion posterior
    'dbname': 'mydatabase',
    'user': 'test',  # Asegúrate de usar las credenciales correctas
    'password': 'ejemplo'
}

def store_data_db(data):
    try:
        # Conecta a la base de datos PostgreSQL
        conn = psycopg2.connect(**db_config)
        cursor = conn.cursor()

        # Inserta los datos en la tabla usuarios
        cursor.execute("INSERT INTO usuarios(nombre) VALUES(%s);", (data,))

        # Realiza commit y cierra la conexion
        conn.commit()
        cursor.close()
        conn.close()
        log.info("Successfully registered")
    except Exception as e:
        log.warning(f"Could not insert in database {data} (Database may not be ready): {e}")

@app.route('/')
def index():
    # Esta funcion se asocia a la ruta raiz "/"
    return render_template('index.html')

@app.route('/formulario', methods=['POST'])
def formulario():
    # Esta funcion se asocia a la ruta "/formulario"
    if request.method == 'POST':
        # Si se envia el formulario, procesamos los datos
        nombre = request.form['nombre']

        # Llama a la funcion para almacenar datos en la base de datos
        store_data_db(nombre)

        mensaje = f"Hola, {nombre}. Gracias por haber rellenado el formulario. Bienvenido a mi app web."
        return mensaje

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
