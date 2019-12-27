------------------------------------------
-- DATA BASE II --------------------------
------------------------------------------
-- Clase 1: 4/sep/2019
-----
-- Agregar infomacion faltante a la base de datos
alter table decanos alter column nomdecano type varchar(40);
copy decanos from 'D:\postgresql\data-base-2\decanos.csv' with(delimiter ',', header, format 'csv', encoding 'UTF-8');
---------------
-- CONDICIONALES MULTIPLES DEN SQL: case WHEN ... END
-- Permite obtener nuevos atributos basados en otros que cumple unas condiciones determinadas.
-- Permite el manejo de mltiples operaciones
-- Clasificar los estudiantes del departamento de nariño en los estratos BAJO(1,2), MEDIO(3,4), Alto(5,6).
select nomestudiante,estbarrio,nomdepto,case
	when estbarrio in ('1','2') then 'BAJO'
	when estbarrio in ('3','4') then 'MEDIO'
	else 'ALTO'
	end as tipo_estrato
from estudiantes join ciudades on ciudad=codciudad 
	join departamentos on departamento=coddepto
	join barrios on barrio=codbarrio
where lower(nomdepto) like '%ari_o%'
order by tipo_estrato;
----------
-- Visualizar las mujeres de estratos MEDIO del depratamento de nariño
-- que reprobaron lamateria bases de datos, ordenados por nota final desendente.
select nomestudiante, sexestudiante, nommateria, nfinal,case
	when estbarrio in ('1','2') then 'BAJO'
	when estbarrio in ('3','4') then 'MEDIO'
	else 'ALTO'
	end as tipo_estrato, nomdepto
from estudiantes join ciudades on ciudad=codciudad 
	join departamentos on departamento=coddepto
	join barrios on barrio=codbarrio
	join regnotas on codestudiante=estudiante
	join materias on materia=codmateria
where 
	sexestudiante='F' and 
	nommateria like ('%ase%ato%') and
	estado='R'
order by nfinal desc;
--
-- Para realizar esta onsulta de necesita que el tipo_estrato se convierta en atributo.
select * from (t1)
where tipo_estrato='BAJO'
order by ti.nfinal;
-- remplazamos ti por la consulta que genera los tipos de estratos
select * from (select nomestudiante, sexestudiante, nommateria, nfinal,case
		when estbarrio in ('1','2') then 'BAJO'
		when estbarrio in ('3','4') then 'MEDIO'
		else 'ALTO'
		end as tipo_estrato, nomdepto
	from estudiantes join ciudades on ciudad=codciudad 
		join departamentos on departamento=coddepto
		join barrios on barrio=codbarrio
		join regnotas on codestudiante=estudiante
		join materias on materia=codmateria
	where 
		sexestudiante='F' and 
		nommateria like ('%ase%ato%') and
		estado='R') as t1
where tipo_estrato='BAJO'
order by t1.nfinal;
--------------
-- Visualizar los estudiantes de bases de datos que obtuvieron
-- una nota buena, ordenados por nota final descendente.
-- la notas son:
-- 5-      EXCELENTE
-- 4 - 4.9 BUENA
-- 3 - 3.9 REGULAR
-- 2 - 2.9 MALA
-- < 2     PESIMA
-------
-- Obtenemos el select interno con la clasificacion de notas.
select nomestudiante,nommateria,nfinal,case 
	when nfinal=5.0 then 'EXCELENTE'
	when nfinal between 4.0 and 4.9 then 'BUENO'
	when nfinal between 3.0 and 3.9 then 'REGULAR'
	when nfinal between 2.0 and 2.9 then 'MALA'
	else 'PESIMA'
	end as nota_cuali
from estudiantes join regnotas on codestudiante=estudiante
	join materias on materia=codmateria
where nommateria like('%ase%ato%')
order by nfinal;
-------
-- Creamos la tabla virtual utilizando select anidados, donde en el select interno
-- insertamos la consulta categorizada anteriormente.
select * from (select nomestudiante,nommateria,nfinal,case 
		when nfinal=5.0 then 'EXCELENTE'
		when nfinal between 4.0 and 4.9 then 'BUENO'
		when nfinal between 3.0 and 3.9 then 'REGULAR'
		when nfinal between 2.0 and 2.9 then 'MALA'
		else 'PESIMA'
		end as nota_cuali
	from estudiantes join regnotas on codestudiante=estudiante
		join materias on materia=codmateria
	where nommateria like('%ase%ato%')) as t1
where t1.nota_cuali='BUENO'
order by t1.nfinal;
---------------
-- Taller clase
---------------
-- Visualizar los estudiantes de la region pasifica que matricularon a la vez
-- las materias ingenieria de software y programacion orientada a objetos
-- ordenados por ciudad.
-- Las regiones pasificas son:
--   ATLANTICA: Atl�ntico, Bolivar, Cesar, Cordoba, Guajira, Magdalena, San Andr�s y Sucre.
--   ORINOQUIA: Amazonas, Arauca, Casanare, Guainia, Guaviare, Putumayo, Vaupes, y Vichada
--   ORIENTE: Boyac�, Cundinamarca, Norete de Santander, Santander, y Meta
--   CENTRAL: Caldaas, Risaralda, Quindio, Huila, Tolima y Caqueta
--   PACIFICA: Cauca, Choco, Nari�o, y Valle del Cauca
--   BOGOTA: Bogot�
--   ANTIOQUIA: Antioquia

