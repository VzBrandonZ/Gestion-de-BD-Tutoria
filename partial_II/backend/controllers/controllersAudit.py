import subprocess
# ControllersAudit.py

class ControllersAudit:
    def __init__(self, db_manager):
        self.db_manager = db_manager

    def createAuditTable(self):
        """
        Creates the Auditoría table in the database if it doesn't already exist.
        """
        table_exists_query = """
        SELECT COUNT(*)
        FROM information_schema.tables
        WHERE table_schema = %s
        AND table_name = 'Auditoria';
        """
        create_table_query = """
        CREATE TABLE IF NOT EXISTS Auditoria (
            ID INT AUTO_INCREMENT PRIMARY KEY,
            NombreTabla VARCHAR(255) NOT NULL,
            FechaHora DATETIME DEFAULT CURRENT_TIMESTAMP,
            UsuarioActual VARCHAR(255) NOT NULL,
            DetalleAccion TEXT NOT NULL
        );
        """
        try:
            cursor = self.db_manager.connection.cursor()
            
            # Check if the table already exists
            cursor.execute(table_exists_query, (self.db_manager.database,))
            result = cursor.fetchone()
            if result[0] > 0:
                print("La tabla 'Auditoria' ya fue creada anteriormente.")
            else:
                cursor.execute(create_table_query)
                self.db_manager.connection.commit()
                print("Tabla 'Auditoria' creada exitosamente.")
                
        except Exception as e:
            print(f"Error al crear la tabla 'Auditoria': {e}")
        finally:
            cursor.close()

    def generateTriggers(self, table_name):
        """
        Generates SQL triggers for DELETE, INSERT, and UPDATE operations for a given table.
        """
        triggers = []

        try:
            # Consulta para obtener el nombre de la columna de la clave primaria
            cursor = self.db_manager.connection.cursor(dictionary=True)
            cursor.execute(f"SHOW KEYS FROM {table_name} WHERE Key_name = 'PRIMARY'")
            primary_key_info = cursor.fetchone()

            if primary_key_info:
                primary_key_column = primary_key_info['Column_name']
            else:
                raise Exception(f"No se encontró una clave primaria definida para la tabla {table_name}")

            # Consulta para obtener todos los nombres de las columnas de la tabla
            cursor.execute(f"SHOW COLUMNS FROM {table_name}")
            column_names = [column['Field'] for column in cursor.fetchall()]

            # Generar los triggers con delimitadores adecuados
            delete_trigger = f"""
            DELIMITER //

            CREATE TRIGGER {table_name}_after_delete
            AFTER DELETE ON {table_name}
            FOR EACH ROW
            BEGIN
                DECLARE detalles TEXT;
                SET detalles = CONCAT('DELETE: [ID: ', OLD.{primary_key_column}, ', ');

                -- Concatenar los valores de todas las columnas
                {self._concatenate_column_values(column_names, 'OLD')}

                SET detalles = CONCAT('DELETE(', detalles, ') ');
                INSERT INTO Auditoria (NombreTabla, UsuarioActual, DetalleAccion)
                VALUES ('{table_name}', USER(), detalles);
            END;

            //

            DELIMITER ;
            """

            insert_trigger = f"""
            DELIMITER //

            CREATE TRIGGER {table_name}_after_insert
            AFTER INSERT ON {table_name}
            FOR EACH ROW
            BEGIN
                DECLARE detalles TEXT;
                SET detalles = CONCAT('INSERT: [ID: ', NEW.{primary_key_column}, ', ');

                -- Concatenar los valores de todas las columnas
                {self._concatenate_column_values(column_names, 'NEW')}

                SET detalles = CONCAT('INSERT(', detalles, ') ');
                
                INSERT INTO Auditoria (NombreTabla, UsuarioActual, DetalleAccion)
                VALUES ('{table_name}', USER(), detalles);
            END;

            //

            DELIMITER ;
            """

            update_trigger = f"""
            DELIMITER //

            CREATE TRIGGER {table_name}_after_update
            AFTER UPDATE ON {table_name}
            FOR EACH ROW
            BEGIN
                DECLARE detalles_final TEXT;
                DECLARE detalles_base TEXT;
                DECLARE detalles_old TEXT;
                DECLARE detalles_new TEXT;
                SET detalles_base = CONCAT('UPDATE( [ID: ', OLD.{primary_key_column}, '] ');

                -- Concatenar los valores de todas las columnas antes del update
                {self._concatenate_column_values_OLD(column_names, 'OLD')}

                -- Concatenar los valores actualizados de todas las columnas
                {self._concatenate_column_values_NEW(column_names, 'NEW')}

                SET detalles_final = CONCAT(detalles_base,'OLD =>[',detalles_old, ']','NEW=>[', detalles_new,'])');
                
                INSERT INTO Auditoria (NombreTabla, UsuarioActual, DetalleAccion)
                VALUES ('{table_name}', USER(), detalles_final);
            END;

            //

            DELIMITER ;
            """

            triggers.append(delete_trigger.strip())
            triggers.append(insert_trigger.strip())
            triggers.append(update_trigger.strip())

        except Exception as e:
            print(f"Error al generar los triggers para la tabla {table_name}: {e}")
        finally:
            cursor.close()

        return "\n\n".join(triggers)

    def _concatenate_column_values(self, column_names, prefix):
        """
        Helper method to concatenate column names and their values into a string.
        """
        concatenated_values = []
        for column_name in column_names:
            concatenated_values.append(f"CONCAT('{column_name}: ', {prefix}.{column_name})")
        return f"SELECT CONCAT_WS(', ', {', '.join(concatenated_values)}) INTO detalles;"
    
    def _concatenate_column_values_OLD(self, column_names, prefix):
        """
        Helper method to concatenate column names and their values into a string.
        """
        concatenated_values = []
        for column_name in column_names:
            concatenated_values.append(f"CONCAT('{column_name}: ', {prefix}.{column_name})")
        return f"SELECT CONCAT_WS(', ', {', '.join(concatenated_values)}) INTO detalles_old;"
    def _concatenate_column_values_NEW(self, column_names, prefix):
        """
        Helper method to concatenate column names and their values into a string.
        """
        concatenated_values = []
        for column_name in column_names:
            concatenated_values.append(f"CONCAT('{column_name}: ', {prefix}.{column_name})")
        return f"SELECT CONCAT_WS(', ', {', '.join(concatenated_values)}) INTO detalles_new;"

    def writeTriggersToFile(self, table_name):
        """
        Writes the generated SQL triggers to a file and executes them in the database.
        """
        triggers_sql = self.generateTriggers(table_name)
        file_path = f"triggers_{table_name}.sql"

        try:
            # Write the triggers to a file
            with open(file_path, 'w') as file:
                file.write(triggers_sql)
            print(f"Disparadores SQL para la tabla '{table_name}' escritos en {file_path}.")

            # Ejecutar el archivo SQL utilizando el cliente de MySQL/MariaDB desde la terminal
            comando = f"mysql -h {self.db_manager.host} -u {self.db_manager.username} -p{self.db_manager.password} {self.db_manager.database} < {file_path}"
            subprocess.run(comando, shell=True, check=True)
            
            print(f"Disparadores SQL para la tabla '{table_name}' ejecutados en la base de datos.")

        except Exception as e:
            print(f"Error al escribir o ejecutar los disparadores SQL: {e}")