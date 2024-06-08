import mysql.connector
from database.config import get_connection

class ControllerRole:
    # Función para crear un nuevo rol
    #@staticmethod
    def create_role(role_name):
        try:
            connection = get_connection()
            cursor = connection.cursor()
            cursor.execute(f"CREATE ROLE {role_name}")
            connection.commit()
            print("Rol creado correctamente")
        except mysql.connector.Error as error:
            print("Error al crear el rol:", error)
        finally:
            if connection.is_connected():
                cursor.close()
                connection.close()

    # Función para obtener todos los roles
    #@staticmethod
    def get_roles():
        try:
            connection = get_connection()
            cursor = connection.cursor()
            cursor.execute("SELECT user FROM mysql.user WHERE is_role='y'")
            roles = cursor.fetchall()
            for role in roles:
                print(role)
        except mysql.connector.Error as error:
            print("Error al obtener los roles:", error)
        finally:
            if connection.is_connected():
                cursor.close()
                connection.close()

    # Función para eliminar un rol existente
    #@staticmethod
    def delete_role(role_name):
        try:
            connection = get_connection()
            cursor = connection.cursor()
            cursor.execute(f"DROP ROLE {role_name}")
            connection.commit()
            print("Rol eliminado correctamente")
        except mysql.connector.Error as error:
            print("Error al eliminar el rol:", error)
        finally:
            if connection.is_connected():
                cursor.close()
                connection.close()
