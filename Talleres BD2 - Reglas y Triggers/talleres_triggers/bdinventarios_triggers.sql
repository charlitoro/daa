create table fabricantes
(
	codigo_fab char(3) not null primary key,
	nombre_fab varchar(20),
	pais_fab varchar(20)
);

create table productos
(
	codigo_pro char(4) not null primary key,
	nom_pro varchar(20) not null unique,
	fabricante char(3) not null references fabricantes(codigo_fab),
	saldo_ini integer,
	vrunitario_pro decimal(12,2) check(vrunitario_pro>=0) 
);

create table movimientos
(
     comprobante char(4) not null,
     fecha date not null,	
     	producto char(4) not null references productos(codigo_pro),
	tipomov char(1) check (tipomov='I' or tipomov='E'),
     cantidad integer check (cantidad>0),
     valor_unit decimal(12,2) check(valor_unit>=0),
	primary key(comprobante,producto,fecha)
);

create table inventarios
(
producto varchar(20)not null primary key references productos(nom_pro),
saldo_ant integer default 0,
total_ing integer default 0,
total_egr integer default 0,
saldo_act integer default 0,
saldo_pesos decimal (12,2) default 0
);

	

/* 
-----datos -------------

* fabricantes.dat
insert into fabricantes values ('100','SONY','JAPON');
insert into fabricantes values ('200','LG','COLOMBIA');
insert into fabricantes values ('300','HACEB','COLOMBIA');
insert into fabricantes values ('400','WIRPOOL','USA');
insert into fabricantes values ('500','SAMSUNG','COREA');
insert into fabricantes values ('600','SHARP','ALEMANIA');
insert into fabricantes values ('700','TOSHIBA','MEXICO');
insert into fabricantes values ('800','ACER','COREA');
insert into fabricantes values ('900','IBM','USA');

* productos.dat
insert into productos values('P100','Equipo Sonido','300',10,600000);
insert into productos values('P200','Televisor LCD32','100',10,900000);
insert into productos values('P300','Lavadora','200',10,850000);
insert into productos value('P400','Microondas','200',10,250000);
insert into productos values('P500','Calentador gas','400',10,350000);
insert into productos values('P600','Nevera','300',10,800000);
insert into productos values('P700','Estufa electrica','400',10,300000);
insert into productos values('P800','Televisor LED40','500',10,1500000);
insert into productos values('P850','Radio','600',10,50000);
insert into productos values('P900','DVD','700',10,120000);
insert into productos values('P950','Blueray','800',10,350000);

*inventarios.dat
insert into inventarios(producto) values ('Equipo Sonido');
insert into inventarios(producto) values ('Televisor LCD32');
insert into inventarios(producto) values ('Lavadora');
insert into inventarios(producto) values ('Microondas');
insert into inventarios(producto) values ('Calentador gas');
insert into inventarios(producto) values ('Nevera');
insert into inventarios(producto) values ('Estufa electrica');
insert into inventarios(producto) values ('Televisor LED40');
insert into inventarios(producto) values ('Radio');
insert into inventarios(producto) values ('DVD');
insert into inventarios(producto) values ('Blueray');

/*
* movimientos.dat
insert into movimientos values ('1000','10/02/2013','P100','E',5,0);
insert into movimientos values ('1000','10/02/2013','P400','E',2,0);
insert into movimientos values ('2000','11/02/2013','P400','I',3,350000);
insert into movimientos values ('2000','11/02/2013','P500','I',2,450000);
insert into movimientos values ('3000','12/02/2013','P300','E',5,0);
insert into movimientos values ('4000','13/02/2013','P700','I',2,400000);
insert into movimientos values ('4000','13/02/2013','P600','I',5,1000000);
insert into movimientos values ('5000','14/02/2013','P200','E',4,0);
insert into movimientos values ('5000','14/02/2013','P500','E',5,0);
insert into movimientos values ('6000','15/02/2013','P200','I',2,1100000);
insert into movimientos values ('6000','15/02/2013','P400','I',1,400000);
insert into movimientos values ('7000','16/02/2013','P400','E',3,0);
insert into movimientos values ('8000','17/02/2013','P200','E',1,0);
insert into movimientos values ('9000','18/02/2013','P300','E',5,0);
insert into movimientos values ('9000','18/02/2013','P400','E',2,0);
insert into movimientos values ('9500','19/02/2013','P300','I',8,950000);
insert into movimientos values ('9500','19/02/2013','P700','E',4,0);
insert into movimientos values ('9500','19/02/2013','P900','E',4,0);
insert into movimientos values ('9500','19/02/2013','P800','E',4,0);
insert into movimientos values ('9500','19/02/2013','P850','E',3,0);

-------------------------------
*/

/*
--- cuestionario

Crear la base de datos inventariodb 


Crear un trigger que al ingresar un movimiento en la tabla movimientos se actualice:
El valor unitario (vrunitario_pro) en la tabla productos como el promedio del valor unitario del producto(vrunitario_pro)  y el nuevo valor unitario del movimiento (valor_unit). Por eso esto es aplicable solo si el tipo de movimiento es un ingreso (I).

El saldo anterior (saldo_ant) de la tabla inventario con el saldo actual (saldo_act) de la misma tabla.

El total ingresos (total_ing) de la tabla inventarios como la acumulación de las ingresos del producto.

El total egresos (total_egr) de la tabla inventarios como la acumulación de los egresos del producto.

El saldo actual (saldo_act) de la tabla inventarios como la suma de esta saldo actual mas la cantidad ingresada o menos la cantidad egresada.

El saldo en pesos (saldo_pesos) de la tabla inventarios como la multiplicacion del saldo actual por el valor unitario del producto.

*/

