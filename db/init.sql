-- init.sql
-- Crea la base de datos
-- esto es un comentario
CREATE DATABASE IF NOT EXISTS mydatabase;
USE mydatabase;

-- Crea una tabla
CREATE TABLE usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50)
);

-- Crea una tabla de direcciones
CREATE TABLE direcciones (
    direcciones_id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT,
    direccion VARCHAR(100),
    ciudad VARCHAR(50),
    estado VARCHAR(50),
    codigo_postal VARCHAR(10),
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
);

-- Crea una tabla de pedidos
CREATE TABLE pedidos (
    pedidos_id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT,
    fecha_pedido DATE,
    detalles_pedido TEXT,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
);

-- Inserta valores por defecto
INSERT INTO usuarios (nombre) VALUES ('Juan');
INSERT INTO usuarios (nombre) VALUES ('Marta');
INSERT INTO usuarios (nombre) VALUES ('Pedro');
INSERT INTO usuarios (nombre) VALUES ('Laura');
INSERT INTO usuarios (nombre) VALUES ('Vicente');
INSERT INTO usuarios (nombre) VALUES ('Alejandro');

-- Inserta direcciones para los usuarios
INSERT INTO direcciones (usuario_id, direccion, ciudad, estado, codigo_postal) VALUES
(1, 'Calle Toledo 1', 'Madrid', 'Madrid', '10001'),
(2, 'Avenida Libertadores 2', 'Getafe', 'Madrid', '20002'),
(3, 'Carrer Catalunya 3', 'Barcelona', 'Barcelona', '30003'),
(4, 'Avenida América 4', 'Zaragoza', 'Zaragoza', '40004'),
(5, 'Calle Malasana 5', 'Madrid', 'Madrid', '50005'),
(6, 'Plaza Espana 6', 'Palma', 'Mallorca', '60006');


-- Inserta pedidos para los usuarios
INSERT INTO pedidos (usuario_id, fecha_pedido, detalles_pedido) VALUES
(1, '2023-01-15', 'Libros'),
(1, '2023-02-20', 'Ropa'),
(2, '2023-03-25', 'Móvil'),
(3, '2023-04-30', 'Mesa'),
(4, '2023-05-05', 'Flores'),
(5, '2023-05-30', 'Cama'),
(6, '2023-06-05', 'Flores');
