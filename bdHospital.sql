create table gerente(
idGerente int primary key,
descGerente varchar(150),
fechaRegistro timestamp
);

create table condicion(
idCondicion int primary key,
descCondicion varchar(150),
fechaRegistro timestamp
);

create table sede(
idSede int primary key,
descSede varchar(150),
fechaRegistro timestamp
);

create table provincia(
idProvincia int primary key,
descProvincia varchar(150),
fechaRegistro timestamp
);

create table distrito(
idDistrito int primary key,
idProvincia int,
descDistrito varchar(150),
fechaRegistro timestamp,
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
fechaRegistro timestamp,
constraint fk_hospital_distrito foreign key(idDistrito) references distrito(idDistrito),
constraint fk_hospital_sede foreign key(idSede) references sede(idSede),
constraint fk_hospital_gerente foreign key(idGerente) references gerente(idGerente),
constraint fk_hospital_condicion foreign key(idCondicion) references condicion(idCondicion)
);