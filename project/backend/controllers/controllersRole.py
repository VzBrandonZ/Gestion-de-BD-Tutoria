import mysql.connector
class ControllerRole:
    def __init__(self, db_manager):
        self.db_manager = db_manager

    # Función para crear un nuevo rol
    def create_role(self, role_name):
        try:
            connection = self.db_manager.connection
            cursor = connection.cursor()
            cursor.execute(f"CREATE ROLE {role_name}")
            connection.commit()
            print("Rol creado correctamente")
        except mysql.connector.Error as error:
            print("Error al crear el rol:", error)
        finally:
            if connection.is_connected():
                cursor.close()

    # Función para obtener todos los roles
    def get_roles(self):
        try:
            connection = self.db_manager.connection
            cursor = connection.cursor()
            cursor.execute("SELECT user FROM mysql.user WHERE is_role='y'")
            roles = cursor.fetchall()
            print("Roles en la base de datos:")
            for role in roles:
                if isinstance(role[0], bytes):
                    print(role[0])
                else:
                    print(role[0].decode('utf-8'))# Decode byte array to string
        except mysql.connector.Error as error:
            print("Error al obtener los roles:", error)
        finally:
            if connection.is_connected():
                cursor.close()

    # Función para eliminar un rol existente
    def delete_role(self, role_name):
        try:
            connection = self.db_manager.connection
            cursor = connection.cursor()
            cursor.execute(f"DROP ROLE {role_name}")
            connection.commit()
            print("Rol eliminado correctamente")
        except mysql.connector.Error as error:
            print("Error al eliminar el rol:", error)
        finally:
            if connection.is_connected():
                cursor.close()


    def assign_privilege(self, role_name):
        while True:
            print("╔════════════════════════════════════════╗")
            print("║        🛡️ Asignar Privilegios 🛡️       ║")
            print("╠════════════════════════════════════════╣")
            print("║  1. Asignar privilegios de lectura     ║")
            print("║     y escritura                        ║")
            print("║                                        ║")
            print("║  2. Asignar privilegios solo lectura   ║")
            print("║                                        ║")
            print("║  3. Asignar privilegio de eliminar     ║")
            print("║     usuarios                           ║")
            print("║                                        ║")
            print("║  4. Asignar privilegio de crear        ║")
            print("║     usuarios                           ║")
            print("║                                        ║")
            print("║  0. Atrás                              ║")
            print("╚════════════════════════════════════════╝")
            print(f"Rol Actual: {role_name}")

            opcion = input("Seleccione una opción: ")

            if opcion == "1":
                try:
                    cursor = self.db_manager.connection.cursor()
                    cursor.execute(f"GRANT SELECT, INSERT, UPDATE, DELETE ON *.* TO '{role_name}'")
                    self.db_manager.connection.commit()
                    print(f"Privilegios de lectura y escritura asignados al rol '{role_name}' correctamente.")
                except mysql.connector.Error as err:
                    print(f"Error al asignar el privilegio: {err}")
                finally:
                    cursor.close()
                break
            elif opcion == "2":
                try:
                    cursor = self.db_manager.connection.cursor()
                    cursor.execute(f"GRANT SELECT ON *.* TO '{role_name}'")
                    self.db_manager.connection.commit()
                    print(f"Privilegios solo lectura asignados al rol '{role_name}' correctamente.")
                except mysql.connector.Error as err:
                    print(f"Error al asignar el privilegio: {err}")
                finally:
                    cursor.close()
                break
            elif opcion == "3":
                try:
                    cursor = self.db_manager.connection.cursor()
                    cursor.execute(f"GRANT DROP USER ON *.* TO '{role_name}'")
                    self.db_manager.connection.commit()
                    print(f"Privilegio de eliminar usuarios asignado al rol '{role_name}' correctamente.")
                except mysql.connector.Error as err:
                    print(f"Error al asignar el privilegio: {err}")
                finally:
                    cursor.close()
                break
            elif opcion == "4":
                try:
                    cursor = self.db_manager.connection.cursor()
                    cursor.execute(f"GRANT CREATE USER ON *.* TO '{role_name}'")
                    self.db_manager.connection.commit()
                    print(f"Privilegio de crear usuarios asignado al rol '{role_name}' correctamente.")
                except mysql.connector.Error as err:
                    print(f"Error al asignar el privilegio: {err}")
                finally:
                    cursor.close()
                break
            elif opcion == "0":
                break
            else:
                print("Opción no válida. Inténtelo de nuevo.")