-- creacion de tablas
-- tabla valores
create table valores(
val_salmin decimal(10,2),
val_subt decimal(10,2),
val_suba decimal(10,2),
val_subf decimal(10,2));

-- dependencias
create table dependencias(
coddep char(2) not null primary key,
nomdep varchar(20) unique);
-- cargos
create table cargos(
codcar char(2) not null primary key,
nomcar varchar(20) unique,
suelcar decimal (12,2));
-- empleados
create table empleados(
cedemp char(4) not null primary key,
nomemp varchar(20) unique,
estemp char(1),
coddep char(2) not null references dependencias(coddep),
codcar char(2) not null references cargos(codcar));
--planilla
create table planilla(
cedemp char(4) not null primary key references empleados(cedemp),
diast decimal(2,0));
-- liquidacion
create table liquidacion(
empleado varchar(20) not null primary key references empleados(nomemp),
dependencia varchar(20) not null references dependencias(nomdep),
cargo varchar(20) not null references cargos(nomcar),
subt decimal(8,0) default 0,
suba decimal(8,0) default 0,
sisben decimal(8,0) default 0,
subf decimal(8,0) default 0,
tsub decimal(8,0) default 0);
-- beneficiarios
create table beneficiarios(
cedemp char(4) not null references empleados(cedemp),
nomben varchar(20) not null,
parben char(1) not null,
edadben decimal(2,0),
primary key (cedemp,nomben,parben));
--
-- datos valores
insert into valores values(780000,60000,120000,50000);
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
insert into  cargos values('30','Jefe Departamento',2000000.00);
insert into  cargos values('50','Profesional',1700000.00);
insert into  cargos values('80','Asistente',1500000.00);
insert into  cargos values('70','Auxiliar',800000.00);
insert into  cargos values('60','Secretaria',480000.00);

insert into empleados values('1000','Carlos Vallejo','6','01','10');
insert into empleados values('1100','Maria Coral','2','01','60');
insert into empleados values('2000','Cesar Bucheli','5','02','20');
insert into empleados values('2100','Adriana Olaya','2','02','60');
insert into empleados values('3000','Sofia Guerrero','4','03','30');
insert into empleados values('3100','Hermes Enriquez','3','03','50');
insert into empleados values('3200','Jaime Cuesta','3','03','80');
insert into empleados values('3300','Andrea Cano','2','03','60');
insert into empleados values('4000','Armando Garcia','4','04','30');
insert into empleados values('4100','Nataly Guerrero','2','04','70');
insert into empleados values('4200','German Puentes','3','04','50');
insert into empleados values('4300','Ligia Montenegro','1','04','60');
insert into empleados values('5000','Ruben Zuleta','3','05','30');
insert into empleados values('5100','Alicia Martinez','2','05','80');
insert into empleados values('5200','Amanda Dorado','1','05','60');
insert into empleados values('6000','Ivan Llano','4','06','30');
insert into empleados values('6100','Nancy Castillo','3','06','50');
insert into empleados values('6200','Dario Mendez','3','06','70');
-- datos planilla 
insert into planilla values('1000',30);
insert into planilla values('1100',30);
insert into planilla values('2000',20);
insert into planilla values('2100',20);
insert into planilla values('3000',15);
insert into planilla values('3100',15);
insert into planilla values('3200',10);
insert into planilla values('3300',10);
insert into planilla values('4000',30);
insert into planilla values('4100',30);
insert into planilla values('4200',30);
insert into planilla values('4300',30);
insert into planilla values('5000',15);
insert into planilla values('5100',15);
insert into planilla values('5200',15);
insert into planilla values('6000',10);
insert into planilla values('6100',10);
insert into planilla values('6200',10);
--
-- datos beneficiarios
insert into beneficiarios values('1000','Andres Vallejo','H',15);
insert into beneficiarios values('1000','Ana Torres','C',35);
insert into beneficiarios values('1100','Ana Coral','H',12);
insert into beneficiarios values('1100','Luis Coral','H',19);
insert into beneficiarios values('1100','Sofia Coral','H',8);
insert into beneficiarios values('2000','Carmen Olaya','C',32);
insert into beneficiarios values('2000','Cesar Bucheli','H',14);
insert into beneficiarios values('2100','Adriana Olaya','H',12);
insert into beneficiarios values('2100','Jaime Olaya','H',22);
insert into beneficiarios values('3000','German Guerrero','H',12);
insert into beneficiarios values('3000','Alfonso Acosta','C',40);
insert into beneficiarios values('3100','Isabel Guerrero','C',33);
insert into beneficiarios values('3200','Alba Cuesta','H',10);
insert into beneficiarios values('3200','Daniel Cuesta','H',22);
insert into beneficiarios values('3300','Dennis Solis','C',37);
insert into beneficiarios values('3300','German Solis','H',9);
insert into beneficiarios values('4000','Ana Tobar','C',25);
insert into beneficiarios values('4000','Luis Garcia','H',12);
insert into beneficiarios values('4100','Ivan Guerrero','C',30);
insert into beneficiarios values('4100','Alba Guerrero','H',2);
insert into beneficiarios values('4200','Ana Mesias','C',25);
insert into beneficiarios values('4300','Julio Bucheli','C',44);
insert into beneficiarios values('4300','Amanda Bucheli','H',19);
insert into beneficiarios values('4300','Julieta Bucheli','H',12);
insert into beneficiarios values('5000','Carmen Peralta','C',44);
insert into beneficiarios values('5100','Carlos Mata','C',38);
insert into beneficiarios values('5200','Sofia Martinez','H',12);
insert into beneficiarios values('6000','Silvio Llano','H',14);
insert into beneficiarios values('6100','Luis Castillo','H',19);
insert into beneficiarios values('6200','Ximena Mendez','H',9);



