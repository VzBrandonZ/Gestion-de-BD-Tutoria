/*==============================================================*/
/* Table: ACTIVIDAD                                             */
/*==============================================================*/
DELIMITER //

/* Procedimiento para insertar en ACTIVIDAD */
CREATE PROCEDURE InsertarActividad(
    IN p_ID_PROGRAMA INT,
    IN p_NOMBRE_ACTIVIDAD VARCHAR(60),
    IN p_DESCRIPCION_ACTIVIDAD VARCHAR(300),
    IN p_DURACION_ACTIVIDAD INT,
    IN p_FINALIZADO TINYINT(1)
)
BEGIN
    INSERT INTO ACTIVIDAD (
        ID_PROGRAMA, 
        NOMBRE_ACTIVIDAD, 
        DESCRIPCION_ACTIVIDAD, 
        DURACION_ACTIVIDAD, 
        FINALIZADO
    ) VALUES (
        p_ID_PROGRAMA,
        UPPER(p_NOMBRE_ACTIVIDAD),
        UPPER(p_DESCRIPCION_ACTIVIDAD),
        p_DURACION_ACTIVIDAD,
        p_FINALIZADO
    );
END //

/* Procedimiento para seleccionar de ACTIVIDAD */
CREATE PROCEDURE SeleccionarActividad(
    IN p_ID_ACTIVIDAD INT
)
BEGIN
    SET @selected_id = p_ID_ACTIVIDAD;
    
    SELECT * 
    FROM ACTIVIDAD 
    WHERE ID_ACTIVIDAD = @selected_id;
END //

/* Procedimiento para actualizar en ACTIVIDAD */
CREATE PROCEDURE ActualizarActividad(
    IN p_ID_ACTIVIDAD INT,
    IN p_ID_PROGRAMA INT,
    IN p_NOMBRE_ACTIVIDAD VARCHAR(60),
    IN p_DESCRIPCION_ACTIVIDAD VARCHAR(300),
    IN p_DURACION_ACTIVIDAD INT,
    IN p_FINALIZADO TINYINT(1)
)
BEGIN
    SET @selected_id = p_ID_ACTIVIDAD;
    
    UPDATE ACTIVIDAD
    SET 
        ID_PROGRAMA = p_ID_PROGRAMA,
        NOMBRE_ACTIVIDAD = UPPER(p_NOMBRE_ACTIVIDAD),
        DESCRIPCION_ACTIVIDAD = UPPER(p_DESCRIPCION_ACTIVIDAD),
        DURACION_ACTIVIDAD = p_DURACION_ACTIVIDAD,
        FINALIZADO = p_FINALIZADO
    WHERE ID_ACTIVIDAD = @selected_id;
END //

/* Procedimiento para eliminar de ACTIVIDAD */
CREATE PROCEDURE EliminarActividad(
    IN p_ID_ACTIVIDAD INT
)
BEGIN
    SET @selected_id = p_ID_ACTIVIDAD;
    
    DELETE FROM ACTIVIDAD 
    WHERE ID_ACTIVIDAD = @selected_id;
END //

DELIMITER ;





/*==============================================================*/
/* Table: ALERGIAS                                              */
/*==============================================================*/

DELIMITER //

/* Procedimiento para insertar en ALERGIAS */
CREATE PROCEDURE InsertarAlergia(
    IN p_NOMBRE_ALERGIA VARCHAR(30)
)
BEGIN
    INSERT INTO ALERGIAS (NOMBRE_ALERGIA) VALUES (UPPER(p_NOMBRE_ALERGIA));
END //

/* Procedimiento para seleccionar de ALERGIAS */
CREATE PROCEDURE SeleccionarAlergia(
    IN p_ID_ALERGIA INT
)
BEGIN
    SET @selected_id = p_ID_ALERGIA;
    
    SELECT * 
    FROM ALERGIAS 
    WHERE ID_ALERGIA = @selected_id;
END //

/* Procedimiento para actualizar en ALERGIAS */
CREATE PROCEDURE ActualizarAlergia(
    IN p_ID_ALERGIA INT,
    IN p_NOMBRE_ALERGIA VARCHAR(30)
)
BEGIN
    SET @selected_id = p_ID_ALERGIA;
    
    UPDATE ALERGIAS
    SET NOMBRE_ALERGIA = UPPER(p_NOMBRE_ALERGIA)
    WHERE ID_ALERGIA = @selected_id;
END //

/* Procedimiento para eliminar de ALERGIAS */
CREATE PROCEDURE EliminarAlergia(
    IN p_ID_ALERGIA INT
)
BEGIN
    SET @selected_id = p_ID_ALERGIA;
    
    DELETE FROM ALERGIAS 
    WHERE ID_ALERGIA = @selected_id;
END //

DELIMITER ;



/*==============================================================*/
/* Table: ANO_LECTIVO                                           */
/*==============================================================*/


DELIMITER //

/* Procedimiento para insertar en ANO_LECTIVO */
CREATE PROCEDURE InsertarAnoLectivo(
    IN p_ANO VARCHAR(4)
)
BEGIN
    INSERT INTO ANO_LECTIVO (ANO) VALUES (UPPER(p_ANO));
END //

/* Procedimiento para seleccionar de ANO_LECTIVO */
CREATE PROCEDURE SeleccionarAnoLectivo(
    IN p_ID_ANO_LECTIVO INT
)
BEGIN
    SET @selected_id = p_ID_ANO_LECTIVO;
    
    SELECT * 
    FROM ANO_LECTIVO 
    WHERE ID_ANO_LECTIVO = @selected_id;
END //

/* Procedimiento para actualizar en ANO_LECTIVO */
CREATE PROCEDURE ActualizarAnoLectivo(
    IN p_ID_ANO_LECTIVO INT,
    IN p_ANO VARCHAR(4)
)
BEGIN
    SET @selected_id = p_ID_ANO_LECTIVO;
    
    UPDATE ANO_LECTIVO
    SET ANO = UPPER(p_ANO)
    WHERE ID_ANO_LECTIVO = @selected_id;
END //

/* Procedimiento para eliminar de ANO_LECTIVO */
CREATE PROCEDURE EliminarAnoLectivo(
    IN p_ID_ANO_LECTIVO INT
)
BEGIN
    SET @selected_id = p_ID_ANO_LECTIVO;
    
    DELETE FROM ANO_LECTIVO 
    WHERE ID_ANO_LECTIVO = @selected_id;
END //

DELIMITER ;



/*==============================================================*/
/* Table: EMPLEA                                                */
/*==============================================================*/
DELIMITER //

