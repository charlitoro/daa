-- COLOMBIADB
--
-- script base de datos COLOMBIADB
/*
drop table posiciones;
drop table partidos;
drop table jugadores;
drop table equipos;
*/
--
-- tabla equipos
create table equipos(
codequipo char(2) not null primary key,
nomequipo varchar(20) not null unique);
-- tabla partidos
create table partidos(
codlocal char(2) not null references equipos(codequipo),
codvisitante char(2) not null references equipos(codequipo),
gollocal numeric(2,0) default 0 check(gollocal>=0),
golvisitante numeric(2,0) default 0 check(golvisitante>=0),
fecha date not null,
primary key(codlocal,codvisitante,fecha));
-- tabla posiciones
create table posiciones(
equipo varchar(20) not null primary key references equipos(nomequipo),
pj numeric(2,0) default 0,
pg numeric(2,0) default 0,
pe numeric(2,0) default 0,
pp numeric(2,0) default 0,
gf numeric(2,0) default 0,
gc numeric(2,0) default 0,
gd numeric(2,0) default 0,
gp numeric(3,2) default 0,
puntos numeric(2,0) default 0);

-- creacion de indices
create index idx_codlocal on partidos(codlocal);
create index idx_codvisita on partidos(codvisitante);
--create index idx_equipo_jug on jugadores(equipo);
----
--- insertar equipos
insert into equipos values ('10','Deportivo Pasto');
insert into equipos values ('20','Deportivo Cali');
insert into equipos values ('30','Nacional');
insert into equipos values ('40','Millonarios');
insert into equipos values ('50','Junior');
-- insertar partidos
Insert into partidos (CODLOCAL,CODVISITANTE,GOLLOCAL,GOLVISITANTE,FECHA) values ('10','20','2','0','10/09/2019');
Insert into partidos (CODLOCAL,CODVISITANTE,GOLLOCAL,GOLVISITANTE,FECHA) values ('10','30','1','1','11/09/2019');
Insert into partidos (CODLOCAL,CODVISITANTE,GOLLOCAL,GOLVISITANTE,FECHA) values ('10','40','2','1','12/09/2019');
Insert into partidos (CODLOCAL,CODVISITANTE,GOLLOCAL,GOLVISITANTE,FECHA) values ('10','50','1','0','13/09/2019');
Insert into partidos (CODLOCAL,CODVISITANTE,GOLLOCAL,GOLVISITANTE,FECHA) values ('20','10','2','2','14/09/2019');
Insert into partidos (CODLOCAL,CODVISITANTE,GOLLOCAL,GOLVISITANTE,FECHA) values ('20','30','2','1','15/09/2019');
Insert into partidos (CODLOCAL,CODVISITANTE,GOLLOCAL,GOLVISITANTE,FECHA) values ('20','40','2','2','16/09/2019');
Insert into partidos (CODLOCAL,CODVISITANTE,GOLLOCAL,GOLVISITANTE,FECHA) values ('20','50','3','2','17/09/2019');
Insert into partidos (CODLOCAL,CODVISITANTE,GOLLOCAL,GOLVISITANTE,FECHA) values ('30','10','3','2','18/09/2019');
Insert into partidos (CODLOCAL,CODVISITANTE,GOLLOCAL,GOLVISITANTE,FECHA) values ('30','20','0','2','19/09/2019');
Insert into partidos (CODLOCAL,CODVISITANTE,GOLLOCAL,GOLVISITANTE,FECHA) values ('30','40','3','3','20/09/2019');
Insert into partidos (CODLOCAL,CODVISITANTE,GOLLOCAL,GOLVISITANTE,FECHA) values ('30','50','2','2','21/09/2019');
Insert into partidos (CODLOCAL,CODVISITANTE,GOLLOCAL,GOLVISITANTE,FECHA) values ('40','10','0','0','22/09/2019');
Insert into partidos (CODLOCAL,CODVISITANTE,GOLLOCAL,GOLVISITANTE,FECHA) values ('40','20','1','1','23/09/2019');
Insert into partidos (CODLOCAL,CODVISITANTE,GOLLOCAL,GOLVISITANTE,FECHA) values ('40','30','2','2','24/09/2019');
Insert into partidos (CODLOCAL,CODVISITANTE,GOLLOCAL,GOLVISITANTE,FECHA) values ('40','50','1','2','25/09/2019');
Insert into partidos (CODLOCAL,CODVISITANTE,GOLLOCAL,GOLVISITANTE,FECHA) values ('50','10','1','0','26/09/2019');
Insert into partidos (CODLOCAL,CODVISITANTE,GOLLOCAL,GOLVISITANTE,FECHA) values ('50','20','1','1','27/09/2019');
Insert into partidos (CODLOCAL,CODVISITANTE,GOLLOCAL,GOLVISITANTE,FECHA) values ('50','30','1','0','28/09/2019');
Insert into partidos (CODLOCAL,CODVISITANTE,GOLLOCAL,GOLVISITANTE,FECHA) values ('50','40','1','0','29/09/2019');
--
/* CUESTIONARIO
1. Insertar en la tabla posiciones el nombre de cada equipo
2. Actualizar para cada equipo los PJ,PG,PP,PE,GF,GC,GD,GP,PUNTOS
