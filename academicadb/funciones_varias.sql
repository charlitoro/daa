--
-- LENGUAJE PROCESDURAL PL/PGSQL
-- funcion que retorne un mensaje 
-- con '
create or replace function fun_mensaje(mensaje text) returns text as $$
begin
return mensaje;
end;
$$ language plpgsql;
-- ejecucion
select fun_mensaje('Bienvenido');
--======================================
-- funcion que retorne un mensaje doble 
-- con uso de "$$" y variables
create or replace function fun_mensa_doble(mensa1 text,mensa2 text) returns text as $$
declare
-- variables de parametros
vmensa1 alias for $1;
vmensa2 alias for $2;
-- variable
mensaje text;
begin
-- asignacion la concatenación de las variables
mensaje:=vmensa1||' '||vmensa2;
return mensaje;
end;
$$ language plpgsql;
--
-- ejecucion
select fun_mensa_doble('Juan Pablo','Bienvenido');
--
-- funcion que retorne un mensaje doble 
-- con  uso de "'" y variables
create or replace function fun_mensa_doblecomilla(mensa1 text,mensa2 text) returns text as '
declare
-- variables de parametros
vmensa1 alias for $1;
vmensa2 alias for $2;
-- variable
mensaje text;
begin
-- asignacion la concatenación de las variables
mensaje:=vmensa1||'' ''||vmensa2;
return mensaje;
end;
' language plpgsql;
--
-- ejecucion
select fun_mensa_doblecomilla('Viva Pasto','carajo!!!!') as mensaje;
--
--
-- funcion que suma dos numeros enteros
create or replace function sumanumeros(num1 integer,num2 integer) 
returns integer as $$
declare
--variables
n1 alias for $1;
n2 alias for $2;
resultado integer;
begin
resultado:=num1+num2;
return resultado;
-- return num1+num2;
end;
$$ language plpgsql;
--
-- ejecución
select sumanumeros(20,10) as suma;
--
-- escribir una funcion que realice las 4 operaciones aritmeticas
-- dependiendo de los parametros
create or replace function fun_opera_aritmetica(op char(1),n1 integer,n2 integer)
returns integer as $$
begin
if op='+' then
 return n1+n2;
end if;
if op='-' then
 return n1-n2;
end if;
if op='*' then
 return n1*n2;
end if;
if op='/' then
 if n2=0 then
  return 0;
 else
  return n1/n2;
 end if;
end if;
end;
$$ language plpgsql;
------
-- escribir una funcion que realice las 4 operaciones aritmeticas
-- dependiendo de los parametros
create or replace function fun_opera_aritmetica(char(1), numeric, numeric)
returns numeric as $$
declare
-- variables
op alias for $1;
n1 alias for $2;
n2 alias for $3;
resultado numeric;
begin
if op='+' then
 resultado:=n1+n2;
end if;
if op='-' then
 resultado:=n1-n2;
end if;
if op='*' then
 resultado:=n1*n2;
end if;
if op='/' then
 if n2=0 then
  resultado:= 0;
 else
  resultado:= n1/n2;
 end if;
end if;
return round(resultado, 2);
end;
$$ language plpgsql;
-- ejecucion
select fun_opera_aritmetica('/',10,3) as resultado;
-- escribir una funcion que realice las 4 operaciones aritmeticas
-- dependiendo de los parametros con if then else end if
create or replace function fun_opera_aritmetica(op char(1),n1 integer,n2 integer)
returns integer as $$
begin
if op='+' then
 return n1+n2;
 else
	if op='-' then
	return n1-n2;
	else
		if op='*' then
		return n1*n2;
		else
			if op='/' then
				if n2=0 then
				return 0;
				else
				return n1/n2;
				end if;
			end if;
		end if;
	end if;
end if;
end;
$$ language plpgsql;
-- ejecucion
select fun_opera_aritmetica('-',10,3) as resultado;
--
-- escribir una funcion que realice las 4 operaciones aritmeticas
-- dependiendo de los parametros con if then elseif
create or replace function fun_opera_aritmetica3(op char(1),n1 numeric,n2 numeric)
returns numeric as $$
begin
if op='+' then
 return n1+n2;
 elseif op='-' then
	return n1-n2;
	elseif op='*' then
		return n1*n2;
		elseif op='/' then
				if n2=0 then
				  raise notice 'El numero % se esta dividiendo entre % ',n1,n2;
				  return 0;
				else
				return n1/n2;
				end if;
			