/* Procedimiento para insertar en EMPLEA */
CREATE PROCEDURE InsertarEmplea(
    IN p_ID_MATERIAL INT,
    IN p_ID_ACTIVIDAD INT
)
BEGIN
    INSERT INTO EMPLEA (ID_MATERIAL, ID_ACTIVIDAD) VALUES (p_ID_MATERIAL, p_ID_ACTIVIDAD);
END //

/* Procedimiento para seleccionar de EMPLEA */
CREATE PROCEDURE SeleccionarEmplea(
    IN p_ID_MATERIAL INT,
    IN p_ID_ACTIVIDAD INT
)
BEGIN
    SET @selected_id_material = p_ID_MATERIAL;
    SET @selected_id_actividad = p_ID_ACTIVIDAD;
    
    SELECT * 
    FROM EMPLEA 
    WHERE ID_MATERIAL = @selected_id_material AND ID_ACTIVIDAD = @selected_id_actividad;
END //

/* Procedimiento para actualizar en EMPLEA */
CREATE PROCEDURE ActualizarEmplea(
    IN p_ID_MATERIAL INT,
    IN p_ID_ACTIVIDAD INT
)
BEGIN
    -- No es necesario actualizar esta tabla, ya que solo contiene claves foráneas.
    -- Puedes eliminar esta sección si no necesitas una actualización.
END //

/* Procedimiento para eliminar de EMPLEA */
CREATE PROCEDURE EliminarEmplea(
    IN p_ID_MATERIAL INT,
    IN p_ID_ACTIVIDAD INT
)
BEGIN
    SET @selected_id_material = p_ID_MATERIAL;
    SET @selected_id_actividad = p_ID_ACTIVIDAD;
    
    DELETE FROM EMPLEA 
    WHERE ID_MATERIAL = @selected_id_material AND ID_ACTIVIDAD = @selected_id_actividad;
END //

DELIMITER ;


/*==============================================================*/
/* Table: ESTADO_SALUD                                          */
/*==============================================================*/
DELIMITER //

/* Procedimiento para insertar en ESTADO_SALUD */
CREATE PROCEDURE InsertarEstadoSalud(
    IN p_ID_NINIO INT,
    IN p_ULTIMA_FECHA_ENFERMO DATETIME,
    IN p_DIAGNOSTICO VARCHAR(300),
    IN p_DOCTOR_TRATANTE VARCHAR(60)
)
BEGIN
    INSERT INTO ESTADO_SALUD (ID_NINIO, ULTIMA_FECHA_ENFERMO, DIAGNOSTICO, DOCTOR_TRATANTE)
    VALUES (p_ID_NINIO, p_ULTIMA_FECHA_ENFERMO, p_DIAGNOSTICO, p_DOCTOR_TRATANTE);
END //

/* Procedimiento para seleccionar de ESTADO_SALUD */
CREATE PROCEDURE SeleccionarEstadoSalud(
    IN p_ID_SALUD_STAT INT
)
BEGIN
    SET @selected_id = p_ID_SALUD_STAT;
    
    SELECT * 
    FROM ESTADO_SALUD 
    WHERE ID_SALUD_STAT = @selected_id;
END //

/* Procedimiento para actualizar en ESTADO_SALUD */
CREATE PROCEDURE ActualizarEstadoSalud(
    IN p_ID_SALUD_STAT INT,
    IN p_ID_NINIO INT,
    IN p_ULTIMA_FECHA_ENFERMO DATETIME,
    IN p_DIAGNOSTICO VARCHAR(300),
    IN p_DOCTOR_TRATANTE VARCHAR(60)
)
BEGIN
    SET @selected_id = p_ID_SALUD_STAT;
    
    UPDATE ESTADO_SALUD
    SET ID_NINIO = p_ID_NINIO,
        ULTIMA_FECHA_ENFERMO = p_ULTIMA_FECHA_ENFERMO,
        DIAGNOSTICO = p_DIAGNOSTICO,
        DOCTOR_TRATANTE = p_DOCTOR_TRATANTE
    WHERE ID_SALUD_STAT = @selected_id;
END //

/* Procedimiento para eliminar de ESTADO_SALUD */
CREATE PROCEDURE EliminarEstadoSalud(
    IN p_ID_SALUD_STAT INT
)
BEGIN
    SET @selected_id = p_ID_SALUD_STAT;
    
    DELETE FROM ESTADO_SALUD 
    WHERE ID_SALUD_STAT = @selected_id;
END //

DELIMITER ;



/*==============================================================*/
/* Table: GENERO                                                */
/*==============================================================*/
DELIMITER //

/* Procedimiento para insertar en GENERO */
CREATE PROCEDURE InsertarGenero(
    IN p_NOMBRE_GENERO VARCHAR(30)
)
BEGIN
    INSERT INTO GENERO (NOMBRE_GENERO) VALUES (UPPER(p_NOMBRE_GENERO));
END //

/* Procedimiento para seleccionar de GENERO */
CREATE PROCEDURE SeleccionarGenero(
    IN p_ID_GENERO INT
)
BEGIN
    SET @selected_id = p_ID_GENERO;
    
    SELECT * 
    FROM GENERO 
    WHERE ID_GENERO = @selected_id;
END //

/* Procedimiento para actualizar en GENERO */
CREATE PROCEDURE ActualizarGenero(
    IN p_ID_GENERO INT,
    IN p_NOMBRE_GENERO VARCHAR(30)
)
BEGIN
    SET @selected_id = p_ID_GENERO;
    
    UPDATE GENERO
    SET NOMBRE_GENERO = UPPER(p_NOMBRE_GENERO)
    WHERE ID_GENERO = @selected_id;
END //

/* Procedimiento para eliminar de GENERO */
CREATE PROCEDURE EliminarGenero(
    IN p_ID_GENERO INT
)
BEGIN
    SET @selected_id = p_ID_GENERO;
    
    DELETE FROM GENERO 
    WHERE ID_GENERO = @selected_id;
END //

DELIMITER ;




/*==============================================================*/
/* Table: MATERIAL                                              */
/*==============================================================*/
DELIMITER //

/* Procedimiento para insertar en MATERIAL */
CREATE PROCEDURE InsertarMaterial(
    IN p_NOMBRE_MATERIAL VARCHAR(30)
)
BEGIN
    INSERT INTO MATERIAL (NOMBRE_MATERIAL) VALUES (UPPER(p_NOMBRE_MATERIAL));
END //

/* Procedimiento para seleccionar de MATERIAL */
CREATE PROCEDURE SeleccionarMaterial(
    IN p_ID_MATERIAL INT
)
BEGIN
    SET @selected_id = p_ID_MATERIAL;
    
    SELECT * 
    FROM MATERIAL 
    WHERE ID_MATERIAL = @selected_id;
