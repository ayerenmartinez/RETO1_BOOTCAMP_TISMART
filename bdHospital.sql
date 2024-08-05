create table gerente(
idGerente int primary key,
descGerente varchar(150),
fechaRegistro timestamp default systimestamp
);

-- Insertar registros reales en GERENTE
INSERT INTO GERENTE (IDGERENTE, DESCGERENTE) VALUES (1, 'Juan Perez');
INSERT INTO GERENTE (IDGERENTE, DESCGERENTE) VALUES (2, 'Maria Rodriguez');
INSERT INTO GERENTE (IDGERENTE, DESCGERENTE) VALUES (3, 'Carlos Sanchez');
INSERT INTO GERENTE (IDGERENTE, DESCGERENTE) VALUES (4, 'Ana Martinez');
INSERT INTO GERENTE (IDGERENTE, DESCGERENTE) VALUES (5, 'Luis Garcia');
INSERT INTO GERENTE (IDGERENTE, DESCGERENTE) VALUES (6, 'Elena Fernandez');
INSERT INTO GERENTE (IDGERENTE, DESCGERENTE) VALUES (7, 'Jose Lopez');
INSERT INTO GERENTE (IDGERENTE, DESCGERENTE) VALUES (8, 'Laura Gomez');
INSERT INTO GERENTE (IDGERENTE, DESCGERENTE) VALUES (9, 'Pablo Diaz');
INSERT INTO GERENTE (IDGERENTE, DESCGERENTE) VALUES (10, 'Clara Ruiz');

create table condicion(
idCondicion int primary key,
descCondicion varchar(150),
fechaRegistro timestamp default systimestamp
);

-- Insertar registros reales en CONDICION
INSERT INTO CONDICION (IDCONDICION, DESCCONDICION) VALUES (1, 'Activo');
INSERT INTO CONDICION (IDCONDICION, DESCCONDICION) VALUES (2, 'Inactivo');
INSERT INTO CONDICION (IDCONDICION, DESCCONDICION) VALUES (3, 'Suspendido');
INSERT INTO CONDICION (IDCONDICION, DESCCONDICION) VALUES (4, 'Retirado');
INSERT INTO CONDICION (IDCONDICION, DESCCONDICION) VALUES (5, 'Vacaciones');
INSERT INTO CONDICION (IDCONDICION, DESCCONDICION) VALUES (6, 'Permiso Especial');
INSERT INTO CONDICION (IDCONDICION, DESCCONDICION) VALUES (7, 'Baja Médica');
INSERT INTO CONDICION (IDCONDICION, DESCCONDICION) VALUES (8, 'Licencia Sin Goce');
INSERT INTO CONDICION (IDCONDICION, DESCCONDICION) VALUES (9, 'Licencia Con Goce');
INSERT INTO CONDICION (IDCONDICION, DESCCONDICION) VALUES (10, 'Despedido');


create table sede(
idSede int primary key,
descSede varchar(150),
fechaRegistro timestamp default systimestamp
);

-- Insertar registros reales en SEDE
INSERT INTO SEDE (IDSEDE, DESCSEDE) VALUES (1, 'Sede Central');
INSERT INTO SEDE (IDSEDE, DESCSEDE) VALUES (2, 'Sede Norte');
INSERT INTO SEDE (IDSEDE, DESCSEDE) VALUES (3, 'Sede Sur');
INSERT INTO SEDE (IDSEDE, DESCSEDE) VALUES (4, 'Sede Este');
INSERT INTO SEDE (IDSEDE, DESCSEDE) VALUES (5, 'Sede Oeste');
INSERT INTO SEDE (IDSEDE, DESCSEDE) VALUES (6, 'Sede Centro');
INSERT INTO SEDE (IDSEDE, DESCSEDE) VALUES (7, 'Sede Internacional');
INSERT INTO SEDE (IDSEDE, DESCSEDE) VALUES (8, 'Sede Nacional');
INSERT INTO SEDE (IDSEDE, DESCSEDE) VALUES (9, 'Sede Regional');
INSERT INTO SEDE (IDSEDE, DESCSEDE) VALUES (10, 'Sede Local');

create table provincia(
idProvincia int primary key,
descProvincia varchar(150),
fechaRegistro timestamp default systimestamp
);

