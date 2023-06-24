#Crear clase "padre" Usuario con los atributos solicitados:#Clau
from datetime import datetime
class Usuario:
    def __init__ (self, id, nombre, apellido, telefono, username, email, contraseña):
        self.id = id
        self.nombre = nombre
        self.apellido = apellido
        self.telefono = telefono
        self.username = username
        self.email = email
        self.contraseña = contraseña
        self.fecha_registro = datetime.now()
        self.avatar = None
        self.estado = "Inactivo"
        self.online = False
#Crea metodos de  la clase Usuario:#Euge #Clau
    def login(self, username, contraseña): 
        if username == self.username and contraseña == self.contraseña:
            self.online = True
            return f"Bienvenido/a! {self.nombre} has iniciado sesion correctamente"
        else:
            return f"Usuario o contraseña incorrectos"
    
    def registrar(self):
        return f"Hola! {self.nombre} te has registrado correctamente!"
    
    def cambiar_estado(self, estado):
        self.estado = estado #No lo pide la actividad pero permite que el usuario cambie su estado.

#Se crea clase "hijo" Publico la cual hereda de Usuario y se le agrega un atributo y un metodo #Euge
class Publico(Usuario):
    def __init__(self, id, nombre, apellido, telefono, username, email, contraseña):
        super().__init__(id, nombre, apellido, telefono, username, email, contraseña)
        self.es_publico = True
        
    def comentar(self):#Metodo que simula la accion de comentar un articulo tomando como condicional que el Usuario este online
        if self.online == True:
            return f"El usuario {self.nombre} realizo un comentario"
        else:
            return f"Inicia sesion para realizar un comentario."
       
#Se crea otra clase "hijo de Usuario" la cual suma un atributo y dos  metodos en comparacion a usuario     
class Colaborador(Usuario):
    def __init__(self, id, nombre, apellido, telefono, username, email, contraseña):
        super().__init__(id, nombre, apellido, telefono, username, email, contraseña)
        self.es_colaborador= True

    def comentar(self):
        if self.online == True:
            return f"El Colaborador {self.nombre} ha realizado un comentario"
        else:
            return f"Debe iniciar sesion para realizar un comentario"
        
    def publicar(self):
        if self.online == True:
            return f"El colaborador {self.nombre} ha realizado la publicacion de un articulo"
        else:
            return f"Debe registrarse o iniciar sesion para realizar una publicacion"

#Se define clase articulo con los atributos que pide la actividad #Euge
class Articulo:
    def __init__(self, id, id_usuario, titulo, resumen, contenido, imagen):
        self.id = id
        self.id_usuario = id_usuario
        self.titulo = titulo
        self.resumen = resumen
        self.contenido = contenido
        self.fecha_publicacion = datetime.now()
        self.imagen = imagen
        self.estado = "activo"

    def mostrar_atributos(self):
        fecha_hora_formateada = self.fecha_publicacion.strftime("%Y-%m-%d %H:%M")
        print("id de articulo: ", self.id)
        print("id de usuario: ", self.id_usuario)
        print("ARticulo: ", self.contenido)
        print("fecha y hora del comentario: ", fecha_hora_formateada)
        print("estado: ", self.estado)

    def cambiar_estado(self, nuevo_estado):
        self.estado = nuevo_estado   

    

#Se define clase Comentario con los atributos que pide la actividad #Euge#julian
class Comentario:
    def __init__(self, id, id_articulo, id_usuario, contenido):
        self.id = id
        self.id_articulo = id_articulo
        self.id_usuario = id_usuario
        self.contenido = contenido
        self.fecha_hora = datetime.now()
        self.estado = "activo"

    def mostrar_atributos(self):
        fecha_hora_formateada = self.fecha_hora.strftime("%Y-%m-%d %H:%M")
        print("id de comentario: ", self.id)
        print("id de articulo: ", self.id_articulo)
        print("id de usuario: ", self.id_usuario)
        print("comentario: ", self.contenido)
        print("fecha y hora del comentario: ", fecha_hora_formateada)
        print("estado: ", self.estado)

    def cambiar_estado(self, nuevo_estado):
        self.estado = nuevo_estado   




usuarios = {}

while True:
    print("\n----¡Bienvenido/a!----\n")
    print("¿Qué desea realizar?\n")
    print("1. Registrar usuario")
    print("2. Iniciar sesión")
    print("3. Comentar")
    print("4. Publicar (solo para colaboradores)")
    print("5. Salir")

    opcion = input("\nIngrese una opción: ")

    if opcion == "1":
        nombre = input("Ingresa tu nombre: ")
        apellido = input("Ingresa tu apellido: ")
        telefono = input("Ingresa tu teléfono: ")
        username = input("Ingresa tu username: ")
        email = input("Ingresa tu email: ")
        contraseña = input("Ingresa tu contraseña: ")

        print("\nSelecciona el tipo de registro:\n")
        print("1. Publico")
        print("2. Colaborador")
        tipo_registro = input("Ingrese una opción: ")

        if tipo_registro == "1":
            usuario = Publico(len(usuarios) + 1, nombre, apellido, telefono, username, email, contraseña)
        elif tipo_registro == "2":
            usuario = Colaborador(len(usuarios) + 1, nombre, apellido, telefono, username, email, contraseña)
        else:
            print("Opción inválida. Registro cancelado.")
            continue

        usuarios[username] = usuario
        usuario.cambiar_estado("Activo")
        print(f"\n{usuario.registrar()}\n")

    elif opcion == "2":
        username = input("Ingrese su usuario: ")
        contraseña = input("Ingrese su contraseña: ")
        
        if username in usuarios:
            usuario = usuarios[username]
            if not usuario.online:
                print(f"\n{usuario.login(username, contraseña)}\n")
            else:
                print("Ya has iniciado sesión")
        else:
            print("Usuario no encontrado")

    elif opcion == "3":          
        if username in usuarios:
            usuario = usuarios[username]
            if isinstance(usuario, Publico) or isinstance(usuario, Colaborador) :
                id = input("Ingrese el id de su comentario: ")
                id_articulo = input("Ingrese el id del articulo a comentar: ")
                id_usuario = input("Ingrese su id de usuario Publico: ")
                contenido = input("Ingrese el contenido de su Comentario: ")
                comentario = Comentario(id, id_articulo, id_usuario, contenido)
                print(usuario.comentar())
                print(f"al articulo {comentario.id_articulo} el mismo dice {comentario.contenido}")
            else:
                print("Acción no permitida para tu tipo de usuario.")
        else:
            print("Debe iniciar sesión primero.")

    elif opcion == "4":
        if username in usuarios:
            usuario = usuarios[username]
            if isinstance(usuario, Colaborador):
                id = input("Ingrese el id de su articulo: ")
                id_usuario = input("Ingrese su id de usuario Colaborador: ")
                titulo = input("Ingrese el titulo de su articulo: ")
                resumen = input("Ingrese el resumen de su articulo: ")
                contenido = input("Ingrese el contenido de su articulo: ")
                imagen = input("Ingrese la imagen de su articulo: ")
                articulo = Articulo(id, id_usuario, titulo, resumen, contenido, imagen)
                print(usuario.publicar())
                print(f"El contenido del articulo es {articulo.resumen}")
            else:
                print("Acción no permitida para tu tipo de usuario.")
        else:
            print("Debe iniciar sesión primero.")

    elif opcion == "5":
        break
    else:
        print("Opción inválida. Ingrese un número válido")