END //

/* Procedimiento para actualizar en MATERIAL */
CREATE PROCEDURE ActualizarMaterial(
    IN p_ID_MATERIAL INT,
    IN p_NOMBRE_MATERIAL VARCHAR(30)
)
BEGIN
    SET @selected_id = p_ID_MATERIAL;
    
    UPDATE MATERIAL
    SET NOMBRE_MATERIAL = UPPER(p_NOMBRE_MATERIAL)
    WHERE ID_MATERIAL = @selected_id;
END //

/* Procedimiento para eliminar de MATERIAL */
CREATE PROCEDURE EliminarMaterial(
    IN p_ID_MATERIAL INT
)
BEGIN
    SET @selected_id = p_ID_MATERIAL;
    
    DELETE FROM MATERIAL 
    WHERE ID_MATERIAL = @selected_id;
END //

DELIMITER ;




/*==============================================================*/
/* Table: MATRICULA                                             */
/*==============================================================*/
DELIMITER //

/* Procedimiento para insertar en MATRICULA */
CREATE PROCEDURE InsertarMatricula(
    IN p_ID_NINIO INT,
    IN p_ID_ANO_LECTIVO INT,
    IN p_PRECIO_MATRICULA INT
)
BEGIN
    INSERT INTO MATRICULA (ID_NINIO, ID_ANO_LECTIVO, PRECIO_MATRICULA)
    VALUES (p_ID_NINIO, p_ID_ANO_LECTIVO, p_PRECIO_MATRICULA);
END //

/* Procedimiento para seleccionar de MATRICULA */
CREATE PROCEDURE SeleccionarMatricula(
    IN p_ID_MATRICULA INT
)
BEGIN
    SET @selected_id = p_ID_MATRICULA;
    
    SELECT * 
    FROM MATRICULA 
    WHERE ID_MATRICULA = @selected_id;
END //

/* Procedimiento para actualizar en MATRICULA */
CREATE PROCEDURE ActualizarMatricula(
    IN p_ID_MATRICULA INT,
    IN p_ID_NINIO INT,
    IN p_ID_ANO_LECTIVO INT,
    IN p_PRECIO_MATRICULA INT
)
BEGIN
    SET @selected_id = p_ID_MATRICULA;
    
    UPDATE MATRICULA
    SET ID_NINIO = p_ID_NINIO,
        ID_ANO_LECTIVO = p_ID_ANO_LECTIVO,
        PRECIO_MATRICULA = p_PRECIO_MATRICULA
    WHERE ID_MATRICULA = @selected_id;
END //

/* Procedimiento para eliminar de MATRICULA */
CREATE PROCEDURE EliminarMatricula(
    IN p_ID_MATRICULA INT
)
BEGIN
    SET @selected_id = p_ID_MATRICULA;
    
    DELETE FROM MATRICULA 
    WHERE ID_MATRICULA = @selected_id;
END //

DELIMITER ;




/*==============================================================*/
/* Table: MEDICAMENTO                                           */
/*==============================================================*/
DELIMITER //

/* Procedimiento para insertar en MEDICAMENTO */
CREATE PROCEDURE InsertarMedicamento(
    IN p_NOMBRE_MEDICAMENTO VARCHAR(30),
    IN p_DESCRIPCION_MEDICAMENTO VARCHAR(300)
)
BEGIN
    INSERT INTO MEDICAMENTO (NOMBRE_MEDICAMENTO, DESCRIPCION_MEDICAMENTO)
    VALUES (UPPER(p_NOMBRE_MEDICAMENTO), UPPER(p_DESCRIPCION_MEDICAMENTO));
END //

/* Procedimiento para seleccionar de MEDICAMENTO */
CREATE PROCEDURE SeleccionarMedicamento(
    IN p_ID_MEDICAMENTO INT
)
BEGIN
    SET @selected_id = p_ID_MEDICAMENTO;
    
    SELECT * 
    FROM MEDICAMENTO 
    WHERE ID_MEDICAMENTO = @selected_id;
END //

/* Procedimiento para actualizar en MEDICAMENTO */
CREATE PROCEDURE ActualizarMedicamento(
    IN p_ID_MEDICAMENTO INT,
    IN p_NOMBRE_MEDICAMENTO VARCHAR(30),
    IN p_DESCRIPCION_MEDICAMENTO VARCHAR(300)
)
BEGIN
    SET @selected_id = p_ID_MEDICAMENTO;
    
    UPDATE MEDICAMENTO
    SET NOMBRE_MEDICAMENTO = UPPER(p_NOMBRE_MEDICAMENTO),
        DESCRIPCION_MEDICAMENTO = UPPER(p_DESCRIPCION_MEDICAMENTO)
    WHERE ID_MEDICAMENTO = @selected_id;
END //

/* Procedimiento para eliminar de MEDICAMENTO */
CREATE PROCEDURE EliminarMedicamento(
    IN p_ID_MEDICAMENTO INT
)
BEGIN
    SET @selected_id = p_ID_MEDICAMENTO;
    
    DELETE FROM MEDICAMENTO 
    WHERE ID_MEDICAMENTO = @selected_id;
END //

DELIMITER ;




/*==============================================================*/
/* Table: NACIONALIDAD                                          */
/*==============================================================*/
DELIMITER //

/* Procedimiento para insertar en NACIONALIDAD */
CREATE PROCEDURE InsertarNacionalidad(
    IN p_NOMBRE_NACIONALIDAD VARCHAR(30)
)
BEGIN
    INSERT INTO NACIONALIDAD (NOMBRE_NACIONALIDAD) VALUES (UPPER(p_NOMBRE_NACIONALIDAD));
END //

/* Procedimiento para seleccionar de NACIONALIDAD */
CREATE PROCEDURE SeleccionarNacionalidad(
    IN p_ID_NACIONALIDAD INT
)
BEGIN
    SET @selected_id = p_ID_NACIONALIDAD;
    
    SELECT * 
    FROM NACIONALIDAD 
    WHERE ID_NACIONALIDAD = @selected_id;
END //

/* Procedimiento para actualizar en NACIONALIDAD */
CREATE PROCEDURE ActualizarNacionalidad(
    IN p_ID_NACIONALIDAD INT,
    IN p_NOMBRE_NACIONALIDAD VARCHAR(30)
)
BEGIN
    SET @selected_id = p_ID_NACIONALIDAD;
    
    UPDATE NACIONALIDAD
    SET NOMBRE_NACIONALIDAD = UPPER(p_NOMBRE_NACIONALIDAD)
    WHERE ID_NACIONALIDAD = @selected_id;
END //