--Solucion Charlie
select *
from (
	select t1.nomestudiante,t1.nomciudad,case
		when lower (t1.nomdepto) like('%tl_ntico%') or 
			 lower (t1.nomdepto) like('%olivar%') or   
			 lower (t1.nomdepto) like('%esar%') or
			 lower (t1.nomdepto) like('%ordoba%') or 
			 lower (t1.nomdepto) like('%uajira%') or
			 lower (t1.nomdepto) like('%agdalena%') or 
			 lower (t1.nomdepto) like('%an%ndr_s%') or
			 lower (t1.nomdepto) like('%ucre%') then 'ATLANTICA'
		when lower (t1.nomdepto) like('%mazonas%') or 
			 lower (t1.nomdepto) like('%rauca%') or   
			 lower (t1.nomdepto) like('%asanare%') or
			 lower (t1.nomdepto) like('%uainia%') or 
			 lower (t1.nomdepto) like('%uaviare%') or
			 lower (t1.nomdepto)like('%utumayo%') or 
			 lower (t1.nomdepto) like('%aupes%') or
			 lower (t1.nomdepto) like('%ichada%') then 'ORINOQUIA'
		when lower (t1.nomdepto) like('%oyac_%') or 
			 lower (t1.nomdepto) like('%undinamarca%') or   
			 lower (t1.nomdepto) like('%orte%antander%') or
			 lower (t1.nomdepto) like('%antander%') or 
			 lower (t1.nomdepto) like('%eta%') then 'ORIENTE'
		when lower (t1.nomdepto) like('%aldas%') or 
			 lower (t1.nomdepto) like('%isaralda%') or   
			 lower (t1.nomdepto) like('%uindio%') or
			 lower (t1.nomdepto) like('%uila%') or 
			 lower (t1.nomdepto) like('%olima%') or 
			 lower (t1.nomdepto) like('%aqueta%') then 'CENTRAL'
		when lower (t1.nomdepto) like('%auca%') or 
			 lower (t1.nomdepto) like('%hoco%') or   
			 lower (t1.nomdepto) like('%ari_o%') or
			 lower (t1.nomdepto) like('%alle%auca%') then 'PASIFICA'
		when lower (t1.nomdepto) like('%ogot_%') then 'BOGOTA'
		when lower (t1.nomdepto) like('%ntioquia%') then 'ANTIOQUIA'
		else 'OTHER'
		end as region
	from (estudiantes join ciudades on ciudad=codciudad
			join departamentos on departamento=coddepto
			join regnotas on codestudiante=estudiante
			join materias on materia=codmateria) as t1
		join (estudiantes join ciudades on ciudad=codciudad
			join departamentos on departamento=coddepto
			join regnotas on codestudiante=estudiante
			join materias on materia=codmateria) as t2
		on t1.codestudiante = t2.codestudiante
	where t1.nommateria like '%rogramaci_n%O_O%' and 
			t2.nommateria like '%oftware%'
) as t3
where region='PASIFICA'
order by t3.nomciudad;
--============================================
-- FUNCIONES AGREGADAS
-- ===========================================
--------------------
-- COUNT(<attribute>)
--------------------
-- Visualizar el numero total de estudiantes
select count(*) as numest
from estudiantes;
------
-- visualizar el numero total de estudiantes del programa de ingenieria de sistemas.
select count(*) as estsistemas
from estudiantes join programas on programa=codprograma
where nomprograma like('%istem%');
------
-- visualizar el numero de estudiantes que reprobaron bases de datos
select 'Reprobados db' as detalle, count(*) as numero
from estudiantes join regnotas on codestudiante=estudiante join materias on materia=codmateria
where nommateria like('%ase%ato%') and estado='R';

-- Visualizar el porcentaje de estudiantes de la ciudad de pasto.
-- 1- calcular el numero total de estudiantes
select count(*) as pastusos
from estudiantes join ciudades on ciudad=codciudad;
-- 2- Calcular el numero de estudiantes pastusos.
select count(*) as pastusos
from estudiantes join ciudades on ciudad=codciudad
where nomciudad like('%asto%');
-- 3- calcular el porcentaje 
select (select count(*)
	from estudiantes join ciudades on ciudad=codciudad
	where nomciudad like('%asto%'))*100/
	(select count(*)
	from estudiantes join ciudades on ciudad=codciudad) 
as porcentaje_pastusos;
------
-- visualizar el numero de hombres y el numero de mujeres de la facultad de ingenieria.
select 'Hombres' as sexo, count(*) as numero
from estudiantes join programas on programa=codprograma
	join facultades on facultad=codfacultad
where nomfacultad like '%genier%' and
	sexestudiante='M'
union
select 'Mujeres' as sexo, count(*) as numero
from estudiantes join programas on programa=codprograma
	join facultades on facultad=codfacultad
where nomfacultad like '%genier%' and
	sexestudiante='F'
order by 1 desc;
-- vosualizar el numero de mujeres y el numero de hombres que 
-- matricularon bases de datos con su respectivo porcentaje
-- ordenado por el mayor porcentaje
select 'Hombres' as sexo, count(*) as numero, (select (select count(*)
	from estudiantes join regnotas on codestudiante=estudiante join materias on materia=codmateria
	where nommateria like('%ase%atos%') and sexestudiante='M')*100/
	(select count(*)
	from estudiantes join regnotas on codestudiante=estudiante join materias on materia=codmateria
	where nommateria like('%ase%atos%')) 
as porcentaje)
from estudiantes join regnotas on codestudiante=estudiante join materias on materia=codmateria
where nommateria like('%ase%atos%') and
	sexestudiante='M'
union
select 'Mujeres' as sexo, count(*) as numero, (select (select count(*)
	from estudiantes join regnotas on codestudiante=estudiante join materias on materia=codmateria
	where nommateria like('%ase%atos%') and sexestudiante='F')*100/
	(select count(*)
	from estudiantes join regnotas on codestudiante=estudiante join materias on materia=codmateria
	where nommateria like('%ase%atos%')) 
as porcentaje)
from estudiantes join regnotas on codestudiante=estudiante join materias on materia=codmateria
where nommateria like('%ase%atos%') and
	sexestudiante='F'
order by 3 desc;
-----
-- count(<att>): no cuenta los valores nulos del atributo
insert into estudiantes (codestudiante,nomestudiante,barrio,ciudad,programa)
	values('4000','Alejandro Useche','101','52001','01');
-----
-- VIsualizar cuantos estudiantes de la ciudad de Pasto hay
 select count(sexestudiante) as men_pasto 
 from estudiantes join ciudades on ciudad=codciudad
 where nomciudad like('%asto%');
/*
 * Anterior a este ejemplo de inserto un estudiante sin su sexo, y al realizar el count(*) cuanta todos los estudiantes
 * en este caso 57 estudiantes de pasto, pero al realizar count(<attribute>) no cuenta los valores nulos encontrados en esa
 * columna, que para este ejemplo de busco por sexo del estudiante y se obtubo 56.
 */
