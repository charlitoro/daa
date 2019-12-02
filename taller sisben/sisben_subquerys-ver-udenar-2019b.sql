-- base de datos sisben
-- 
-- 
-- tabla valores
create table valores(
val_salmin decimal(10,2),
val_hijo10 decimal(10,2),
val_hijo18 decimal(10,2)
);
--
-- tabla topes
create table topes(
codigo_top char(2) not null primary key,
valor_top decimal(10,2)
);
--

create table barrios(
codigo_ba char(3) not null primary key,
nombre_ba varchar(20),
estrato_ba char(1) 
);
--
create table oficios(
codigo_of char(3) not null primary key, 
nombre_of varchar(20),
ingreso_of decimal(10,2)
);
--
create table ciudadanos(
cedula_ciu char(4) not null primary key,
nombre_ciu varchar (20) not null unique,
barrio_ciu char(3) not null references barrios(codigo_ba),
oficio_ciu char(3) not null references oficios(codigo_of)
);
--
create table familiares(
cedula_fa char(4) not null primary key,
nombre_fa varchar(20),
parent_fa char(1) check (parent_fa='C' or parent_fa='H'),
edad_fa decimal(2,0),
ciudadano_fa char(4) not null references ciudadanos(cedula_ciu)
);
--
--
create table subsisben(
ciudadano varchar(20) not null primary key references ciudadanos(nombre_ciu),
nivel char(1),
sub_escolar decimal(10,2) default 0,
sub_familias  decimal(10,2) default 0,
sub_tot      decimal(10,2)
);
--
-- datos valores
insert into valores values (860000,100000,50000);
--
-- datos topes
insert into topes values ('T1',600000);
insert into topes values ('T2',800000);
insert into topes values ('T3',1000000);

--
-- datos barrios
insert into barrios values ('B10','La Habana','1');
insert into barrios values ('B11','Lorenzo','2');
insert into barrios values ('B12','Miraflores','3');
insert into barrios values ('B13','San Ignacio','4');
insert into barrios values ('B14','Acacias','5');
insert into barrios values ('B15','Morasurco','6');
--
--
-- datos oficios
insert into oficios values ('C00','Cocinero',400000);
insert into oficios values ('C01','Carpintero',500000);
insert into oficios values ('C02','Albanil',600000);
insert into oficios values ('C03','Lustrabotas',700000);
insert into oficios values ('C04','Chofer',800000);
insert into oficios values ('C05','Musico',650000);
insert into oficios values ('C06','Mecanico',900000);
insert into oficios values ('C07','Maestro',1200000);
insert into oficios values ('C08','Oficinista',1300000);
insert into oficios values ('C09','Secretaria',750000);

