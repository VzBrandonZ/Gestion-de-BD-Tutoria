/*==============================================================*/
/* Table: ACTIVIDAD                                             */
/*==============================================================*/
CREATE TABLE ACTIVIDAD (
      ID_ACTIVIDAD          INT NOT NULL AUTO_INCREMENT,
      ID_PROGRAMA           INT NOT NULL,
      NOMBRE_ACTIVIDAD      VARCHAR(60) NOT NULL,
      DESCRIPCION_ACTIVIDAD VARCHAR(300) NOT NULL,
      DURACION_ACTIVIDAD    INT NOT NULL,
      FINALIZADO            TINYINT(1) NOT NULL DEFAULT 0,
      PRIMARY KEY (ID_ACTIVIDAD)
);
/*==============================================================*/
/* Table: ALERGIAS                                              */
/*==============================================================*/
CREATE TABLE ALERGIAS (
      ID_ALERGIA           INT NOT NULL AUTO_INCREMENT COMMENT '',
      NOMBRE_ALERGIA       VARCHAR(30) NOT NULL COMMENT '',
      PRIMARY KEY (ID_ALERGIA)
);

/*==============================================================*/
/* Table: ANO_LECTIVO                                           */
/*==============================================================*/
CREATE TABLE ANO_LECTIVO (
      ID_ANO_LECTIVO       INT NOT NULL AUTO_INCREMENT COMMENT '',
      ANO                  VARCHAR(4) NOT NULL COMMENT '',
      PRIMARY KEY (ID_ANO_LECTIVO)
);
/*==============================================================*/
/* Table: EMPLEA                                                */
/*==============================================================*/
CREATE TABLE EMPLEA (
      ID_MATERIAL          INT NOT NULL COMMENT '',
      ID_ACTIVIDAD         INT NOT NULL COMMENT '',
      PRIMARY KEY (ID_MATERIAL, ID_ACTIVIDAD)
);


/*==============================================================*/
/* Table: ESTADO_SALUD                                          */
/*==============================================================*/
CREATE TABLE ESTADO_SALUD (
      ID_SALUD_STAT        INT NOT NULL AUTO_INCREMENT COMMENT '',
      ID_NINIO             INT NOT NULL COMMENT '',
      ULTIMA_FECHA_ENFERMO DATETIME NOT NULL COMMENT '',
      DIAGNOSTICO          VARCHAR(300) DEFAULT NULL COMMENT '',
      DOCTOR_TRATANTE      VARCHAR(60) DEFAULT NULL COMMENT '',
      PRIMARY KEY (ID_SALUD_STAT)
);


/*==============================================================*/
/* Table: GENERO                                                */
/*==============================================================*/
CREATE TABLE GENERO (
      ID_GENERO            INT NOT NULL AUTO_INCREMENT COMMENT '',
      NOMBRE_GENERO        VARCHAR(30) NOT NULL COMMENT '',
      PRIMARY KEY (ID_GENERO)
);


/*==============================================================*/
/* Table: MATERIAL                                              */
/*==============================================================*/
CREATE TABLE MATERIAL (
      ID_MATERIAL          INT NOT NULL AUTO_INCREMENT COMMENT '',
      NOMBRE_MATERIAL      VARCHAR(30) COMMENT '',
      PRIMARY KEY (ID_MATERIAL)
);

/*==============================================================*/
/* Table: MATRICULA                                             */
/*==============================================================*/
CREATE TABLE MATRICULA (
      ID_MATRICULA         INT NOT NULL AUTO_INCREMENT COMMENT '',
      ID_NINIO             INT NOT NULL COMMENT '',
      ID_ANO_LECTIVO       INT NOT NULL COMMENT '',
      PRECIO_MATRICULA     INT NOT NULL COMMENT '',
      PRIMARY KEY (ID_MATRICULA)
);


