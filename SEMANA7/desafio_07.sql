--El siguiente codigo fue creado de manera integral por los miembros del grupo "grupo.py" del informatorio2023-com8
--Para el mismo hubo una division de tareas y posterior puesta a punto en la que intervinieron los miembros del grupo
--durante el desarrollo se utilizaron heramientas como github y trello (para el segumiento mediante tablero kanban)
--se puede agragar que el desarrollo estuvo basado en metodologias agiles de trabajo tipo Scrum.
--a continuacion el resultado:

--se crea base de datos
CREATE DATABASE desafio_07;

USE desafio_07;

--se crean tablas
CREATE TABLE comentario (

    id_comentario INT (15) NOT NULL AUTO_INCREMENT, 
    id_articulo INT (12),
    id_usuario INT (12),
    contenido VARCHAR(280),
    fecha_hora TIMESTAMP,
    estado BOOLEAN,
    PRIMARY KEY (id_comentario),
    Foreign Key (id_usuario) REFERENCES usuario(id_usuario),
    Foreign Key (id_articulo) REFERENCES articulo(id_articulo)
) ;
--lo hizo Ailen

CREATE TABLE usuario ( 
    id_usuario INT (12) NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(25),
    apellido VARCHAR(25),
    telefono INT,
    username VARCHAR(30),
    email VARCHAR(50),
    contrasenia VARCHAR(20) NOT NULL,
    estado BOOLEAN,
    fecha_creacion TIMESTAMP,
    avatar VARCHAR(255),
    es_publico BOOLEAN,
    es_colaborador BOOLEAN,
    es_admin BOOLEAN,
    PRIMARY KEY (id_usuario)
) ;
--lo hizo Johana

CREATE TABLE articulo (
   id_articulo INT (12) NOT NULL AUTO_INCREMENT,
   id_usuario INT (12),
   titulo VARCHAR(100),
   resumen VARCHAR(255),
   contenido VARCHAR(4096),
   fecha_publicacion TIMESTAMP,
   estado BOOLEAN,
   imagen VARCHAR(255),
   PRIMARY KEY(id_articulo),
   Foreign Key (id_usuario) REFERENCES usuario(id_usuario),
) ;

CREATE TABLE articulo_categoria (
   id_articulo INT (12),
   id_categoria INT(12),
   FOREIGN KEY (id_articulo) REFERENCES articulo(id_articulo),
   FOREIGN KEY (id_categoria) REFERENCES categoria(id_categoria),
);

CREATE TABLE categoria (
  id INT(12) AUTO_INCREMENT,
  id_categoria INT,
  nombre VARCHAR(100),
  descripcion VARCHAR(255),
  imagen VARCHAR(255),
  estado BOOLEAN,
  PRIMARY KEY(id),
  FOREIGN KEY (id_categoria) REFERENCES categoria(id)
);
--lo hizo Cele

--Arranca Parte de Euge

