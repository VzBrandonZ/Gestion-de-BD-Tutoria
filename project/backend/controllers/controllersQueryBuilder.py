

class ControllersQueryBuilder:
    def __init__(self, db_manager, controllersList):
        self.db_manager = db_manager
        self.controllersList = controllersList
        self.entities = []
        self.attributes = {}
        self.attribute_list = []  # Lista para almacenar los atributos

    def listAttribute(self):
        return self.attribute_list

    def addEntity(self, entity):
        try:
            # Verificar si la entidad ya ha sido agregada
            if entity in self.entities:
                print(f"Entidad {entity} ya fue agregada anteriormente.")
            # Verificar si la entidad existe en la lista de entidades controladas
            elif entity in self.controllersList.listEntities():
                self.entities.append(entity)
                self.attributes[entity] = []
                return '0'
            else:
                print(f"Entidad {entity} no encontrada.")
        except Exception as e:
            print(f"Error al agregar la entidad {entity}: {e}")


    def addAttribute(self, entity, attribute):
        data = '1'
        if entity in self.entities:
            if attribute in self.controllersList.listAttributes(entity):
                self.attributes[entity].append(attribute)
                self.attribute_list.append(attribute)
                return data
            else:
                print(f"Atributo {attribute} no encontrado en la entidad {entity}.")
        else:
            print(f"Entidad {entity} no agregada a la consulta.")
        

    def buildQuery(self):
        if not self.entities:
            raise ValueError("No se han agregado entidades a la consulta.")

        select_clauses = []
        for entity, attrs in self.attributes.items():
            if not attrs:
                raise ValueError(f"No se han agregado atributos para la entidad {entity}.")
            for attr in attrs:
                select_clauses.append(f"{entity}.{attr}")

        select_statement = ", ".join(select_clauses)
        from_statement = ", ".join(self.entities)
        query = f"SELECT {select_statement} FROM {from_statement}"
        return query