/* Procedimiento para eliminar de NACIONALIDAD */
CREATE PROCEDURE EliminarNacionalidad(
    IN p_ID_NACIONALIDAD INT
)
BEGIN
    SET @selected_id = p_ID_NACIONALIDAD;
    
    DELETE FROM NACIONALIDAD 
    WHERE ID_NACIONALIDAD = @selected_id;
END //

DELIMITER ;




/*==============================================================*/
/* Table: NINIO                                                 */
/*==============================================================*/
DELIMITER //

/* Procedimiento para insertar en NINIO */
CREATE PROCEDURE InsertarNinio(
    IN p_ID_NACIONALIDAD INT,
    IN p_ID_GENERO INT,
    IN p_ID_TALLA_ZAPATO INT,
    IN p_ID_TALLA_VESTIMENTA INT,
    IN p_CI_NINIO VARCHAR(10),
    IN p_NOMBRE_NINIO VARCHAR(30),
    IN p_APELLIDO_NINIO VARCHAR(30),
    IN p_NACIMIENTO_DATE DATETIME,
    IN p_ESTADO_MATRICULA BOOLEAN
)
BEGIN
    INSERT INTO NINIO (ID_NACIONALIDAD, ID_GENERO, ID_TALLA_ZAPATO, ID_TALLA_VESTIMENTA, CI_NINIO, NOMBRE_NINIO, APELLIDO_NINIO, NACIMIENTO_DATE, ESTADO_MATRICULA)
    VALUES (p_ID_NACIONALIDAD, p_ID_GENERO, p_ID_TALLA_ZAPATO, p_ID_TALLA_VESTIMENTA, UPPER(p_CI_NINIO), UPPER(p_NOMBRE_NINIO), UPPER(p_APELLIDO_NINIO), p_NACIMIENTO_DATE, p_ESTADO_MATRICULA);
END //

/* Procedimiento para seleccionar de NINIO */
CREATE PROCEDURE SeleccionarNinio(
    IN p_ID_NINIO INT
)
BEGIN
    SET @selected_id = p_ID_NINIO;
    
    SELECT * 
    FROM NINIO 
    WHERE ID_NINIO = @selected_id;
END //

/* Procedimiento para actualizar en NINIO */
CREATE PROCEDURE ActualizarNinio(
    IN p_ID_NINIO INT,
    IN p_ID_NACIONALIDAD INT,
    IN p_ID_GENERO INT,
    IN p_ID_TALLA_ZAPATO INT,
    IN p_ID_TALLA_VESTIMENTA INT,
    IN p_CI_NINIO VARCHAR(10),
    IN p_NOMBRE_NINIO VARCHAR(30),
    IN p_APELLIDO_NINIO VARCHAR(30),
    IN p_NACIMIENTO_DATE DATETIME,
    IN p_ESTADO_MATRICULA BOOLEAN
)
BEGIN
    SET @selected_id = p_ID_NINIO;
    
    UPDATE NINIO
    SET ID_NACIONALIDAD = p_ID_NACIONALIDAD,
        ID_GENERO = p_ID_GENERO,
        ID_TALLA_ZAPATO = p_ID_TALLA_ZAPATO,
        ID_TALLA_VESTIMENTA = p_ID_TALLA_VESTIMENTA,
        CI_NINIO = UPPER(p_CI_NINIO),
        NOMBRE_NINIO = UPPER(p_NOMBRE_NINIO),
        APELLIDO_NINIO = UPPER(p_APELLIDO_NINIO),
        NACIMIENTO_DATE = p_NACIMIENTO_DATE,
        ESTADO_MATRICULA = p_ESTADO_MATRICULA
    WHERE ID_NINIO = @selected_id;
END //

/* Procedimiento para eliminar de NINIO */
CREATE PROCEDURE EliminarNinio(
    IN p_ID_NINIO INT
)
BEGIN
    SET @selected_id = p_ID_NINIO;
    
    DELETE FROM NINIO 
    WHERE ID_NINIO = @selected_id;
END //

DELIMITER ;



/*==============================================================*/
/* Table: PADRE                                                 */
/*==============================================================*/
DELIMITER //

/* Procedimiento para insertar en PADRE */
CREATE PROCEDURE InsertarPadre(
    IN p_ID_GENERO INT,
    IN p_ID_NACIONALIDAD INT,
    IN p_NOMBRE_PADRE VARCHAR(30),
    IN p_APELLIDO_PADRE VARCHAR(30),
    IN p_CI_PADRE VARCHAR(10),
    IN p_DIRECCION_PADRE VARCHAR(30),
    IN p_TELEFONO_PADRE VARCHAR(10),
    IN p_DOMICILIO_PADRE VARCHAR(30)
)
BEGIN
    INSERT INTO PADRE (ID_GENERO, ID_NACIONALIDAD, NOMBRE_PADRE, APELLIDO_PADRE, CI_PADRE, DIRECCION_PADRE, TELEFONO_PADRE, DOMICILIO_PADRE)
    VALUES (p_ID_GENERO, p_ID_NACIONALIDAD, UPPER(p_NOMBRE_PADRE), UPPER(p_APELLIDO_PADRE), UPPER(p_CI_PADRE), p_DIRECCION_PADRE, p_TELEFONO_PADRE, p_DOMICILIO_PADRE);
END //

/* Procedimiento para seleccionar de PADRE */
CREATE PROCEDURE SeleccionarPadre(
    IN p_ID_PADRE INT
)
BEGIN
    SET @selected_id = p_ID_PADRE;
    
    SELECT * 
    FROM PADRE 
    WHERE ID_PADRE = @selected_id;
END //

/* Procedimiento para actualizar en PADRE */
CREATE PROCEDURE ActualizarPadre(
    IN p_ID_PADRE INT,
    IN p_ID_GENERO INT,
    IN p_ID_NACIONALIDAD INT,
    IN p_NOMBRE_PADRE VARCHAR(30),
    IN p_APELLIDO_PADRE VARCHAR(30),
    IN p_CI_PADRE VARCHAR(10),
    IN p_DIRECCION_PADRE VARCHAR(30),
    IN p_TELEFONO_PADRE VARCHAR(10),
    IN p_DOMICILIO_PADRE VARCHAR(30)
)
BEGIN
    SET @selected_id = p_ID_PADRE;
    
    UPDATE PADRE
    SET ID_GENERO = p_ID_GENERO,
        ID_NACIONALIDAD = p_ID_NACIONALIDAD,
        NOMBRE_PADRE = UPPER(p_NOMBRE_PADRE),
        APELLIDO_PADRE = UPPER(p_APELLIDO_PADRE),
        CI_PADRE = UPPER(p_CI_PADRE),
        DIRECCION_PADRE = p_DIRECCION_PADRE,
        TELEFONO_PADRE = p_TELEFONO_PADRE,
        DOMICILIO_PADRE = p_DOMICILIO_PADRE
    WHERE ID_PADRE = @selected_id;
