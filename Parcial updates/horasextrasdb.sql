-- creacion de tablas extrasdb
-- parametros
create table parametros(
codigopar char(10) not null primary key,
valorpar decimal(10,2)
);
-- dependencias
create table dependencias(
coddep char(2) not null primary key,
nomdep varchar(20) unique);
-- cargos
create table cargos(
codcar char(2) not null primary key,
nomcar varchar(20) unique,
suelcar decimal (12,2));
--novedades
create table novedades(
codnov char(3) not null primary key,
nomnov varchar(30));
-- empleados
create table empleados(
cedemp char(4) not null primary key,
nomemp varchar(20) unique,
dependencia char(2) not null references dependencias(coddep),
cargo char(2) not null references cargos(codcar));
--planilla
create table planilla(
empleado char(4) not null references empleados(cedemp),
novedad char(3) not null references novedades(codnov),
fecha date,
numero decimal(2,0),
primary key (empleado,novedad,fecha));
-- liquidacion
create table liquidacion(
empleado varchar(20) not null primary key references empleados(nomemp),
dependencia varchar(20) not null references dependencias(nomdep),
cargo varchar(20) not null references cargos(nomcar),
hed smallint default 0,
hen smallint default 0,
hef smallint default 0,
vhed decimal(8,0) default 0,
vhen decimal(8,0) default 0,
vhef decimal(8,0) default 0,
the decimal(2,0) default 0,
vthe decimal(8,0) default 0
);
-- DATOS
-- datos parametros
insert into parametros values ('PORHED',125);
insert into parametros values ('PORHEN',175);
insert into parametros values ('PORHEF',225);

---datos dependencias
insert into dependencias values('01','Gerencia');
insert into dependencias values('02','Subgerencia');
insert into dependencias values('03','Planeacion');
insert into dependencias values('04','Contabilidad');
insert into dependencias values('05','Presupuesto');
insert into dependencias values('06','Personal');
insert into dependencias values('07','Ventas');
-- datos cargos
insert into cargos values('10','Gerente',5000000.00);
insert into cargos  values('20','Subgerente',4000000.00);
insert into  cargos values('30','Jefe Departamento',3000000.00);
insert into  cargos values('50','Profesional',2500000.00);
insert into  cargos values('80','Asistente',1500000.00);
insert into  cargos values('70','Auxiliar',800000.00);
insert into  cargos values('60','Secretaria',480000.00);
-- datos novedades
insert into novedades values('110','Horas Extras Diurnas');
insert into novedades values('120','Horas Extras Nocturnas');
insert into novedades values('130','Horas Extras Festivas');
-- datos empleados