/*==============================================================*/
/* Table: MEDICAMENTO                                           */
/*==============================================================*/
CREATE TABLE MEDICAMENTO (
      ID_MEDICAMENTO            INT NOT NULL AUTO_INCREMENT COMMENT '',
      NOMBRE_MEDICAMENTO        VARCHAR(30) NOT NULL COMMENT '',
      DESCRIPCION_MEDICAMENTO   VARCHAR(300) NOT NULL COMMENT '',
      PRIMARY KEY (ID_MEDICAMENTO)
);


/*==============================================================*/
/* Table: NACIONALIDAD                                          */
/*==============================================================*/
CREATE TABLE NACIONALIDAD (
      ID_NACIONALIDAD      INT NOT NULL AUTO_INCREMENT COMMENT '',
      NOMBRE_NACIONALIDAD  VARCHAR(30) NOT NULL COMMENT '',
      PRIMARY KEY (ID_NACIONALIDAD)
);

/*==============================================================*/
/* Table: NINIO                                                 */
/*==============================================================*/
CREATE TABLE NINIO (
      ID_NINIO             INT NOT NULL AUTO_INCREMENT COMMENT '',
      ID_NACIONALIDAD      INT NOT NULL COMMENT '',
      ID_GENERO            INT NOT NULL COMMENT '',
      ID_TALLA_ZAPATO      INT NOT NULL COMMENT '',
      ID_TALLA_VESTIMENTA  INT NOT NULL COMMENT '',
      CI_NINIO             VARCHAR(10) NOT NULL COMMENT '',
      NOMBRE_NINIO         VARCHAR(30) NOT NULL COMMENT '',
      APELLIDO_NINIO       VARCHAR(30) NOT NULL COMMENT '',
      NACIMIENTO_DATE      DATETIME NOT NULL COMMENT '',
      ESTADO_MATRICULA     BOOLEAN NOT NULL COMMENT '',
      PRIMARY KEY (ID_NINIO)
);


/*==============================================================*/
/* Table: PADRE                                                 */
/*==============================================================*/
CREATE TABLE PADRE (
      ID_PADRE             INT NOT NULL AUTO_INCREMENT COMMENT '',
      ID_GENERO            INT NOT NULL COMMENT '',
      ID_NACIONALIDAD      INT NOT NULL COMMENT '',
      NOMBRE_PADRE         VARCHAR(30) NOT NULL COMMENT '',
      APELLIDO_PADRE       VARCHAR(30) NOT NULL COMMENT '',
      CI_PADRE             VARCHAR(10) NOT NULL COMMENT '',
      DIRECCION_PADRE      VARCHAR(30) NOT NULL COMMENT '',
      TELEFONO_PADRE       VARCHAR(10) NOT NULL COMMENT '',
      DOMICILIO_PADRE      VARCHAR(30) NOT NULL COMMENT '',
      PRIMARY KEY (ID_PADRE)
);


/*==============================================================*/
/* Table: PROFESIONAL                                           */
/*==============================================================*/
CREATE TABLE PROFESIONAL (
      ID_PROF              INT NOT NULL AUTO_INCREMENT COMMENT '',
      ID_ACTIVIDAD         INT NOT NULL COMMENT '',
      ID_GENERO            INT NOT NULL COMMENT '',
      ID_NACIONALIDAD      INT NOT NULL COMMENT '',
      NOMBRES_PROF         VARCHAR(30) NOT NULL COMMENT '',
      APELLIDOS_PROF       VARCHAR(30) NOT NULL COMMENT '',
      CI_PROF              VARCHAR(10) NOT NULL COMMENT '',
      DIRECCION_PROF       VARCHAR(60) NOT NULL COMMENT '',
      TELEFONO_PROF        VARCHAR(10) NOT NULL COMMENT '',
      NO_CERTIFI_SENECYT   CHAR(15) NOT NULL COMMENT '',
      PRIMARY KEY (ID_PROF)
);

/*==============================================================*/
/* Table: PROGRAMA                                              */
/*==============================================================*/
CREATE TABLE PROGRAMA (
      ID_PROGRAMA          INT NOT NULL AUTO_INCREMENT COMMENT '',
      ID_ANO_LECTIVO       INT NOT NULL COMMENT '',
      NOMBRE_PROGRAMA      VARCHAR(60) NOT NULL COMMENT '',
      PRIMARY KEY (ID_PROGRAMA)
);