--
-- datos ciudadanos
insert into ciudadanos  values ('1000','Sofia Montenegro','B15','C09');
insert into ciudadanos  values ('2000','Pedro Ortiz','B14','C08');
insert into ciudadanos  values ('3000','Julio Bucheli','B13','C07');
insert into ciudadanos  values ('4000','Rodrigo Casas','B12','C06');
insert into ciudadanos  values ('5000','Enrique Pianda','B11','C05');
insert into ciudadanos  values ('6000','Camilo Perdomo','B11','C04');
insert into ciudadanos  values ('7000','Armando Agreda','B11','C02');
insert into ciudadanos  values ('8000','Carlos Rodriguez','B10','C05');
insert into ciudadanos  values ('9000','Enrique Lasso','B10','C03');
insert into ciudadanos  values ('9500','Carmen Sea','B10','C00');
--
-- datos familiares
insert into familiares  values ('1001', 'Fernando Jurado','C',40,'1000');
insert into familiares  values ('1002', 'Nancy Jurado','H',15,'1000');
insert into familiares  values ('1003', 'Luis Jurado','H',10,'1000');
insert into familiares  values ('2001', 'Rubiela Garcia','C',35,'2000');
insert into familiares  values ('2002', 'Juan Ortiz','H',19,'2000');
insert into familiares  values ('2003', 'Ana Ortiz','H',16,'2000');
insert into familiares  values ('3000', 'Ligia Montenegro','C',45,'3000');
insert into familiares  values ('3001', 'Adriano Bucheli','H',24,'3000');
insert into familiares  values ('4001', 'Tania Robledo','C',39,'4000');
insert into familiares  values ('4002', 'Cesar Casas','H',15,'4000');
insert into familiares  values ('5001', 'Maria Moreno','C',29,'5000');
insert into familiares  values ('5002', 'Sara Pianda','H',9,'5000');
insert into familiares  values ('5003', 'Hernan Pianda','H',12,'5000');
insert into familiares  values ('5004', 'Juan Pianda','H',19,'5000');
insert into familiares  values ('6001', 'Alejandra Moreno','C',25,'6000');
insert into familiares  values ('7001', 'Amanda Vallejo','C',29,'7000');
insert into familiares  values ('7002', 'Lucia Agreda','H',15,'7000');
insert into familiares  values ('8001', 'Carmen Vallejo','C',40,'8000');
insert into familiares  values ('9001', 'Sofia Pereira','C',30,'9000');
insert into familiares  values ('9002','Enrique Lasso','H', 4,'9000');
insert into familiares  values ('9501', 'Libaro Castro','C',49,'9500');
insert into familiares  values ('9502', 'Libaro Castro','H',19,'9500');
insert into familiares  values ('9503', 'Gloria Castro','H',13,'9500');
--
-- datos subsisben
--
-- 
/*
1. Crear la base de datos sisbendb 
2. insertar en la tabla subsisben el nombre del ciudadano a partir de la tabla ciudadanos.
2. Actualizar la tabla subsisben   teniendo en cuenta los siguientes datos:


NIVEL es el nivel de sisben a la cual pertenece el grupo familiar y se asigna de la siguiente manera:
Si el ciudadano es de estrato 1 y sus ingresos menores o iguales al valor de Tope T1 su nivel_sisben es 0 
Si el ciudadano es de estrato 1 y sus ingresos menores o iguales al valor de Tope T2 su nivel_sisben es 1 
Si el ciudadano es de estrato 1 y sus ingresos menores o iguales al valor de Tope T3 su nivel_sisben es 2 
Si el ciudadano es de estrato 1 y sus ingresos mayores al valor de Tope T3 su nivel_sisben es N 

Si el ciudadano es de estrato 2 y sus ingresos menores o iguales al valor de Tope T1 su nivel_sisben es 1
Si el ciudadano es de estrato 2 y sus ingresos menores o iguales al valor de Tope T2 su nivel_sisben es 2 
Si el ciudadano es de estrato 2 y sus ingresos mayores  al valor de Tope T2 su nivel_sisben es N 

Si el ciudadano es de estrato 3 y sus ingresos menores o iguales al valor de Tope T1 su nivel_sisben es 2
Si el ciudadano es de estrato 3 y sus ingresos mayores al valor de Tope T1  su nivel_sisben es N

Si el ciudadano  es de estrato 4, 5  y  6  su nivel_sisben es N 
 
  
-SUB_escolar es el valor del subsidio escolar que se le da a cada HIJO (H) menor que 18 años asi:
 si la edad del hijo es menor que 10 años el subsidio escolar es el valor del atributo  val_hijo10 de la tabla de valores por cada hijo <10
 si la edad del hijo es >=10 y menor que 18 el subsidio escolar es el valor del atributo val_hijo18 de la tabla valores por cada hijo >=10 y < 18
 si le edad del hijo es >=18 el subsidio escolar es 0

- sub_familias es el valor del subsidio de familias en accion y se asigna asi:
      Si es nivel 0 el subsidio de familias es del 10% del valor del salario minimo  por cada persona que conforma el nucleofamiliar.
      Si es nivel 1 el subsidio de familias es del 5% del valor deñ salario minimo por cada persona que conforma el nucleofamiliar.
      Si es nivel 2 el subsidio de familias es del 3% del valor del salario minimo por cada persona que conforma el nucleofamiliar.
	Si no tiene nivel el subsidio de vivienda es 0.

El nucleo familiar esta compuesto por el ciudadano y su familia

-	SUB_TOTAL es la suma de los dos subsidios

Ð!!!Exitos


*/
 



 