insert into empleados values('1000','Carlos Vallejo','01','10');
insert into empleados values('1100','Maria Coral','01','60');
insert into empleados values('2000','Cesar Bucheli','02','20');
insert into empleados values('2100','Adriana Olaya','02','60');
insert into empleados values('3000','Sofia Guerrero','03','30');
insert into empleados values('3100','Hermes Enriquez','03','50');
insert into empleados values('3200','Jaime Cuesta','03','80');
insert into empleados values('3300','Andrea Cano','03','60');
insert into empleados values('4000','Armando Garcia','04','30');
insert into empleados values('4100','Nataly Guerrero','04','70');
insert into empleados values('4200','German Puentes','04','50');
insert into empleados values('4300','Ligia Montenegro','04','60');
insert into empleados values('5000','Ruben Zuleta','05','30');
insert into empleados values('5100','Alicia Martinez','05','80');
insert into empleados values('5200','Amanda Dorado','05','60');
insert into empleados values('6000','Ivan Llano','06','30');
insert into empleados values('6100','Nancy Castillo','06','50');
insert into empleados values('6200','Dario Mendez','06','70');
-- datos planilla 
insert into planilla values('1100','110','01/01/2019',1);
insert into planilla values('1100','110','02/01/2019',3);
insert into planilla values('1100','120','03/01/2019',2);
insert into planilla values('1100','130','04/01/2019',1);
insert into planilla values('1100','120','05/01/2019',1);
insert into planilla values('2100','130','06/01/2019',1);
insert into planilla values('2100','120','07/01/2019',4);
insert into planilla values('2100','110','08/01/2019',1);
insert into planilla values('2100','120','09/01/2019',1);
insert into planilla values('3100','110','10/01/2019',1);
insert into planilla values('3100','110','11/01/2019',1);
insert into planilla values('4100','110','12/01/2019',1);
insert into planilla values('4100','130','13/01/2019',5);
insert into planilla values('4100','120','14/01/2019',1);
insert into planilla values('4100','130','15/01/2019',1);
insert into planilla values('5100','110','16/01/2019',1);
insert into planilla values('5100','110','17/01/2019',2);
insert into planilla values('6100','120','18/01/2019',1);
insert into planilla values('6100','120','19/01/2019',5);
insert into planilla values('1100','110','20/01/2019',2);
insert into planilla values('1100','120','20/01/2019',2);
insert into planilla values('1100','130','20/01/2019',2);
insert into planilla values('2100','110','20/01/2019',1);
insert into planilla values('2100','120','20/01/2019',2);
insert into planilla values('2100','130','20/01/2019',2);
insert into planilla values('3100','110','20/01/2019',1);
insert into planilla values('3100','120','20/01/2019',1);
insert into planilla values('3100','130','20/01/2019',1);
insert into planilla values('3200','110','20/01/2019',2);
insert into planilla values('3200','120','20/01/2019',2);
insert into planilla values('3200','130','20/01/2019',2);
insert into planilla values('4100','110','20/01/2019',4);
insert into planilla values('4100','120','20/01/2019',4);
insert into planilla values('4100','130','20/01/2019',4);
insert into planilla values('4300','110','20/01/2019',4);
insert into planilla values('4300','120','20/01/2019',4);
insert into planilla values('4300','130','20/01/2019',4);
insert into planilla values('5100','110','21/01/2019',2);
insert into planilla values('5100','120','21/01/2019',2);
insert into planilla values('5100','130','21/01/2019',2);
insert into planilla values('5200','110','21/01/2019',2);
insert into planilla values('5200','120','21/01/2019',2);
insert into planilla values('5200','130','21/01/2019',2);
insert into planilla values('6100','110','21/01/2019',3);
insert into planilla values('6100','120','21/01/2019',3);
insert into planilla values('6100','130','21/01/2019',3);
insert into planilla values('1100','110','22/01/2019',2);
insert into planilla values('1100','120','22/01/2019',2);
insert into planilla values('1100','130','22/01/2019',2);
insert into planilla values('2100','110','23/01/2019',1);
insert into planilla values('2100','120','23/01/2019',2);
insert into planilla values('2100','130','23/01/2019',2);
insert into planilla values('3100','110','24/01/2019',1);
insert into planilla values('3100','120','24/01/2019',1);
insert into planilla values('3100','130','24/01/2019',1);
insert into planilla values('3200','110','24/01/2019',2);
insert into planilla values('3200','120','24/01/2019',2);
insert into planilla values('3200','130','24/01/2019',2);
insert into planilla values('4100','110','25/01/2019',4);
insert into planilla values('4100','120','25/01/2019',4);
insert into planilla values('4100','130','25/01/2019',4);
insert into planilla values('4300','110','26/01/2019',4);
insert into planilla values('4300','120','26/01/2019',4);
insert into planilla values('4300','130','26/01/2019',4);
insert into planilla values('5100','110','27/01/2019',2);
insert into planilla values('5100','120','27/01/2019',2);
insert into planilla values('5100','130','27/01/2019',2);
insert into planilla values('5200','110','28/01/2019',2);
insert into planilla values('5200','120','28/01/2019',2);
insert into planilla values('5200','130','28/01/2019',2);

/* 
1. Crear la base de datos EXTRASDB 
2. insertar en la tabla liquidación el nombre empleado, nombre de la dependencia y cargo solo de aquellos que tienen horas extras.
3. Actualizar el resto de campos de la tabla liquidación a partir de las novedades de la tabla planilla asi:
- hed:numero total de horas extras diurnas trabajadas en el periodo
- hen:numero total de horas extras nocturnas trabajadas en el periodo
- hef:numero total de horas extras festivas trabajadas en el periodo
- vhed: Valor total de las horas extras diurnas trabajadas en el periodo
- vhen: Valor total de las horas extras nocturnas trabajadas en el periodo
- vhef: Valor total de las horas extras festivas trabajadas en el periodo
- the: Numero total de horas extras trabajadas
- vthe: Valor total recibido por todas las horas extras trabajadas 
Para efectos de calculo de las horas extras:
El valor de una hora extra diurna (hed) equivale al porcentaje del valor de una hora ordinaria estipulado en parametros para HED.  
El valor de una hora extra nocturna (hen) equivale al porcentaje del valor de una hora ordinaria estipulado en parametros para HEN.  
El valor de una hora extra festiva (hef) equivale al porcentaje del valor de una hora ordinaria estipulado en parametros para HEF.   
El valor de una hora ordinaria es el valor de una hora que le pagan normalmente por trabajar en los 30 dias al mes y en las 8 horas al dia.
*/





