/*==============================================================*/
/* Table: RELACION                                              */
/*==============================================================*/
CREATE TABLE RELACION (
      ID_PARENTESCO        INT NOT NULL AUTO_INCREMENT COMMENT '',
      NOMBRE_PARENTESCO    VARCHAR(30) NOT NULL COMMENT '',
      PRIMARY KEY (ID_PARENTESCO)
);


/*==============================================================*/
/* Table: RELACION_PADRE_NINIO                                  */
/*==============================================================*/
CREATE TABLE RELACION_PADRE_NINIO (
      ID_PADRE             INT NOT NULL COMMENT '',
      ID_NINIO             INT NOT NULL COMMENT '',
      PRIMARY KEY (ID_PADRE, ID_NINIO)
);

/*==============================================================*/
/* Table: RENDIMIENTO                                           */
/*==============================================================*/
CREATE TABLE RENDIMIENTO (
      ID_RENDIMIENTO       INT NOT NULL AUTO_INCREMENT COMMENT '',
      ID_ACTIVIDAD         INT NOT NULL COMMENT '',
      ID_TIPO_RENDIMIENT   INT NOT NULL COMMENT '',
      ID_NINIO             INT NOT NULL COMMENT '',
      OBSERVACIONES        VARCHAR(300) NOT NULL COMMENT '',
      PRIMARY KEY (ID_RENDIMIENTO)
);

/*==============================================================*/
/* Table: SALUD_ALERGIAS_RELATION                               */
/*==============================================================*/
CREATE TABLE SALUD_ALERGIAS_RELATION (
      ID_ALERGIA           INT NOT NULL COMMENT '',
      ID_SALUD_STAT        INT NOT NULL COMMENT '',
      PRIMARY KEY (ID_ALERGIA, ID_SALUD_STAT)
);


/*==============================================================*/
/* Table: SALUD_MEDICAMENT_RELATION                             */
/*==============================================================*/
CREATE TABLE SALUD_MEDICAMENT_RELATION (
      ID_MEDICAMENTO       INT NOT NULL COMMENT '',
      ID_SALUD_STAT        INT NOT NULL COMMENT '',
      PRIMARY KEY (ID_MEDICAMENTO, ID_SALUD_STAT)
);


/*==============================================================*/
/* Table: TALLA_VESTIMENTA                                      */
/*==============================================================*/
CREATE TABLE TALLA_VESTIMENTA (
      ID_TALLA_VESTIMENTA  INT NOT NULL AUTO_INCREMENT COMMENT '',
      NUMERO_TALLA         DECIMAL(4,0) NOT NULL COMMENT '',
      PRIMARY KEY (ID_TALLA_VESTIMENTA)
);

/*==============================================================*/
/* Table: TALLA_ZAPATO                                          */
/*==============================================================*/
CREATE TABLE TALLA_ZAPATO (
      ID_TALLA_ZAPATO      INT NOT NULL AUTO_INCREMENT COMMENT '',
      NUMERO_TALLA         DECIMAL(4,0) NOT NULL COMMENT '',
      PRIMARY KEY (ID_TALLA_ZAPATO)
);

/*==============================================================*/
/* Table: TIPO_RENDIMIENTO                                      */
/*==============================================================*/
CREATE TABLE TIPO_RENDIMIENTO (
      ID_TIPO_RENDIMIENT   INT NOT NULL AUTO_INCREMENT COMMENT '',
      NOMBRE_RENDIMIENT    VARCHAR(20) NOT NULL COMMENT '',
      PRIMARY KEY (ID_TIPO_RENDIMIENT)
);


