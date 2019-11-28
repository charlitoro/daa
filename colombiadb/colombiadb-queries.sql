--------------------------------------------------------------------------------------
-- Actualiza Colombia db 
-- Insertar Equipos en posiciones
insert into posiciones(equipo)
(select nomequipo from equipos order by 1);
-- Actualizar posiciones
-- Partidos Jugados: partidos jugados de local y partidos jugados de visitantes
update posiciones set pj =(
	select count(*) 
	from 
	partidos join equipos on (codlocal=codequipo
	or codvisitante=codequipo) and equipo=nomequipo
);
--
update posiciones set pj =(
	select count(*) 
	from 
	partidos join equipos on (codlocal=codequipo
	or codvisitante=nomequipo) 
	where
	equipo=codequipo
);
-- Partidos Ganados: Enlazar update con el join que se esta trabajando
-- 1 forma:
update posiciones set pg = (
	select  count(*)
	from 
	partidos join equipos on 
	((codlocal=codequipo and gollocal>golvisitante) or
	(codvisitante=codequipo and golvisitante>gollocal)) and
	equipo=nomequipo
);
-- 2 forma: 
update posiciones set pg = (
	(select  count(*)
	from 
	partidos join equipos on 
	(codlocal=codequipo and gollocal>golvisitante) and
	equipo=nomequipo)+
	(select  count(*)
	from 
	partidos join equipos on 
	(codvisitante=codequipo and golvisitante>gollocal) 
	and equipo=nomequipo)
);
-- Partidos Perdidos:
update posiciones set pp = (
	select  count(*)
	from 
	partidos join equipos on 
	((codlocal=codequipo and gollocal<golvisitante) or
	(codvisitante=codequipo and golvisitante<gollocal)) and
	equipo=nomequipo
);
-- Partidos Empatados:
update posiciones set pe = (
	select  count(*)
	from 
	partidos join equipos on 
	((codlocal=codequipo or codvisitante=codequipo) and 
	 (gollocal=golvisitante and equipo=nomequipo))
);
-- Goles a Favor: 
-- 1 forma:
update posiciones set gf = (
	select sum(gollocal) from partidos join equipos
	on codlocal=codequipo and equipo=nomequipo
)+
(
	select sum(golvisitante) from partidos join equipos
	on codvisitante=codequipo and equipo=nomequipo
);
-- 2 forma:
-- si el atributo esta en posiciones se pone case
-- pero si no esta se pone select case en posiciones
/*update posiciones  set gf = (
	select case 
	when codlocal=codequipo then 
	   (select sum(gollocal) from 
		partidos join equipos on codlocal=codequipo
	 	and equipo=nomequipo)
	when codvisitante=codequipo then 
);*/
-- Goles en Contra:
update posiciones set gc = (
	select sum(gollocal) from partidos join equipos
	on codvisitante=codequipo and equipo=nomequipo
)+
(
	select sum(golvisitante) from partidos join equipos
	on codlocal=codequipo and equipo=nomequipo
);
-- Gol diferencia:
update posiciones set gd = gf-gc;
-- Gol promedio: Goles que hago por partido
update posiciones set gp = gf/pj;
-- Puntos
update posiciones set puntos = (pg*3)+pe;