END //

/* Procedimiento para eliminar de PADRE */
CREATE PROCEDURE EliminarPadre(
    IN p_ID_PADRE INT
)
BEGIN
    SET @selected_id = p_ID_PADRE;
    
    DELETE FROM PADRE 
    WHERE ID_PADRE = @selected_id;
END //

DELIMITER ;




/*==============================================================*/
/* Table: PROFESIONAL                                           */
/*==============================================================*/
DELIMITER //

/* Procedimiento para insertar en PROFESIONAL */
CREATE PROCEDURE InsertarProfesional(
    IN p_ID_ACTIVIDAD INT,
    IN p_ID_GENERO INT,
    IN p_ID_NACIONALIDAD INT,
    IN p_NOMBRES_PROF VARCHAR(30),
    IN p_APELLIDOS_PROF VARCHAR(30),
    IN p_CI_PROF VARCHAR(10),
    IN p_DIRECCION_PROF VARCHAR(60),
    IN p_TELEFONO_PROF VARCHAR(10),
    IN p_NO_CERTIFI_SENECYT CHAR(15)
)
BEGIN
    INSERT INTO PROFESIONAL (ID_ACTIVIDAD, ID_GENERO, ID_NACIONALIDAD, NOMBRES_PROF, APELLIDOS_PROF, CI_PROF, DIRECCION_PROF, TELEFONO_PROF, NO_CERTIFI_SENECYT)
    VALUES (p_ID_ACTIVIDAD, p_ID_GENERO, p_ID_NACIONALIDAD, UPPER(p_NOMBRES_PROF), UPPER(p_APELLIDOS_PROF), UPPER(p_CI_PROF), p_DIRECCION_PROF, p_TELEFONO_PROF, p_NO_CERTIFI_SENECYT);
END //

/* Procedimiento para seleccionar de PROFESIONAL */
CREATE PROCEDURE SeleccionarProfesional(
    IN p_ID_PROF INT
)
BEGIN
    SET @selected_id = p_ID_PROF;
    
    SELECT * 
    FROM PROFESIONAL 
    WHERE ID_PROF = @selected_id;
END //

/* Procedimiento para actualizar en PROFESIONAL */
CREATE PROCEDURE ActualizarProfesional(
    IN p_ID_PROF INT,
    IN p_ID_ACTIVIDAD INT,
    IN p_ID_GENERO INT,
    IN p_ID_NACIONALIDAD INT,
    IN p_NOMBRES_PROF VARCHAR(30),
    IN p_APELLIDOS_PROF VARCHAR(30),
    IN p_CI_PROF VARCHAR(10),
    IN p_DIRECCION_PROF VARCHAR(60),
    IN p_TELEFONO_PROF VARCHAR(10),
    IN p_NO_CERTIFI_SENECYT CHAR(15)
)
BEGIN
    SET @selected_id = p_ID_PROF;
    
    UPDATE PROFESIONAL
    SET ID_ACTIVIDAD = p_ID_ACTIVIDAD,
        ID_GENERO = p_ID_GENERO,
        ID_NACIONALIDAD = p_ID_NACIONALIDAD,
        NOMBRES_PROF = UPPER(p_NOMBRES_PROF),
        APELLIDOS_PROF = UPPER(p_APELLIDOS_PROF),
        CI_PROF = UPPER(p_CI_PROF),
        DIRECCION_PROF = p_DIRECCION_PROF,
        TELEFONO_PROF = p_TELEFONO_PROF,
        NO_CERTIFI_SENECYT = p_NO_CERTIFI_SENECYT
    WHERE ID_PROF = @selected_id;
END //

/* Procedimiento para eliminar de PROFESIONAL */
CREATE PROCEDURE EliminarProfesional(
    IN p_ID_PROF INT
)
BEGIN
    SET @selected_id = p_ID_PROF;
    
    DELETE FROM PROFESIONAL 
    WHERE ID_PROF = @selected_id;
END //

DELIMITER ;




/*==============================================================*/
/* Table: PROGRAMA                                              */
/*==============================================================*/
DELIMITER //

/* Procedimiento para insertar en PROGRAMA */
CREATE PROCEDURE InsertarPrograma(
    IN p_ID_ANO_LECTIVO INT,
    IN p_NOMBRE_PROGRAMA VARCHAR(60)
)
BEGIN
    INSERT INTO PROGRAMA (ID_ANO_LECTIVO, NOMBRE_PROGRAMA)
    VALUES (p_ID_ANO_LECTIVO, UPPER(p_NOMBRE_PROGRAMA));
END //

/* Procedimiento para seleccionar de PROGRAMA */
CREATE PROCEDURE SeleccionarPrograma(
    IN p_ID_PROGRAMA INT
)
BEGIN
    SET @selected_id = p_ID_PROGRAMA;
    
    SELECT * 
    FROM PROGRAMA 
    WHERE ID_PROGRAMA = @selected_id;
END //

/* Procedimiento para actualizar en PROGRAMA */
CREATE PROCEDURE ActualizarPrograma(
    IN p_ID_PROGRAMA INT,
    IN p_ID_ANO_LECTIVO INT,
    IN p_NOMBRE_PROGRAMA VARCHAR(60)
)
BEGIN
    SET @selected_id = p_ID_PROGRAMA;
    
    UPDATE PROGRAMA
    SET ID_ANO_LECTIVO = p_ID_ANO_LECTIVO,
        NOMBRE_PROGRAMA = UPPER(p_NOMBRE_PROGRAMA)
    WHERE ID_PROGRAMA = @selected_id;
END //

/* Procedimiento para eliminar de PROGRAMA */
CREATE PROCEDURE EliminarPrograma(
    IN p_ID_PROGRAMA INT
)
BEGIN
    SET @selected_id = p_ID_PROGRAMA;
    
    DELETE FROM PROGRAMA 
    WHERE ID_PROGRAMA = @selected_id;
END //

DELIMITER ;




/*==============================================================*/
/* Table: RELACION                                              */
/*==============================================================*/
DELIMITER //

/* Procedimiento para insertar en RELACION */
CREATE PROCEDURE InsertarRelacion(
    IN p_ID_PARENTESCO INT,
    IN p_NOMBRE_PARENTESCO VARCHAR(30)
)
BEGIN
    INSERT INTO RELACION (ID_PARENTESCO, NOMBRE_PARENTESCO)
    VALUES (p_ID_PARENTESCO, UPPER(p_NOMBRE_PARENTESCO));
END //