----
-- count(distinct <attribute>) cuantos valores distintos hay en ese atrobuto
-- visualizar de cuantas doferentes ciudades provienen los estudiantes
select count(distinct codciudad) 
from ciudades join estudiantes on codciudad=ciudad;
-- visualizar los valores distintos de sexo
select count(distinct sexestudiante)
from estudiantes;
-- visualizar los valores distintos en la edad
select count(distinct edaestudiante)
from estudiantes;
-- 
------------
-- SUM(attibute): obtener totales
------------
-- visualizar la suma de las edades de las mujeres de pasto 
-- y de los hombres por separado
select 'Women' as sexo, sum(edaestudiante) as sum_age 
from estudiantes join ciudades on ciudad=codciudad
where sexestudiante='F' and nomciudad like('%asto%')
union
select 'Men' as sexo, sum(edaestudiante) as sum_age 
from estudiantes join ciudades on ciudad=codciudad
where sexestudiante='M' and nomciudad like('%asto%')
union
select 'All' as sexo, sum(edaestudiante) as sum_age 
from estudiantes join ciudades on ciudad=codciudad
where nomciudad like('%asto%')
order by sum_age;
--- 2 forma
select 'Women' as sexo, sum(edaestudiante) as sum_age 
from estudiantes join ciudades on ciudad=codciudad
where sexestudiante='F' and nomciudad like('%asto%')
	union
select 'Men' as sexo, sum(edaestudiante) as sum_age 
from estudiantes join ciudades on ciudad=codciudad
where sexestudiante='M' and nomciudad like('%asto%')
	union
select 'All' as sexo, sum(t1.sum_age)
from (select 'Women' as sexo, sum(edaestudiante) as sum_age 
	from estudiantes join ciudades on ciudad=codciudad
	where sexestudiante='F' and nomciudad like('%asto%')
	union
	select 'Men' as sexo, sum(edaestudiante) as sum_age 
	from estudiantes join ciudades on ciudad=codciudad
	where sexestudiante='M' and nomciudad like('%asto%')) as t1
order by sum_age;
----
-- visualizar el numero de estudiantes del programa de 
-- ingenieria de sistemas  y el numero de estudiantes
-- de ingenieria Agroforestal que matricularon based de datos y totalizar
select 'Ing Sistemas' as programa, count(nomestudiante) as num
from estudiantes join regnotas on codestudiante=estudiante 
	join materias on materia=codmateria
	join programas on programa=codprograma
where nomprograma like('%istemas%') and nommateria like('%ase%atos%')
union
select 'Ing Electronica' as programa, count(nomestudiante) as num
from estudiantes join regnotas on codestudiante=estudiante 
	join materias on materia=codmateria
	join programas on programa=codprograma
where nomprograma like('%groforest%') and nommateria like('%ase%atos%')
union
select 'All' as programa, sum(t1.num)
from (select 'Ing Sistemas' as programa, count(nomestudiante) as num
	from estudiantes join regnotas on codestudiante=estudiante 
		join materias on materia=codmateria
		join programas on programa=codprograma
	where nomprograma like('%istemas%') and nommateria like('%ase%atos%')
	union
	select 'Ing Agroforestal' as programa, count(nomestudiante) as num
	from estudiantes join regnotas on codestudiante=estudiante 
		join materias on materia=codmateria
		join programas on programa=codprograma
	where nomprograma like('%groforest%') and nommateria like('%ase%atos%')) as t1
order by 2;
----------------------------------
--
-- visualizar la nota promedio en la materia de bases de datos de los estudiantes
-- de los estudiantes de ingenieria de sistemas
select round(sum(nfinal)/count(*), 2) as npromedio
from estudiantes join regnotas on codestudiante=estudiante
		join materias on materia=codmateria 
		join programas on programa=codprograma
where nomprograma like '%istem%' and 
	nommateria like '%ase%atos%';
----------
-- AVG(<attri>): Funcion que calcula el promedio de el valor del atrobuto
----------
-- visualizar la nota promedio en la materia de bases de datos de los estudiantes
-- de los estudiantes de ingenieria de sistemas
select round(avg(nfinal), 2) as npromedio
from estudiantes join regnotas on codestudiante=estudiante
		join materias on materia=codmateria 
		join programas on programa=codprograma
where nomprograma like '%istem%' and 
	nommateria like '%ase%atos%';
----
-- visualizar el numero de mujeres y su edad promedio y de  igual manera
-- el numero de honbres y su edad promedio de todos los estudiantes
-- de la ciudad de Pasto y totalizar
select 'Mujeres' as sexo, round(avg(edaestudiante)) as nedad
from estudiantes join ciudades on ciudad=codciudad
where nomciudad like '%asto%' and sexestudiante='F'
union 
select 'Hombres' as sexo, round(avg(edaestudiante)) as nedad
from estudiantes join ciudades on ciudad=codciudad
where nomciudad like '%asto%' and sexestudiante='M'
union
select 'Total' as sexo, round(avg(edaestudiante)) as nedad
from estudiantes join ciudades on ciudad=codciudad
where nomciudad like '%asto%';
---------------
-- MAX(<attri>) y min(<attri>): Permiten obtener el valor maximo y el valor minimo
-- de un atributo numerico.
---------------
-- Visualizar cual fue la nota maxima y la nota minima de los estudiantes de ing de sistemas 
-- en la materia bases de datos.
select 'Maximo' as category, max(nfinal) as value 
from estudiantes join regnotas on codestudiante=estudiante
	join materias on materia=codmateria join programas on programa=codprograma
where nommateria like '%ase%atos%' and nomprograma like '%istem%'
union
select 'Minimo' as category, min(nfinal) as value 
from estudiantes join regnotas on codestudiante=estudiante
	join materias on materia=codmateria join programas on programa=codprograma
where nommateria like '%ase%atos%' and nomprograma like '%istem%';
----
-- visalizar el numero de estudiantes , la nota promedio, la nota maxima y la nota minima
-- del programa de ing sistemas
select count(distinct estudiante) as num_estu, round(avg(nfinal), 2) as nfinal, max(nfinal) as maximo, min(nfinal) as minimo
from estudiantes join programas on programa=codprograma 
	join regnotas on codestudiante=estudiante
