create table partidos
(
	codigo_par  char(2) not null primary key,
	nombre_par varchar(20)
);

create table barrios
(
	codigo_ba char(3) not null primary key,
	nombre_ba varchar(20),
	estrato_ba smallint
);

create table candidatos
(
	codigo_can char(3) not null primary key,
	nombre_can varchar(20) not null unique,
	partido char(2) not null references partidos(codigo_par)
);

create table ciudadanos(
	cedula_ciu char(4) not null primary key,
	nombre_ciu varchar(20),
	sexo_ciu char(1),
	edad_ciu smallint,
	barrio char(3) not null references barrios(codigo_ba),
   	partido char(2) not null references partidos(codigo_par)
);

create table mesas(
	codigo_mes char(2) not null primary key,
	descripcion_mes varchar(20),
	barrio char(3) not null references barrios(codigo_ba)
);

create table puestos
(
ciudadano char(4) not null references ciudadanos(cedula_ciu),
mesa char(2) references mesas(codigo_mes),
primary key(ciudadano,mesa)
);

create table votaciones
(
ciudadano char(4) not null primary key references ciudadanos(cedula_ciu),
candidato char(3) references candidatos(codigo_can)
);

create table resultados
(
candidato varchar(20) not null primary key references candidatos(nombre_can),
votos_m smallint default 0,
votos_f smallint default 0,
votos_e123 smallint default 0,
votos_e456 smallint default 0,
votos_jov smallint default 0,
votos_adu smallint default 0,
votos_may smallint default 0,
votos_par smallint default 0,
votos_otr smallint default 0,
votos_tot smallint default 0
);


-- DATOS PARTIDOS 
insert into partidos values ('LB','LIBERAL');
insert into partidos values ('CV','CONSERVADOR');
insert into partidos values ('PD','POLO DEMOCRATICO');
insert into partidos values ('PU','PARTIDO U');
insert into partidos values ('CR','CAMBIO RADICAL');
insert into partidos values ('VR','VERDE');
insert into partidos values ('PN','PIN');
insert into partidos values ('MR','MIRA');
--
-- DATOS BARRIOS
insert into barrios values('B10','LA HABANA',1);
insert into barrios values('B15','CHAPAL',1);
insert into barrios values('B20','LORENZO',2);
insert into barrios values('B30','SANTA BARBARA',2);
insert into barrios values('B40','MIRAFLORES',3);
insert into barrios values('B45','MERCEDARIO',3);
insert into barrios values('B50','SAN IGNACIO',4);
insert into barrios values('B55','LA AURORA',4);
insert into barrios values('B60','LAS ACACIAS',5);
insert into barrios values('B70','MORASURCO',5);
--
-- DATOS CANDIDATOS
insert into candidatos values('C10','RODRIGO PARDO','LB');
insert into candidatos values('C20','ANDRES PASTRANA','CV');
insert into candidatos values('C30','JAIME GARZON','PD');
insert into candidatos values('C40','JUAN SANTOS','PU');
insert into candidatos values('C50','CARLOS LLERAS','CR');
insert into candidatos values('C60','ANTANAS MOKUS','VR');
insert into candidatos values('C70','ANDRES CEPEDA','PN');
insert into candidatos values('C80','ALBERTO HENAO','MR');
--
-- DATOS CIUDADANOS
insert into ciudadanos values('1000','PABLO PEREZ','M',18,'B10','LB');
insert into ciudadanos values('1500','CARLOS LONGA PEREZ','M',20,'B15','LB');
insert into ciudadanos values('2000','MARTHA BARRETO','F',25,'B20','CV');
insert into ciudadanos values('2500','DIEGO ROSERO','M',27,'B30','CV');
insert into ciudadanos values('3000','LEONARDO JARA','M',30,'B40','PD');
insert into ciudadanos values('3500','CARLOS MENDEZ','M',33,'B45','PD');
insert into ciudadanos values('4000','JUAN FONTECHE','M',39,'B50','PU');
insert into ciudadanos values('4500','MILADY CORAL','F',40,'B55','PU');
insert into ciudadanos values('5000','MARGARITA ORBES','F',43,'B60','CR');
insert into ciudadanos values('5500','LAURA CORDOBA','F',46,'B70','CR');
insert into ciudadanos values('6000','ISABEL MARTINEZ','F',60,'B10','VR');
insert into ciudadanos values('6500','CARLOS DORADO','M',65,'B15','VR');
insert into ciudadanos values('7000','HERNAN CHAVES','M',70,'B20','PN');
insert into ciudadanos values('7500','HERMES PACHAJOA','M',20,'B30','PN');
insert into ciudadanos values('8000','SOFIA MONTENEGRO','F',22,'B40','MR');
insert into ciudadanos values('8500','ANDREA CASTILLO','F',25,'B45','MR');
insert into ciudadanos values('9000','LUIS CHUMPITAZ','M',65,'B50','LB');
insert into ciudadanos values('9500','ERNESTO LASERNA','M',68,'B55','CV');
insert into ciudadanos values('9600','AMANDA SARASTY','F',45,'B60','PD');
insert into ciudadanos values('9700','JESUS ACOSTA','M',70,'B70','PU');
--
-- DATOS MESAS
insert into mesas values('10','MESA 1','B10');
insert into mesas values('20','MESA 2','B10');
insert into mesas values('30','MESA 3','B15');
insert into mesas values('40','MESA 4','B15');
insert into mesas values('50','MESA 5','B20');
insert into mesas values('60','MESA 6','B20');
insert into mesas values('70','MESA 7','B30');
insert into mesas values('80','MESA 8','B30');
insert into mesas values('85','MESA 9','B40');
insert into mesas values('87','MESA 10','B40');
insert into mesas values('90','MESA 11','B45');
insert into mesas values('91','MESA 12','B45');
insert into mesas values('92','MESA 13','B50');
insert into mesas values('93','MESA 14','B50');
insert into mesas values('94','MESA 15','B55');
insert into mesas values('95','MESA 16','B55');
insert into mesas values('96','MESA 17','B60');
insert into mesas values('97','MESA 18','B60');
insert into mesas values('98','MESA 19','B70');
insert into mesas values('99','MESA 20','B70');
--
-- DATOS PUESTOS VOTACION
insert into puestos values ('1000','10');
insert into puestos values ('1500','20');
insert into puestos values ('2000','30');
insert into puestos values ('2500','40');
insert into puestos values ('3000','50');
insert into puestos values ('3500','60');
insert into puestos values ('4000','70');
insert into puestos values ('4500','80');
insert into puestos values ('5000','85');
insert into puestos values ('5500','87');
insert into puestos values ('6000','90');
insert into puestos values ('6500','91');
insert into puestos values ('7000','92');
insert into puestos values ('7500','93');
insert into puestos values ('8000','94');
insert into puestos values ('8500','95');
insert into puestos values ('9000','96');
insert into puestos values ('9500','97');
insert into puestos values ('9600','98');
insert into puestos values ('9700','99');
--
-- DATOS RESULTADOS
insert into resultados(candidato)  values('RODRIGO PARDO');
insert into resultados(candidato)  values('ANDRES PASTRANA');
insert into resultados(candidato)  values('JAIME GARZON');
insert into resultados(candidato)  values('JUAN SANTOS');
insert into resultados(candidato)  values('CARLOS LLERAS');
insert into resultados(candidato)  values('ANTANAS MOKUS');
insert into resultados(candidato)  values('ANDRES CEPEDA');
insert into resultados(candidato)  values('ALBERTO HENAO');

