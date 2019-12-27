/*
 * ----------------------
 * -- Taller de Reglas --
 * ----------------------
 * Por:
 * 	Carlos Andres Toro Guerrero 
 * DB: 
 * 	jardindb
 *
 **/
/* 
1. Crear la base de datos jardin y ejecutar el script jardin.sql
2. Crear una regla que al insertar un inscrito en la tabla inscritos:
A) Haga en la tabla MATRICULADOS
-  Inserte el codigo del inscrito en la tabla matriculados. 
-  Actualice el codigo del nivel al cual se matricula
-  Actualice el valor de la matricula con el valor del nivel al que se matricula.

El nivel se determina asi:
Si el ni�o tiene 2 o menos a�os se matricula al nivel de parvulos.

Si el ni�o tiene 4 o menos a�os y mas de 2 se matricula al nivel de prejardin.

Si el ni�o tiene 5 a�os y mas de 4 se matricula al nivel de jardin.

Si el ni�o tiene 6 a�os y mas de 5 se matricula al nivel de transicion.

B) Haga en la tabla ESTADISTICAS
- Actualice el numero de ni�as (nfem) si es el caso en el respectivo nivel que se matricula.
- Actualice el numero de ni�os (nmas) si es el caso en el respectivo nivel que se matricula.
- Actualice el total de matriculas de ni�as (tot_matf) si es el caso en el respectivo nivel que se matricula.
- Actualice el total de matriculas de ni�os (tot_matm) si es el caso en el respectivo nivel que se matricula.
- Actualice el numero total de estudiantes (num_m) en el respectivo nivel que se matricula.
- Actualice el valor total de matriculas de estudiantes (tot_m)  en el respectivo nivel que se matricula.

*/
delete from matriculados;
delete from inscritos;
delete from estadisticas;
delete from niveles;


create or replace rule inserta_inscritos as on insert to inscritos do (
-- A)	
	-- insert matriculados
	insert into matriculados(matriculado, nivel_mat) values(new.cod_insc, (
		case when new.edad_insc <= 2 then (select cod_niv from niveles where nom_niv like '%Parvulos%')
			when new.edad_insc > 2 and new.edad_insc <= 4 then (select cod_niv from niveles where nom_niv like '%Prejardin%')
			when new.edad_insc = 5 then (select cod_niv from niveles where nom_niv like '%Jardin%')
			when new.edad_insc = 6 then (select cod_niv from niveles where nom_niv like '%Transici_n%')
		end
	));
	-- update valor matricula
	update matriculados set valor_mat = (
		select valor_niv from niveles where nivel_mat=cod_niv
	) where new.cod_insc in (select matriculado from matriculados);
-- B)
	-- update numero de niñas
	update estadisticas set nfem = nfem + 1
	where new.sexo_insc='F' and new.cod_insc in (
		select matriculado from matriculados join niveles on nivel_mat=cod_niv
		where nivel=nom_niv);
	-- update numero de niños
	update estadisticas set nmas = nmas + 1
	where new.sexo_insc='M' and new.cod_insc in (
		select matriculado from matriculados join niveles on nivel_mat=cod_niv
		where nivel=nom_niv);
	-- update total valor matricula niñas
	update estadisticas set tot_matf = nfem*(select valor_niv from niveles where nivel=nom_niv)
	where new.sexo_insc='F' and new.cod_insc in (
		select matriculado from matriculados
	);
	-- Update Total valor matriculas niños
	update estadisticas set tot_matm = nmas*(
		select valor_niv from niveles where nivel=nom_niv
	)
	where new.sexo_insc='M' and new.cod_insc in (
		select matriculado from matriculados
	);
	-- Update total estudiantes
	update estadisticas set num_n = nfem+nmas;
	-- Update total valor matroculas
	update estadisticas set tot_m = tot_matf+tot_matm;
);
/*
---datos niveles
insert into niveles values('01','Parvulos',600000);
insert into niveles values('02','Prejardin',500000);
insert into niveles values('03','Jardin',400000);
insert into niveles values('04','Transicion',300000);
-- 
-- datos estadisticas
---
insert into estadisticas(nivel) values('Parvulos');
insert into estadisticas(nivel) values('Prejardin');
insert into estadisticas(nivel) values('Jardin');
insert into estadisticas(nivel) values('Transicion');
*/

-- datos inscritos
insert into inscritos values('1000','Carlos Vallejo',1,'M');
insert into inscritos values('1100','Maria Coral',2,'F');
insert into inscritos values('2000','Cesar Bucheli',3,'M');
insert into inscritos values('2100','Adriana Olaya',4,'F');
insert into inscritos values('3000','Sofia Guerrero',5,'F');
insert into inscritos values('3100','Hermes Enriquez',6,'M');
insert into inscritos values('3200','Jaime Cuesta',1,'M');
insert into inscritos values('3300','Andrea Cano',2,'F');
insert into inscritos values('4000','Armando Garcia',3,'M');
insert into inscritos values('4100','Nataly Guerrero',4,'F');
insert into inscritos values('4200','German Puentes',5,'M');
insert into inscritos values('4300','Ligia Montenegro',6,'F');
insert into inscritos values('5000','Ruben Zuleta',1,'M');
insert into inscritos values('5100','Alicia Martinez',2,'F');
insert into inscritos values('5200','Amanda Dorado',3,'F');
insert into inscritos values('6000','Ivan Llano',4,'M');
insert into inscritos values('6100','Nancy Castillo',5,'F');
insert into inscritos values('6200','Dario Mendez',6,'M');



