/* Procedimiento para seleccionar de RELACION */
CREATE PROCEDURE SeleccionarRelacion(
    IN p_ID_PARENTESCO INT
)
BEGIN
    SET @selected_id = p_ID_PARENTESCO;
    
    SELECT * 
    FROM RELACION 
    WHERE ID_PARENTESCO = @selected_id;
END //

/* Procedimiento para actualizar en RELACION */
CREATE PROCEDURE ActualizarRelacion(
    IN p_ID_PARENTESCO INT,
    IN p_NOMBRE_PARENTESCO VARCHAR(30)
)
BEGIN
    SET @selected_id = p_ID_PARENTESCO;
    
    UPDATE RELACION
    SET NOMBRE_PARENTESCO = UPPER(p_NOMBRE_PARENTESCO)
    WHERE ID_PARENTESCO = @selected_id;
END //

/* Procedimiento para eliminar de RELACION */
CREATE PROCEDURE EliminarRelacion(
    IN p_ID_PARENTESCO INT
)
BEGIN
    SET @selected_id = p_ID_PARENTESCO;
    
    DELETE FROM RELACION 
    WHERE ID_PARENTESCO = @selected_id;
END //

DELIMITER ;




/*==============================================================*/
/* Table: RELACION_PADRE_NINIO                                  */
/*==============================================================*/
DELIMITER //

/* Procedimiento para insertar en RELACION_PADRE_NINIO */
CREATE PROCEDURE InsertarRelacionPadreNinio(
    IN p_ID_PADRE INT,
    IN p_ID_NINIO INT
)
BEGIN
    INSERT INTO RELACION_PADRE_NINIO (ID_PADRE, ID_NINIO)
    VALUES (p_ID_PADRE, p_ID_NINIO);
END //

/* Procedimiento para seleccionar de RELACION_PADRE_NINIO */
CREATE PROCEDURE SeleccionarRelacionPadreNinio(
    IN p_ID_PADRE INT,
    IN p_ID_NINIO INT
)
BEGIN
    SET @selected_padre = p_ID_PADRE;
    SET @selected_ninio = p_ID_NINIO;
    
    SELECT * 
    FROM RELACION_PADRE_NINIO 
    WHERE ID_PADRE = @selected_padre AND ID_NINIO = @selected_ninio;
END //

/* Procedimiento para eliminar de RELACION_PADRE_NINIO */
CREATE PROCEDURE EliminarRelacionPadreNinio(
    IN p_ID_PADRE INT,
    IN p_ID_NINIO INT
)
BEGIN
    SET @selected_padre = p_ID_PADRE;
    SET @selected_ninio = p_ID_NINIO;
    
    DELETE FROM RELACION_PADRE_NINIO 
    WHERE ID_PADRE = @selected_padre AND ID_NINIO = @selected_ninio;
END //

DELIMITER ;




/*==============================================================*/
/* Table: RENDIMIENTO                                           */
/*==============================================================*/
DELIMITER //

/* Procedimiento para insertar en RENDIMIENTO */
CREATE PROCEDURE InsertarRendimiento(
    IN p_ID_ACTIVIDAD INT,
    IN p_ID_TIPO_RENDIMIENTO INT,
    IN p_ID_NINIO INT,
    IN p_OBSERVACIONES VARCHAR(300)
)
BEGIN
    INSERT INTO RENDIMIENTO (ID_ACTIVIDAD, ID_TIPO_RENDIMIENT, ID_NINIO, OBSERVACIONES)
    VALUES (p_ID_ACTIVIDAD, p_ID_TIPO_RENDIMIENTO, p_ID_NINIO, p_OBSERVACIONES);
END //

/* Procedimiento para seleccionar de RENDIMIENTO */
CREATE PROCEDURE SeleccionarRendimiento(
    IN p_ID_RENDIMIENTO INT
)
BEGIN
    SET @selected_id = p_ID_RENDIMIENTO;
    
    SELECT * 
    FROM RENDIMIENTO 
    WHERE ID_RENDIMIENTO = @selected_id;
END //

/* Procedimiento para actualizar en RENDIMIENTO */
CREATE PROCEDURE ActualizarRendimiento(
    IN p_ID_RENDIMIENTO INT,
    IN p_ID_ACTIVIDAD INT,
    IN p_ID_TIPO_RENDIMIENTO INT,
    IN p_ID_NINIO INT,
    IN p_OBSERVACIONES VARCHAR(300)
)
BEGIN
    SET @selected_id = p_ID_RENDIMIENTO;
    
    UPDATE RENDIMIENTO
    SET ID_ACTIVIDAD = p_ID_ACTIVIDAD,
        ID_TIPO_RENDIMIENT = p_ID_TIPO_RENDIMIENTO,
        ID_NINIO = p_ID_NINIO,
        OBSERVACIONES = p_OBSERVACIONES
    WHERE ID_RENDIMIENTO = @selected_id;
END //

/* Procedimiento para eliminar de RENDIMIENTO */
CREATE PROCEDURE EliminarRendimiento(
    IN p_ID_RENDIMIENTO INT
)
BEGIN
    SET @selected_id = p_ID_RENDIMIENTO;
    
    DELETE FROM RENDIMIENTO 
    WHERE ID_RENDIMIENTO = @selected_id;
END //

DELIMITER ;




/*==============================================================*/
/* Table: SALUD_ALERGIAS_RELATION                               */
/*==============================================================*/
DELIMITER //

/* Procedimiento para insertar en SALUD_ALERGIAS_RELATION */
CREATE PROCEDURE InsertarSaludAlergiasRelacion(
    IN p_ID_ALERGIA INT,
    IN p_ID_SALUD_STAT INT
)
BEGIN
    INSERT INTO SALUD_ALERGIAS_RELATION (ID_ALERGIA, ID_SALUD_STAT)
    VALUES (p_ID_ALERGIA, p_ID_SALUD_STAT);
END //

/* Procedimiento para seleccionar de SALUD_ALERGIAS_RELATION */
CREATE PROCEDURE SeleccionarSaludAlergiasRelacion(
    IN p_ID_ALERGIA INT,
    IN p_ID_SALUD_STAT INT
)
BEGIN
    SET @selected_alergia = p_ID_ALERGIA;
    SET @selected_salud_stat = p_ID_SALUD_STAT;
    
    SELECT * 
    FROM SALUD_ALERGIAS_RELATION 
    WHERE ID_ALERGIA = @selected_alergia AND ID_SALUD_STAT = @selected_salud_stat;
END //

