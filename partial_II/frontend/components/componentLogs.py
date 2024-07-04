from backend.controllers.controllersLogs import ControllersLogs
from backend.controllers.controllersQueries import ControllersQueries

class ComponentLogs:
    def __init__(self, db_manager):
        self.db_manager = db_manager
        self.controllers_logs = ControllersLogs(db_manager)
        self.controllers_queries = ControllersQueries(db_manager)

    def componentLogs(self):
        while True:
            print("\n------ MENÚ PRINCIPAL ------")
            print("1. Acceder a Logs")
            print("2. Aplicar Filtros por usuarios")
            print("3. Generar Consultas en PDF")
            print("0. Salir")
            opcion = input("Seleccione una opción: ")

            if opcion == '1':
                self.acceder_logs()
            elif opcion == '2':
                self.aplicar_filtros()
            elif opcion == '3':
                self.generar_consultas_pdf()
            elif opcion == '0':
                print("Saliendo del programa...")
                break
            else:
                print("Opción no válida, intente nuevamente.")

    def acceder_logs(self):
        logs_generales = self.controllers_logs.access_general_logs()
        print("\nLogs Generales:")
        # Imprimir encabezados de columnas
        print(f"{'Event Time':<20} {'User Host':<20} {'Thread ID':<12} {'Server ID':<10} {'Command Type':<15} {'Argument'}")
        # Imprimir cada log
        for log in logs_generales:
            log_dict = {
                'event_time': log[0],
                'user_host': self.clean_user_host(log[1]),
                'thread_id': log[2],
                'server_id': log[3],
                'command_type': log[4],
                'argument': log[5]
            }
            print(f"{log_dict['event_time']}\t {log_dict['user_host']:<20} {log_dict['thread_id']:<12} {log_dict['server_id']:<10} {log_dict['command_type']:<15} {log_dict['argument']}")



    def aplicar_filtros(self):
        print(self.users_get())
        filtro = input("Ingrese el filtro para aplicar (por ejemplo, usuario, fecha): ").strip().lower()
        logs = self.controllers_logs.access_general_logs()

        logs_filtrados = [log for log in logs if filtro in str(log).lower()]
        print(f"{'Event Time':<20} {'User Host':<20} {'Thread ID':<12} {'Server ID':<10} {'Command Type':<15} {'Argument'}")
        for log in logs_filtrados:
            log_dict = {
                'event_time': log[0],
                'user_host': self.clean_user_host(log[1]),
                'thread_id': log[2],
                'server_id': log[3],
                'command_type': log[4],
                'argument': log[5]
            }
            print(f"{log_dict['event_time']}\t {log_dict['user_host']:<20} {log_dict['thread_id']:<12} {log_dict['server_id']:<10} {log_dict['command_type']:<15} {log_dict['argument']}")

    def generar_consultas_pdf(self):
        filtro = input("Ingrese el filtro para aplicar (por ejemplo, usuario, fecha): ").strip()
        logs = self.controllers_logs.access_general_logs()
        logs_filtrados = [log for log in logs if filtro in str(log).lower()]
        filename = input("Ingrese el nombre del archivo PDF: ").strip()
        pdf_path = self.controllers_queries.generate_pdf_report(logs_filtrados, filename)
        print(f"Archivo PDF generado: {pdf_path}")


    def clean_user_host(self, user_host):
        return user_host.split('[')[1].split(']')[0]
    
    def users_get(self):
        try:
            cursor = self.db_manager.get_cursor()
            query = """
            SELECT DISTINCT 
                SUBSTRING_INDEX(SUBSTRING_INDEX(user_host, ']', 1), '[', -1) AS user_name
            FROM mysql.general_log;
            """
            cursor.execute(query)
            users = cursor.fetchall()
            cursor.close()

            # Procesar los resultados para devolver solo los nombres de usuario en una lista
            user_names = [user[0] for user in users]
            
            # Crear el encabezado y agregar margen
            result = (
                "╔══════════════════════════════════════════╗\n"
                "║                Users                     ║\n"
                "╠══════════════════════════════════════════╣\n"
            )
            
            # Agregar cada usuario al resultado
            for user in user_names:
                result += f"║  {user:<40}║\n"  # Alinear a la izquierda y ajustar el ancho
            
            result += "╚══════════════════════════════════════════╝"

            return result

        except mysql.connector.Error as e:
            return f"Error al acceder a los logs generales: {e}"