where nomprograma like '%istem%';
-------------------------
-- Agrupamiento con funciones agregadas
-------------------------
/*
 * GROUP BY(<attr>) permite obtener 
 * Todo atributo que este acompa�ado de una funciona agregada debe ir 
 * en la clausula group by y no viceversa, es decir, todo atributo 
 * que va en el group by no necesariamente debe estar en selest
 */
-- 
select nomprograma, round(avg(nfinal), 2)
from estudiantes join programas on programa=codprograma
	join regnotas on codestudiante=estudiante
group by nomprograma;
--
--visualizar el numero de estudiantes, la nota promedio, la nota maxima y la nota minima por programa
-- ordenados por nota promedio dese
select nomprograma, count(distinct codestudiante) as num_estu, round(avg(nfinal), 2) as n_promedio, max(nfinal) as maximo, min(nfinal) as minimo
from estudiantes join programas on programa=codprograma 
	join regnotas on codestudiante=estudiante
group by nomprograma
order by 1 desc;
----
--visualizar el numero de estudiantes, la nota promedio, la nota maxima y la nota minima por programa y sexo
-- ordenados por nota promedio dese
select nomprograma, sexestudiante as sexo, count(distinct codestudiante) as num_estu, round(avg(nfinal), 2) as n_promedio, max(nfinal) as maximo, min(nfinal) as minimo
from estudiantes join programas on programa=codprograma 
	join regnotas on codestudiante=estudiante
group by nomprograma, sexo
order by 1,2 desc;
----
-- VIsualizar el numero de estudiantes y su porcentaje de aquellos
-- que aprobaron y reprobaron bases de datos.
-- discriminados(agrupado) por sexo.

-- enviar a siritiper@gmail.com hasta las 12 de la noche en pdf(resultado y orden)

select estado, sexestudiante, count(*) num_est, 
		count(*)*100/(select count(*) 
					from estudiantes join regnotas on codestudiante=estudiante 
						join materias on materia=codmateria 
					where nommateria like '%ase%atos%') as porcent
from estudiantes join regnotas on codestudiante=estudiante
	join materias on materia=codmateria
where nommateria like '%ase%atos%'
group by estado, sexestudiante; 

-- Soucion con redondeo
select sexestudiante, estado, count(*), 
round((count(*)*100/(select count(*) 
	from estudiantes join regnotas on codestudiante=estudiante join materias on materia=codmateria
	where nommateria like '%ase%atos%')::numeric), 2) as porcentaje
from estudiantes join regnotas on codestudiante=estudiante join materias on materia=codmateria
where nommateria like '%ase%atos%'
group by sexestudiante, estado;

--===================================
-- RESTRICCIONES EN FUNCIONES AGREGADAS
--===================================
----
-- Visualizar las ciudades cuyo numero de estudiantes sea mayor que 45, ordenados
-- por numero de estudiantes desecendentemente
select nomciudad as ciudad, count(*) as num_estudiantes
from ciudades join estudiantes on codciudad=ciudad
group by 1
having count(*)>45
order by 2 desc;
----
-- Visualizar los estudiantes de ingenieria cuya nota promedio sea menor que la
-- nota promedio del programa de ingneieria de sistemas
select round(avg(nfinal),2) 
from programas join estudiantes on codprograma=programa
		join regnotas on codestudiante=estudiante
where nomprograma like '%istem%';
-- resultado 2.93
select nomestudiante,round(avg(nfinal),2) as promedio
from programas join estudiantes on codprograma=programa
		join regnotas on codestudiante=estudiante
where nomprograma like '%istem%'
group by nomestudiante
having round(avg(nfinal), 2) < (select round(avg(nfinal),2) 
		from programas join estudiantes on codprograma=programa
			join regnotas on codestudiante=estudiante
		where nomprograma like '%istem%')
;		
-- visualizar el numero de estudiantes y de nota promedio de aquellos programas
-- cuyo numero de estudiantes es mayor que 15 y la nota promedio mayor que 2.9
-- ordenado por numero de estudiantes
select nomprograma, count(*) as nestudoantes, round(avg(nfinal),2) as promedio
from programas join estudiantes on codprograma=programa
		join regnotas on codestudiante=estudiante
group by 1
having count(*) > 15 and round(avg(nfinal),2) > 2.9
order by 2 desc;
----
-- Visualizar las materias cuya nota promedio es mayor que
-- la nota promedio de la materia bases de datos
-- ordenado por nota promedio desendente.
select nommateria as materia,
round(avg(nfinal),2) as promedio 
from regnotas join materias on materia=codmateria
group by 1
having round(avg(nfinal)) > (select round(avg(nfinal),2) from regnotas join materias on materia=codmateria where nommateria like '%ase%ato%')
order by 2 desc;
--============================
-- ANIDAMIENTO DE FUCIONES AGREFADAS
--============================
----
-- Visualizar cual programa tiene la mayor nota promedio
select nommateria, round(avg(nfinal)) as promedio
from  regnotas join materias on materia=codmateria
group by 1;
----
-- Visualizar cuales estudiantes de ingenieria de sisemas 
-- tienen la menor nota promedio ordenados alfabeticamente
select nomestudiante, round(avg(nfinal),2) as promedio
from estudiantes join programas on programa=codprograma
join regnotas on codestudiante=estudiante
where nomprograma like '%istem%'
group by 1
having round(avg(nfinal),2)= (select min(t1.promedio)from (select nomestudiante, round(avg(nfinal),2) as promedio from estudiantes join programas on programa=codprograma
join regnotas on codestudiante=estudiante 
where nomprograma like '%istem%'
group by 1) as t1);
/*
 * SUBQUERIES CON FUNCIONES AGREGADAS
 */
-- Visualizar cuales estudiantes de bases de datos tiene nota final
-- mayor que la nota promedio de bases de datos, ordenado por nota final
-- desendente
----
-- paso 1: Calcular la nota promedio 
select round(avg(nfinal),2)
from regnotas join materias on materia=codmateria
where nommateria like '%ase%ato%';
-- resultado 2.87
-- Paso2: calcular los estudiantes y la nota final
-- en bd es mayor que 2.87
select nomestudiante,nommateria,nfinal
from regnotas join materias on materia=codmateria 
		join estudiantes on estudiante=codestudiante
where  nommateria like '%ase%ato%'and 
		nfinal>(2.87)
