from backend.controllers.controllersUser import ControllerUser
from backend.controllers.controllersRole import ControllerRole
from frontend.components.componentPrivilegioRol import ComponentPrivilegioRol



class ComponentAdminRolesUserPer:
    def __init__(self, db_manager):
        self.db_manager = db_manager

        
    def componentAdminRolUser(self, db_manager):
        controllerUser = ControllerUser(db_manager)
        controllerRole = ControllerRole(db_manager)
        componentAdminRolUser = ComponentPrivilegioRol(db_manager)
        while True:
            print("\n=== Gestión de Roles, Usuarios y Permisos ===")
            print("Seleccione una opción:")
            print("╔═══════════════════════════════════════════╗")
            print("║ 1.  Crear un usuario                      ║")
            print("║ 2.  Modificar un usuario                  ║")
            print("║ 3.  Eliminar un usuario                   ║")
            print("║ 4.  Crear un rol                          ║")
            print("║ 5.  Asignar un rol a un usuario           ║")
            print("║ 6.  Consultar privilegios del usuario     ║")
            print("║ 7.  Consultar los usuarios creados        ║")
            print("║ 8.  Consultar los roles creados           ║")
            print("║ 0.  Volver al menú principal              ║")
            print("╚═══════════════════════════════════════════╝")

            opcion = input("Opción: ")
            #* options user

            if opcion == "1":
                username = input("Ingrese el nombre del nuevo usuario: ").strip()
                password = input("Ingrese la contraseña del nuevo usuario: ").strip()
                controllerUser.createUser(username, password)
            elif opcion == "2":
                username = input("Ingrese el nombre del usuario a modificar: ").strip()
                new_password = input("Ingrese la nueva contraseña: ").strip()
                controllerUser.updateUser(username, new_password)
            elif opcion == "3":
                username = input("Ingrese el nombre del usuario a eliminar: ").strip()
                controllerUser.deleteUser(username)


            #* options role


            elif opcion == "4":
                componentAdminRolUser.assignPrivilegeRole()
            elif opcion == "5":
                username = input("Ingrese el nombre del usuario: ").strip()
                role_name = input("Ingrese el nombre del rol: ").strip()
                controllerUser.assignRoleToUser(username, role_name)
            elif opcion == "6":
                username = input("Ingrese el nombre del usuario: ").strip()
                controllerUser.showUserPrivileges(username)
            elif opcion == "7":
                controllerUser.getUsers()
            elif opcion == "8":
                controllerRole.get_roles()
            elif opcion == "0":
                break
            else:
                print("Opción no válida. Inténtelo de nuevo.")