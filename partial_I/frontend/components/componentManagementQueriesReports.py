from backend.controllers.controllersList import ControllersList
from backend.controllers.controllersQueryBuilder import ControllersQueryBuilder
from backend.controllers.controllersReportGenerator import ControllersReportGenerator
from frontend.components.componentAddAttributeEntity import ComponentAddAttributeEntity

class ComponentManagementQueriesReports:
    def __init__(self, db_manager):
        self.db_manager = db_manager
        self.controllersList = ControllersList(db_manager)
        self.controllersQueryBuilder = ControllersQueryBuilder(db_manager,self.controllersList)


    def componentManagementQueriesReports(self):
        while True:
            print("╔════════════════════════════════════════╗")
            print("║         📋 Menú de Consultas 📋        ║")
            print("╠════════════════════════════════════════╣")
            print("║  1. Listar Entidades                   ║")
            print("║  2. Listar Atributos por Entidad       ║")
            print("║  3. Agregar Atributo a la Consulta     ║")
            print("║  4. Generar Reporte en PDF             ║")
            print("║  0. Volver al Menu Principal           ║")
            print("╚════════════════════════════════════════╝")
            opcion = input("Seleccione una opción: ")

            if opcion == "1":
                entities = self.controllersList.listEntities()
                print("Entidades en la base de datos:")
                for entity in entities:
                    print(entity)
            elif opcion == "2":
                entity = input("Ingrese el nombre de la entidad: ").upper()
                attributes = self.controllersList.listAttributes(entity)
                print(f"Atributos de {entity}:")
                for attribute in attributes:
                    print(attribute)
            elif opcion == "3":
                while True:
                    entity = input("Ingrese el nombre de la entidad: ").upper()
                    optionData = self.controllersQueryBuilder.addEntity(entity)                       
                    if optionData == '0':
                        break

                while True:
                    attribute = input("Ingrese el nombre del atributo: ")
                    
                    choice = self.controllersQueryBuilder.addAttribute(entity, attribute)
                    if choice == '1':
                        choice = ComponentAddAttributeEntity().componentAddAttributeEntity()
                    if choice == '0':
                        break
            elif opcion == "4":
                filename = input("Ingrese el nombre del archivo PDF: ")
                report_generator = ControllersReportGenerator(self.db_manager, self.controllersQueryBuilder)
                report_generator.generatePdfReport(filename)                
            elif opcion == "0":
                break
            else:
                print("Opción no válida. Inténtelo de nuevo.")