-- Insertar registros reales en PROVINCIA
INSERT INTO PROVINCIA (IDPROVINCIA, DESCPROVINCIA) VALUES (1, 'Lima');
INSERT INTO PROVINCIA (IDPROVINCIA, DESCPROVINCIA) VALUES (2, 'Cusco');
INSERT INTO PROVINCIA (IDPROVINCIA, DESCPROVINCIA) VALUES (3, 'Arequipa');
INSERT INTO PROVINCIA (IDPROVINCIA, DESCPROVINCIA) VALUES (4, 'La Libertad');
INSERT INTO PROVINCIA (IDPROVINCIA, DESCPROVINCIA) VALUES (5, 'Piura');
INSERT INTO PROVINCIA (IDPROVINCIA, DESCPROVINCIA) VALUES (6, 'Lambayeque');
INSERT INTO PROVINCIA (IDPROVINCIA, DESCPROVINCIA) VALUES (7, 'Ancash');
INSERT INTO PROVINCIA (IDPROVINCIA, DESCPROVINCIA) VALUES (8, 'Junin');
INSERT INTO PROVINCIA (IDPROVINCIA, DESCPROVINCIA) VALUES (9, 'Ica');
INSERT INTO PROVINCIA (IDPROVINCIA, DESCPROVINCIA) VALUES (10, 'Puno');

create table distrito(
idDistrito int primary key,
idProvincia int,
descDistrito varchar(150),
fechaRegistro timestamp default systimestamp,
constraint fk_distrito_provincia foreign key(idProvincia) references provincia(idProvincia)
);

-- Insertar registros reales en DISTRITO
INSERT INTO DISTRITO (IDDISTRITO, IDPROVINCIA, DESCDISTRITO) VALUES (1, 1, 'Miraflores');
INSERT INTO DISTRITO (IDDISTRITO, IDPROVINCIA, DESCDISTRITO) VALUES (2, 1, 'San Isidro');
INSERT INTO DISTRITO (IDDISTRITO, IDPROVINCIA, DESCDISTRITO) VALUES (3, 2, 'San Sebastian');
INSERT INTO DISTRITO (IDDISTRITO, IDPROVINCIA, DESCDISTRITO) VALUES (4, 2, 'Wanchaq');
INSERT INTO DISTRITO (IDDISTRITO, IDPROVINCIA, DESCDISTRITO) VALUES (5, 3, 'Cayma');
INSERT INTO DISTRITO (IDDISTRITO, IDPROVINCIA, DESCDISTRITO) VALUES (6, 3, 'Miraflores (Arequipa)');
INSERT INTO DISTRITO (IDDISTRITO, IDPROVINCIA, DESCDISTRITO) VALUES (7, 4, 'Trujillo');
INSERT INTO DISTRITO (IDDISTRITO, IDPROVINCIA, DESCDISTRITO) VALUES (8, 4, 'Florencia de Mora');
INSERT INTO DISTRITO (IDDISTRITO, IDPROVINCIA, DESCDISTRITO) VALUES (9, 5, 'Piura');
INSERT INTO DISTRITO (IDDISTRITO, IDPROVINCIA, DESCDISTRITO) VALUES (10, 5, 'Sullana');

create table hospital(
idHospital int primary key,
idDistrito int,
nombre varchar(150),
antiguedad int,
area decimal(5,2),
idSede int,
idGerente int,
idCondicion int,
fechaRegistro timestamp default systimestamp,
constraint fk_hospital_distrito foreign key(idDistrito) references distrito(idDistrito),
constraint fk_hospital_sede foreign key(idSede) references sede(idSede),
constraint fk_hospital_gerente foreign key(idGerente) references gerente(idGerente),
constraint fk_hospital_condicion foreign key(idCondicion) references condicion(idCondicion)
);

--PROCEDIMIENTO ALMACENADO PARA REGISTRAR HOSPITAL
CREATE OR REPLACE PROCEDURE SP_HOSPITAL_REGISTRAR (
    p_idHospital  IN HOSPITAL.IDHOSPITAL%TYPE,
    p_idDistrito  IN HOSPITAL.IDDISTRITO%TYPE,
    p_nombre      IN HOSPITAL.NOMBRE%TYPE,
    p_antiguedad  IN HOSPITAL.ANTIGUEDAD%TYPE,
    p_area        IN HOSPITAL.AREA%TYPE,
    p_idSede      IN HOSPITAL.IDSEDE%TYPE,
    p_idGerente   IN HOSPITAL.IDGERENTE%TYPE,
    p_idCondicion IN HOSPITAL.IDCONDICION%TYPE
) IS
    v_exists INTEGER;
