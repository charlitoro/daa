-- creacion de tablas
-- niveles
create table niveles
(
cod_niv char(2) not null prim ary key,
nom_niv varchar(20) unique,
valor_niv decimal (12,2) default 0
);

-- ninos inscritos
create table inscritos
(
cod_insc char(4) not null primary key,
nom_insc varchar(20), 
edad_insc decimal (2,0),
sexo_insc char(1) check (sexo_insc='F' or sexo_insc='M') 
);

--matriculados
create table matriculados
(
matriculado char(4) not null primary key references inscritos(cod_insc),
nivel_mat char(2) not null references niveles(cod_niv),
valor_mat decimal(12,2)
);

-- estadisticas
create table estadisticas
(
nivel varchar(20) not null primary key references niveles (nom_niv),
nfem smallint default 0,
nmas smallint default 0,
tot_matf decimal(12,2) default 0,
tot_matm decimal(12,2) default 0,
num_n smallint default 0,
tot_m decimal(12,2) default 0
);

---datos niveles
insert into niveles values('01','Parvulos',600000);
insert into niveles values('02','Prejardin',500000);
insert into niveles values('03','Jardin',400000);
insert into niveles values('04','Transicion',300000);
-- 
-- datos estadisticas
---
insert into estadisticas(nivel) values('Parvulos');
insert into estadisticas(nivel) values('Prejardin');
insert into estadisticas(nivel) values('Jardin');
insert into estadisticas(nivel) values('Transicion');
/*
-- datos inscritos
insert into inscritos values('1000','Carlos Vallejo',1,'M');
insert into inscritos values('1100','Maria Coral',2,'F');
insert into inscritos values('2000','Cesar Bucheli',3,'M');
insert into inscritos values('2100','Adriana Olaya',4,'F');
insert into inscritos values('3000','Sofia Guerrero',5,'F');
insert into inscritos values('3100','Hermes Enriquez',6,'M');
insert into inscritos values('3200','Jaime Cuesta',1,'M');
insert into inscritos values('3300','Andrea Cano',2,'F');
insert into inscritos values('4000','Armando Garcia',3,'M');
insert into inscritos values('4100','Nataly Guerrero',4,'F');
insert into inscritos values('4200','German Puentes',5,'M');
insert into inscritos values('4300','Ligia Montenegro',6,'F');
insert into inscritos values('5000','Ruben Zuleta',1,'M');
insert into inscritos values('5100','Alicia Martinez',2,'F');
insert into inscritos values('5200','Amanda Dorado',3,'F');
insert into inscritos values('6000','Ivan Llano',4,'M');
insert into inscritos values('6100','Nancy Castillo',5,'F');
insert into inscritos values('6200','Dario Mendez',6,'M');
*/

/* 
1. Crear la base de datos jardin y ejecutar el script jardin.sql
2. Crear una regla que al insertar un inscrito en la tabla inscritos:
A) Haga en la tabla MATRICULADOS 
-  Inserte el codigo del inscrito en la tabla matriculados. 
-  Actualice el codigo del nivel al cual se matricula
-  Actualice el valor de la matricula con el valor del nivel al que se matricula.

El nivel se determina asi:
Si el niño tiene 2 o menos años se matricula al nivel de parvulos.

Si el niño tiene 4 o menos años y mas de 2 se matricula al nivel de prejardin.

Si el niño tiene 5 años y mas de 4 se matricula al nivel de jardin.

Si el niño tiene 6 años y mas de 5 se matricula al nivel de transicion.

B) Haga en la tabla ESTADISTICAS
- Actualice el numero de niñas (nfem) si es el caso en el respectivo nivel que se matricula.
- Actualice el numero de niños (nmas) si es el caso en el respectivo nivel que se matricula.
- Actualice el total de matriculas de niñas (tot_matf) si es el caso en el respectivo nivel que se matricula.
- Actualice el total de matriculas de niños (tot_matm) si es el caso en el respectivo nivel que se matricula.
- Actualice el numero total de estudiantes (num_m) en el respectivo nivel que se matricula.
- Actualice el valor total de matriculas de estudiantes (tot_m)  en el respectivo nivel que se matricula.

*/




















