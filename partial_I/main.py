from backend.database.config import MariaDBManager
from frontend.components.componentAdminRolesUserPer import ComponentAdminRolesUserPer
from frontend.components.componentRespaldoRestauracionDB import ComponentRespaldoRestauracion
from frontend.components.componentManagementQueriesReports import ComponentManagementQueriesReports

class MainMenu:
    def __init__(self):
        self.db_manager = MariaDBManager(username='root', password='1728821081Br', host='localhost', port=3306, database='mysql')
        self.db_managerKinder = MariaDBManager(username='root', password='1728821081Br', host='localhost', port=3306, database='kinderdb')

    def showMenu(self):
        self.db_manager.connect()
        while True:
            print("╔════════════════════════════════════════╗")
            print("║          Menú Principal                ║")
            print("╠════════════════════════════════════════╣")
            print("║  1. Administrar Roles, Usuarios        ║")
            print("║     y Permisos                         ║")
            print("║                                        ║")
            print("║  2. Respaldo y Restauración            ║")
            print("║     de Base de Datos                   ║")
            print("║                                        ║")
            print("║  3. Gestión de Consulta y              ║")
            print("║     Generación de Reportes             ║")
            print("║                                        ║")
            print("║  4. Salir                              ║")
            print("╚════════════════════════════════════════╝")

            opcion = input("Seleccione una opción: ")

            if opcion == '1':
                ComponentAdminRolesUserPer(self.db_manager).componentAdminRolUser()
            elif opcion == '2':
                self.db_managerKinder.connect()
                ComponentRespaldoRestauracion(self.db_managerKinder).backupRestoreMenu()
                self.db_managerKinder.disconnect()
            elif opcion == '3':
                self.db_managerKinder.connect()
                ComponentManagementQueriesReports(self.db_managerKinder).componentManagementQueriesReports()
                self.db_managerKinder.disconnect()
            elif opcion == '4':
                print("Saliendo del programa...")
                break
            else:
                print("Opción no válida, por favor intente de nuevo.\n")
        self.db_manager.disconnect()

if __name__ == "__main__":
    main_menu = MainMenu()
    main_menu.showMenu()
