-- se crea la tabla registro academico
--
-- drop table regacademico;
create table regacademico(
codigo char(4),
nombre varchar(30),
materia varchar(30),
profesor varchar(30),
notafinal decimal(3,1));
--
-- se crea un trigger que al insertar notas, actualiza notas e inserte en registro academico los datos
--
create or replace function fun_inserta_notas() returns trigger as $$
declare
xnfinal regnotas.nfinal%type;
xestado regnotas.estado%type;
regacad regacademico%rowtype; -- regacad sume todos los atributos de regacademico
regestudiante record; -- record toma solo las compos pasados, es un registro variable
regmateria record;
regprofesor record;
begin
-- para evitarse los joins
select into regestudiante * from estudiantes where codestudiante=new.estudiante;
select into regmateria * from materias where codmateria=new.materia;
select into regprofesor nomprofesor from profesores where codprofesor=new.profesor;
xnfinal:=new.parcial1*0.30+new.parcial2*0.30+new.efinal*0.40;
if xnfinal>=3.0 then
	xestado:='A';
 else
	xestado:='R';
 end if;
 -- actualiza notas
 update regnotas set nfinal=xnfinal,estado=xestado 
	where estudiante=new.estudiante and materia=new.materia;
 --
 -- inserta en registro academico
 regacad.codigo:=regestudiante.codestudiante;
 regacad.nombre:=regestudiante.nomestudiante;
 regacad.materia:=regmateria.nommateria;
 regacad.profesor:=regprofesor.nomprofesor;
 regacad.notafinal:=xnfinal;
 insert into regacademico values(regacad.*);
 return new;
 end;
 $$ language plpgsql;
 --
 -- creacion trigger
create trigger trig_insertanotas after insert on regnotas
for each row execute procedure fun_inserta_notas();
--
--ejecucion trigger
insert into regnotas(estudiante,materia,profesor,parcial1,parcial2,efinal) values('1000','06','06',4.0,4.0,4.0);
-- verificar
select * from regnotas where estudiante='1000' and materia='06';
select * from regacademico;
--
insert into regnotas(estudiante,materia,profesor,parcial1,parcial2,efinal) values('1100','01','01',2.0,3.0,3.0);
-- verificar
select * from regnotas where estudiante='1100' and materia='01';
select * from regacademico;


