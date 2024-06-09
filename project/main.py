from backend.database.config import MariaDBManager
from frontend.components.componentAdminRolesUserPer import ComponentAdminRolesUserPer
from frontend.components.componentRespaldoRestauracionDB import ComponentRespaldoRestauracion


def mostrar_menu():
    db_manager = MariaDBManager(username='root', password='1728821081Br', host='localhost', port=3306, database='mysql')
    db_manager.connect()
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
            ComponentAdminRolesUserPer(db_manager).componentAdminRolUser(db_manager)
        elif opcion == '2':
            pass
            ComponentRespaldoRestauracion(db_manager).backupRestoreMenu(db_manager)
        elif opcion == '3':
            pass
            #gestion_consulta_reportes()
        elif opcion == '4':
            print("Saliendo del programa...")
            break
        else:
            print("Opción no válida, por favor intente de nuevo.\n")
    db_manager.disconnect()
if __name__ == "__main__":
    mostrar_menu()