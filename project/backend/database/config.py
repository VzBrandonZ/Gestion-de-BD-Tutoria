import mysql.connector

def get_connection():
    connect = mysql.connector.connect(
        host="localhost",
        user="root",
        password="1728821081Br",
        database="kinderdb"
    )
    return connect

try:
    # Obtener la conexión
    connection = get_connection()

    # Verificar la conexión
    if connection.is_connected():
        print("Conexión exitosa.")

        # Obtener el nombre de la base de datos
        database_name = connection.database

        # Consulta para obtener nombres de todas las tablas
        cursor = connection.cursor()
        cursor.execute(
            "SELECT table_name FROM information_schema.tables WHERE table_schema = %s", (database_name,)
        )

        # Mostrar resultados
        print("Tablas:")
        for table in cursor:
            print(table[0])

        # Consulta para obtener información sobre las columnas de una tabla específica
        table_name = "genero"
        cursor.execute(
            f"SELECT column_name, data_type FROM information_schema.columns WHERE table_schema = %s AND table_name = %s", (database_name, table_name)
        )

        # Mostrar resultados
        print(f"\nColumnas de la tabla '{table_name}':")
        for column in cursor:
            print(column[0], "-", column[1])

        # Cerrar cursor y conexión
        cursor.close()
        connection.close()
    else:
        print("Error de conexión.")
except mysql.connector.Error as error:
    print("Error al conectar a MySQL:", error)
