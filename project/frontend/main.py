from components.componentAdminRolesUserPer import componentAdminRolUser


def mostrar_menu():
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
            componentAdminRolUser()
        elif opcion == '2':
            respaldo_restauracion_bd()
        elif opcion == '3':
            gestion_consulta_reportes()
        elif opcion == '4':
            print("Saliendo del programa...")
            break
        else:
            print("Opción no válida, por favor intente de nuevo.\n")

if __name__ == "__main__":
    mostrar_menu()