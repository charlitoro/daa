/*
 * ----------------------
 * -- Taller de Reglas --
 * ----------------------
 * Por:
 * 	Carlos Andres Toro Guerrero 
 * DB: 
 * 	energiadb
 *
 **/

/*
-- datos barrios
insert into barrios values ('B10','La Habana','1');
insert into barrios values ('B11','Lorenzo','2');
insert into barrios values ('B12','Miraflores','3');
insert into barrios values ('B13','San Ignacio','4');
insert into barrios values ('B14','Acacias','5');
insert into barrios values ('B15','Morasurco','6');
--
-- datos usuarios
insert into usuarios values ('1000','Pedro Ortiz','B15','M100');
insert into usuarios values ('2000','Julio Bucheli','B14','M200');
insert into usuarios values ('3000','Sofia Montenegro','B13','M300');
insert into usuarios values ('4000','Carmen Casas','B12','M400');
insert into usuarios values ('5000','Enrique Pianda','B11','M500');
insert into usuarios values ('6000','Camilo Perdomo','B10','M600');
--
--
-- datos lecturas
--
insert into lecturas  values ('M100',700,100,'01/09/2016');
insert into lecturas values ('M200',300,100,'01/09/2016');
insert into lecturas values ('M300',150,9150,'01/09/2016');
insert into lecturas values ('M400',500,100,'01/09/2016');
insert into lecturas values ('M500',1000,100,'01/09/2016');
insert into lecturas values ('M600',100,9500,'01/09/2016');
-- 
*/

delete from estadisticas;
delete from facturas;
delete from lecturas;
delete from usuarios;
delete from barrios;

-- 1. Crear una regla que al insertar un barrio en la tabla barrios 
--    inserte el nombre del barrio en la tabla  estadisticas.
create or replace rule inserta_barrios as on insert to barrios do (
	insert into estadisticas(barrio) values(new.nombre_ba);
);
-- datos barrios
insert into barrios values ('B10','La Habana','1');
insert into barrios values ('B11','Lorenzo','2');
insert into barrios values ('B12','Miraflores','3');
insert into barrios values ('B13','San Ignacio','4');
insert into barrios values ('B14','Acacias','5');
insert into barrios values ('B15','Morasurco','6');

-- 2. Crear una regla que al insertar un usuario en la tabla usuarios, 
--    se inserte el nombre del usuario en la tabla facturas.
create or replace rule inserta_usuarios as on insert to usuarios do (
	insert into facturas(usuario) values(new.nombre_usu);
);
-- datos usuarios
insert into usuarios values ('1000','Pedro Ortiz','B15','M100');
insert into usuarios values ('2000','Julio Bucheli','B14','M200');
insert into usuarios values ('3000','Sofia Montenegro','B13','M300');
insert into usuarios values ('4000','Carmen Casas','B12','M400');
insert into usuarios values ('5000','Enrique Pianda','B11','M500');
insert into usuarios values ('6000','Camilo Perdomo','B10','M600');

