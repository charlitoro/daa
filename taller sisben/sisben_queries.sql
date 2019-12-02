-- datos subsisben
--
---- 
-- 1. Crear la base de datos sisbendb 
-- 2. insertar en la tabla subsisben el nombre del ciudadano a partir de la tabla ciudadanos.
insert into subsisben(ciudadano) (select nombre_ciu from ciudadanos);
-----
-- 2. Actualizar la tabla subsisben   teniendo en cuenta los siguientes datos:
--
/*
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
*/
update subsisben set nivel = (
	select case when estrato_ba='1' and ingreso_of <= (select valor_top from topes where codigo_top='T1') then '0'
				when estrato_ba='1' and ingreso_of <= (select valor_top from topes where codigo_top='T2') then '1'
				when estrato_ba='1' and ingreso_of <= (select valor_top from topes where codigo_top='T3') then '2'
				when estrato_ba='2' and ingreso_of <= (select valor_top from topes where codigo_top='T1') then '1'
				when estrato_ba='2' and ingreso_of <= (select valor_top from topes where codigo_top='T2') then '2'
				when estrato_ba='3' and ingreso_of <= (select valor_top from topes where codigo_top='T1') then '2'
				else 'N' end
	from ciudadanos join barrios on barrio_ciu=codigo_ba 
			join oficios on oficio_ciu=codigo_of
	where ciudadano=nombre_ciu);
/*
-SUB_escolar es el valor del subsidio escolar que se le da a cada HIJO (H) menor que 18 a�os asi:
 si la edad del hijo es menor que 10 a�os el subsidio escolar es el valor del atributo  val_hijo10 de la tabla de valores por cada hijo <10
 si la edad del hijo es >=10 y menor que 18 el subsidio escolar es el valor del atributo val_hijo18 de la tabla valores por cada hijo >=10 y < 18
 si le edad del hijo es >=18 el subsidio escolar es 0
*/
update subsisben set sub_escolar = (
	select sum(valor_hijos)
	from (select nombre_ciu, 
				 case when edad_fa < 10 and parent_fa='H' then (select val_hijo10 from valores) 
					  when edad_fa>=10 and edad_fa<18 and parent_fa='H' then (select val_hijo18 from valores)
					  else 0 end
				 as valor_hijos
		 from ciudadanos join familiares on cedula_ciu=ciudadano_fa) as t1
	where ciudadano=t1.nombre_ciu 
);

select nombre_ciu, count(*) from ciudadanos join familiares on ciudadano_fa=cedula_ciu
group by 1;

/*
- sub_familias es el valor del subsidio de familias en accion y se asigna asi:
      Si es nivel 0 el subsidio de familias es del 10% del valor del salario minimo  por cada persona que conforma el nucleofamiliar.
      Si es nivel 1 el subsidio de familias es del 5% del valor de� salario minimo por cada persona que conforma el nucleofamiliar.
      Si es nivel 2 el subsidio de familias es del 3% del valor del salario minimo por cada persona que conforma el nucleofamiliar.
	Si no tiene nivel el subsidio de vivienda es 0.

El nucleo familiar esta compuesto por el ciudadano y su familia
*/
update subsisben set sub_familias = (
	select case when nivel='0' 
				then (select val_salmin from valores) * 0.1 * (count(*)+1)
				when nivel='1' 
				then (select val_salmin from valores) * 0.05 * (count(*)+1)
				when nivel='2' 
				then (select val_salmin from valores) * 0.03 * (count(*)+1)
				else 0 end
	from ciudadanos join familiares on ciudadano_fa=cedula_ciu
	where ciudadano=nombre_ciu
);

-- SUB_TOTAL es la suma de los dos subsidios
update subsisben set sub_tot = sub_escolar + sub_familias;