-- Agregar el comando necesario que introduzca en la tabla usuario, 1 usuario con rol
--de admin, 4 con rol de colaborador y 5 con rol de público. Donde los campos:
--es_publico, es_colaborador y es_admin son booleanos.
INSERT INTO usuario (nombre, apellido, telefono, username, email, contrasenia, estado, fecha_creacion, avatar, es_publico, es_colaborador, es_admin)
VALUES ('Nombre del Admin', 'Apellido del Admin', 123456789, 'admin', 'admin@ong.com', 'contraseña del Admin', true, CURDATE(), 'imagen.jpg', false, false, true),
       ('Nombre de Colab1', 'Apellido de Colab1', 111111111, 'colaborador1', 'colab1@ong.com', 'contraseña Colab1', true, CURDATE(), 'imagen1.jpg', false, true, false),
       ('Nombre de Colab2', 'Apellido de Colab2', 222222222, 'colaborador2', 'colab2@ong.com', 'contraseña Colab2', true, CURDATE(), 'imagen2.jpg', false, true, false),
       ('Nombre de Colab3', 'Apellido de Colab3', 333333333, 'colaborador3', 'colab3@ong.com', 'contraseña Colab3', true, CURDATE(), 'imagen3.jpg', false, true, false),
       ('Nombre de Colab4', 'Apellido de Colab4', 444444444, 'colaborador4', 'colab4@ong.com', 'contraseña Colab4', true, CURDATE(), 'imagen4.jpg', false, true, false),
       ('Nombre de Pub1', 'Apellido de Pub1', 555555555, 'publico1', 'publico1@ong.com', 'contraseña Pub1', true, CURDATE(), 'imagen5.jpg', true, false, false),
       ('Nombre de Pub2', 'Apellido de Pub2', 666666666, 'publico2', 'publico2@ong.com', 'contraseña Pub2', true, CURDATE(), 'imagen6.jpg', true, false, false),
       ('Nombre de Pub3', 'Apellido de Pub3', 777777777, 'publico3', 'publico3@ong.com', 'contraseña Pub3', true, CURDATE(), 'imagen7.jpg', true, false, false),
       ('Nombre de Pub4', 'Apellido de Pub4', 888888888, 'publico4', 'publico4@ong.com', 'contraseña Pub4', true, CURDATE(), 'imagen8.jpg', true, false, false),
       ('Nombre de Pub5', 'Apellido de Pub5', 999999999, 'publico5', 'publico5@ong.com', 'contraseña Pub5', true, CURDATE(), 'imagen9.jpg', true, false, false);

--Agregar el comando necesario para actualizar el rol a admin de uno de los usuarios agregado con rol de colaborador
UPDATE usuario
SET es_admin = true
WHERE id_usuario = [ID_USUARIO]; --Reemplazar con el id de usuario que corresponda... 

--FIN DE PARTE EUGE

-- Agregar el comando necesario que introduzca en la tabla articulo, 3 artículos con
--estado TRUE y uno con estado FALSE. Donde el campo estado en todas las tablas es Booleano.
INSERT INTO articulo (titulo, resumen, contenido, estado, imagen, id_usuario)
VALUES
    ('Título del artículo 1', 'Resumen del artículo 1', 'Contenido del artículo 1', TRUE, 'imagen1.jpg', 2),
    ('Título del artículo 2', 'Resumen del artículo 2', 'Contenido del artículo 2', TRUE, 'imagen2.jpg', 5),
    ('Título del artículo 3', 'Resumen del artículo 3', 'Contenido del artículo 3', TRUE, 'imagen3.jpg', 4),
    ('Título del artículo 4', 'Resumen del artículo 4', 'Contenido del artículo 4', FALSE, 'imagen4.jpg', 3);
-- lo hizo Fran

-- Agregar el comando necesario para eliminar el artículo que tenga estado FALSE.
DELETE FROM articulo
WHERE estado = FALSE;
--lohizo Fran

-- Agregar el comando necesario que introduzca 3 comentarios al primer artículo
--agregado y 2 comentarios al segundo artículo.
INSERT INTO comentario(contenido, id_articulo, id_usuario)
VALUES ("comentario 1", 1, 1),
       ("comentario 2", 1, 1),
       ("comentario 3", 1, 1),
       ("comentario 1", 2, 1),
       ("comentario 2", 2, 1);
--aqui termina la parte de julian

-- Agregar el comando necesario para listar todos los artículos que tengan
--comentarios, mostrando el título del artículo, la fecha_publicacion del artículo, el
--nombre del usuario que realizo el comentario y la fecha_hora que realizó dicho
--comentario, agrupados por artículos.
SELECT a.titulo, a.fecha_publicacion, u.nombre, c.fecha_hora
FROM articulo a
JOIN comentario c ON a.id_articulo = c.id_articulo
JOIN usuario u ON c.id_usuario = u.id_usuario
GROUP BY a.id_articulo;
--lo hizo Fran.