end if;
end;
$$ language plpgsql;
-- ejecucion
select fun_opera_aritmetica('/',10,0) as resultado;
--
-- escribir una funcion que realice las 4 operaciones aritmeticas
-- dependiendo de los parametros con case
create or replace function fun_opera_aritmetica(op char(1),n1 integer,n2 integer)
returns integer as $$
begin
case
	when op='+' then  return n1+n2;
	when op='-' then  return n1-n2;
	when op='*' then  return n1*n2;
	else  
 	if n2=0 then
   		raise notice 'El numero % se esta dividiendo entre % ',n1,n2;
   	return 0;
   	else
   		return n1/n2;
 	end if;			
end case;
end;
$$ language plpgsql;
-- ejecucion
select fun_opera_aritmetica('/',10,0) as resultado;
--
-- determinar si un numero es par o impar
create or replace function fun_parimpar(numero integer) returns text
as $$
declare
residuo integer;
begin
residuo:=mod(numero,2);
if residuo=0 then 
  return 'El numero '||numero||' es par';
else 
  return 'El numero '||numero||' es impar';
end if;
end;
$$ language plpgsql;
-- ejecucion
select fun_parimpar(1345) as resultado;
--
-- sumar los n primeros numeros impares
create or replace function fun_sumaimpar(n integer) returns integer
as $$
declare
-- contador
i integer;
-- acumulador
sumaimpar integer;
-- generador de numeros impares
numero integer;
-- residuo
residuo integer;
begin
-- inicializar valores
i:=0;
sumaimpar:=0;
numero:=1;
while i<n loop
  residuo:=mod(numero,2);
  if residuo<>0 then
     sumaimpar:=sumaimpar+numero;
     i:=i+1;
  end if;
  numero:=numero+1;
end loop;
return sumaimpar;
end;
$$ language plpgsql;
-- ejecucion
select fun_sumaimpar(3) as resultado;
-- determinar si un numero es primo o no
create or replace function fun_primo(numero integer) returns text
as $$
declare 
i integer;
residuo integer;
sw integer;
begin
sw:=0;
for i in 2 ..numero/2 loop
 residuo:=mod(numero,i);
 if residuo=0 then
    sw:=1;
    i:=numero;
 end if;
end loop;
if sw=0 then
   return 'El numero '||numero||' es primo';
else
   return 'El numero '||numero||' no es primo'; 
end if;
end;
$$ language plpgsql;
--
-- ejecucion
select fun_primo(1) as resultado;
-- ======================================================
-- generar los n numeros primos y sumarlos
-- =======================================================
create or replace function fun_genprimo(n integer) returns setof integer
as $$
declare 
i integer;
numero integer;
sumap integer;
residuo integer;
sw integer;
begin
i:=0;
numero:=1;
sumap:=0;
while i<n loop
sw:=0;
for i in 2 ..numero/2 loop
 residuo:=mod(numero,i);
 if residuo=0 then
    sw:=1;
    i:=numero;
 end if;
end loop;
if sw=0 then
   return next numero;
   sumap:=sumap+numero;
   i:=i+1;
end if;
numero:=numero+1;
end loop;
return next sumap;
end;
$$ language plpgsql;
--
-- ejecucion
select fun_genprimo(10) as resultado;
--=============================================
-- funciones que llaman otras funciones
--==============================================
--drop function fun_par(numero integer);
create or replace function fun_par(num integer) returns integer as $$
declare
residuo integer;
bandera integer;
begin
residuo:=mod(num,2);
if residuo=0 then
  bandera:=0;
else  
  bandera:=1;
end if;
return bandera;
end;
$$ language plpgsql;
--
select fun_par(3) as parono;
--=================================================
-- funcion que dice si es par o no llamando otra
create or replace function fun_dice_par(numero integer) returns text as $$
declare
sw integer;
begin
sw:=fun_par(numero);
if sw=0 then
   return 'el numero '|| numero || '  es par';
else
   return 'el numero '|| numero || '  es impar';
end if;
end;
$$ language plpgsql;
--
--ejecucion
select fun_dice_par(7);
--======================================================================
-- eliminar funcion
--drop function fun_gen_par_suma(n integer);
--drop function fun_gen_par_suma(n integer, numeroi integer);
--drop function fun_gen_par_suma(n integer, numero integer);
-- genera y suma n pares
create or replace function fun_gen_par_suma(n integer) returns setof text as $$
declare 
i integer;
sumapar integer;
numero integer;
sw integer;
begin
i:=0;
numero:=2;
sumapar:=0;
while i<n loop
 sw:=fun_par(numero);
 if sw=0 then 
   return next 'par ['||i+1||']'||numero;
   sumapar:=sumapar+numero;
   i:=i+1;
 end if;
 numero:=numero+1;
end loop;
return next 'suma='||sumapar;
end;
$$ language plpgsql;  
--
select fun_gen_par_suma(10);

