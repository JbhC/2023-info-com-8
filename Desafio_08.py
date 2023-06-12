# Crear las siguientes clases con sus atributos y métodos.

# Clase Usuario
## atributos: id, nombre, apellido, teléfono, username, email, contraseña, fecha de registro, avatar, estado, online
class Usuario:
    def _init_ (self, id, nombre, apellido, telefono, username, email, contraseña, fecha_registro, avatar, estado, online):
        self.id = id
        self.nombre = nombre
        self.apellido = apellido
        self.telefono = telefono
        self.username = username
        self.email = email
        self.contraseña = contraseña
        self.fecha_registro = datetime.now()
        self.avatar = None
        self.estado = "Activo"
        self.online = False #Clau
        
### Metodos login(), registrar()
    def login(self, username, contraseña): 
        self.username = input("Ingresar Username: ")
        self.contraseña = input("Ingresar Contraseña: ")
        if username == username and contraseña == contraseña:
            self.online = True
        return f"Bienvenido/a! {self.nombre} has iniciado sesion correctamente" #Euge
    
    def registrar(self):
      ## definir
        return f"Hola! {self.nombre} te has registrado correctamente!" #Clau

# Clase Publico(Usuario)
## atributo: es_publico
class Publico(Usuario):
    def __init__(self, id, nombre, apellido, telefono, username, email, contraseña, fecha_registro, avatar, estado, es_publico):
        super().__init__(id, nombre, apellido, telefono, username, email, contraseña, fecha_registro, avatar, estado)
        self.es_publico = es_publico
        
    ### métodos: comentar(), registrar() -> se define en Usuario por lo que entendi(?
    def comentar(self, articulo, comentario):
        # definir
        pass #Euge

# clase Colaborador(Usuario)
## atributos: es_colaborador

### métodos: registrar(), comentar(), publicar()


# clase Articulo
## id, id_usuario, titulo, resumen, contenido, fecha_publicacion, imagen, estado


# clase Comentario
## id, id_articulo, id_usuario, contenido, fecha_hora, estado