order by 3 desc;
-- paso final. Reemplazar 2.87 por la orden que lo genero 
select  nomestudiante,nommateria,nfinal
from regnotas join materias on materia=codmateria 
	join estudiantes on estudiante=codestudiante
where  nommateria like '%ase%ato%' and 
		nfinal >(select round(avg(nfinal),2)
					from regnotas join materias on materia=codmateria
					where nommateria like '%ase%ato%')
order by 3 desc;
--
----------------------------------------------------------------
-- Visualizar la nota promedio de los estudiantes de Ingenieria 
-- de Sistemas que no matricularon la materia base de datos
---- 
-- 1 forma:left join
-- paso 1. Visualizar todos los estudiantes de Ingenieria de Sistemas
-- que no matricularon base de datos
select nomestudiante,nomprograma,nommateria
from 	(estudiantes join programas on programa=codprograma and nomprograma like '%istem%')
	left join 
		(regnotas join materias on materia=codmateria and nommateria like '%ase%ato%')
	on codestudiante=estudiante
where nommateria is null
order by 3;
--
-- paso final. Calcular la nota promedio de estos estudiantes
select round(avg(nfinal),2) as promedio
from (	select codestudiante,nomestudiante,nomprograma,nommateria
		from (estudiantes join programas on programa=codprograma and nomprograma like '%istem%')
		left join
			(regnotas join materias on materia=codmateria and nommateria like '%ase%ato%')
		on codestudiante=estudiante 
		where nommateria is null) t1 
	join regnotas on t1.codestudiante=estudiante;
----
-- Visualizar cuales estudiantes de Ingenieria de Sistemas que no matricularon
-- bases de datos tienen su nota promedio mayor que la nota promedio de los estudiantes
-- de Ingenieria de Sistemas que no matricularon bases de datos (en este caso 2.94).

<<<<<<< HEAD
-- paso 1. Visualizar la nota final de cada estudiante de Ing. de Sistemas
-- que no matricularon bases de datos.
select t1.nomestudiante,nfinal
from  (select codestudiante,nomestudiante,nomprograma,nommateria
	   from (estudiantes join programas on programa=codprograma and nomprograma like '%istem%')
	   	  left join
	   	  	(regnotas join materias on materia=codmateria and nommateria like '%ase%ato%')
		  on codestudiante=estudiante
	   where nommateria is null) t1 
	join regnotas on t1.codestudiante=estudiante