BEGIN
    -- Validar los parámetros de entrada
    IF p_idHospital IS NULL OR p_idDistrito IS NULL OR p_nombre IS NULL OR
       p_antiguedad IS NULL OR p_area IS NULL OR p_idSede IS NULL OR
       p_idGerente IS NULL OR p_idCondicion IS NULL THEN
        RAISE_APPLICATION_ERROR(-20006, 'Uno o más parámetros de entrada son NULL.');
    END IF;

    -- Verificar si el hospital ya existe
    SELECT COUNT(*) INTO v_exists
    FROM HOSPITAL
    WHERE IDHOSPITAL = p_idHospital;

    IF v_exists > 0 THEN
        -- Si el hospital ya existe, lanzar una excepción
        RAISE_APPLICATION_ERROR(-20001, 'El hospital con ID ' || p_idHospital || ' ya existe.');
    ELSE
        -- Verificar la existencia de los valores referenciados
        BEGIN
            SELECT COUNT(*) INTO v_exists
            FROM DISTRITO
            WHERE IDDISTRITO = p_idDistrito;
            IF v_exists = 0 THEN
                RAISE_APPLICATION_ERROR(-20002, 'El distrito con ID ' || p_idDistrito || ' no existe.');
            END IF;
        EXCEPTION
            WHEN OTHERS THEN
                RAISE_APPLICATION_ERROR(-20002, 'Error al verificar distrito con ID ' || p_idDistrito);
        END;

        BEGIN
            SELECT COUNT(*) INTO v_exists
            FROM SEDE
            WHERE IDSEDE = p_idSede;
            IF v_exists = 0 THEN
                RAISE_APPLICATION_ERROR(-20003, 'La sede con ID ' || p_idSede || ' no existe.');
            END IF;
        EXCEPTION
            WHEN OTHERS THEN
                RAISE_APPLICATION_ERROR(-20003, 'Error al verificar sede con ID ' || p_idSede);
        END;

        BEGIN
            SELECT COUNT(*) INTO v_exists
            FROM GERENTE
            WHERE IDGERENTE = p_idGerente;
            IF v_exists = 0 THEN
                RAISE_APPLICATION_ERROR(-20004, 'El gerente con ID ' || p_idGerente || ' no existe.');
            END IF;
        EXCEPTION
            WHEN OTHERS THEN
                RAISE_APPLICATION_ERROR(-20004, 'Error al verificar gerente con ID ' || p_idGerente);
        END;

        BEGIN
            SELECT COUNT(*) INTO v_exists
            FROM CONDICION
            WHERE IDCONDICION = p_idCondicion;
            IF v_exists = 0 THEN
                RAISE_APPLICATION_ERROR(-20005, 'La condición con ID ' || p_idCondicion || ' no existe.');
            END IF;
        EXCEPTION
            WHEN OTHERS THEN
                RAISE_APPLICATION_ERROR(-20005, 'Error al verificar condición con ID ' || p_idCondicion);
        END;

        -- Si todos los valores existen, insertar el nuevo registro
        INSERT INTO HOSPITAL (
            IDHOSPITAL, 
            IDDISTRITO, 
            NOMBRE, 
            ANTIGUEDAD, 
            AREA, 
            IDSEDE, 
            IDGERENTE, 
            IDCONDICION, 
            FECHAREGISTRO
        ) VALUES (
            p_idHospital, 
            p_idDistrito, 
            p_nombre, 
            p_antiguedad, 
            p_area, 
            p_idSede, 
            p_idGerente, 
            p_idCondicion, 
            SYSTIMESTAMP
        );

        -- Confirmar la transacción
        COMMIT;
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        -- Manejo de excepciones
        ROLLBACK;
        RAISE;
END SP_HOSPITAL_REGISTRAR;

--ACTUALIZAR HOSPITAL
CREATE OR REPLACE PROCEDURE SP_HOSPITAL_ACTUALIZAR (
    p_idHospital  IN HOSPITAL.IDHOSPITAL%TYPE,
    p_idDistrito  IN HOSPITAL.IDDISTRITO%TYPE,
    p_nombre      IN HOSPITAL.NOMBRE%TYPE,
    p_antiguedad  IN HOSPITAL.ANTIGUEDAD%TYPE,
    p_area        IN HOSPITAL.AREA%TYPE,
    p_idSede      IN HOSPITAL.IDSEDE%TYPE,
    p_idGerente   IN HOSPITAL.IDGERENTE%TYPE,
    p_idCondicion IN HOSPITAL.IDCONDICION%TYPE
) IS
    v_count INTEGER;
BEGIN
    -- Verificar si el hospital existe
    SELECT COUNT(*)
    INTO v_count
    FROM HOSPITAL
    WHERE IDHOSPITAL = p_idHospital;

    IF v_count = 0 THEN
        -- Si el hospital no existe, lanzar una excepción
        RAISE_APPLICATION_ERROR(-20001, 'El hospital con ID ' || p_idHospital || ' no existe.');
    END IF;

    -- Actualizar el registro del hospital
    UPDATE HOSPITAL
    SET IDDISTRITO = p_idDistrito,
        NOMBRE = p_nombre,
        ANTIGUEDAD = p_antiguedad,
        AREA = p_area,
        IDSEDE = p_idSede,
        IDGERENTE = p_idGerente,
        IDCONDICION = p_idCondicion
    WHERE IDHOSPITAL = p_idHospital;

    -- Confirmar la transacción
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        -- Manejo de excepciones
        ROLLBACK;
        RAISE_APPLICATION_ERROR(-20002, 'Error al actualizar el hospital: ' || SQLERRM);
END SP_HOSPITAL_ACTUALIZAR;