--3. Crear una regla que al insertar lecturas en la tabla lecturas 
--   actualice los datos en la tabla FACTURAS y en la tabla ESTADISTICAS,  
create or replace rule insert_lecturas as on insert to lecturas do (
-- UPDATE FACTURAS
	-- update kwh
	update facturas set kwh = (
		case when new.lectura_act < new.lectura_ant then 
				new.lectura_act+power(10, 
					(select digitos_me from medidores 
					where codigo_me=new.medidor_lec)) - new.lectura_ant
			else new.lectura_act - new.lectura_ant end)
	where usuario in (
		select nombre_usu from usuarios
		where new.medidor_lec=medidor_usu);
	-- update consumo
	update facturas set consumo = (
		case when kwh <= 200 then kwh * (select valor_tar from tarifas where codigo_tar='T1')
		     when kwh > 200  and kwh <= 400 then kwh * (select valor_tar from tarifas where codigo_tar='T2')
		     when kwh > 400  and kwh <= 800 then kwh * (select valor_tar from tarifas where codigo_tar='T3')
		     when kwh > 800  and kwh <= 1600 then kwh * (select valor_tar from tarifas where codigo_tar='T4')
		     when kwh > 1600 then kwh * (select valor_tar from tarifas where codigo_tar='T5')
		     end
	)
	where usuario in (
		select nombre_usu from usuarios
		where new.medidor_lec=medidor_usu);
	-- update cargofijo
	update facturas set cargofijo=(
		select valor_car from usuarios 
			join barrios on barrio_usu=codigo_ba
			join carfijos on estrato_ba=estrato_car
		where usuario=nombre_usu
	)
	where usuario in (
		select nombre_usu from usuarios
		where new.medidor_lec=medidor_usu
	);
	-- update vrfacturacion
	update facturas set vrfactura=consumo+cargofijo
	where usuario in (
		select nombre_usu from usuarios
		where new.medidor_lec=medidor_usu
	);
-- UPDATE ESTADISTICAS
	update estadisticas set tot_kwhs=tot_kwhs + (
		select kwh from facturas 
			join usuarios on usuario=nombre_usu
			join barrios on barrio_usu=codigo_ba
		where nombre_ba=barrio);
	--
	update estadisticas set tot_consumos=tot_consumos + (
		select consumo from facturas 
			join usuarios on usuario=nombre_usu
			join barrios on barrio_usu=codigo_ba
		where nombre_ba=barrio);
	--
	update estadisticas set tot_cargosfijo=tot_cargosfijo + (
		select cargofijo from facturas 
			join usuarios on usuario=nombre_usu
			join barrios on barrio_usu=codigo_ba
		where nombre_ba=barrio);
	--
	update estadisticas set tot_facturas=tot_kwhs+tot_consumos+tot_cargosfijo;
);

-- datos lecturas
--
insert into lecturas  values ('M100',700,100,'01/09/2016');
insert into lecturas values ('M200',300,100,'01/09/2016');
insert into lecturas values ('M300',150,9150,'01/09/2016');
insert into lecturas values ('M400',500,100,'01/09/2016');
insert into lecturas values ('M500',1000,100,'01/09/2016');
insert into lecturas values ('M600',100,9500,'01/09/2016');

--   teniendo en cuenta los siguientes datos:
/*
 En la tabla FACTURAS:
	Los KWH de cada usuario se obtienen como la diferencia entre
 la lectura actual (lectura_act) y la lectura anterior  (lectura_ant) del Medidor del usuario.
 Si la lectura actual es menor que la lectura anterior  quiere decir que el contador de lecturas del medidor
 dio una vuelta, por lo tanto, para que la diferencia no de negativa, se debe adicionar a la lectura actual 
 el numero 10 elevado a la potencia del numero de digitos del medidor  (lectura_act+10^digitos_me).

	El CONSUMO de cada usuario se obtiene como resultado del producto de los KWH por el valor de la tarifa  VALOR_TAR asi:
o	Si kwh <=200 entonces los kwh se cobran con CODIGO_TAR=T1
o	SI kwh>200 y kwh<=400 entonces se cobran con CODIGO_TAR=T2 	
	SI kwh>400 y kwh<=800 entonces  se cobran con CODIGO_TAR=T3
o	Si kwh>800 kwh y kwh <= 1600 entonces CODIGO_TAR=T4
o	Si kwh>1600 kwh  entonces CODIGO_TAR=T5
     
      El CARGOFIJO de cada usuario es el valor de la tabla CARFIJOS de acuerdo al estrato al cual  pertenece el usuario.

.     VRFACTURA es la suma de CONSUMO y CARGOFIJO

En la tabla ESTADISTICAS:
tot_kwhs es el total de kilovatios por barrio:
tot_consumos es el total de consumos por barrio.
tot_cargosfijo es el total de cargos fijos por barrio
tot_facturas es el total facturado por barrio
*/

