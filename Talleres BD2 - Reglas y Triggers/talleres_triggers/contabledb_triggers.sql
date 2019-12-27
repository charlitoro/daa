-- contable
-- creacion de tablas
-- 
create table cuentas
(
codmayor char(1) not null,
codsub char(1) not null,
codaux char(2) not null,
nomcue  varchar(20),
saldo decimal(12,2) default 0,
tipo char(1),
primary key(codmayor,codsub,codaux)
);


-- movimientos 
create table movimientos
(
mayor char(1) not null references cuentas(codmayor),
subcuenta char(1) not null references cuentas(codsub),
auxiliar char(2) not null references cuentas(codaux),
tipomov char(1),
valormov decimal(12,2),
fechamov date
);


-- datos cuentas
-- Activo
-- En estas cuentas si el movimiento es debito (D) se suma al saldo
-- Si el movimiento es credito (C) se resta al saldo
--
insert into cuentas values('1','0','00','Activo',500000,'M');
insert into cuentas values('1','1','00','Bancos',400000,'S');
insert into cuentas values('1','1','01','Banco Colombia',100000,'A');
insert into cuentas values('1','1','02','Banco Bogota',200000,'A');
insert into cuentas values('1','1','03','Banco Popular',100000,'A');
insert into cuentas values('1','2','00','Caja',100000,'S');
insert into cuentas values('1','2','01','Caja Menor 1',50000,'A');
insert into cuentas values('1','2','02','Caja Menor 2',50000,'A');
---
-- Pasivo
-- En estas cuentas si el movimiento es debito (D) se resta al saldo
-- Si el movimiento es credito (C) se suma al saldo
--

insert into cuentas values('2','0','00','Pasivo',400000,'M');
insert into cuentas values('2','1','00','Parafiscales',300000,'S');
insert into cuentas values('2','1','01','Aportes Salud',100000,'A');
insert into cuentas values('2','1','02','Aportes Pension',100000,'A');
insert into cuentas values('2','1','03','Aporte Subsidios',100000,'A');
insert into cuentas values('2','2','00','Cuenta x Pagar',100000,'S');
insert into cuentas values('2','2','01','Mercancia credito',50000,'A');
insert into cuentas values('2','2','01','Fletes',50000,'A');

/*
-- datos movimientos 
-- solo se realiza con cuentas auxiliares (A)
--
insert into movimientos values('1','1','01','D',50000,'25/05/2012');
insert into movimientos values('1','1','02','C',50000,'26/05/2012');
insert into movimientos values('1','1','03','D',50000,'27/05/2012');
insert into movimientos values('1','2','01','D',50000,'28/05/2012');
insert into movimientos values('1','2','02','C',50000,'29/05/2012');
insert into movimientos values('2','1','01','C',50000,'30/05/2012');
insert into movimientos values('2','1','02','C',50000,'02/06/2012');
insert into movimientos values('2','1','03','C',50000,'03/06/2012');
insert into movimientos values('2','2','01','D',50000,'04/06/2012');
insert into movimientos values('2','2','01','D',50000,'05/06/2012');


-- movimiento mayor que el saldo
insert into movimientos values('1','1','01','C',500000,'26/05/2012');

*/

/* 
1. Crear la base de datos contabilidaddb 
2. crear un triger que al ingresar un movimiento en la tabla movimientos : 
- Actualice el atributo saldo en la tabla cuentas tanto a la cuenta auxiliar (A) del movimiento como a sus respectivas subcuenta (S) y cuenta mayor (M) teniendo en cuenta el tipo de movimiento (D -debe, C-Credito)  y si es una cuenta del activo o pasivo asi: 
-- Cuenta Activo
-- En estas cuentas si el movimiento es debito (D) se suma al saldo
-- Si el movimiento es credito (C) se resta al saldo
--
-- Cuenta Pasivo
-- En estas cuentas si el movimiento es debito (D) se resta al saldo
-- Si el movimiento es credito (C) se suma al saldo
--

En el caso en que en un movimiento el saldo es menor que el valor a acreditar (en cuenta activa) o a debitar (Cuenta pasiva) generar un mensaje y salir
*/




















