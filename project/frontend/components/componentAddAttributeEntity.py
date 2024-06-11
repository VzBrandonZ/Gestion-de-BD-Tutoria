


class ComponentAddAttributeEntity:

    def componentAddAttributeEntity(self):
            while True:
                print("\n╔══════════════════════════════╗")
                print("║      GESTIÓN DE ENTIDADES    ║")
                print("╠══════════════════════════════╣")
                print("║  1. Agregar otro atributo    ║")
                print("║  0. Atrás                    ║")
                print("╚══════════════════════════════╝")
                choice = input("Opcion:")
                if choice == '1' or choice == '0':
                    return choice
                else:
                    print("Opción no válida. Inténtelo de nuevo.")