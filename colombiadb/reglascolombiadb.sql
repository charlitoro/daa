delete from posiciones;
delete from partidos;
delete from equipos;
-- Crear una regla que al insertar un equipo , lo inserte
-- en la tabla posiciones

create or replace rule inserta_equipos as 
on insert to equipos do 
insert into posiciones(equipo) values(new.nomequipo);

-- insertar equipos
insert into equipos values ('10','Deportivo Pasto');
insert into equipos values ('20','Deportivo Cali');
insert into equipos values ('30','Nacional');
insert into equipos values ('40','Millonarios');
insert into equipos values ('50','Junior'); 


-- 2. Crear una regla que al insertar un partido se 
-- actualize automaticamente todos los atributos de posiciones 
-- de los dos equipos
create or replace rule inserta_partidos as on 
insert to partidos do (
-- actualiza partidos juegos
	update posiciones set pj=pj+1
	where equipo in (select nomequipo from equipos
	where codequipo=new.codlocal or codequipo=new.codvisitante);
-- Partidos Ganados
	update posiciones set pg=pg+1
    where equipo in (select nomequipo from equipos
    where (codequipo=new.codlocal and new.gollocal>new.golvisitante)
    or (codequipo=new.codvisitante and new.golvisitante>new.gollocal));
-- partidos perdidos
	update posiciones set pp=pp+1
	where equipo in (select nomequipo from equipos 
	where (codequipo=new.codlocal and new.gollocal<new.golvisitante)
	or (codequipo= new.codvisitante and new.gollocal>new.golvisitante));
-- partidos empatados
	update posiciones set pe=pe+1
	where equipo in (select nomequipo from equipos 
	where (codequipo=new.codlocal and codequipo=new.codvisitante)
	and new.gollocal=new.golvisitante);
-- goles a favor
	update posiciones set gf=(select case
	when codequipo=new.codlocal then gf+new.gollocal
	when codequipo=new.codvisitante then gf+new.golvisitante
	else gf end 
	from equipos where equipo=nomequipo);
-- goles en contra 
	update posiciones set gc=(select case
	when codequipo=new.codlocal then gf+new.gollocal
	when codequipo=new.codvisitante then gf+new.golvisitante
	else gf end 
	from equipos where equipo=nomequipo);
-- gol diferencia 
	update posiciones set gd=gf-gc where equipo in
	(select nomequipo from equipos where codequipo=new.codlocal or 
	codequipo=new.codvisitante);
-- gol promedio 
	update posiciones set gp=gf/pj where equipo in
	(select nomequipo from equipos where codequipo=new.codlocal or 
	codequipo=new.codvisitante);
-- puntos
	update posiciones set puntos=pg*3+pe where equipo in
	(select nomequipo from equipos where codequipo=new.codlocal or 
	codequipo=new.codvisitante);

);

delete from partidos;
update posiciones set pj=0,pg=0,pp=0,pe=0,gf=0,gc=0,gd=0,puntos=0;
-- Insertar partidos


Insert into partidos (CODLOCAL,CODVISITANTE,GOLLOCAL,GOLVISITANTE,FECHA) values ('10','20','2','0','09/10/2019');
Insert into partidos (CODLOCAL,CODVISITANTE,GOLLOCAL,GOLVISITANTE,FECHA) values ('10','30','1','1','09/11/2019');
Insert into partidos (CODLOCAL,CODVISITANTE,GOLLOCAL,GOLVISITANTE,FECHA) values ('10','40','2','1','09/12/2019');
Insert into partidos (CODLOCAL,CODVISITANTE,GOLLOCAL,GOLVISITANTE,FECHA) values ('10','50','1','0','09/13/2019');
Insert into partidos (CODLOCAL,CODVISITANTE,GOLLOCAL,GOLVISITANTE,FECHA) values ('20','10','2','2','09/14/2019');
Insert into partidos (CODLOCAL,CODVISITANTE,GOLLOCAL,GOLVISITANTE,FECHA) values ('20','30','2','1','09/15/2019');
Insert into partidos (CODLOCAL,CODVISITANTE,GOLLOCAL,GOLVISITANTE,FECHA) values ('20','40','2','2','09/16/2019');
Insert into partidos (CODLOCAL,CODVISITANTE,GOLLOCAL,GOLVISITANTE,FECHA) values ('20','50','3','2','09/17/2019');
Insert into partidos (CODLOCAL,CODVISITANTE,GOLLOCAL,GOLVISITANTE,FECHA) values ('30','10','3','2','09/18/2019');
Insert into partidos (CODLOCAL,CODVISITANTE,GOLLOCAL,GOLVISITANTE,FECHA) values ('30','20','0','2','09/19/2019');
Insert into partidos (CODLOCAL,CODVISITANTE,GOLLOCAL,GOLVISITANTE,FECHA) values ('30','40','3','3','09/20/2019');
Insert into partidos (CODLOCAL,CODVISITANTE,GOLLOCAL,GOLVISITANTE,FECHA) values ('30','50','2','2','09/21/2019');
Insert into partidos (CODLOCAL,CODVISITANTE,GOLLOCAL,GOLVISITANTE,FECHA) values ('40','10','0','0','09/22/2019');
Insert into partidos (CODLOCAL,CODVISITANTE,GOLLOCAL,GOLVISITANTE,FECHA) values ('40','20','1','1','09/23/2019');
Insert into partidos (CODLOCAL,CODVISITANTE,GOLLOCAL,GOLVISITANTE,FECHA) values ('40','30','2','2','09/24/2019');
Insert into partidos (CODLOCAL,CODVISITANTE,GOLLOCAL,GOLVISITANTE,FECHA) values ('40','50','1','2','09/25/2019');
Insert into partidos (CODLOCAL,CODVISITANTE,GOLLOCAL,GOLVISITANTE,FECHA) values ('50','10','1','0','09/26/2019');
Insert into partidos (CODLOCAL,CODVISITANTE,GOLLOCAL,GOLVISITANTE,FECHA) values ('50','20','1','1','09/27/2019');
Insert into partidos (CODLOCAL,CODVISITANTE,GOLLOCAL,GOLVISITANTE,FECHA) values ('50','30','1','0','09/28/2019');
Insert into partidos (CODLOCAL,CODVISITANTE,GOLLOCAL,GOLVISITANTE,FECHA) values ('50','40','1','0','09/29/2019');
--
