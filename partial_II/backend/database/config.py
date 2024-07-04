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
    
    def get_cursor(self):
        if self.connection is None or not self.connection.is_connected():
            self.connect()
        if self.connection is not None:
            return self.connection.cursor()
        else:
            raise Exception("No se pudo conectar a la base de datos")

    def get_tables(self):
        tables = []
        try:
            cursor = self.connection.cursor()
            cursor.execute(
                "SELECT table_name FROM information_schema.tables WHERE table_schema = %s", (self.database,)
            )
            tables = cursor.fetchall()
            tables = [table[0] for table in tables]  # Convert to a simple list of table names
        except mysql.connector.Error as err:
            print(f"Error al obtener las tablas: {err}")
        finally:
            cursor.close()
        return tables

    def get_table_columns(self, table_name):
        columns = []
        try:
            cursor = self.connection.cursor(dictionary=True)
            cursor.execute(
                "SELECT column_name, data_type FROM information_schema.columns WHERE table_schema = %s AND table_name = %s", (self.database, table_name)
            )
            columns = cursor.fetchall()
        except mysql.connector.Error as err:
            print(f"Error al obtener las columnas de la tabla {table_name}: {err}")
        finally:
            cursor.close()
        return columns

