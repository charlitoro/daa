/*
* OPERACIONES BASE DE DATOS SUBSIDIOS
*/

-- 2.1 - insertar en la tabla liquidacion nombre, nombre de la dependencia y nombre del cargo de todos los empleados.
-- nombdre del cargo de todos los empleados
insert into liquidacion(empleado,dependencia,cargo)
 (select nomemp,nomdep,nomcar 
 from empleados join cargos using(codcar)
 	join dependencias using(coddep));

/*
 a. Subsidio de tranporte (subt) se paga a aquellos cuyo sueldo mensual sea menor que 2 salarios minimos legales 
	y se paga el valor del subsidio de transporte estipulado en la tabla valores. Para el resto es cero (0).
    El subsidio de transporte es proporcional a los dias trabajados.
*/
-- el pago de subsidio de tranposte solo de brinda para los asalariados con menos de
-- de 2 salarios minios, ademas el valor es proporcional a los dias trabjados, en otras palabras
-- si trabaja los 30 dias tiene derecho al valor total del subsidio que en este caso es 60000 mil
 update liquidacion set subt = (
		select case when suelcar < 2 *(select val_salmin from valores) then ((select val_subt from valores)*diast)/30 else 0 end
		from cargos join empleados using(codcar)
			join planilla using(cedemp)
		where empleado=nomemp);
/*
b. Subsidio de alimentacion (suba) se paga a aquellos cuyo sueldo mensual es menor que 3 salarios minimos legales
    y se paga el valor del subsidio de alimentación estipulado en la tabla de valores. Para el resto es cero (0). 
	El subsidio de  alimentacion es proporcional a los dias trabajados.
*/
-- actualizar el subsidio de vivienda igual que el anterior solo que aplican quiens tienen menos d 3 salario minimos
 update liquidacion set suba = (
		select case when suelcar < 3 *(select val_salmin from valores) then ((select val_suba from valores)*diast)/30 else 0 end
		from cargos join empleados using(codcar)
			join planilla using(cedemp)
		where empleado=nomemp);
/*
c. sisben se paga a aquellos de los estratos 1,2 y 3 asi:
   Si es de estrato 1 el sisben es del 50% del valor del salario minimo estipulado en la tabla de valores.
   Si es de estrato 2 el sisben es del 30% del valor del salario minimo estipulado en la tabla de valores.
   Si es de estrato 3 el sisben es del 10% del valor del salario minimo estipulado en la tabla de valores.
   Para el resto es cero (0).
*/
-- actualizar susidio por sisben
update liquidacion set sisben = 
	(select case when estemp='1' 
				 then (select val_salmin from valores)*0.5
				 when estemp='2' 
				 then (select val_salmin from valores)*0.3
				 when estemp='3' 
				 then (select val_salmin from valores)*0.1
				 else 0 end
	from empleados 
	where empleado=nomemp);
/*
 d. El subsidio familiar se  paga a aquellos de estratos 1,2 y 3 que tengan hijos (H) menores que 18 
      años a razon del valor estipulado por cada hijo en el subidio familiar de la tabla de valores. 
	  Para el resto es cero (0).
*/
-- actualiza el subsidio familiar
update liquidacion set subf = 
	(select case when estemp in ('1','2','3') 
				then (select count(*) 
					   from beneficiarios join empleados using(cedemp)
					   where parben='H' and edadben<18 and empleado=nomemp)
					 *
					 (select val_subf from valores)
				else 0 end
	from empleados
	where empleado=nomemp);
/*
e- total subsidios, la suma de los subsidios de transporte,alimentacion,sisben y subsidio familiar. 
*/
-- actualizar el total del subsidio
update liquidacion set tsub = (subt+suba+sisben+subf);
---------------------------------------------
-- Comprobar valores
----------------------------------------
-- adicionar a la tabla liquidacion los siguientes atributos
-- sueldo del empleado, dias trabajados, estrato y numero de hijos
alter table liquidacion add column sueldo numeric(12,2);
alter table liquidacion add column diast smallint;
alter table liquidacion add column estrato char(1);
alter table liquidacion add column nhijos smallint;
---
update liquidacion set sueldo = (
	select suelcar 
	from cargos join empleados using(codcar) where empleado=nomemp);
--
update liquidacion set diast = (
	select diast from planilla join empleados using(cedemp) where empleado=nomemp);
--
update liquidacion set estrato= (
	select estemp from empleados where empleado=nomemp);
--
update liquidacion set nhijos = (
	select count(*) from beneficiarios 
		join empleados using(cedemp)
	where parben='H' and edadben<18 and empleado=nomemp);