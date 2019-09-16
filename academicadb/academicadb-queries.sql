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