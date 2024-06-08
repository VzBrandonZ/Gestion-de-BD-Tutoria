import mysql.connector
from database.config import get_connection

class ControllerUser:
    # Función para crear un nuevo usuario
    #@staticmethod
    def createUser(username, password):
        try:
            connection = get_connection()
            cursor = connection.cursor()
            cursor.execute(f"CREATE USER '{username}'@'localhost' IDENTIFIED BY '{password}'")
            connection.commit()
            print("Usuario creado correctamente")
        except mysql.connector.Error as error:
            print("Error al crear el usuario:", error)
        finally:
            if connection.is_connected():
                cursor.close()
                connection.close()

    # Función para obtener todos los usuarios
    #@staticmethod
    def getUsers():
        try:
            connection = get_connection()
            cursor = connection.cursor()
            cursor.execute("SELECT User FROM mysql.user WHERE Host = 'localhost'")
            users = cursor.fetchall()
            for user in users:
                print(user[0])
        except mysql.connector.Error as error:
            print("Error al obtener los usuarios:", error)
        finally:
            if connection.is_connected():
                cursor.close()
                connection.close()

    # Función para actualizar la contraseña de un usuario existente
    def updateUser(username, new_password):
        try:
            connection = get_connection()
            cursor = connection.cursor()
            cursor.execute(f"SET PASSWORD FOR '{username}'@'localhost' = PASSWORD('{new_password}')")
            connection.commit()
            print("Contraseña actualizada correctamente")
        except mysql.connector.Error as error:
            print("Error al actualizar la contraseña:", error)
        finally:
            if connection.is_connected():
                cursor.close()
                connection.close()

    # Función para eliminar un usuario existente
    #@staticmethod
    def deleteUser(username):
        try:
            connection = get_connection()
            cursor = connection.cursor()
            cursor.execute(f"DROP USER '{username}'@'localhost'")
            connection.commit()
            print("Usuario eliminado correctamente")
        except mysql.connector.Error as error:
            print("Error al eliminar el usuario:", error)
        finally:
            if connection.is_connected():
                cursor.close()
                connection.close()