/*==============================================================*/
/* Table: TUTOR                                                 */
/*==============================================================*/
CREATE TABLE TUTOR (
      ID_TUTOR             INT NOT NULL AUTO_INCREMENT  COMMENT '',
      ID_NACIONALIDAD      INT NOT NULL  COMMENT '',
      ID_GENERO            INT NOT NULL  COMMENT '',
      ID_PARENTESCO        INT NOT NULL  COMMENT '',
      NOMBRE_TUTOR         VARCHAR(30) NOT NULL  COMMENT '',
      APELLIDO_TUTOR       VARCHAR(30) NOT NULL  COMMENT '',
      CI_TUTOR             VARCHAR(10) NOT NULL  COMMENT '',
      DIRECCION_TUTOR      VARCHAR(30) NOT NULL  COMMENT '',
      TELEFONO_TUTOR       VARCHAR(10) NOT NULL  COMMENT '',
      DOMICILIO_TUTOR      VARCHAR(30) NOT NULL  COMMENT '',
      MOTIVO               VARCHAR(300)  COMMENT '',
      PRIMARY KEY (ID_TUTOR)
);

/*==============================================================*/
/* Table: TUTORES_NINIOS_RELATION                               */
/*==============================================================*/
CREATE TABLE TUTORES_NINIOS_RELATION (
      ID_NINIO             INT NOT NULL  COMMENT '',
      ID_TUTOR             INT NOT NULL  COMMENT '',
      PRIMARY KEY (ID_NINIO, ID_TUTOR)
);


alter table ACTIVIDAD add constraint FK_ACTIVIDA_PERTENECE_PROGRAMA foreign key (ID_PROGRAMA)
      references PROGRAMA (ID_PROGRAMA) on delete restrict on update restrict;

alter table EMPLEA add constraint FK_EMPLEA_EMPLEA2_ACTIVIDA foreign key (ID_ACTIVIDAD)
      references ACTIVIDAD (ID_ACTIVIDAD) on delete restrict on update restrict;

alter table EMPLEA add constraint FK_EMPLEA_EMPLEA_MATERIAL foreign key (ID_MATERIAL)
      references MATERIAL (ID_MATERIAL) on delete restrict on update restrict;

alter table ESTADO_SALUD add constraint FK_ESTADO_S_POSEE_NINIO foreign key (ID_NINIO)
      references NINIO (ID_NINIO) on delete restrict on update restrict;

alter table MATRICULA add constraint FK_MATRICUL_RELATIONS_ANO_LECT foreign key (ID_ANO_LECTIVO)
      references ANO_LECTIVO (ID_ANO_LECTIVO) on delete restrict on update restrict;

alter table MATRICULA add constraint FK_MATRICUL_RELATIONS_NINIO foreign key (ID_NINIO)
      references NINIO (ID_NINIO) on delete restrict on update restrict;

alter table NINIO add constraint FK_NINIO_POSEE_UN__GENERO foreign key (ID_GENERO)
      references GENERO (ID_GENERO) on delete restrict on update restrict;

alter table NINIO add constraint FK_NINIO_PRESENTAN_TALLA_ZA foreign key (ID_TALLA_ZAPATO)
      references TALLA_ZAPATO (ID_TALLA_ZAPATO) on delete restrict on update restrict;

alter table NINIO add constraint FK_NINIO_PRESENTA__TALLA_VE foreign key (ID_TALLA_VESTIMENTA)
      references TALLA_VESTIMENTA (ID_TALLA_VESTIMENTA) on delete restrict on update restrict;

alter table NINIO add constraint FK_NINIO_TIENEN_NA_NACIONAL foreign key (ID_NACIONALIDAD)
      references NACIONALIDAD (ID_NACIONALIDAD) on delete restrict on update restrict;

alter table PADRE add constraint FK_PADRE_POSEE_UNA_NACIONAL foreign key (ID_NACIONALIDAD)
      references NACIONALIDAD (ID_NACIONALIDAD) on delete restrict on update restrict;

alter table PADRE add constraint FK_PADRE_POSEE_UN__GENERO foreign key (ID_GENERO)
      references GENERO (ID_GENERO) on delete restrict on update restrict;

alter table PROFESIONAL add constraint FK_PROFESIO_POSEE_UN__GENERO foreign key (ID_GENERO)
      references GENERO (ID_GENERO) on delete restrict on update restrict;

