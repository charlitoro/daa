/*
 * ----------------------
 * -- Taller de Triggers --
 * ----------------------
 * Por:
 * 	Carlos Andres Toro Guerrero 
 * DB: 
 * 	bancodb
 *
 **/

/* 
1. Crear la base de datos bancosdb 
2. Crear un triger que al ingresar un movimiento en la tabla movimientos : 
- Actualice los atributo saldoi y estado = '1' de la tabla cuentas cuando el movimiento corresponda a un saldo inicial. Si se vuelve a ingresar un movimiento de saldo incial a la cuenta cuyo estado esta actualizado generar un mensaje y salir.
-Acumule  el campo saldosuc de la tabla sucursales con cualquier movimiento. Si es saldo inicial unicamente la primera vez.
- Inserte un registro en la tabla saldos  y actualice el atributo saldonuevo si la cuenta no existe y  el movimiento sea saldo inicial. 
- Actualice la tabla saldos con los movimientos de consignacion o retiro moviendo saldo a saldo anterior y acumulando o total  consignaciones o total retiros y actualizando el saldonuevo con el nuevo valor.
En el caso de retiros, si el saldo es menor que el valor a retirar generar un mensaje y salir
*/

drop trigger insert_movimiento on movimientos;
delete from movimientos;
delete from saldos;
delete from cuentas;
delete from sucursales;


create or replace function fun_insert_movimiento() returns trigger as $$
declare
cuenta_tmp record;
saldo_tmp record;
sucursal_tmp record;
begin
  select * into cuenta_tmp from cuentas where ncta=new.cuentamov;
  select * into saldo_tmp from saldos where cuenta=cuenta_tmp.ncta; 
  select * into sucursal_tmp from sucursales where codsuc=cuenta_tmp.sucursal;
 
 if cuenta_tmp.estado='0' and new.codmov='1' then
	begin
	update cuentas set saldoi=new.vrmov where ncta=cuenta_tmp.ncta;
	update cuentas set estado='1' where ncta=cuenta_tmp.ncta;
	update sucursales set saldosuc=saldosuc+new.vrmov where codsuc=sucursal_tmp.codsuc;
	insert into saldos(cuenta,saldonuevo) values(cuenta_tmp.ncta,new.vrmov);
	end;
 end if;
if cuenta_tmp.estado='1' and new.codmov='1' then
 begin
  	raise notice 'saldo inicial ya existe';
 end;
end if;
if cuenta_tmp.estado='1' and new.codmov='2' then
	begin
	update sucursales set saldosuc=saldosuc+new.vrmov where codsuc=sucursal_tmp.codsuc;
	update saldos set saldoant=saldonuevo where cuenta=cuenta_tmp.ncta;
	update saldos set saldonuevo=saldonuevo+new.vrmov where cuenta=cuenta_tmp.ncta;
	update saldos set tconsignaciones=tconsignaciones+new.vrmov  where cuenta=cuenta_tmp.ncta;
	end;
end if;
if cuenta_tmp.estado = '1' and new.codmov = '3' then
	begin
	   if new.vrmov <= saldo_tmp.saldonuevo then
		begin
		  update sucursales set saldosuc=saldosuc-new.vrmov where codsuc=sucursal_tmp.codsuc;
		  update saldos set saldoant=saldonuevo where cuenta=cuenta_tmp.ncta;
		  update saldos set saldonuevo=saldonuevo-new.vrmov where cuenta=cuenta_tmp.ncta;
		  update saldos set tretiros=tretiros+new.vrmov where cuenta=cuenta_tmp.ncta;
		end;
	   else
		raise exception 'saldo insuficiente';
	   end if;
	end;
end if;

return new;
end;
$$ language plpgsql;

-- create trigger
create trigger insert_movimiento after insert on movimientos 
  for each row execute procedure fun_insert_movimiento();

-- datos movimientos saldos iniciales
insert into movimientos values('1000','1',50000,'06/10/2012');
insert into movimientos values('1100','1',50000,'06/10/2012');
insert into movimientos values('2000','1',100000,'06/10/2012');
insert into movimientos values('2100','1',100000,'06/10/2012');
insert into movimientos values('3000','1',150000,'06/10/2012');
insert into movimientos values('3100','1',150000,'06/10/2012');
insert into movimientos values('3200','1',200000,'06/10/2012');
insert into movimientos values('4000','1',200000,'06/10/2012');
insert into movimientos values('4100','1',250000,'06/11/2012');
insert into movimientos values('4200','1',250000,'06/11/2012');
insert into movimientos values('4300','1',300000,'06/11/2012');
insert into movimientos values('5000','1',300000,'06/11/2012');
-- datos consignaciones
insert into movimientos values('1000','2',50000,'06/12/2012');
insert into movimientos values('1100','2',50000,'06/12/2012');
insert into movimientos values('2000','2',100000,'06/12/2012');
insert into movimientos values('2100','2',100000,'06/12/2012');
insert into movimientos values('3000','2',150000,'06/12/2012');
insert into movimientos values('3100','2',150000,'06/12/2012');
insert into movimientos values('3200','2',200000,'06/12/2012');
-- datos retiros
insert into movimientos values('4000','3',50000,'06/13/2012');
insert into movimientos values('4100','3',50000,'06/13/2012');
insert into movimientos values('4200','3',50000,'06/13/2012');
insert into movimientos values('4300','3',30000,'06/13/2012');
insert into movimientos values('5000','3',30000,'06/13/2012');
