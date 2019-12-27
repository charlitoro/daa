-- base de datos energia
-- 
create table carfijos(
estrato_car char(1) not null primary key,
valor_car decimal(6,0)
);
--
-- 
create table tarifas(
codigo_tar char(2) not null primary key,
valor_tar decimal(6,0)
);
--
--
create table medidores(
codigo_me char(4) not null primary key,
marca_me varchar(20),
digitos_me decimal(2,0)
);
--

create table barrios(
codigo_ba char(3) not null primary key,
nombre_ba varchar(20) unique,
estrato_ba char(1) not null references carfijos(estrato_car)
);
--
create table usuarios(
codigo_usu char(4) not null primary key,
nombre_usu varchar (20) not null unique,
barrio_usu char(3) references barrios(codigo_ba),
medidor_usu char(4) references medidores(codigo_me)
);
--
--
create table lecturas(
medidor_lec char(4) not null primary key references medidores(codigo_me),
lectura_act decimal (6,0) default 0,
lectura_ant decimal (6,0) default 0,
fecha date
);
--
--
create table facturas(
usuario varchar(20) not null primary key references usuarios(nombre_usu),
kwh decimal (8,0) default 0,
consumo decimal(10,2) default 0,
cargofijo decimal(6,0) default 0,
vrfactura decimal(10,2));

--
--
create table estadisticas(
barrio varchar(20) not null primary key references barrios(nombre_ba),
tot_kwhs decimal (10,0) default 0,
tot_consumos decimal(10,2) default 0,
tot_cargosfijo decimal(10,0) default 0,
tot_facturas decimal(10,2))default 0
);
--
-- POBLAMIENTO DE LA BASE DE DATOS
--
-- datos cargos fijos
insert into carfijos values ('1',1000);
insert into carfijos values ('2',2000);
insert into carfijos values ('3',3000);
insert into carfijos values ('4',5000);
insert into carfijos values ('5',10000);
insert into carfijos values ('6',20000);
--
-- datos tarifas
insert into tarifas values ('T1',100);
insert into tarifas values ('T2',200);
insert into tarifas values ('T3',300);
insert into tarifas values ('T4',500);
insert into tarifas values ('T5',1000);
--
-- datos medidores
insert into medidores values ('M100','Iskra',3);
insert into medidores values ('M200','G&E',4);
insert into medidores values ('M300','LG',4);
insert into medidores values ('M400','Iskra',3);
insert into medidores values ('M500','G&E',4);
insert into medidores values ('M600','LG',4);

--
/*
-- datos barrios
insert into barrios values ('B10','La Habana','1');
insert into barrios values ('B11','Lorenzo','2');
insert into barrios values ('B12','Miraflores','3');
insert into barrios values ('B13','San Ignacio','4');
insert into barrios values ('B14','Acacias','5');
insert into barrios values ('B15','Morasurco','6');
--
-- datos usuarios
insert into usuarios values ('1000','Pedro Ortiz','B15','M100');
insert into usuarios values ('2000','Julio Bucheli','B14','M200');
insert into usuarios values ('3000','Sofia Montenegro','B13','M300');
insert into usuarios values ('4000','Carmen Casas','B12','M400');
insert into usuarios values ('5000','Enrique Pianda','B11','M500');
insert into usuarios values ('6000','Camilo Perdomo','B10','M600');
--
--
-- datos lecturas
--
insert into lecturas  values ('M100',700,100,'01/09/2016');
insert into lecturas values ('M200',300,100,'01/09/2016');
insert into lecturas values ('M300',150,9150,'01/09/2016');
insert into lecturas values ('M400',500,100,'01/09/2016');
insert into lecturas values ('M500',1000,100,'01/09/2016');
insert into lecturas values ('M600',100,9500,'01/09/2016');
-- 
*/
/*
Crear la base de datos energiaIIdb.
1. Crear una regla que al insertar un barrio en la tabla barrios inserte el nombre del barrio en la tabla  estadisticas.
2. Crear una regla que al insertar un usuario en la tabla usuarios , se inserte el nombre del usuario en la tabla facturas.
3. Crear una regla que al insertar lecturas en la tabla lecturas 
actualice los datos en la tabla FACTURAS y en la tabla ESTADISTICAS ,  teniendo en cuenta los siguientes datos:

En la tabla FACTURAS:
	Los KWH de cada usuario se obtienen como la diferencia entre
 la lectura actual (lectura_act) y la lectura anterior  (lectura_ant) del Medidor del usuario.
 Si la lectura actual es menor que la lectura anterior  quiere decir que el contador de lecturas del medidor
 dio una vuelta, por lo tanto, para que la diferencia no de negativa, se debe adicionar a la lectura actual 
 el numero 10 elevado a la potencia del numero de digitos del medidor  (lectura_act+10^digitos_me).

	El CONSUMO de cada usuario se obtiene como resultado del producto de los KWH por el valor de la tarifa  VALOR_TAR asi:
o	Si kwh <=200 entonces los kwh se cobran con CODIGO_TAR=T1
o	SI kwh>200 y kwh<=400 entonces se cobran con CODIGO_TAR=T2 	SI kwh>400 y kwh<=800 entonces  se cobran con CODIGO_TAR=T3
o	Si kwh>800 kwh y kwh <= 1600 entonces CODIGO_TAR=T4
o	Si kwh>1600 kwh  entonces CODIGO_TAR=T5

     
      El CARGOFIJO de cada usuario es el valor de la tabla CARFIJOS de acuerdo al estrato al cual  pertenece el usuario.

.     VRFACTURA es la suma de CONSUMO y CARGOFIJO

En la tabla ESTADISTICAS:
tot_kwhs es el total de kilovatios por barrio:
tot_consumos es el total de consumos por barrio.
tot_cargosfijo es el total de cargos fijos por barrio
tot_facturas es el total facturado por barrio

�!!!Exitos

*/
 



 
