create database ventas;
use ventas;

create table ventas(
sucursal_id int primary key,
ventas int
);

drop table ventas;

create table productos(
id_producto int primary key,
producto varchar (100)
);

drop table productos;

create table empleados(
id_empleado int primary key,
nombre varchar (50),
ap varchar (50),
sucursal_id int,
id_producto int,
foreign key (sucursal_id)
    references ventas (sucursal_id) on update cascade on delete cascade,
foreign key (id_producto)
    references productos (id_producto) on update cascade on delete cascade
);

create table resultados (
id int primary key auto_increment,
nombre varchar (50),
ap varchar (50),
ventas int,
fecha_proceso datetime
);

truncate table resultados;

drop table resultados;

drop table empleados;

insert into ventas(sucursal_id,ventas)
values
	(1,"10000"),
	(2,"20000"),
	(3,"30000"),
	(4,"40000"),
	(5,"50000"),
	(6,"60000"),
	(7,"70000"),
	(8,"80000"),
	(9,"90000");

SELECT * FROM sucursal;

insert into productos(id_producto, producto)
values
	(1,"Mochila"),
	(2,"Lápiz"),
	(3,"Pluma"),
	(4,"Cuaderno"),
	(5,"Libro"),
	(6,"Computadora"),
	(7,"Diccionario"),
	(8,"Sacapuntas"),
	(9,"Goma"),
	(10,"Mochila"),
	(11,"Mochila"),
	(12,"Mochila"),
	(13,"Mochila"),
	(14,"Mochila"),
	(15,"Mochila");

SELECT * FROM productos;

insert into empleados(id_empleado,nombre,ap,sucursal_id,id_producto)
values
	(1,"Rafael","Ramirez",1,13),
	(2,"Salvador","Lucio",2,14),
	(3,"Christopher","Ramos",3,15),
	(4,"Evelyn","Quesada",4,7),
	(5,"Gloria","Calva",5,6),
	(6,"Alejandro","Angeles",6,5),
	(7,"Adrian","Reyes",7,4),
	(8,"Cuauhtemoc","Santos",8,3),
	(9,"Judith","Galindo",9,2),
	(10,"Emilia","Ramirez",1,1);

SELECT * FROM productos;

drop database ventas;