/* Procedimiento para eliminar de SALUD_ALERGIAS_RELATION */
CREATE PROCEDURE EliminarSaludAlergiasRelacion(
    IN p_ID_ALERGIA INT,
    IN p_ID_SALUD_STAT INT
)
BEGIN
    SET @selected_alergia = p_ID_ALERGIA;
    SET @selected_salud_stat = p_ID_SALUD_STAT;
    
    DELETE FROM SALUD_ALERGIAS_RELATION 
    WHERE ID_ALERGIA = @selected_alergia AND ID_SALUD_STAT = @selected_salud_stat;
END //

DELIMITER ;




/*==============================================================*/
/* Table: SALUD_MEDICAMENT_RELATION                             */
/*==============================================================*/
DELIMITER //

/* Procedimiento para insertar en SALUD_MEDICAMENT_RELATION */
CREATE PROCEDURE InsertarSaludMedicamentoRelacion(
    IN p_ID_MEDICAMENTO INT,
    IN p_ID_SALUD_STAT INT
)
BEGIN
    INSERT INTO SALUD_MEDICAMENT_RELATION (ID_MEDICAMENTO, ID_SALUD_STAT)
    VALUES (p_ID_MEDICAMENTO, p_ID_SALUD_STAT);
END //

/* Procedimiento para seleccionar de SALUD_MEDICAMENT_RELATION */
CREATE PROCEDURE SeleccionarSaludMedicamentoRelacion(
    IN p_ID_MEDICAMENTO INT,
    IN p_ID_SALUD_STAT INT
)
BEGIN
    SET @selected_medicamento = p_ID_MEDICAMENTO;
    SET @selected_salud_stat = p_ID_SALUD_STAT;
    
    SELECT * 
    FROM SALUD_MEDICAMENT_RELATION 
    WHERE ID_MEDICAMENTO = @selected_medicamento AND ID_SALUD_STAT = @selected_salud_stat;
END //

/* Procedimiento para eliminar de SALUD_MEDICAMENT_RELATION */
CREATE PROCEDURE EliminarSaludMedicamentoRelacion(
    IN p_ID_MEDICAMENTO INT,
    IN p_ID_SALUD_STAT INT
)
BEGIN
    SET @selected_medicamento = p_ID_MEDICAMENTO;
    SET @selected_salud_stat = p_ID_SALUD_STAT;
    
    DELETE FROM SALUD_MEDICAMENT_RELATION 
    WHERE ID_MEDICAMENTO = @selected_medicamento AND ID_SALUD_STAT = @selected_salud_stat;
END //

DELIMITER ;




/*==============================================================*/
/* Table: TALLA_VESTIMENTA                                      */
/*==============================================================*/
DELIMITER //

/* Procedimiento para insertar en TALLA_VESTIMENTA */
CREATE PROCEDURE InsertarTallaVestimenta(
    IN p_NUMERO_TALLA DECIMAL(4,0)
)
BEGIN
    INSERT INTO TALLA_VESTIMENTA (NUMERO_TALLA)
    VALUES (p_NUMERO_TALLA);
END //

/* Procedimiento para seleccionar de TALLA_VESTIMENTA */
CREATE PROCEDURE SeleccionarTallaVestimenta(
    IN p_ID_TALLA_VESTIMENTA INT
)
BEGIN
    SET @selected_id = p_ID_TALLA_VESTIMENTA;
    
    SELECT * 
    FROM TALLA_VESTIMENTA 
    WHERE ID_TALLA_VESTIMENTA = @selected_id;
END //

/* Procedimiento para actualizar en TALLA_VESTIMENTA */
CREATE PROCEDURE ActualizarTallaVestimenta(
    IN p_ID_TALLA_VESTIMENTA INT,
    IN p_NUMERO_TALLA DECIMAL(4,0)
)
BEGIN
    UPDATE TALLA_VESTIMENTA
    SET NUMERO_TALLA = p_NUMERO_TALLA
    WHERE ID_TALLA_VESTIMENTA = p_ID_TALLA_VESTIMENTA;
END //

/* Procedimiento para eliminar de TALLA_VESTIMENTA */
CREATE PROCEDURE EliminarTallaVestimenta(
    IN p_ID_TALLA_VESTIMENTA INT
)
BEGIN
    DELETE FROM TALLA_VESTIMENTA 
    WHERE ID_TALLA_VESTIMENTA = p_ID_TALLA_VESTIMENTA;
END //

DELIMITER ;





/*==============================================================*/
/* Table: TALLA_ZAPATO                                          */
/*==============================================================*/
DELIMITER //

/* Procedimiento para insertar en TALLA_ZAPATO */
CREATE PROCEDURE InsertarTallaZapato(
    IN p_NUMERO_TALLA DECIMAL(4,0)
)
BEGIN
    INSERT INTO TALLA_ZAPATO (NUMERO_TALLA)
    VALUES (p_NUMERO_TALLA);
END //

/* Procedimiento para seleccionar de TALLA_ZAPATO */
CREATE PROCEDURE SeleccionarTallaZapato(
    IN p_ID_TALLA_ZAPATO INT
)
BEGIN
    SET @selected_id = p_ID_TALLA_ZAPATO;
    
    SELECT * 
    FROM TALLA_ZAPATO 
    WHERE ID_TALLA_ZAPATO = @selected_id;
END //

/* Procedimiento para actualizar en TALLA_ZAPATO */
CREATE PROCEDURE ActualizarTallaZapato(
    IN p_ID_TALLA_ZAPATO INT,
    IN p_NUMERO_TALLA DECIMAL(4,0)
)
BEGIN
    UPDATE TALLA_ZAPATO
    SET NUMERO_TALLA = p_NUMERO_TALLA
    WHERE ID_TALLA_ZAPATO = p_ID_TALLA_ZAPATO;
END //

/* Procedimiento para eliminar de TALLA_ZAPATO */
CREATE PROCEDURE EliminarTallaZapato(
    IN p_ID_TALLA_ZAPATO INT
)
BEGIN
    DELETE FROM TALLA_ZAPATO 
    WHERE ID_TALLA_ZAPATO = p_ID_TALLA_ZAPATO;
END //

DELIMITER ;





/*==============================================================*/
/* Table: TIPO_RENDIMIENTO                                      */
/*==============================================================*/
DELIMITER //

/* Procedimiento para insertar en TIPO_RENDIMIENTO */
CREATE PROCEDURE InsertarTipoRendimiento(
    IN p_NOMBRE_RENDIMIENT VARCHAR(20)
)
BEGIN
    INSERT INTO TIPO_RENDIMIENTO (NOMBRE_RENDIMIENT)
    VALUES (UPPER(p_NOMBRE_RENDIMIENT));
END //

