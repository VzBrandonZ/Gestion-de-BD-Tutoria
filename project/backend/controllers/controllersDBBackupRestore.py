import subprocess

class ControllerDBBackupRestore:
    def __init__(self, db_manager):
        self.db_manager = db_manager

        
    def backupDatabase(self, backup_file):
        try:
            # Ejecutar el comando mysqldump para respaldar la base de datos
            subprocess.run(['mysqldump', '-u', self.db_manager.username, '-p' + self.db_manager.password, self.db_manager.database, '>', backup_file+".sql"], shell=True)
            print("Respaldo de la base de datos creado exitosamente.")
        except Exception as e:
            print("Error al crear el respaldo de la base de datos:", e)

    def restoreDatabase(self, backup_file):
        try:
            # Ejecutar el comando mysql para restaurar la base de datos desde el respaldo
            subprocess.run(['mysql', '-u', self.db_manager.username, '-p' + self.db_manager.password, self.db_manager.database, '<', backup_file], shell=True)
            print("Restauración de la base de datos completada exitosamente.")
        except Exception as e:
            print("Error al restaurar la base de datos:", e)