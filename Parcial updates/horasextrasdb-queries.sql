/*
 * 1. Crear la base de datos EXTRASDB 
 * 2. insertar en la tabla liquidación el nombre empleado, 
 * nombre de la dependencia y cargo solo de aquellos que tienen horas extras.
*/
insert into liquidacion(empleado, dependencia, cargo)
	(select distinct nomemp,nomdep,nomcar
	from empleados join cargos on cargo=codcar 
		join dependencias on dependencia=coddep
		join planilla on cedemp=empleado
		join novedades on novedad=codnov);

-- 3. Actualizar el resto de campos de la tabla liquidación a partir de las novedades de la tabla planilla asi:
-- hed:numero total de horas extras diurnas trabajadas en el periodo
update liquidacion set hed = (
	select horas
	from
		(select nomemp, sum(numero) as horas from empleados join planilla on cedemp=empleado 
				join novedades on novedad=codnov
		where nomnov like 'Horas Extras Diurnas'
		group by 1) as t1
	where t1.nomemp=empleado
);
-- hen:numero total de horas extras nocturnas trabajadas en el periodo
update liquidacion set hen = (
	select horas	
	from
		(select nomemp, sum(numero) as horas from empleados join planilla on cedemp=empleado 
				join novedades on novedad=codnov
		where nomnov like '%Horas%Extras%Nocturnas%'
		group by 1) as t1
	where t1.nomemp=empleado
);
-- hef:numero total de horas extras festivas trabajadas en el periodo
update liquidacion set hef = (
	select horas	
	from
		(select nomemp, sum(numero) as horas from empleados join planilla on cedemp=empleado 
				join novedades on novedad=codnov
		where nomnov like '%Horas%Extras%Festivas%'
		group by 1) as t1
	where t1.nomemp=empleado
);

-- vhed: Valor total de las horas extras diurnas trabajadas en el periodo
update liquidacion set vhed = (
	select round(round(suelcar/(30*8)) * (select valorpar/100 from parametros where codigopar like '%PORHED%')) * hed
	from empleados join cargos on cargo=codcar
	where empleado=nomemp
);

select nomemp, round(suelcar/(30*8)) * (select valorpar/100 from parametros where codigopar like '%PORHED%') * hed
	from empleados join cargos on cargo=codcar join liquidacion on empleado=nomemp;
-- vhen: Valor total de las horas extras nocturnas trabajadas en el periodo
update liquidacion set vhen = (
	select round(round(suelcar/(30*8)) * (select valorpar/100 from parametros where codigopar like '%PORHEN%')) * hen
	from empleados join cargos on cargo=codcar
	where empleado=nomemp
);
-- vhef: Valor total de las horas extras festivas trabajadas en el periodo
update liquidacion set vhef = (
	select round(round(suelcar/(30*8)) * (select valorpar/100 from parametros where codigopar like '%PORHEF%')) * hef
	from empleados join cargos on cargo=codcar
	where empleado=nomemp
);
-- the: Numero total de horas extras trabajadas
update liquidacion set the = hed+hen+hef;
-- vthe: Valor total recibido por todas las horas extras trabajadas 
update liquidacion set vthe = vhed+vhen+vhef;
/*Para efectos de calculo de las horas extras:
El valor de una hora extra diurna (hed) equivale al porcentaje del valor de una hora ordinaria estipulado en parametros para HED.  
El valor de una hora extra nocturna (hen) equivale al porcentaje del valor de una hora ordinaria estipulado en parametros para HEN.  
El valor de una hora extra festiva (hef) equivale al porcentaje del valor de una hora ordinaria estipulado en parametros para HEF.   
El valor de una hora ordinaria es el valor de una hora que le pagan normalmente por trabajar en los 30 dias al mes y en las 8 horas al dia.
/*