order by 1;
-- paso 2. Visualizar la nota promedio de cada estudiante de Ing. de Sistemas
-- que no matricularon bases de datos.
select  t2.nomestudiante,round(avg(nfinal),2) as promedio
from (select t1.nomestudiante,nfinal
=======

-->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
/*
* Visualizar cuales estudiantes de Ingenieria de Sistemas que no matricularon
* ni bases de datos ni Telem�tica tienen su nota promedio menor que la nota promedio
* de los estudiantes de Ingenieria de Sistemas que no matricularon
* ni bases de datos ni telem�tica
* enviar a siritiper@gmail.com hasta el lunes 14 de octubre a las 6 pm.
*/
-- Paso final
select t3.nomestudiante,round(avg(nfinal), 2)
from (select t1.codestudiante,t1.nomestudiante,t1.nomprograma
>>>>>>> 6123d85a5c670995cf47589b9511f18f9f77a9f4
	  from (select codestudiante,nomestudiante,nomprograma,nommateria
			from (estudiantes join programas on programa=codprograma and nomprograma like '%istem%')
			  left join
				(regnotas join materias on materia=codmateria and nommateria like '%ase%ato%')
			  on codestudiante=estudiante
	  		where nommateria is null) t1 join regnotas on t1.codestudiante=estudiante) t2
group by 1
order by 1;
-- paso 3. Visualizar los estudiantes que no matricularon base de datos cuya 
-- nota promedio es mayor que 2.94
select t2.nomestudiante,round(avg(t2.nfinal),2) as promedio
from (select t1.nomestudiante,nfinal
		from (select codestudiante,nomestudiante,nomprograma,nommateria
			  from (estudiantes join programas on programa=codprograma and nomprograma like '%istem%')
			    left join
					(regnotas join materias on materia=codmateria and nommateria like '%ase%ato%')
				on codestudiante=estudiante
			  where nommateria is null) t1 
		join regnotas on t1.codestudiante=estudiante) t2
group by 1
having round(avg(nfinal),2)>(2.94)
order by 1;
--------------------------------------------------------------------------------------
-- paso final. Reemplazar el 2.94 por la orden que lo genero
select  t2.nomestudiante,round(avg(t2.nfinal),2) as promedio
from (select t1.nomestudiante,nfinal
	  from  (select codestudiante,nomestudiante,nomprograma,nommateria
             from (estudiantes join programas on programa=codprograma and nomprograma like '%istem%')
				left join
					(regnotas join materias on materia=codmateria and nommateria like '%ase%ato%')
				on codestudiante=estudiante
			 where nommateria is null) t1 
	  join regnotas on t1.codestudiante=estudiante) t2
group by 1
having round(avg(nfinal),2) > (select round(avg(nfinal),2) as promedio
								from (select codestudiante,nomestudiante,nomprograma,nommateria
									  from (estudiantes join programas on programa=codprograma and nomprograma like '%istem%')
										left join
											(regnotas join materias on materia=codmateria and nommateria like '%ase%ato%')
										on codestudiante=estudiante
									  where nommateria is null) t1 
								join regnotas on t1.codestudiante=estudiante)
order by 1;
--=========================================================================
/*
 * Visualizar cuales estudiantes de Ingenieria de Sistemas que no matricularon
 * ni bases de datos ni  Telemática tienen su nota promedio menor que la nota promedio 
 * de los estudiantes de Ingenieria de Sistemas que no matricularon 
 * ni bases de datos ni telemática
 * enviar a siritiper@gmail.com hasta el lunes 14 de octubre a las 6 pm.
*/
----
-- Estudiantes de ingenieria de sistemas que no matricularon bases de datos y telematica
select *
from 
		(select codestudiante,nomestudiante,nomprograma,nommateria
		from (estudiantes join programas on programa=codprograma and nomprograma like '%istem%')
			left join 
			  (regnotas join materias on materia=codmateria and nommateria like '%ase%ato%')
			on codestudiante=estudiante
		where nommateria is null) as t1
	join 
		(select codestudiante,nomestudiante,nomprograma,nommateria
		from (estudiantes join programas on programa=codprograma and nomprograma like '%istem%')
			left join 
			  (regnotas join materias on materia=codmateria and nommateria like '%elem_tic%')
			on codestudiante=estudiante
		where nommateria is null) as t2
	on t1.codestudiante=t2.codestudiante;
-- Visualizar la nota final de los estudiantes que no matriuclaron telematica ni bases de datos
select t3.nomestudiante,nfinal
from (select t1.codestudiante,t1.nomestudiante,t1.nomprograma
	  from 
		(select codestudiante,nomestudiante,nomprograma,nommateria
		from (estudiantes join programas on programa=codprograma and nomprograma like '%istem%')
			left join 
			  (regnotas join materias on materia=codmateria and nommateria like '%ase%ato%')
			on codestudiante=estudiante
		where nommateria is null) as t1
	  join 
		(select codestudiante,nomestudiante,nomprograma,nommateria
		from (estudiantes join programas on programa=codprograma and nomprograma like '%istem%')
			left join 
			  (regnotas join materias on materia=codmateria and nommateria like '%elem_tic%')
			on codestudiante=estudiante
		where nommateria is null) as t2
	  on t1.codestudiante=t2.codestudiante) as t3
	join 
	  regnotas on estudiante=t3.codestudiante
;
-- Visualizar el promedio de nota de los estudiantes que no matricularon bases de datos ni telematica
select t3.nomestudiante,round(avg(nfinal), 2)
from (select t1.codestudiante,t1.nomestudiante,t1.nomprograma
	  from 
		(select codestudiante,nomestudiante,nomprograma,nommateria
		from (estudiantes join programas on programa=codprograma and nomprograma like '%istem%')
			left join 
			  (regnotas join materias on materia=codmateria and nommateria like '%ase%ato%')
			on codestudiante=estudiante
		where nommateria is null) as t1
	  join 
		(select codestudiante,nomestudiante,nomprograma,nommateria
		from (estudiantes join programas on programa=codprograma and nomprograma like '%istem%')
			left join 
			  (regnotas join materias on materia=codmateria and nommateria like '%elem_tic%')
			on codestudiante=estudiante
		where nommateria is null) as t2
	  on t1.codestudiante=t2.codestudiante) as t3
	join 
	  regnotas on estudiante=t3.codestudiante
group by 1;  
	
-- Paso final
select t3.nomestudiante,round(avg(nfinal), 2)
from (select t1.codestudiante,t1.nomestudiante,t1.nomprograma
	  from 
		(select codestudiante,nomestudiante,nomprograma,nommateria
		from (estudiantes join programas on programa=codprograma and nomprograma like '%istem%')
			left join 
			  (regnotas join materias on materia=codmateria and nommateria like '%ase%ato%')
			on codestudiante=estudiante
		where nommateria is null) as t1
	  join 
		(select codestudiante,nomestudiante,nomprograma,nommateria
		from (estudiantes join programas on programa=codprograma and nomprograma like '%istem%')
			left join 
			  (regnotas join materias on materia=codmateria and nommateria like '%elem_tic%')
			on codestudiante=estudiante
		where nommateria is null) as t2
	  on t1.codestudiante=t2.codestudiante) as t3
	join 
	  regnotas on estudiante=t3.codestudiante
group by 1
having round(avg(nfinal),2) < 
		(select round(avg(nfinal), 2)
		from (select t1.codestudiante,t1.nomestudiante,t1.nomprograma
			  from (select codestudiante,nomestudiante,nomprograma,nommateria
					from (estudiantes join programas on programa=codprograma and nomprograma like '%istem%')
						left join
							(regnotas join materias on materia=codmateria and nommateria like '%ase%ato%')
						on codestudiante=estudiante
					where nommateria is null) as t1
				join
					(select codestudiante,nomestudiante,nomprograma,nommateria
					 from (estudiantes join programas on programa=codprograma and nomprograma like '%istem%')
						left join
							(regnotas join materias on materia=codmateria and nommateria like '%elem_tic%')
						on codestudiante=estudiante
					where nommateria is null) as t2
				on t1.codestudiante=t2.codestudiante) as t3
			join
				regnotas on estudiante=t3.codestudiante)
	order by 1;
-->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
-- VISTAS
---------
create or replace view estu_is_bd as 
select * 
from programas join estudiantes on codprograma=programa join regnotas on codestudiante=estudiante
	join materias on materia=codmateria
where nomprograma like '%istem%' and
		nommateria like '%ase%atos%';
--------
-- consulta de las vistas
-- visualizar los estudiantes de Pasto de 
-- sistemas que reprobaron bases de datos
select nomestudiante,nomciudad,nommateria,nfinal,nomprograma
from estu_is_bd join ciudades on ciudad=codciudad
where nomciudad like '%asto%' and
	estado = 'R'
order by 1;
----
-- visualizar el nombre, sexo y edad y el programa de las estudiantes
-- de ing de sistemas menores que 22 a�os que miran bases de datos 
-- ordenados desendentemente por a�o.
select nomestudiante,sexestudiante,edaestudiante,nomprograma
from estu_is_bd
where sexestudiante='F' and edaestudiante < 22 
order by 3;
----
-- se actualiza el sexo del estudiante Daniel Toro
update estudiantes set sexestudiante='M'
where nomestudiante like 'Daniel%oro%';
----
create or replace view estu_is_tm as
select nomestudiante as nombre,
	nomprograma as programa,
	nommateria as materia,
	nfinal as final
from estudiantes join programas on programa=codprograma
	join regnotas on codestudiante=estudiante
	join materias on materia=codmateria
where nomprograma like '%istem%' and
	nommateria like '%elem_ti%'
order by 4 desc;
----
-- Eliminar una vista
drop view estu_is_tm;
----
-- Corregir el error y ejecutar siempre y cuando 
-- tenga la clausula replace-
----
select *
from estu_is_tm;
-----
-- visualizar los estudiantes de ingenieria de sistemas que matricularon
-- a la vez bases de datos y telematica
select nomestudiante,sexestudiante
from estu_is_bd join estu_is_tm on nomestudiante=nombre
order by 2;
-- con intersect 
select nomestudiante,nomprograma
from estu_is_bd 
intersect 
select nombre,programa
from estu_is_tm
order by 1;
-----
create or replace view estu_is_bdtm as 
select t1.nomestudiante,t1.sexestudiante,t1.nomprograma,t1.nommateria
from estu_is_bd as t1 join estu_is_tm as t2 on t1.nomestudiante=t2.nombre;
----
--------------------------------------------------------------------------------------
-- Creaci�n de vistas con otras vistas
--------------------------------------------------------------------------------------
-- Crear una vista con los estudiantes de ingenieria de sistemas
-- que matricularon a la vez base de datos y telem�tica
create or replace view estu_is_bdtm as
select t1.nomestudiante, t1.nomprograma, t1.nommateria,t2.materia
from
estu_is_bd t1 join estu_is_tm t2  on t1.nomestudiante=t2.nombre
order by 1;
--------------------------------------------------------------------------------------
-- Visualizar los estudiantes de ingenieria de sistemas que matricularon materias
-- pero no matricularon ni base de datos ni telematica
--------------------------------------------------------------------------------------
-- 1 forma
select distinct  
nomestudiante, nomprograma
from 
estudiantes join programas on programa=codprograma
join regnotas on codestudiante=estudiante
where nomprograma like '%istem%'
except
select nomestudiante, nomprograma
from estu_is_bdtm 
order by 1;
-- 2 forma 
select distinct  
t1.nomestudiante, t1.nomprograma
from 
(estudiantes join programas on programa=codprograma
join regnotas on codestudiante=estudiante and nomprograma like '%istem%') t1
left join 
estu_is_bdtm  t2 on t1.nomestudiante=t2.nomestudiante
where
t2.materia is null
order by 1;
--------------------------------------------------------------------------------------
-- VISTAS CON AGRUPAMIENTO Y AGREGACI�N
--------------------------------------------------------------------------------------
-- Visualizar la nota promedio de los estudiantes que matricularon a la vez
-- base de datos y telematica
select 
t1.nomestudiante, round(avg(t3.nfinal),2) as promedio
from
estu_is_bdtm t1 join estudiantes t2 on t1.nomestudiante=t2.nomestudiante
join regnotas t3 on t2.codestudiante=t3.estudiante
group by 1
order by 2 desc;
--------------------------------------------------------------------------------------
-- Visualizar los estudiantes de Ing. sistemas que matricularon a la vez
-- base de datos y telematica y la nota promedio es mayor que la nota promedio
-- de los estudiantes que matricularon base de datos y telematica
-- ordenados por nota promedio
--------------------------------------------------------------------------------------
-- 1 paso: calular nota promedio de los estudiantes
-- de ingenieris de sistemas que matricularon bases de datos
-- y telematica 
select round(avg(nfinal),2) as promedio
from estu_is_bdtm t1 join estudiantes t2 on t1.nomestudiante=t2.nomestudiante
	join regnotas t3 on t2.codestudiante=t3.estudiante
	join programas t4 on t1.nomprograma=t4.nomprograma;
-----
-- Viisualizar los estudiantes con un promedio de nota mayor a 3.01
select t1.nomestudiante, round(avg(nfinal),2) as promedio
from estu_is_bdtm t1 join estudiantes t2 on t1.nomestudiante=t2.nomestudiante
	join regnotas t3 on t2.codestudiante=t3.estudiante
	join programas t4 on t1.nomprograma=t4.nomprograma
group by 1 
having round(avg(nfinal),2) > (select round(avg(nfinal),2) as promedio
from estu_is_bdtm t1 join estudiantes t2 on t1.nomestudiante=t2.nomestudiante
	join regnotas t3 on t2.codestudiante=t3.estudiante
	join programas t4 on t1.nomprograma=t4.nomprograma);
	
---------
-- SUBQUERIES EN CLAUSILA select
---------
-- Visualizar los estudiantes de la facultad de ingenieria 
-- que matricularon materias pero que no matricularon
-- bases de datos y telematica.
select distinct nomestudiante,nomprograma,nomfacultad
from facultades join programas on codfacultad=nomfacultad
	join estudiantes on programa=codprograma
	join regnotas on codestudiante=estudiante
where nomfacultad like '%gen_er_a%' and 
	codestudiante not in (select codestudiante 
						  from estudiantes join regnotas on codestudiante=estudiante
						  		join materias on materia=codmateria
						  where nommateria like '%ase%ato%') and
	codestudiante not in (select codestudiante 
						  from estudiantes join regnotas on codestudiante=estudiante
						  		join materias on materia=codmateria
						  where nommateria like '%elem_tic%');
--- visualizar loes estudiantes de ingenieria de sistemas
-- cuya nota final en bases de datos es menor que la nota promedio
-- que la materia bades de datos, ordenado por nota final.
select nomestudiante,nommateria,nfinal,nomprograma
from estudiantes join regnotas on codestudiante=estudiante
join materias on materia=codmateria
join programas on programa=codprograma
where nomprograma like '%istem%' and 
	nommateria like '%ase%ato%' and 
	nfinal < (select round(avg(nfinal),2)
				from regnotas join materias on materia=codmateria
					where nommateria like '%ase%ato%')
order by 3;

-- clasficar a los estudiantes de ingenieria de sistemas que matricularon
-- bases de datos en:
--	Sobre la media
--	Bajo la media
-- en el caso que la nota final sea igual o mayor que la media respectivament
-- ordenados por nfinal

-- (1) promedio nfin al de bases de datos
select round(avg(nfinal),2)
from regnotas join materias on materia=codmateria
where nommateria like '%ase%atos%';
----
select nomestudiante, nfinal, case when nfinal >= (select round(avg(nfinal),2)
								from regnotas join materias on materia=codmateria
								where nommateria like '%ase%atos%') then 'Sobre la media'
							else 'Bajo la media' end as estado
from estudiantes join regnotas on codestudiante=estudiante
	join programas on programa=codprograma
	join materias on materia=codmateria
where nommateria like '%ase%atos%' and 
		nomprograma like '%istem%'
order by nfinal desc;
----------------------------------------
-- SUBQUERIES O SUBCONSULTAS EN UPDATES
----------------------------------------
create table estadisticas as
	select distinct nomestudiante as nombre from estudiantes
	join regnotas on codestudiante=estudiante
	order by 1;
--
alter table estadisticas add column npromedio decimal(4,2); 
-- atualizar la nota promedio de cada estudiante 
-- de la tabla estadiisticas
update estadisticas set npromedio=(
	select round(avg(nfinal), 2) 
	from estudiantes join regnotas on codestudiante=estudiante and nombre=nomestudiante);
--- 2 forma
update estadisticas set npromedio=(
	select round(avg(nfinal), 2) 
	from estudiantes join regnotas on codestudiante=estudiante
	where nomestudiante=nombre);
----
-- crear los atributos notamax,notamin, en la tabla estadisticas
-- y actualizarlos por la nota minima y maxima de cada estudiante
alter table estadisticas add column notamax decimal(3,1);
alter table estadisticas add column notamin decimal(3,1);
----
update estadisticas set notamax=(
	select max(nfinal) from estudiantes join regnotas on codestudiante=estudiante and nomestudiante=nombre),
	notamin=(
	select min(nfinal) from estudiantes join regnotas on codestudiante=estudiante and nomestudiante=nombre);
----
-- adicionar los atributos matmax y matmin a la tabla estadisticas 
-- y actualizarlos con los nombres de las matieras donde cada estudiante
-- obtuvo la nota maxima y la nota minima
alter table estadisticas add column matmax varchar(30);
alter table estadisticas add column matmin varchar(30);
--
update estadisticas set matmax=(
	select nommateria from estudiantes join regnotas on codestudiante=estudiante
		join materias on materia=codmateria and nomestudiante=nombre where nfinal=notamax limit 1),
	matmin=(
	select nommateria from estudiantes join regnotas on codestudiante=estudiante
		join materias on materia=codmateria and nomestudiante=nombre where nfinal=notamin limit 1);
----
-- crear el atributo rendimiento y actualizarlo deacuerdo si esta por encima, igual
-- o por debajo del promedio del programa al cual pertenece cada estudiante
alter table estadisticas add column rendimiento varchar	(20);
--
update estadisticas set rendimiento=(
	select case when npromedio > (select round(avg(nfinal),2)
										 from programas join estudiantes on codprograma=programa
										 	join regnotas on estudiante=codestudiante
										 where nomprograma=(select nomprograma 
										 					from programas join estudiantes on codprograma=programa and nomestudiante=nombre)
										 )
		   		then 'Encima de la media'
		   		when npromedio < (select round(avg(nfinal),2)
										 from programas join estudiantes on codprograma=programa
										 	join regnotas on estudiante=codestudiante
										 where nomprograma=(select nomprograma 
										 					from programas join estudiantes on codprograma=programa and nomestudiante=nombre)
										 )
		   		then 'Debajo de la media'
		   		else 'Igual que la media' end);
-----
-- adicionar los atributos estprograma y programa a la tabla
-- estadisticas y actualizar con el programa y la nota promedio del programa
-- al cual pertenece cada estudiante
--
alter table estadisticas add column estprograma varchar(30);
alter table estadisticas add column promprograma decimal(4,2);
---
update estadisticas set estprograma=(
	select nomprograma from programas join 
	estudiantes on codprograma=programa and
	nomestudiante=nombre);
--
update estadisticas set promprograma=(
	select round(avg(nfinal), 2) 
	from programas join 
		estudiantes on codprograma=programa join regnotas on codestudiante=estudiante 
	where nomprograma=estprograma);
----
-- adicionar el atributi sumpromedios y actulizarlo con 
-- la suma de los promedios de la facultad y de la ciudad
-- a la cual pertence el estudiante
alter table estadisticas add column sumpromedios numeric(4,2);
--
update esadisticas set sumapromedios=((
	select round(avg(nfinal),2)
	from regnotas join estudiantes on estudiante=codestudiante
		join programa on programa=codprograma
		join facultades on facultad=codfacultad
		and nomestudiante=nombre) +
	(select round(avg(nfinal),2)
	from regnotas join estudiantes on estudiante=codestudiante
		join ciudades on ciudad=codciudad
		and nomestudiante=nombre))
;

---------------------------
-- CREACION DE REGLAS SOBRE VISTAS
-------------------------
---------
-- ON INSERT
---------
create or replace view basicos_est as 
select codestudiante as codigo,
		nomestudiante as nombre,
		sexestudiante as sexo ,
		edaestudiante as edad
from estudiantes join ciudades on ciudad=codciudad
where nomciudad like 'Pasto';
----
create or replace rule insert_basicos_est as 
on insert to basicos_est do instead 
(insert into estudiantes(codestudiante,nomestudiante,sexestudiante,edaestudiante,barrio,ciudad,programa) 
		values(new.codigo, new.nombre, new.sexo, new.edad,'101','52001','91'));
---- test
	insert into basicos_est values('6201', 'Alfonso Eraso', 'M', 30);
---------
-- ON UPDATE
---------
update basicos_est set edad=28 where codigo='6201';
---
create or replace rule update_basicos_est as
on update to basicos_est
do instead
update estudiantes set 
	codestudiante=new.codigo,
	nomestudiante=new.nombre,
	edaestudiante=new.edad,
	sexestudiante=new.sexo
where codestudiante=old.codigo;
---
update basicos_est set codigo='6210',nombre='Alfonsa Erazo',edad=26,sexo='F' where codigo='6201';
--------
-- ON DELETE
--------
delete from basicos_est where codigo='6210';
---
create or replace rule delete_basicos_est as 
on delete to basicos_est 
do instead 
delete from estudiantes where codestudiante=old.codigo;
---
delete from basicos_est where codigo='6210';
---------------------------------------------------------------------------
-- REGLAS SOBRE TABLAS
---------------------------------------------------------------------------
----
-- ON INSERT
----
create or replace rule inserta_notas as 
on insert to regnotas do
(update regnotas set nfinal=new.parcial1*0.30+new.parcial2*0.30+new.nfinal*0.40
where estudiante = new.estudiante and materia=new.materia;
---------------
update regnotas set estado = case when nfinal >=3 then 'A' else 'R' end 
where estudiante = new.estudiante and materia=new.materia);