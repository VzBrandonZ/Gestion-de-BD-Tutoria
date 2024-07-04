# controllersCursorsAutomation.py

import mysql.connector

class ControllersCursorsAutomation:
    def __init__(self, db_manager):
        self.db_manager = db_manager

    def matricular_ninio(self):
        """
        Realiza el proceso de matriculación de un niño, solicitando los datos necesarios
        paso a paso y buscando los IDs correspondientes por nombre en la base de datos.
        """
        try:
            connection = self.db_manager.connection
            cursor = connection.cursor()

            connection.start_transaction()

            while True:
                # 1. Solicitar la cédula del niño y buscar en la base de datos
                cedula_ninio = input("Ingrese la cédula del niño: ")
                id_ninio = self._buscar_id_ninio_por_cedula(cursor, cedula_ninio)
                print(id_ninio)
                if id_ninio is None:
                    print(f"No se encontró un niño con cédula {cedula_ninio}. Inténtelo nuevamente.")
                else:
                    break
            


            # Mostrar años lectivos disponibles
            self._mostrar_opciones(cursor, "ANO_LECTIVO", "ANO")
            while True:
                # 3. Solicitar el año lectivo y buscar su ID en la base de datos
                ano_lectivo = input("Ingrese el año lectivo: ")
                id_ano_lectivo = self._buscar_id_por_nombre(cursor, "ANO_LECTIVO", "ANO", ano_lectivo)
                if id_ano_lectivo is None:
                    print(f"No se encontró un año lectivo {ano_lectivo}. Inténtelo nuevamente.")
                else:
                    break
            
            # Mostrar programas disponibles
            self._mostrar_opciones(cursor, "PROGRAMA", "NOMBRE_PROGRAMA")
            while True:
                # 2. Solicitar el nombre del programa y buscar su ID en la base de datos
                nombre_programa = input("Ingrese el nombre del programa: ")
                id_programa = self._buscar_id_por_nombre2(cursor, "PROGRAMA", "NOMBRE_PROGRAMA", nombre_programa.strip(), id_ano_lectivo)
                print(id_programa)
                if id_programa is None:
                    print(f"No se encontró un programa con nombre {nombre_programa}. Inténtelo nuevamente.")
                else:
                    break

            # Mostrar medicamentos disponibles
            self._mostrar_opciones(cursor, "MEDICAMENTO", "NOMBRE_MEDICAMENTO")
            while True:
                # 4. Solicitar los nombres de los medicamentos y buscar sus IDs en la base de datos
                nombres_medicamentos = input("Ingrese los nombres de los medicamentos (separados por coma): ").split(",")
                ids_medicamentos = []
                medicamentos_validos = True
                for nombre_med in nombres_medicamentos:
                    id_med = self._buscar_id_por_nombre(cursor, "MEDICAMENTO", "NOMBRE_MEDICAMENTO", nombre_med.strip())
                    if id_med is None:
                        print(f"No se encontró el medicamento {nombre_med.strip()}. Inténtelo nuevamente.")
                        medicamentos_validos = False
                        break
                    ids_medicamentos.append(id_med)
                if medicamentos_validos:
                    break

            # Mostrar alergias disponibles
            self._mostrar_opciones(cursor, "ALERGIAS", "NOMBRE_ALERGIA")
            while True:
                # 5. Solicitar los nombres de las alergias y buscar sus IDs en la base de datos
                nombres_alergias = input("Ingrese los nombres de las alergias (separados por coma): ").split(",")
                ids_alergias = []
                alergias_validas = True
                for nombre_alg in nombres_alergias:
                    id_alg = self._buscar_id_por_nombre(cursor, "ALERGIAS", "NOMBRE_ALERGIA", nombre_alg.strip())
                    if id_alg is None:
                        print(f"No se encontró la alergia {nombre_alg.strip()}. Inténtelo nuevamente.")
                        alergias_validas = False
                        break
                    ids_alergias.append(id_alg)
                if alergias_validas:
                    break

            # Finalmente, realizar la matriculación con los IDs obtenidos
            while True:
                try:
                    precio_matricula = float(input("Ingrese el precio de la matrícula: "))
                    break
                except ValueError:
                    print("Debe ingresar un valor numérico para el precio de la matrícula.")

            while True:
                estado_matricula_str = input("Ingrese el estado de la matrícula (Activa/Inactiva): ").strip().lower()
                if estado_matricula_str == "activa":
                    estado_matricula = True
                    break
                elif estado_matricula_str == "inactiva":
                    estado_matricula = False
                    break
                else:
                    print("Ingrese 'True' o 'False' para el estado de la matrícula.")

            # Realizar el proceso de matriculación
            self._registrar_matricula(cursor, id_ninio, id_ano_lectivo, precio_matricula)
            self._asignar_actividades(cursor, id_ninio, id_programa)
            self._actualizar_estado_matricula(cursor, id_ninio, estado_matricula)
            self._registrar_estado_salud(cursor, id_ninio)
            self._registrar_medicamentos(cursor, id_ninio, ids_medicamentos)
            self._registrar_alergias(cursor, id_ninio, ids_alergias)

            connection.commit()
            print("Matrícula realizada exitosamente.")
        except Exception as e:
            connection.rollback()
            print(f"Error al matricular al niño: {e}")
        finally:
            cursor.close()

    def _buscar_id_ninio_por_cedula(self, cursor, cedula):
        query = """
        SELECT ID_NINIO
        FROM NINIO
        WHERE CI_NINIO = %s;
        """
        cursor.execute(query, (cedula,))
        result = cursor.fetchone()
        if result:
            return result[0]  # Solo retornamos el ID directamente
        else:
            return None 

    def _buscar_id_por_nombre2(self, cursor, tabla, columna_nombre, nombre, id_anio_lectivo):
        query = f"""
        SELECT ID_{tabla}
        FROM {tabla}
        WHERE UPPER({columna_nombre}) = UPPER(%s) AND ID_ANO_LECTIVO = UPPER(%s);
        """
        cursor.execute(query, (nombre, id_anio_lectivo))
        result = cursor.fetchone()
        if result:
            return result[0]  # Solo retornamos el ID directamente
        else:
            return None
    def _buscar_id_por_nombre(self, cursor, tabla, columna_nombre, nombre):
        query = f"""
        SELECT ID_{tabla}
        FROM {tabla}
        WHERE UPPER({columna_nombre}) = UPPER(%s);
        """
        cursor.execute(query, (nombre,))
        result = cursor.fetchone()
        if result:
            return result[0]  # Solo retornamos el ID directamente
        else:
            return None

    def _mostrar_opciones(self, cursor, tabla, columna_nombre):
        """
        Muestra las opciones disponibles para una tabla específica.
        """
        query = f"""
        SELECT {columna_nombre}
        FROM {tabla};
        """
        cursor.execute(query)
        resultados = cursor.fetchall()
        print(f"Opciones disponibles para {tabla}:")
        for resultado in resultados:
            print(resultado[0])  # Mostramos el nombre del programa, medicamento o alergia

    def _registrar_matricula(self, cursor, id_ninio, id_ano_lectivo, precio_matricula):
        query = """
        INSERT INTO MATRICULA (ID_NINIO, ID_ANO_LECTIVO, PRECIO_MATRICULA)
        VALUES (%s, %s, %s);
        """
        cursor.execute(query, (id_ninio, id_ano_lectivo, precio_matricula))

    def _asignar_actividades(self, cursor, id_ninio, id_programa):
        query = """
        SELECT ID_ACTIVIDAD
        FROM ACTIVIDAD
        WHERE ID_PROGRAMA = %s;
        """
        cursor.execute(query, (id_programa,))
        actividades = cursor.fetchall()

        for actividad in actividades:
            query_insert = """
            INSERT INTO RENDIMIENTO (ID_ACTIVIDAD, ID_TIPO_RENDIMIENT, ID_NINIO, OBSERVACIONES)
            VALUES (%s, 1., %s, 'EL NIÑO RINDIÓ EXCELENTE');
            """
            cursor.execute(query_insert, (actividad[0], id_ninio))

    def _actualizar_estado_matricula(self, cursor, id_ninio, estado_matricula):
        query = """
        UPDATE NINIO
        SET ESTADO_MATRICULA = %s
        WHERE ID_NINIO = %s;
        """
        cursor.execute(query, (estado_matricula, id_ninio))
    
    def _registrar_estado_salud(self,cursor, id_ninio):
        query = """
        INSERT INTO ESTADO_SALUD (ID_NINIO, ULTIMA_FECHA_ENFERMO, DIAGNOSTICO, DOCTOR_TRATANTE)
        VALUES (%s, %s, %s, %s);
        """
        cursor.execute(query, (id_ninio, "2021-06-07 00:00:00", "EL NIÑO SE ENCUENTRA BIEN PERO PODRÍA EMPEORAR", "DR.PEDRO PICAPIEDRA"))

        
    def _registrar_medicamentos(self, cursor, id_ninio, ids_medicamentos):
        query = """
        SELECT ID_SALUD_STAT
        FROM ESTADO_SALUD
        WHERE ID_NINIO = %s;
        """
        cursor.execute(query, (id_ninio,))
        estado_salud = cursor.fetchone()
        print(estado_salud)

        if estado_salud:
            for medicamento_id in ids_medicamentos:
                query_insert = """
                INSERT INTO SALUD_MEDICAMENT_RELATION (ID_MEDICAMENTO, ID_SALUD_STAT)
                VALUES (%s, %s);
                """
                cursor.execute(query_insert, (medicamento_id, estado_salud[0]))

    def _registrar_alergias(self, cursor, id_ninio, ids_alergias):
        query = """
        SELECT ID_SALUD_STAT
        FROM ESTADO_SALUD
        WHERE ID_NINIO = %s;
        """
        cursor.execute(query, (id_ninio,))
        estado_salud = cursor.fetchone()

        if estado_salud:
            for alergia_id in ids_alergias:
                query_insert = """
                INSERT INTO SALUD_ALERGIAS_RELATION (ID_ALERGIA, ID_SALUD_STAT)
                VALUES (%s, %s);
                """
                cursor.execute(query_insert, (alergia_id, estado_salud[0]))
