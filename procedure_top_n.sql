DELIMITER //

CREATE DEFINER=root@localhost PROCEDURE top_n(
n int,d int
)
BEGIN
drop temporary table if exists maximo_n;
create temporary table maximo_n
	select sucursal_id, ventas from ventas limit n;
		
if d = 0 then
insert into resultados
select 0, A.nombre,A.ap,0 ventas, now() from empleados A
    where A.sucursal_id in (select sucursal_id from maximo_n order by ventas) order by A.sucursal_id;
end if;

if d = 1 then
insert into resultados
select 0, A.nombre,A.ap,B.ventas, now() from empleados A, (select sucursal_id , ventas from  maximo_n) as B
	where A.sucursal_id=B.sucursal_id order by B.ventas desc;
end if;
if d = 2 then
insert into resultados
select 0, A.nombre,A.ap,B.ventas, now() from empleados A, (select sucursal_id , ventas from  maximo_n) as B
	where A.sucursal=B.sucursal_id order by B.ventas asc;
end if;

END //

DELIMITER ;






/*
DELIMITER //

drop procedure if exists top_n_menor;

CREATE DEFINER=root@localhost PROCEDURE top_n_menor ( n int, d int)

BEGIN

drop temporary table if exists menor_n;

create temporary table menor_n

select sucursal_id, ventas from ventas limit n;

if d=0 then

insert into resultados

select 0,A.nombre, A.ap, 0 ventas, now() from empleados A

where A.sucursal in (select sucursal_id from menor_n order by ventas) order by A.sucursal;

end if;

if d=1 then

insert into resultados

select 0, A.nombre,A.ap, B.ventas, now() from empleados A, (select sucursal_id, ventas from menor_n) as B

where A.sucursal=B.sucursal_id order by B.ventas asc;

END if;

END //

DELIMITER ;
*/