/* 
1. Crear la base de datos subsidiosdb 
   
2. Realizar las siguientes operaciones sobre la base de datos:

2.1 - insertar en la tabla liquidacion nombre, nombre de la dependencia y nombre del cargo de todos los empleados.
2.2 - actualizar la tabla liquidaci¢n con los valores de subsidios de tranporte, alimentacion, sisben, subsidio familiar 
      y total subsidios asi:
	  
    a. Subsidio de tranporte (subt) se paga a aquellos cuyo sueldo mensual sea menor que 2 salarios minimos legales 
	y se paga el valor del subsidio de transporte estipulado en la tabla valores. Para el resto es cero (0).
    El subsidio de transporte es proporcional a los dias trabajados.
	
	b. Subsidio de alimentacion (suba) se paga a aquellos cuyo sueldo mensual es menor que 3 salarios minimos legales
    y se paga el valor del subsidio de alimentación estipulado en la tabla de valores. Para el resto es cero (0). 
	El subsidio de  alimentacion es proporcional a los dias trabajados.
	
   c. sisben se paga a aquellos de los estratos 1,2 y 3 asi:
   Si es de estrato 1 el sisben es del 50% del valor del salario minimo estipulado en la tabla de valores.
   Si es de estrato 2 el sisben es del 30% del valor del salario minimo estipulado en la tabla de valores.
   Si es de estrato 3 el sisben es del 10% del valor del salario minimo estipulado en la tabla de valores.
   Para el resto es cero (0).

   d. El subsidio familiar se  paga a aquellos de estratos 1,2 y 3 que tengan hijos (H) menores que 18 
      años a razon del valor estipulado por cada hijo en el subidio familiar de la tabla de valores. 
	  Para el resto es cero (0).
	  
  e- total subsidios, la suma de los subsidios de transporte,alimentacion,sisben y subsidio familiar. 
--
Para efectos de calculos  el mes laborable es de 30 dias.
--


*/

