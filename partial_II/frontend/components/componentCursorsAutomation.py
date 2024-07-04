from backend.controllers.controllersCursorsAutomation import ControllersCursorsAutomation

class ComponentCursorsAutomation:
    def __init__(self, db_manager):
        self.db_manager = db_manager
        self.controllersCursorsAutomation = ControllersCursorsAutomation(self.db_manager)

    def menu_automatizacion(self):
        print("1. Matricular niño y registrar actividad")
        print("0. Salir")

    def componentCursorsAutomation(self):
        while True:
            self.menu_automatizacion()
            opcion = input("Seleccione una opción: ")
            if opcion == '1':
                self.controllersCursorsAutomation.matricular_ninio()
            elif opcion == '0':
                print("Regresando al menú principal...")
                break
            else:
                print("Opción no válida, intente nuevamente.")