alter table PROFESIONAL add constraint FK_PROFESIO_PROPONE_ACTIVIDA foreign key (ID_ACTIVIDAD)
      references ACTIVIDAD (ID_ACTIVIDAD) on delete restrict on update restrict;

alter table PROFESIONAL add constraint FK_PROFESIO_TIENE_MAC_NACIONAL foreign key (ID_NACIONALIDAD)
      references NACIONALIDAD (ID_NACIONALIDAD) on delete restrict on update restrict;

alter table PROGRAMA add constraint FK_PROGRAMA_RELATIONS_ANO_LECT foreign key (ID_ANO_LECTIVO)
      references ANO_LECTIVO (ID_ANO_LECTIVO) on delete restrict on update restrict;

alter table RELACION_PADRE_NINIO add constraint FK_RELATION_RELATIONS_NINIO foreign key (ID_NINIO)
      references NINIO (ID_NINIO) on delete restrict on update restrict;

alter table RELACION_PADRE_NINIO add constraint FK_RELATION_RELATIONS_PADRE foreign key (ID_PADRE)
      references PADRE (ID_PADRE) on delete restrict on update restrict;

alter table RENDIMIENTO add constraint FK_RENDIMIE_RELATIONS_ACTIVIDA foreign key (ID_ACTIVIDAD)
      references ACTIVIDAD (ID_ACTIVIDAD) on delete restrict on update restrict;

alter table RENDIMIENTO add constraint FK_RENDIMIE_RELATIONS_NINIO foreign key (ID_NINIO)
      references NINIO (ID_NINIO) on delete restrict on update restrict;

alter table RENDIMIENTO add constraint FK_RENDIMIE_RELATIONS_TIPO_REN foreign key (ID_TIPO_RENDIMIENT)
      references TIPO_RENDIMIENTO (ID_TIPO_RENDIMIENT) on delete restrict on update restrict;

alter table SALUD_ALERGIAS_RELATION add constraint FK_SALUD_AL_SALUD_ALE_ALERGIAS foreign key (ID_ALERGIA)
      references ALERGIAS (ID_ALERGIA) on delete restrict on update restrict;

alter table SALUD_ALERGIAS_RELATION add constraint FK_SALUD_AL_SALUD_ALE_ESTADO_S foreign key (ID_SALUD_STAT)
      references ESTADO_SALUD (ID_SALUD_STAT) on delete restrict on update restrict;

alter table SALUD_MEDICAMENT_RELATION add constraint FK_SALUD_ME_SALUD_MED_ESTADO_S foreign key (ID_SALUD_STAT)
      references ESTADO_SALUD (ID_SALUD_STAT) on delete restrict on update restrict;

alter table SALUD_MEDICAMENT_RELATION add constraint FK_SALUD_ME_SALUD_MED_MEDICAME foreign key (ID_MEDICAMENTO)
      references MEDICAMENTO (ID_MEDICAMENTO) on delete restrict on update restrict;

alter table TUTOR add constraint FK_TUTOR_MANTIENE__RELACION foreign key (ID_PARENTESCO)
      references RELACION (ID_PARENTESCO) on delete restrict on update restrict;

alter table TUTOR add constraint FK_TUTOR_POSEE_UN__GENERO foreign key (ID_GENERO)
      references GENERO (ID_GENERO) on delete restrict on update restrict;

alter table TUTOR add constraint FK_TUTOR_TIENEN_NA_NACIONAL foreign key (ID_NACIONALIDAD)
      references NACIONALIDAD (ID_NACIONALIDAD) on delete restrict on update restrict;

alter table TUTORES_NINIOS_RELATION add constraint FK_TUTORES__TUTORES_N_NINIO foreign key (ID_NINIO)
      references NINIO (ID_NINIO) on delete restrict on update restrict;

alter table TUTORES_NINIOS_RELATION add constraint FK_TUTORES__TUTORES_N_TUTOR foreign key (ID_TUTOR)
      references TUTOR (ID_TUTOR) on delete restrict on update restrict;

