from backend.controllers.controllersRole import ControllerRole


class ComponentPrivilegioRol:
    def __init__(self, db_manager):
        self.db_manager = db_manager

    def assignPrivilegeRole(self):
        controllerRole = ControllerRole(self.db_manager)

        while True:
            print("\n╔════════════════════════════════════════════╗")
            print("║        Crear Rol o Asignar Privilegio      ║")
            print("╠════════════════════════════════════════════╣")
            print("║  1. Crear un rol                           ║")
            print("║  2. Asignar un privilegio                  ║")
            print("║  0. Atrás                                  ║")
            print("╚════════════════════════════════════════════╝")

            opcion = input("Seleccione una opción: ")

            if opcion == "1":
                nombre_rol = input("Ingrese el nombre del nuevo rol: ").strip()
                controllerRole.create_role(nombre_rol)
            elif opcion == "2":
                nombre_rol = input("Ingrese el nombre del rol al que asignar el privilegio: ").strip()
                controllerRole.assign_privilege(nombre_rol)
            elif opcion == "0":
                break
            else:
                print("Opción no válida. Inténtelo de nuevo.")