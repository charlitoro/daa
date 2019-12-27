/*
 * ----------------------
 * -- Taller de Reglas --
 * ----------------------
 * Por:
 * 	Carlos Andres Toro Guerrero 
 * DB: 
 *   sisbendb 
 */

delete from familiares;
delete from subsisben;
delete from ciudadanos;

-- Crear una regla para que cuando se inserte un ciudadano
-- Se inserte subsisben:
--   * el nombre del ciudadano
--   * calcular el nivel 
--   * poner en cero los subsidios

create or replace rule inserta_ciudadanos as 
on insert to ciudadanos do (
-- Insertar el nombre en subsisben
	insert into subsisben(ciudadano, nivel, sub_escolar, sub_familias, sub_tot) 
		values(new.nombre_ciu, (
			case when (select estrato_ba from barrios where new.barrio_ciu=codigo_ba) = '1' and 
					  (select ingreso_of from oficios where new.oficio_ciu=codigo_of) <= (select valor_top from topes where codigo_top='T1') then '0'
				when (select estrato_ba from barrios where new.barrio_ciu=codigo_ba) = '1' and 
					 (select ingreso_of from oficios where new.oficio_ciu=codigo_of) <= (select valor_top from topes where codigo_top='T2') then '1'
				when (select estrato_ba from barrios where new.barrio_ciu=codigo_ba) = '1' and 
				     (select ingreso_of from oficios where new.oficio_ciu=codigo_of) <= (select valor_top from topes where codigo_top='T3') then '2'
				when (select estrato_ba from barrios where new.barrio_ciu=codigo_ba)='2' and 
				     (select ingreso_of from oficios where new.oficio_ciu=codigo_of) <= (select valor_top from topes where codigo_top='T1') then '1'
				when (select estrato_ba from barrios where new.barrio_ciu=codigo_ba)='2' and 
				     (select ingreso_of from oficios where new.oficio_ciu=codigo_of) <= (select valor_top from topes where codigo_top='T2') then '2'
				when (select estrato_ba from barrios where new.barrio_ciu=codigo_ba)='3' and 
				     (select ingreso_of from oficios where new.oficio_ciu=codigo_of) <= (select valor_top from topes where codigo_top='T1') then '2'
				else 'N' end
	), 0, 0, 0);
);
-- test insert
insert into ciudadanos  values ('1000','Sofia Montenegro','B15','C09');
insert into ciudadanos  values ('2000','Pedro Ortiz','B14','C08');
insert into ciudadanos  values ('3000','Julio Bucheli','B13','C07');
insert into ciudadanos  values ('4000','Rodrigo Casas','B12','C06');
insert into ciudadanos  values ('5000','Enrique Pianda','B11','C05');
insert into ciudadanos  values ('6000','Camilo Perdomo','B11','C04');
insert into ciudadanos  values ('7000','Armando Agreda','B11','C02');
insert into ciudadanos  values ('8000','Carlos Rodriguez','B10','C05');
insert into ciudadanos  values ('9000','Enrique Lasso','B10','C03');
insert into ciudadanos  values ('9500','Carmen Sea','B10','C00');
-- Crear una regla para cuando se inserte un famliar se actualice el
--   * sub_escolar (Subsidio escolar)
--   * subfamiliar (Subsidio familiar)
--   * sub_tol (Subtotal)
create or replace rule inserta_familiares as 
on insert to familiares do (
-- actualizar sub_escolar
	update subsisben set sub_escolar = sub_escolar + (
		case when new.edad_fa<10 and new.parent_fa='H' then (select val_hijo10 from valores)
			when new.edad_fa>=10 and new.edad_fa<18 and new.parent_fa='H' then (select val_hijo18 from valores)
			else 0 end
		)
	where ciudadano in (
		select nombre_ciu from ciudadanos
		where cedula_ciu=new.ciudadano_fa);
-- actualizar sub_familiar
	update subsisben set sub_familias = sub_familias + (
		case when nivel='0' then (select val_salmin from valores)*0.1
			when nivel='1' then (select val_salmin from valores)*0.05
			when nivel='2' then (select val_salmin from valores)*0.03
			else 0 end
		)
	where ciudadano in (
		select nombre_ciu from ciudadanos
		where cedula_ciu=new.ciudadano_fa);
-- actualizar sub_tol
	update subsisben set sub_tot = (sub_escolar + sub_familias)
	where ciudadano in (
		select nombre_ciu from ciudadanos
		where cedula_ciu=new.ciudadano_fa);
); 
-- Test update
insert into familiares  values ('1001', 'Fernando Jurado','C',40,'1000');
insert into familiares  values ('1002', 'Nancy Jurado','H',15,'1000');
insert into familiares  values ('1003', 'Luis Jurado','H',10,'1000');
insert into familiares  values ('2001', 'Rubiela Garcia','C',35,'2000');
insert into familiares  values ('2002', 'Juan Ortiz','H',19,'2000');
insert into familiares  values ('2003', 'Ana Ortiz','H',16,'2000');
insert into familiares  values ('3000', 'Ligia Montenegro','C',45,'3000');
insert into familiares  values ('3001', 'Adriano Bucheli','H',24,'3000');
insert into familiares  values ('4001', 'Tania Robledo','C',39,'4000');
insert into familiares  values ('4002', 'Cesar Casas','H',15,'4000');
insert into familiares  values ('5001', 'Maria Moreno','C',29,'5000');
insert into familiares  values ('5002', 'Sara Pianda','H',9,'5000');
insert into familiares  values ('5003', 'Hernan Pianda','H',12,'5000');
insert into familiares  values ('5004', 'Juan Pianda','H',19,'5000');
insert into familiares  values ('6001', 'Alejandra Moreno','C',25,'6000');
insert into familiares  values ('7001', 'Amanda Vallejo','C',29,'7000');
insert into familiares  values ('7002', 'Lucia Agreda','H',15,'7000');
insert into familiares  values ('8001', 'Carmen Vallejo','C',40,'8000');
insert into familiares  values ('9001', 'Sofia Pereira','C',30,'9000');
insert into familiares  values ('9002','Enrique Lasso','H', 4,'9000');
insert into familiares  values ('9501', 'Libaro Castro','C',49,'9500');
insert into familiares  values ('9502', 'Libaro Castro','H',19,'9500');
insert into familiares  values ('9503', 'Gloria Castro','H',13,'9500');