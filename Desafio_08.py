# Crear las siguientes clases con sus atributos y métodos.

# Clase Usuario
## atributos: id, nombre, apellido, teléfono, username, email, contraseña, fecha de registro, avatar, estado, online

from datetime import datetime
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
    def comentar(self):
        if self.online == True:
            return f"El usuario {self.nombre} realizo un comentario"
        else:
            return f"Inicia sesion para realizar un comentario publico"
        pass #Euge

# clase Colaborador(Usuario)
## atributos: es_colaborador
class Colaborador(Usuario):
    def __init__(self, id, nombre, apellido, telefono, username, email, contraseña, fecha_registro, avatar, estado, es_colaborador):
        super().__init__(id, nombre, apellido, telefono, username, email, contraseña, fecha_registro, avatar, estado)
        self.es_colaborador= es_colaborador
### métodos: registrar(), comentar(), publicar()
    def Comentar(self):
        if self.online == True:
            return f"El Colaborador {self.nombre} ha realizado un comentario"
        else:
            return f"Debe iniciar sesion para realizar un comentario"
        
    def Publicar(self):
        if self.online == True:
            return f"El colaborador {self.nombre} ha realizado la publicacion de un articulo"
        else:
            return f"Debe registrarse o iniciar sesion para realizar una publicacion"

# clase Articulo
## id, id_usuario, titulo, resumen, contenido, fecha_publicacion, imagen, estado
class Articulo:
    def __init__(self, id, id_usuario, titulo, resumen, contenido, fecha_publicacion, imagen, estado):
        self.id = id
        self.id_usuario = id_usuario
        self.titulo = titulo
        self.resumen = resumen
        self.contenido = contenido
        self.fecha_publicacion = fecha_publicacion
        self.imagen = imagen
        self.estado = estado #Euge


# clase Comentario
## id, id_articulo, id_usuario, contenido, fecha_hora, estado

#Código para elegir entre registrar usuarios o hacer login (si ya está registrado). Una vez registrado y 
#logueado, código que permita comentar al Publico y además publicar al Colaborador


usuarios= []  #armo una lista vacia para ir agregando los usuarios registrados

while True:
    print("¿Que desea realizar?")
    print("1.Registrar usuario")
    print("2.Hacer login")
    print("3.Salir")

    opcion = input("Ingrese una opcion: ")

    if opcion == 1:
        nombre = input("Ingresa tu nombre: ")
        apellido = input("Ingresa tu apellido: ")
        telefono = input("Ingresa tu teléfono: ")
        username = input("Ingresa tu username: ")
        email = input("Ingresa tu email: ")
        contraseña = input("Ingresa tu contraseña: ")
        usuario= Usuario(nombre,apellido,telefono,username, email, contraseña)
        usuarios.append(usuario)  #agrego el usuario nuevo regisrado a la lista de usuarios

        usuario.registrar()   #llamo al metodo registrar  

    elif opcion == 2:
        usuario.login()  #llamo a la funcion login que hizo euge para que se pueda loguear

        usuario_encontrado = None

        for usuario in usuarios: #recorro la lista de usuarios registrados para ver si el usuario ingresado coincide con algunos de ellos
            if usuario.username == username and usuario.contraseña == contraseña:
                usuario_encontrado = usuario
                break  #si coincide el sistema para directamente

        if usuario_encontrado == True:
            print("Que desea hacer?")
            print("1. Comentar")
            print("2. Publicar")

            opcion= input("Ingrese una opcion: ")
            if opcion == 1:
                usuario_encontrado= Publico(usuario_encontrado)
                usuario_encontrado.comentar()

            elif opcion == 2:
                usuario_encontrado= Colaborador(usuario_encontrado)
                usuario_encontrado.Publicar()  ##faltaria agregar lo del articulo y comentario

    elif opcion == 3:
        break

    else:
        print("Opcion invalida. Ingrese un numero valido")










