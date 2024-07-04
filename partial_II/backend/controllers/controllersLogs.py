import mysql.connector

class ControllersLogs:
    def __init__(self, db_manager):
        self.db_manager = db_manager

    def access_general_logs(self):
        try:
            cursor = self.db_manager.get_cursor()
            cursor.execute("SELECT * FROM mysql.general_log")
            logs = cursor.fetchall()
            cursor.close()
            return logs
        except mysql.connector.Error as e:
            return f"Error al acceder a los logs generales: {e}"