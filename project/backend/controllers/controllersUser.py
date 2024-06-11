import mysql.connector

class ControllerUser:
    def __init__(self, db_manager):
        self.db_manager = db_manager

    # Función para crear un nuevo usuario
    def createUser(self, username, password):
        try:
            connection = self.db_manager.connection
            cursor = connection.cursor()
            cursor.execute(f"CREATE USER '{username}'@'localhost' IDENTIFIED BY '{password}'")
            connection.commit()
            print("Usuario creado correctamente")
        except mysql.connector.Error as error:
            print("Error al crear el usuario:", error)
        finally:
            if connection.is_connected():
                cursor.close()

    # Función para obtener todos los usuarios
    def getUsers(self):
        try:
            connection = self.db_manager.connection
            cursor = connection.cursor()
            cursor.execute("SELECT User FROM mysql.user WHERE Host = 'localhost'")
            users = cursor.fetchall()

            print("Usuarios en la base de datos:")
            for user in users:
                if isinstance(user[0], bytes):
                    print(user[0]) 
                else:
                    print(user[0].decode('utf-8'))# Decode byte array to string

        except mysql.connector.Error as error:
            print("Error al obtener los usuarios:", error)
        finally:
            if connection.is_connected():
                cursor.close()

    # Función para actualizar la contraseña de un usuario existente
    def updateUser(self, username, new_password):
        try:
            connection = self.db_manager.connection
            cursor = connection.cursor()
            cursor.execute(f"SET PASSWORD FOR '{username}'@'localhost' = PASSWORD('{new_password}')")
            connection.commit()
            print("Contraseña actualizada correctamente")
        except mysql.connector.Error as error:
            print("Error al actualizar la contraseña:", error)
        finally:
            if connection.is_connected():
                cursor.close()

    # Función para eliminar un usuario existente
    def deleteUser(self, username):
        try:
            connection = self.db_manager.connection
            cursor = connection.cursor()
            cursor.execute(f"DROP USER '{username}'@'localhost'")
            connection.commit()
            print("Usuario eliminado correctamente")
        except mysql.connector.Error as error:
            print("Error al eliminar el usuario:", error)
        finally:
            if connection.is_connected():
                cursor.close()

    # Función para asignar un rol a un usuario
    def assignRoleToUser(self, username, role_name):
        try:
            connection = self.db_manager.connection
            cursor = connection.cursor()
            cursor.execute(f"GRANT '{role_name}' TO '{username}'@'localhost'")
            connection.commit()
            print(f"Rol '{role_name}' asignado correctamente al usuario '{username}'")
        except mysql.connector.Error as error:
            print(f"Error al asignar el rol '{role_name}' al usuario '{username}':", error)
        finally:
            if connection.is_connected():
                cursor.close()
    
    # Método para mostrar los privilegios de un usuario
    def showUserPrivileges(self, username):
        try:
            connection = self.db_manager.connection
            cursor = connection.cursor()
            cursor.execute(f"SHOW GRANTS FOR '{username}'@'localhost';")
            privileges = cursor.fetchall()
            if privileges:
                print(f"Privilegios del usuario '{username}':")
                for privilege in privileges:
                    grant = privilege[0]
                    start_quote = grant.find('`')  # Find the first backtick
                    end_quote = grant.find('`', start_quote + 1)  # Find the next backtick
                    if start_quote != -1 and end_quote != -1:
                        role_name = grant[start_quote + 1:end_quote]  # Extract text between backticks
                        print(role_name)
            else:
                print(f"No se encontraron privilegios para el usuario '{username}'")
        except mysql.connector.Error as error:
            print("Error al mostrar los privilegios del usuario:", error)
        finally:
            if connection.is_connected():
                cursor.close()