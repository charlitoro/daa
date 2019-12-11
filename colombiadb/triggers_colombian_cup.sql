-- base de datos colombiadb
-- actualizacion de datos con triggers
--
--crear un trigger que al insertar un equipo, inserte en posiciones su nombre
--
/*
delete from posiciones;
delete from partidos;
delete from jugadores;
delete from equipos;
*/

--tablas
--
-- tabla equipos
create table equipos(
codequipo char(2) not null primary key,
nomequipo varchar(20) not null unique);
-- tabla partidos
create table partidos(
codlocal char(2) not null references equipos(codequipo),
codvisitante char(2) not null references equipos(codequipo),
gollocal numeric(2,0) default 0 check(gollocal>=0),
golvisitante numeric(2,0) default 0 check(golvisitante>=0),
fecha date not null,
primary key(codlocal,codvisitante,fecha));
-- tabla posiciones
create table posiciones(
equipo varchar(20) not null primary key references equipos(nomequipo),
pj numeric(2,0) default 0,
pg numeric(2,0) default 0,
pe numeric(2,0) default 0,
pp numeric(2,0) default 0,
gf numeric(2,0) default 0,
gc numeric(2,0) default 0,
gd numeric(2,0) default 0,
gp numeric(3,2) default 0,
puntos numeric(2,0) default 0);

-- creacion de indices
create index idx_codlocal on partidos(codlocal);
create index idx_codvisita on partidos(codvisitante);

--funciones
--
create or replace function fun_insequipos() returns trigger as $$
begin
insert into posiciones(equipo) values (new.nomequipo);
return new;
end;
$$ language plpgsql;
-- trigger
create trigger trig_insequipos after insert on equipos
for each row execute procedure fun_insequipos();

insert into equipos values ('10','Deportivo Pasto');
insert into equipos values ('20','Deportivo Cali');
insert into equipos values ('30','Nacional');
insert into equipos values ('40','Millonarios');
insert into equipos values ('50','Junior');
--
-- crear trigger que  a partir de los partidos actualice posiciones
create or replace function fun_insepartidos() returns trigger as $$
declare
regequiploc record;
regequipvisit record;
begin
select into regequiploc * from equipos where codequipo=new.codlocal; 
select into regequipvisit * from equipos where codequipo=new.codvisitante;
--pj
update posiciones set pj=pj+1 where equipo=regequiploc.nomequipo or equipo=regequipvisit.nomequipo;
--pg
update posiciones set pg=pg+1 where(equipo=regequiploc.nomequipo and new.gollocal>new.golvisitante) or 
(equipo=regequipvisit.nomequipo and new.golvisitante>new.gollocal);
--pp
update posiciones set pp=pp+1 where(equipo=regequiploc.nomequipo and new.gollocal<new.golvisitante) or 
(equipo=regequipvisit.nomequipo and new.golvisitante<new.gollocal);
--pe
update posiciones set pe=pe+1 where (equipo=regequiploc.nomequipo or equipo=regequipvisit.nomequipo) and new.gollocal=new.golvisitante;
-- gf 
update posiciones set 
gf=case 
when equipo=regequiploc.nomequipo then gf+new.gollocal 
when equipo=regequipvisit.nomequipo then gf+new.golvisitante
else gf
end;
-- gc
update posiciones set 
gc=case 
when equipo=regequiploc.nomequipo then gc+new.golvisitante 
when equipo=regequipvisit.nomequipo then gc+new.gollocal
else gc
end;
--
--gd
update posiciones set gd=gf-gc where equipo=regequiploc.nomequipo or equipo=regequipvisit.nomequipo;
--
--gp
update posiciones set gp=gf/pj where equipo=regequiploc.nomequipo or equipo=regequipvisit.nomequipo;
--puntos
update posiciones set puntos=pg*3+pe where equipo=regequiploc.nomequipo or equipo=regequipvisit.nomequipo;
return new;
end;
$$ language plpgsql;
--
-- trigger
create trigger trig_insepartidos after insert on partidos
for each row execute procedure fun_insepartidos();
--
--datos
delete from partidos;
update posiciones set pj=0,pg=0,pe=0,pp=0,gf=0,gc=0,gd=0,puntos=0;

Insert into partidos (CODLOCAL,CODVISITANTE,GOLLOCAL,GOLVISITANTE,FECHA) values ('10','20','2','0','10/09/2019');
Insert into partidos (CODLOCAL,CODVISITANTE,GOLLOCAL,GOLVISITANTE,FECHA) values ('10','30','1','1','11/09/2019');
Insert into partidos (CODLOCAL,CODVISITANTE,GOLLOCAL,GOLVISITANTE,FECHA) values ('10','40','2','1','12/09/2019');
Insert into partidos (CODLOCAL,CODVISITANTE,GOLLOCAL,GOLVISITANTE,FECHA) values ('10','50','1','0','13/09/2019');
Insert into partidos (CODLOCAL,CODVISITANTE,GOLLOCAL,GOLVISITANTE,FECHA) values ('20','10','2','2','14/09/2019');
Insert into partidos (CODLOCAL,CODVISITANTE,GOLLOCAL,GOLVISITANTE,FECHA) values ('20','30','2','1','15/09/2019');
Insert into partidos (CODLOCAL,CODVISITANTE,GOLLOCAL,GOLVISITANTE,FECHA) values ('20','40','2','2','16/09/2019');
Insert into partidos (CODLOCAL,CODVISITANTE,GOLLOCAL,GOLVISITANTE,FECHA) values ('20','50','3','2','17/09/2019');
Insert into partidos (CODLOCAL,CODVISITANTE,GOLLOCAL,GOLVISITANTE,FECHA) values ('30','10','3','2','18/09/2019');
Insert into partidos (CODLOCAL,CODVISITANTE,GOLLOCAL,GOLVISITANTE,FECHA) values ('30','20','0','2','19/09/2019');
Insert into partidos (CODLOCAL,CODVISITANTE,GOLLOCAL,GOLVISITANTE,FECHA) values ('30','40','3','3','20/09/2019');
Insert into partidos (CODLOCAL,CODVISITANTE,GOLLOCAL,GOLVISITANTE,FECHA) values ('30','50','2','2','21/09/2019');
Insert into partidos (CODLOCAL,CODVISITANTE,GOLLOCAL,GOLVISITANTE,FECHA) values ('40','10','0','0','22/09/2019');
Insert into partidos (CODLOCAL,CODVISITANTE,GOLLOCAL,GOLVISITANTE,FECHA) values ('40','20','1','1','23/09/2019');
Insert into partidos (CODLOCAL,CODVISITANTE,GOLLOCAL,GOLVISITANTE,FECHA) values ('40','30','2','2','24/09/2019');
Insert into partidos (CODLOCAL,CODVISITANTE,GOLLOCAL,GOLVISITANTE,FECHA) values ('40','50','1','2','25/09/2019');
Insert into partidos (CODLOCAL,CODVISITANTE,GOLLOCAL,GOLVISITANTE,FECHA) values ('50','10','1','0','26/09/2019');
Insert into partidos (CODLOCAL,CODVISITANTE,GOLLOCAL,GOLVISITANTE,FECHA) values ('50','20','1','1','27/09/2019');
Insert into partidos (CODLOCAL,CODVISITANTE,GOLLOCAL,GOLVISITANTE,FECHA) values ('50','30','1','0','28/09/2019');
Insert into partidos (CODLOCAL,CODVISITANTE,GOLLOCAL,GOLVISITANTE,FECHA) values ('50','40','1','0','29/09/2019');

