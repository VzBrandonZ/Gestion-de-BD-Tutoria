# ControllersList.py

class ControllersList:
    def __init__(self, db_manager):
        self.db_manager = db_manager

    def listEntitiesWithAttributes(self):
        """
        Lists entities with their attributes from the database schema.
        """
        self.entities = []
        try:
            # Get table names
            tables = self.db_manager.get_tables()
            if not tables:
                print("No se encontraron tablas en la base de datos.")
                return self.entities

            # Get columns for each table
            for table_name in tables:
                columns = self.db_manager.get_table_columns(table_name)
                if columns is None:
                    print(f"No se encontraron columnas para la tabla {table_name}")
                    continue

                attributes = [column['column_name'] for column in columns]

                # Print table name and attributes in a formatted way
                print(f"Tabla: {table_name}")
                print("Atributos:")
                for attribute in attributes:
                    print(f"  - {attribute}")

                print()  # Print a blank line for separation

                self.entities.append({
                    'table': table_name,
                    'attributes': attributes
                })

        except Exception as e:
            print(f"Error: {e}")

        return self.entities
    def listEntitiesWithAttributes(self):
            query = """
            SELECT TABLE_NAME, COLUMN_NAME, DATA_TYPE
            FROM INFORMATION_SCHEMA.COLUMNS
            WHERE TABLE_SCHEMA = %s
            """
            cursor = self.db_manager.get_cursor()
            cursor.execute(query, (self.db_manager.database,))
            resultados = cursor.fetchall()
            cursor.close()

            entidades_y_atributos = {}
            for resultado in resultados:
                table_name, column_name, data_type = resultado
                if table_name not in entidades_y_atributos:
                    entidades_y_atributos[table_name] = []
                entidades_y_atributos[table_name].append((column_name, data_type))

            return entidades_y_atributos