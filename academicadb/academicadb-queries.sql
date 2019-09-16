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
