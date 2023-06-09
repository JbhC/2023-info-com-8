CREATE DATABASE desafio_07;

USE desafio_07;

CREATE TABLE comentario (

    id INT (25) NOT NULL AUTO_INCREMENT, 
    id_articulo INT (6),
    id_usuario INT (4),
    contenido VARCHAR(250),
    fecha_hora TIMESTAMP,
    PRIMARY KEY (id),
    Foreign Key (id_usuario) REFERENCES (usuario),
    Foreign Key (id_articulo) REFERENCES (articulo)

) ;
CREATE TABLE usuario(
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
;)

CREATE TABLE articulo (
  id INT PRIMARY KEY AUTO_INCREMENT,
  titulo VARCHAR(100) ,
  estado BOOLEAN
);

CREATE TABLE categoria (
  id INT PRIMARY KEY AUTO_INCREMENT,
  id_categoria INT,
  descripcion VARCHAR(100),
  imagen VARCHAR(100),
  estado BOOLEAN,
  PRIMARY KEY(id)
  FOREING KEY (id_categoria) REFERENCES categoria(id)
);

CREATE TABLE articulo_categoria (
  articulo_id INT,
  categoria_id INT,
  FOREIGN KEY (articulo_id) REFERENCES articulo(id),
  FOREIGN KEY (categoria_id) REFERENCES categoria(id)
);

--Agregar el comando necesario que introduzca en la tabla usuario, 1 usuario con rol de admin, 4 con rol de colaborador y 5 con rol de público.
-- Donde los campos: es_publico, es_colaborador y es_admin son booleanos.--

INSERT INTO usuario (es_admin)
--parte de julian:- Agregar el comando necesario para listar todos los artículos que tengan
--comentarios, mostrando el título del artículo, la fecha_publicacion del artículo, el
--nombre del usuario que realizo el comentario y la fecha_hora que realizó dicho
--comentario, agrupados por artículos
INSERT INTO comentario(contenido, id_articulo, id_usuario) VALUES ("comentario 1", 1, 1);
INSERT INTO comentario(contenido, id_articulo, id_usuario) VALUES ("comentario 2", 1, 1);
INSERT INTO comentario(contenido, id_articulo, id_usuario) VALUES ("comentario 3", 1, 1);
INSERT INTO comentario(contenido, id_articulo, id_usuario) VALUES ("comentario 1", 2, 1);
INSERT INTO comentario(contenido, id_articulo, id_usuario) VALUES ("comentario 2", 2, 1); --aqui termina la parte de julian
