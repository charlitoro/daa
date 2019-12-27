-- creacion de tablas
-- clientes
create table clientes(
cedclie char(4) not null primary key,
nomclie varchar(20) unique);

-- sucursales banco
create table sucursales(
codsuc char(2) not null primary key,
nomsuc varchar(20),
saldosuc decimal (12,2) default 0);

--novedades
create table novedades(
codnov char(1) not null primary key,
nomnov varchar(20));

--cuentas de ahorro
create table cuentas(
ncta char(4) not null primary key,
cliente char(4) not null references clientes(cedclie),
sucursal char(2) not null references sucursales(codsuc),
saldoi decimal (12,2)default 0,
estado char(1) default '0');

-- movimientos 
create table movimientos(
cuentamov char(4) not null references cuentas(ncta),
codmov char(1) not null references novedades(codnov),
vrmov decimal(12,2),
fechamov date,
primary key (cuentamov,codmov,fechamov));

-- saldos
create table saldos(
cuenta char(4) not null primary key references cuentas(ncta),
saldoant decimal(12,2) default 0,
tconsignaciones  decimal(12,2) default 0,
tretiros decimal(12,2) default 0,
saldonuevo decimal(12,2) default 0);


-- datos clientes
insert into clientes values('1000','Carlos Vallejo');
insert into clientes values('1100','Maria Coral');
insert into clientes values('2000','Cesar Bucheli');
insert into clientes values('2100','Adriana Olaya');
insert into clientes values('3000','Sofia Guerrero');
insert into clientes values('3100','Hermes Enriquez');
insert into clientes values('3200','Jaime Cuesta');
insert into clientes values('3300','Andrea Cano');
insert into clientes values('4000','Armando Garcia');
insert into clientes values('4100','Nataly Guerrero');
insert into clientes values('4200','German Puentes');
insert into clientes values('4300','Ligia Montenegro');
insert into clientes values('5000','Ruben Zuleta');
insert into clientes values('5100','Alicia Martinez');
insert into clientes values('5200','Amanda Dorado');
insert into clientes values('6000','Ivan Llano');
insert into clientes values('6100','Nancy Castillo');
insert into clientes values('6200','Dario Mendez');

---datos sucursales
insert into sucursales values('01','Centro',0);
insert into sucursales values('02','Norte',0);
insert into sucursales values('03','Sur',0);
insert into sucursales values('04','Oriente',0);
insert into sucursales values('05','Occidente',0);
-- datos novedades
insert into novedades values('1','Saldo Inicial');
insert into novedades values('2','Consignacion');
insert into novedades values('3','Retiro');

insert into cuentas values('1000','1000','01',0);
insert into cuentas values('1100','1100','01',0);
insert into cuentas values('2000','2000','02',0);
insert into cuentas values('2100','2100','02',0);
insert into cuentas values('3000','3000','03',0);
insert into cuentas values('3100','3100','03',0);
insert into cuentas values('3200','3200','04',0);
insert into cuentas values('3300','3300','04',0);
insert into cuentas values('4000','4000','05',0);
insert into cuentas values('4100','4100','05',0);
insert into cuentas values('4200','4200','01',0);
insert into cuentas values('4300','4300','02',0);
insert into cuentas values('5000','5000','03',0);
insert into cuentas values('5100','5100','04',0);
insert into cuentas values('5200','5200','05',0);
insert into cuentas values('6000','6000','01',0);
insert into cuentas values('6100','6100','02',0);
insert into cuentas values('6200','6200','03',0);
/*
-- datos movimientos saldos iniciales
insert into movimientos values('1000','1',50000,'10/06/2012');
insert into movimientos values('1100','1',50000,'10/06/2012');
insert into movimientos values('2000','1',100000,'10/06/2012');
insert into movimientos values('2100','1',100000,'10/06/2012');
insert into movimientos values('3000','1',150000,'10/06/2012');
insert into movimientos values('3100','1',150000,'10/06/2012');
insert into movimientos values('3200','1',200000,'10/06/2012');
insert into movimientos values('4000','1',200000,'10/06/2012');
insert into movimientos values('4100','1',250000,'11/06/2012');
insert into movimientos values('4200','1',250000,'11/06/2012');
insert into movimientos  values('4300','1',300000,'11/06/2012');
insert into movimientos values('5000','1',300000,'11/06/2012');
-- datos consignaciones
insert into movimientos values('1000','2',50000,'12/06/2012');
insert into movimientos values('1100','2',50000,'12/06/2012');
insert into movimientos values('2000','2',100000,'12/06/2012');
insert into movimientos values('2100','2',100000,'12/06/2012');
insert into movimientos values('3000','2',150000,'12/06/2012');
insert into movimientos values('3100','2',150000,'12/06/2012');
insert into movimientos values('3200','2',200000,'12/06/2012');
-- datos retiros
insert into movimientos values('4000','3',50000,'13/06/2012');
insert into movimientos values('4100','3',50000,'13/06/2012');
insert into movimientos values('4200','3',50000,'13/06/2012');
insert into movimientos values('4300','3',30000,'13/06/2012');
insert into movimientos values('5000','3',30000,'13/06/2012');
-- movimientos erroneos
-- ya fue actualizado el estado de saldo inicial
insert into movimientos values('5000','1',300000,'14/06/2012');
-- retiro mayor que el saldo
insert into movimientos values('1000','3',200000,'14/06/2012');

*/

/* 
1. Crear la base de datos bancosdb 
2. Crear un triger que al ingresar un movimiento en la tabla movimientos : 
- Actualice los atributo saldoi y estado = '1' de la tabla cuentas cuando el movimiento corresponda a un saldo inicial. Si se vuelve a ingresar un movimiento de saldo incial a la cuenta cuyo estado esta actualizado generar un mensaje y salir.
-Acumule  el campo saldosuc de la tabla sucursales con cualquier movimiento. Si es saldo inicial unicamente la primera vez.
- Inserte un registro en la tabla saldos  y actualice el atributo saldonuevo si la cuenta no existe y  el movimiento sea saldo inicial. 
- Actualice la tabla saldos con los movimientos de consignacion o retiro moviendo saldo a saldo anterior y acumulando o total  consignaciones o total retiros y actualizando el saldonuevo con el nuevo valor.
En el caso de retiros, si el saldo es menor que el valor a retirar generar un mensaje y salir
*/




