/*
--
-- DATOS VOTACION
insert into votaciones values ('1000','C10');
insert into votaciones values ('1500','C20');
insert into votaciones values ('2000','C30');
insert into votaciones values ('2500','C40');
insert into votaciones values ('3000','C50');
insert into votaciones values ('3500','C60');
insert into votaciones values ('4000','C70');
insert into votaciones values ('4500','C80');
insert into votaciones values ('5000','C10');
insert into votaciones values ('5500','C10');
insert into votaciones values ('6000','C30');
insert into votaciones values ('6500','C30');
insert into votaciones values ('7000','C30');
insert into votaciones values ('7500','C40');
insert into votaciones values ('8000','C60');
insert into votaciones values ('8500','C60');
insert into votaciones values ('9000','C60');
insert into votaciones values ('9500','C60');
*/

/*
-------------------------------

--- cuestionario

Crear la base de datos eleccionesdb 


Crear un trigger que actualice los valores de los atributos de la tabla resultados al ingresar un voto en la tabla de votaciones.

Los datos a actualizar son:

votos_m No. votos masculinos que votaron por el candidato
votos_f No. votos femeninos que votaron por el candidato
votos_e123 No.votos de estratos bajos (estratos 1,2,3)
votos_e456 No.votos de estratos altos (estratos 4,5,6)
votos_jov No.votos jovenes (edad entre 18 y 30 años)
votos_adu No.votos adultos (edad entre 31 y 59 años)
votos_may No.votos tercera edad (edad >=60 años)
votos_par No.votos de ciudadanos que votaron y que son del mismo  mismo partido que el candidato  
votos_otr No.votos de ciudadanos que votaron y que son  de otros partidos diferentes al del candidato
votos_tot total votos obtenidos por el candidato

*/
-- EXITOS !!!
