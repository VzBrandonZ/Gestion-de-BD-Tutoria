from backend.controllers.controllersDBBackupRestore import ControllerDBBackupRestore

class ComponentRespaldoRestauracion:
    def __init__(self, db_manager):
        self.db_manager = db_manager
        self.controllerDBBackupRestore = ControllerDBBackupRestore(db_manager)

    def backupRestoreMenu(self):
        

        while True:
            print("╔════════════════════════════════════════╗")
            print("║ 📦 Respaldar y Restaurar Base de Datos ║")
            print("╠════════════════════════════════════════╣")
            print("║  1. Respaldar la base de datos         ║")
            print("║                                        ║")
            print("║  2. Restaurar la base de datos         ║")
            print("║     desde un archivo                   ║")
            print("║                                        ║")
            print("║  0. Volver al menú principal           ║")
            print("╚════════════════════════════════════════╝")
            opcion = input("Opción: ")

            if opcion == "1":
                backup_file = input("Ingrese la ruta donde guardar el respaldo: ").strip()
                self.controllerDBBackupRestore.backupDatabase(backup_file)
            elif opcion == "2":
                backup_file = input("Ingrese la ruta del archivo de respaldo: ").strip()
                self.controllerDBBackupRestore.restoreDatabase(backup_file)
            elif opcion == "0":
                break
            else:
                print("Opción no válida. Inténtelo de nuevo.")