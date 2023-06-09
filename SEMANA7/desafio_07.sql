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