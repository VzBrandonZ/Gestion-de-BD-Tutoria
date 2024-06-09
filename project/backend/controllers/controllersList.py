


class ControllersList:
    def __init__(self, db_manager):
        self.db_manager = db_manager

    def listEntities(self):
        cursor = self.db_manager.connection.cursor()
        cursor.execute("SHOW TABLES")
        tables = cursor.fetchall()
        cursor.close()
        return [table[0] for table in tables]
    
    def listAttributes(self, entity):
        cursor = self.db_manager.connection.cursor()
        cursor.execute(f"DESCRIBE {entity}")
        columns = cursor.fetchall()
        cursor.close()
        return [column[0] for column in columns]
