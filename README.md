> <h1 align="center">PARTIAL I</h1>
# Proyecto de Administración de Roles, Usuarios y Permisos

Este proyecto tiene como objetivo proporcionar una solución integral para administrar roles, usuarios y permisos en una base de datos. Proporciona funcionalidades como la creación, modificación y eliminación de usuarios, así como la gestión de roles y asignación de estos a usuarios. También incluye características de respaldo y restauración de la base de datos, así como la generación de consultas y reportes en PDF.

## Características principales

### Administración de Roles y Usuarios

- **Crear un usuario:** Permite crear un nuevo usuario en la base de datos.
- **Modificar un usuario:** Permite actualizar la información de un usuario existente.
- **Eliminar un usuario:** Permite eliminar un usuario de la base de datos.
- **Crear un Rol:** Permite crear un nuevo rol en la base de datos.
- **Asignar un Rol a un Usuario:** Permite asignar uno o varios roles a un usuario específico.
- **Consultar los usuarios creados:** Permite consultar la lista de usuarios existentes en la base de datos.
- **Consultar los roles creados:** Permite consultar la lista de roles existentes en la base de datos.

### Respaldo y Restauración de Base de Datos

- **Respaldar su base de datos:** Permite realizar una copia de seguridad de la base de datos para su posterior restauración.
- **Restaurar a partir de un archivo:** Permite restaurar la base de datos a partir de un archivo de respaldo previamente generado.

### Gestión de Consultas y Generación de Reportes

- **Listar las entidades:** Permite listar todas las entidades disponibles en la base de datos.
- **Listar atributos por entidades:** Permite obtener una lista de atributos asociados a cada entidad.
- **Agregar entidades con atributos a su consulta:** Permite seleccionar las entidades y atributos deseados para realizar consultas personalizadas.
- **Generar reporte en PDF o en pantalla:** Permite generar reportes en formato PDF o visualizarlos en pantalla con la información consultada.

### Generación de Procedimientos Almacenados CRUD

- **Crear script con extensión SQL:** Genera automáticamente todos los procedimientos almacenados del CRUD (INSERT, UPDATE, DELETE y SELECT) para cada entidad de la base de datos.

## Requisitos

- Python
- Gestor de base de datos compatible (MySQL, PostgreSQL, etc.)

## Instalación

1. Clona el repositorio a tu máquina local.
2. Instala las dependencias necesarias.
3. Configura la conexión a la base de datos.
4. Ejecuta el script principal para comenzar a utilizar el sistema.


## Uso

1. Accede a la interfaz de usuario.
2. Utiliza las diferentes opciones y funcionalidades según tus necesidades.
3. Realiza consultas, genera reportes, administra roles y usuarios, y realiza respaldos/restauraciones de la base de datos según sea necesario.

> 
## Uso de Entorno Virtual y Dependencias

Para gestionar las dependencias del proyecto de forma aislada, se recomienda utilizar un entorno virtual de Python. Aquí están los comandos básicos para crear y activar un entorno virtual:


> Crear un nuevo entorno virtual
```bash
python -m venv venv
```
> O tambien puedes crearlo con
```bash
virtualenv -p python myenv
```
> Activar el entorno virtual (en Windows)
```bash
venv\Scripts\activate
```
> Activar el entorno virtual (en macOS/Linux)
```bash
source venv/bin/activate
```

Una vez activado el entorno virtual, puedes instalar las dependencias del proyecto utilizando el archivo requirements.txt:

```bash
pip install -r requirements.txt
```
