import mysql.connector

class MariaDBManager:
    def __init__(self, username, password, host, port, database):
        self.username = username
        self.password = password
        self.host = host
        self.port = port
        self.database = database
        self.connection = None

    def connect(self):
        try:
            self.connection = mysql.connector.connect(
                user=self.username,
                password=self.password,
                host=self.host,
                port=self.port,
                database=self.database
            )
            print(f"Conectado exitosamente a la base de datos: {self.database} en {self.host}:{self.port} como {self.username}")

        except mysql.connector.Error as err:
            if err.errno == errorcode.ER_ACCESS_DENIED_ERROR:
                print("Error: Usuario o contraseña incorrectos")
            elif err.errno == errorcode.ER_BAD_DB_ERROR:
                print("Error: La base de datos no existe")
            else:
                print(f"Error al conectar a la base de datos: {err}")
            exit(1)

    def disconnect(self):
        if self.connection:
            self.connection.close()
            print("Desconectado de la base de datos")

    def get_tables(self):
        try:
            cursor = self.connection.cursor()
            cursor.execute(
                "SELECT table_name FROM information_schema.tables WHERE table_schema = %s", (self.database,)
            )
            tables = cursor.fetchall()
            print("Tablas en la base de datos:")
            for table in tables:
                print(table[0])
        except mysql.connector.Error as err:
            print(f"Error al obtener las tablas: {err}")
        finally:
            cursor.close()

    def get_table_columns(self, table_name):
        try:
            cursor = self.connection.cursor()
            cursor.execute(
                "SELECT column_name, data_type FROM information_schema.columns WHERE table_schema = %s AND table_name = %s", (self.database, table_name)
            )
            columns = cursor.fetchall()
            print(f"Columnas en la tabla {table_name}:")
            for column in columns:
                print(f"Nombre: {column[0]}, Tipo: {column[1]}")
        except mysql.connector.Error as err:
            print(f"Error al obtener las columnas de la tabla {table_name}: {err}")
        finally:
            cursor.close()