/* Procedimiento para seleccionar de TIPO_RENDIMIENTO */
CREATE PROCEDURE SeleccionarTipoRendimiento(
    IN p_ID_TIPO_RENDIMIENT INT
)
BEGIN
    SET @selected_id = p_ID_TIPO_RENDIMIENT;
    
    SELECT * 
    FROM TIPO_RENDIMIENTO 
    WHERE ID_TIPO_RENDIMIENT = @selected_id;
END //

/* Procedimiento para actualizar en TIPO_RENDIMIENTO */
CREATE PROCEDURE ActualizarTipoRendimiento(
    IN p_ID_TIPO_RENDIMIENT INT,
    IN p_NOMBRE_RENDIMIENT VARCHAR(20)
)
BEGIN
    UPDATE TIPO_RENDIMIENTO
    SET NOMBRE_RENDIMIENT = UPPER(p_NOMBRE_RENDIMIENT)
    WHERE ID_TIPO_RENDIMIENT = p_ID_TIPO_RENDIMIENT;
END //

/* Procedimiento para eliminar de TIPO_RENDIMIENTO */
CREATE PROCEDURE EliminarTipoRendimiento(
    IN p_ID_TIPO_RENDIMIENT INT
)
BEGIN
    DELETE FROM TIPO_RENDIMIENTO 
    WHERE ID_TIPO_RENDIMIENT = p_ID_TIPO_RENDIMIENT;
END //

DELIMITER ;




/*==============================================================*/
/* Table: TUTOR                                                 */
/*==============================================================*/
DELIMITER //

/* Procedimiento para insertar en TUTOR */
CREATE PROCEDURE InsertarTutor(
    IN p_ID_NACIONALIDAD INT,
    IN p_ID_GENERO INT,
    IN p_ID_PARENTESCO INT,
    IN p_NOMBRE_TUTOR VARCHAR(30),
    IN p_APELLIDO_TUTOR VARCHAR(30),
    IN p_CI_TUTOR VARCHAR(10),
    IN p_DIRECCION_TUTOR VARCHAR(30),
    IN p_TELEFONO_TUTOR VARCHAR(10),
    IN p_DOMICILIO_TUTOR VARCHAR(30),
    IN p_MOTIVO VARCHAR(300)
)
BEGIN
    INSERT INTO TUTOR (
        ID_NACIONALIDAD,
        ID_GENERO,
        ID_PARENTESCO,
        NOMBRE_TUTOR,
        APELLIDO_TUTOR,
        CI_TUTOR,
        DIRECCION_TUTOR,
        TELEFONO_TUTOR,
        DOMICILIO_TUTOR,
        MOTIVO
    ) VALUES (
        p_ID_NACIONALIDAD,
        p_ID_GENERO,
        p_ID_PARENTESCO,
        UPPER(p_NOMBRE_TUTOR),
        UPPER(p_APELLIDO_TUTOR),
        UPPER(p_CI_TUTOR),
        UPPER(p_DIRECCION_TUTOR),
        p_TELEFONO_TUTOR,
        UPPER(p_DOMICILIO_TUTOR),
        p_MOTIVO
    );
END //

/* Procedimiento para seleccionar de TUTOR */
CREATE PROCEDURE SeleccionarTutor(
    IN p_ID_TUTOR INT
)
BEGIN
    SET @selected_id = p_ID_TUTOR;
    
    SELECT * 
    FROM TUTOR 
    WHERE ID_TUTOR = @selected_id;
END //

/* Procedimiento para actualizar en TUTOR */
CREATE PROCEDURE ActualizarTutor(
    IN p_ID_TUTOR INT,
    IN p_ID_NACIONALIDAD INT,
    IN p_ID_GENERO INT,
    IN p_ID_PARENTESCO INT,
    IN p_NOMBRE_TUTOR VARCHAR(30),
    IN p_APELLIDO_TUTOR VARCHAR(30),
    IN p_CI_TUTOR VARCHAR(10),
    IN p_DIRECCION_TUTOR VARCHAR(30),
    IN p_TELEFONO_TUTOR VARCHAR(10),
    IN p_DOMICILIO_TUTOR VARCHAR(30),
    IN p_MOTIVO VARCHAR(300)
)
BEGIN
    UPDATE TUTOR
    SET 
        ID_NACIONALIDAD = p_ID_NACIONALIDAD,
        ID_GENERO = p_ID_GENERO,
        ID_PARENTESCO = p_ID_PARENTESCO,
        NOMBRE_TUTOR = UPPER(p_NOMBRE_TUTOR),
        APELLIDO_TUTOR = UPPER(p_APELLIDO_TUTOR),
        CI_TUTOR = UPPER(p_CI_TUTOR),
        DIRECCION_TUTOR = UPPER(p_DIRECCION_TUTOR),
        TELEFONO_TUTOR = p_TELEFONO_TUTOR,
        DOMICILIO_TUTOR = UPPER(p_DOMICILIO_TUTOR),
        MOTIVO = p_MOTIVO
    WHERE ID_TUTOR = p_ID_TUTOR;
END //

/* Procedimiento para eliminar de TUTOR */
CREATE PROCEDURE EliminarTutor(
    IN p_ID_TUTOR INT
)
BEGIN
    DELETE FROM TUTOR 
    WHERE ID_TUTOR = p_ID_TUTOR;
END //

DELIMITER ;




/*==============================================================*/
/* Table: TUTORES_NINIOS_RELATION                               */
/*==============================================================*/
DELIMITER //

/* Procedimiento para insertar en TUTORES_NINIOS_RELATION */
CREATE PROCEDURE InsertarTutorNinioRelacion(
    IN p_ID_NINIO INT,
    IN p_ID_TUTOR INT
)
BEGIN
    INSERT INTO TUTORES_NINIOS_RELATION (ID_NINIO, ID_TUTOR)
    VALUES (p_ID_NINIO, p_ID_TUTOR);
END //

/* Procedimiento para seleccionar de TUTORES_NINIOS_RELATION */
CREATE PROCEDURE SeleccionarTutorNinioRelacion(
    IN p_ID_NINIO INT,
    IN p_ID_TUTOR INT
)
BEGIN
    SELECT *
    FROM TUTORES_NINIOS_RELATION
    WHERE ID_NINIO = p_ID_NINIO AND ID_TUTOR = p_ID_TUTOR;
END //

/* Procedimiento para eliminar de TUTORES_NINIOS_RELATION */
CREATE PROCEDURE EliminarTutorNinioRelacion(
    IN p_ID_NINIO INT,
    IN p_ID_TUTOR INT
)
BEGIN
    DELETE FROM TUTORES_NINIOS_RELATION
    WHERE ID_NINIO = p_ID_NINIO AND ID_TUTOR = p_ID_TUTOR;
END //

DELIMITER ;
