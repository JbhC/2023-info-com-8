CREATE DATABASE desafio_07;

USE desafio_07;

CREATE TABLE IF NOT EXISTS comentario (

    id INT (25) PRIMARY KEY NOT NULL AUTO_INCREMENT, 
    id_articulo INT (6),
    id_usuario INT (4),
    contenido VARCHAR(250),
    fecha_hora TIMESTAMP,
    Foreign Key (id_usuario) REFERENCES (usuario),
    Foreign Key (id_articulo) REFERENCES (articulo),

) 

CREATE TABLE IF NOT EXISTS usuario(
    id_usuario INT (8) NOT NULL,
    nombre VARCHAR (15),
    apellido VARCHAR (15),
    telefono INT (10),
    username VARCHAR (10),
    email VARCHAR (25)
    contraseña CHAR(25)
    estado BOOLEAN,
    fecha_creacion DATE,
    avatar CHAR (25)
    es_publico BOOLEAN,
    es_colaborador BOOLEAN,
    es_admin BOOLEAN,
    PRIMARY KEY (id_usuario)
)

--Agregar el comando necesario que introduzca en la tabla usuario, 1 usuario con rol de admin, 4 con rol de colaborador y 5 con rol de público.
-- Donde los campos: es_publico, es_colaborador y es_admin son booleanos.--

INSERT INTO usuario (es_admin)