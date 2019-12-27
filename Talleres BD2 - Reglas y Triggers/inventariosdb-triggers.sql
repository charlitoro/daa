/*
 * ------------------------
 * -- Taller de Triggers --
 * ------------------------
 * Por:
 * 	Carlos Andres Toro Guerrero 
 * DB: 
 * 	inventariosdb
 **/

/*
Crear la base de datos inventariodb 

Crear un trigger que al ingresar un movimiento en la tabla movimientos 
se actualice: 
El valor unitario (vrunitario_pro) en la tabla productos como 
el promedio del valor unitario del producto(vrunitario_pro)  
y el nuevo valor unitario del movimiento (valor_unit). 
Por eso esto es aplicable solo si el tipo de movimiento es un ingreso (I).

El saldo anterior (saldo_ant) de la tabla inventario con el saldo actual 
(saldo_act) de la misma tabla.

El total ingresos (total_ing) de la tabla inventarios como la acumulación 
de las ingresos del producto.

El total egresos (total_egr) de la tabla inventarios como la acumulación 
de los egresos del producto.

El saldo actual (saldo_act) de la tabla inventarios como la suma de 
esta saldo actual mas la cantidad ingresada o menos la cantidad egresada.

El saldo en pesos (saldo_pesos) de la tabla inventarios como 
la multiplicacion del saldo actual por el valor unitario del producto.

*/

drop trigger insert_movimiento on movimientos;
delete from inventarios;
delete from movimientos;

create or replace function fun_insert_movimiento() returns trigger as $$
declare
  producto_tmp record;
  inventario_tmp record;
begin
  select * into producto_tmp from productos where codigo_pro=new.producto;
  select * into inventario_tmp from inventarios where producto=producto_tmp.nom_pro;

  update inventarios set saldo_ant = saldo_act
  where producto_tmp.codigo_pro=new.producto;

  if new.tipomov = 'I' then 
      update productos set 
        vrunitario_pro = round(((new.valor_unit+producto_tmp.vrunitario_pro)/2), 0)
	  where codigo_pro=producto_tmp.codigo_pro;
	  
      update inventarios set total_ing = total_ing + new.cantidad
	  where producto = producto_tmp.nom_pro;
 
      update inventarios set saldo_act = saldo_act + new.cantidad
      where producto = producto_tmp.nom_pro;

    elsif new.tipomov = 'E' then
      if inventario_tmp.saldo_act-new.cantidad >= 0 then 
        update inventarios set total_egr = total_egr + new.cantidad
	    where producto = producto_tmp.nom_pro;
  
        update inventarios set saldo_act = saldo_act - new.cantidad
        where producto = producto_tmp.nom_pro;
      else 
        raise notice 'Saldo actual insuficiente.';
      end if;
  end if;

  update inventarios set saldo_pesos = saldo_act * producto_tmp.vrunitario_pro
  where producto = producto_tmp.nom_pro;

  return new;
end
$$ language plpgsql;
-- create trigger
create trigger insert_movimiento after insert on movimientos 
  for each row execute procedure fun_insert_movimiento();

-- data movimientos
insert into movimientos values ('1000','02/10/2013','P100','E',5,0);
insert into movimientos values ('1000','02/10/2013','P400','E',2,0);
insert into movimientos values ('2000','02/11/2013','P400','I',3,350000);
insert into movimientos values ('2000','02/11/2013','P500','I',2,450000);
insert into movimientos values ('3000','02/12/2013','P300','E',5,0);
insert into movimientos values ('4000','02/13/2013','P700','I',2,400000);
insert into movimientos values ('4000','02/13/2013','P600','I',5,1000000);
insert into movimientos values ('5000','02/14/2013','P200','E',4,0);
insert into movimientos values ('5000','02/14/2013','P500','E',5,0);
insert into movimientos values ('6000','02/15/2013','P200','I',2,1100000);
insert into movimientos values ('6000','02/15/2013','P400','I',1,400000);
insert into movimientos values ('7000','02/16/2013','P400','E',3,0);
insert into movimientos values ('8000','02/17/2013','P200','E',1,0);
insert into movimientos values ('9000','02/18/2013','P300','E',5,0);
insert into movimientos values ('9000','02/18/2013','P400','E',2,0);
insert into movimientos values ('9500','02/19/2013','P300','I',8,950000);
insert into movimientos values ('9500','02/19/2013','P700','E',4,0);
insert into movimientos values ('9500','02/19/2013','P900','E',4,0);
insert into movimientos values ('9500','02/19/2013','P800','E',4,0);
insert into movimientos values ('9500','02/19/2013','P850','E',3,0);

