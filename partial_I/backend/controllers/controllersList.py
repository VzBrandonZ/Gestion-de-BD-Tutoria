

class ControllersList:
    def __init__(self, db_manager):
        self.db_manager = db_manager

    def listEntities(self):
        try:
            cursor = self.db_manager.connection.cursor()
            cursor.execute("SHOW TABLES")
            tables = cursor.fetchall()
            cursor.close()
            return [table[0].upper() for table in tables]
        except Exception as e:
            print(f"Error al listar las entidades: {e}")
            return []

    def listAttributes(self, entity):
        try:
            if not entity:
                raise ValueError("La entidad no puede ser vacía")

            cursor = self.db_manager.connection.cursor()
            cursor.execute(f"DESCRIBE {entity}")
            columns = cursor.fetchall()
            cursor.close()
            return [column[0].upper() for column in columns]
        except ValueError as ve:
            print(f"Error de validación: {ve}")
            return []
        except Exception as e:
            print(f"Error al listar los atributos de la entidad {entity}: {e}")
            return []
