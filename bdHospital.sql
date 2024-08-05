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

create table distrito(
idDistrito int primary key,
idProvincia int,
descDistrito varchar(150),
fechaRegistro timestamp default systimestamp,
constraint fk_distrito_provincia foreign key(idProvincia) references provincia(idProvincia)
);

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
