# main.py
from backend.database.config import MariaDBManager
from frontend.components.componentGeneratorAuditTriggers import ComponentGeneratorAuditTriggers
from frontend.components.componentCursorsAutomation import ComponentCursorsAutomation
from frontend.components.componentComparacionHilos import ComponentComparacionHilos
from frontend.components.componentLogs import ComponentLogs


class MainMenu:
    def __init__(self):
        self.db_manager = MariaDBManager(username='root', password='1728821081Br', host='localhost', port=3306, database='kinderdb')
        self.db_mysql = MariaDBManager(username='root', password='1728821081Br', host='localhost', port=3306, database='mysql')
        self.componentGeneratorAuditTriggers = ComponentGeneratorAuditTriggers(self.db_manager)
        self.componentCursorsAutomation = ComponentCursorsAutomation(self.db_manager)
        self.componentComparacionHilos = ComponentComparacionHilos(self.db_manager)
        self.componentLogs = ComponentLogs(self.db_mysql)

    def showMenu(self):
        self.db_manager.connect()
        while True:
            print("╔══════════════════════════════════════════╗")
            print("║              Menú Principal              ║")
            print("╠══════════════════════════════════════════╣")
            print("║  1. Generación de disparadores de        ║")
            print("║     auditoria                            ║")
            print("║                                          ║")
            print("║  2. Cursores y automatización utilizando ║")
            print("║     transacciones                        ║")
            print("║                                          ║")
            print("║  3. Comparación de consultas aplicando   ║")
            print("║     hilos                                ║")
            print("║                                          ║")
            print("║  4. Visualizador de eventos y auditoria  ║")
            print("║     (Logs) generados por su base de      ║")
            print("║     datos                                ║")
            print("║                                          ║")
            print("║  0. Salir                                ║")
            print("╚══════════════════════════════════════════╝")

            opcion = input("Seleccione una opción (1-5): ")

            if opcion == '1':
                self.componentGeneratorAuditTriggers.componentGeneratorAuditTriggers()

            elif opcion == '2':
                self.componentCursorsAutomation.componentCursorsAutomation()

            elif opcion == '3':
                self.componentComparacionHilos.ejecutar()
            elif opcion == '4':
                self.db_mysql.connect()
                self.componentLogs.componentLogs()
                self.db_mysql.disconnect()
            elif opcion == '0':
                print("Saliendo del programa...")
                break

            else:
                print("Opción no válida. Por favor, seleccione una opción del 1 al 5.")

        self.db_manager.disconnect()

if __name__ == "__main__":
    main_menu = MainMenu()
    main_menu.showMenu()
