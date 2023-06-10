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

CREATE TABLE usuario ( --lo hizo Ailen
    id_usuario INT (25) NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(25),
    apellido VARCHAR(25),
    telefono INT,
    username VARCHAR(40),
    email VARCHAR(40),
    contrasenia VARCHAR(20) NOT NULL,
    estado BOOLEAN,
    fecha_creacion DATE,
    avatar VARCHAR(255),
    es_publico BOOLEAN,
    es_colaborador BOOLEAN,
    es_admin BOOLEAN,
    PRIMARY KEY (id_usuario)
    Foreign Key (id_articulo) REFERENCES (articulo) --Agrego Euge no se si esta bien
);
--Arranca Parte de Euge
--Agregar el comando necesario que introduzca en la tabla usuario, 1 usuario con rol de admin (El campo es_admin es booleano)
INSERT INTO usuario (nombre, apellido, telefono, username, email, contrasenia, estado, fecha_creacion, avatar, es_publico, es_colaborador, es_admin)
VALUES ('Nombre del Admin', 'Apellido del Admin', 123456789, 'admin', 'admin@ong.com', 'contraseña del Admin', true, CURDATE(), 'imagen.jpg', false, false, true);

--Agregar el comando necesario que introduzca en la tabla usuario, 4 usuarios con rol de colaborador.  (El campo es_colaborador es booleano)
INSERT INTO usuario (nombre, apellido, telefono, username, email, contrasenia, estado, fecha_creacion, avatar, es_publico, es_colaborador, es_admin)
VALUES ('Nombre de Colab1', 'Apellido de Colab1', 111111111, 'colaborador1', 'colab1@ong.com', 'contraseña Colab1', true, CURDATE(), 'imagen1.jpg', false, true, false),
       ('Nombre de Colab2', 'Apellido de Colab2', 222222222, 'colaborador2', 'colab2@ong.com', 'contraseña Colab2', true, CURDATE(), 'imagen2.jpg', false, true, false),
       ('Nombre de Colab3', 'Apellido de Colab3', 333333333, 'colaborador3', 'colab3@ong.com', 'contraseña Colab3', true, CURDATE(), 'imagen3.jpg', false, true, false),
       ('Nombre de Colab4', 'Apellido de Colab4', 444444444, 'colaborador4', 'colab4@ong.com', 'contraseña Colab4', true, CURDATE(), 'imagen4.jpg', false, true, false);

--Agregar el comando necesario que introduzca en la tabla usuario   5 usuarios con rol de público. (El campo es_publico es booleano)
INSERT INTO usuario (nombre, apellido, telefono, username, email, contrasenia, estado, fecha_creacion, avatar, es_publico, es_colaborador, es_admin)
VALUES ('Nombre de Pub1', 'Apellido de Pub1', 555555555, 'publico1', 'publico1@ong.com', 'contraseña Pub1', true, CURDATE(), 'imagen5.jpg', true, false, false),
       ('Nombre de Pub2', 'Apellido de Pub2', 666666666, 'publico2', 'publico2@ong.com', 'contraseña Pub2', true, CURDATE(), 'imagen6.jpg', true, false, false),
       ('Nombre de Pub3', 'Apellido de Pub3', 777777777, 'publico3', 'publico3@ong.com', 'contraseña Pub3', true, CURDATE(), 'imagen7.jpg', true, false, false),
       ('Nombre de Pub4', 'Apellido de Pub4', 888888888, 'publico4', 'publico4@ong.com', 'contraseña Pub4', true, CURDATE(), 'imagen8.jpg', true, false, false),
       ('Nombre de Pub5', 'Apellido de Pub5', 999999999, 'publico5', 'publico5@ong.com', 'contraseña Pub5', true, CURDATE(), 'imagen9.jpg', true, false, false);

--Agregar el comando necesario para actualizar el rol a admin de uno de los usuarios agregado con rol de colaborador
UPDATE usuario
SET es_admin = true
WHERE id_usuario = [ID_USUARIO]; --Reemplazar con el id de usuario que corresponda... FIN DE PARTE EUGE

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
  PRIMARY KEY(id),
  FOREIGN KEY (id_categoria) REFERENCES categoria(id)
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
