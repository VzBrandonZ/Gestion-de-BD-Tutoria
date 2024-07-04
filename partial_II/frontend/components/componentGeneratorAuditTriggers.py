from backend.controllers.controllersList import ControllersList
from backend.controllers.controllersAudit import ControllersAudit

# ComponentGeneratorAuditTriggers.py

class ComponentGeneratorAuditTriggers:
    def __init__(self, db_manager):
        self.db_manager = db_manager
        self.controllersList = ControllersList(self.db_manager)
        self.controllersAudit = ControllersAudit(self.db_manager)

    def componentGeneratorAuditTriggers(self):
        self.db_manager.connect()
        while True:
            print("╔═══════════════════════════════════════════╗")
            print("║   Generación de Disparadores de Auditoria ║")
            print("╠═══════════════════════════════════════════╣")
            print("║  1. Listar entidades con atributos        ║")
            print("║  2. Crear tabla de Auditoría              ║")
            print("║  3. Generar disparadores                  ║")
            print("║  0. Salir                                 ║")
            print("╚═══════════════════════════════════════════╝")

            opcion = input("Seleccione una opción: ")

            if opcion == '1':
                self.controllersList.listEntitiesWithAttributes()
            elif opcion == '2':
                self.controllersAudit.createAuditTable()
            elif opcion == '3':
                table_name = input("Ingrese el nombre de la tabla para generar disparadores: ").upper()
                self.controllersAudit.writeTriggersToFile(table_name)
            elif opcion == '0':
                print("Saliendo del menú de Generación de Disparadores de Auditoria...")
                break
            else:
                print("Opción no válida, por favor intente de nuevo.\n")

        self.db_manager.disconnect()