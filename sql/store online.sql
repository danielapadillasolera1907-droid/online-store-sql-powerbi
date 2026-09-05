create database Online_store; 
use  Online_store; 

create table clientes(
id_cliente int identity (1,1) primary key,
nombre varchar (50) not null ,
apellido_1 varchar (25) not null,
apellido_2 varchar (25) ,
correo_electronico varchar (100) unique not null,
telefono varchar (25) ,
ciudad varchar (50) not null ,
fecha_registro date
);


create table categorias(
id_categoria int identity (1,1) primary key ,
nombre_categoria varchar (50) not null unique ,
descripcion varchar (100)  ,
fecha_creacion date 
);

create table proveedores(
id_proveedor int identity (1,1) primary key,
nombre_proveedor varchar (50) not null ,
contacto varchar (50) not null ,
correo_electronico varchar (100) unique ,
direccion varchar (150) not null ,
ciudad varchar (50),
fecha_registro date,
estado VARCHAR(20) default 'Activo'
);
alter table proveedores add numero_telefono varchar(50);

create table productos(
id_producto int identity(1,1) primary key ,
nombre_producto varchar (100) not null , 
descripcion varchar (100)  ,
precio decimal (10,2) check (precio > 0), 
stock int not null check (stock >= 0) ,
id_categoria int not null,
id_proveedor int ,
foreign key (id_categoria) references categorias (id_categoria),
foreign key (id_proveedor) references proveedores (id_proveedor)
);

create table pedidos(
id_pedido int identity (1,1) primary key,
id_cliente int not null,
fecha_pedido date,
estado varchar (50) not null check (estado IN('pendiente','enviado','entregado','cancelado')),
total decimal (10,2) check (total >0),
foreign key (id_cliente)references clientes(id_cliente)
);

create table detalle_pedido(
id_detalle_pedido int identity (1,1) primary key,
id_pedido int not null,
id_producto int not null ,
cantidad int not null check (cantidad >0),
precio_unitario decimal(10,2) check (precio_unitario >0), unique(id_pedido,id_producto),
foreign key (id_pedido) references pedidos (id_pedido),
foreign key (id_producto) references productos (id_producto)
);
SELECT COUNT(*) AS cantidad_detalles
FROM detalle_pedido;

INSERT INTO clientes(nombre, apellido_1, apellido_2, correo_electronico, telefono, ciudad, fecha_registro)
VALUES
('Daniela','Padilla','Lopez','daniela.padilla@gmail.com','8888-1111','Liberia','2025-01-05'),
('Carlos','Rodriguez','Soto','carlos.rodriguez@gmail.com','8888-2222','San Jose','2025-01-12'),
('Maria','Gomez','Rojas','maria.gomez@gmail.com','8888-3333','Heredia','2025-01-18'),
('Jose','Vargas','Mendez','jose.vargas@gmail.com','8888-4444','Alajuela','2025-01-25'),
('Andrea','Castro','Jimenez','andrea.castro@gmail.com','8888-5555','Cartago','2025-02-03'),
('Luis','Ramirez','Salas','luis.ramirez@gmail.com','8888-6666','Puntarenas','2025-02-11'),
('Sofia','Morales','Herrera','sofia.morales@gmail.com','8888-7777','Limon','2025-02-19'),
('Josue','Hernandez','Rojas','josue.hernandez@gmail.com','8888-8888','San Jose','2025-02-27'),
('Laura','Mora','Vega','laura.mora@gmail.com','8888-9999','Heredia','2025-03-06'),
('Miguel','Alvarado','Perez','miguel.alvarado@gmail.com','8777-1111','Liberia','2025-03-14'),
('Valeria','Jimenez','Castro','valeria.jimenez@gmail.com','8777-2222','Alajuela','2025-03-22'),
('Fernando','Sanchez','Diaz','fernando.sanchez@gmail.com','8777-3333','Cartago','2025-04-01'),
('Natalia','Rojas','Vargas','natalia.rojas@gmail.com','8777-4444','San Jose','2025-04-09'),
('Diego','Salazar','Mora','diego.salazar@gmail.com','8777-5555','Heredia','2025-04-17'),
('Camila','Herrera','Lopez','camila.herrera@gmail.com','8777-6666','Puntarenas','2025-04-25'),
('Andres','Gomez','Castro','andres.gomez@gmail.com','8777-7777','San Jose','2025-05-04'),
('Valeria','Mendez','Rojas','valeria.mendez@gmail.com','8777-8888','Alajuela','2025-05-12'),
('Daniel','Vargas','Soto','daniel.vargas@gmail.com','8777-9999','Heredia','2025-05-20'),
('Sofia','Ramirez','Jimenez','sofia.ramirez@gmail.com','8666-1111','Cartago','2025-05-28'),
('Mateo','Chaves','Mora','mateo.chaves@gmail.com','8666-2222','Limon','2025-06-05'),
('Isabella','Navarro','Perez','isabella.navarro@gmail.com','8666-3333','Guanacaste','2025-06-13'),
('Sebastian','Salazar','Vega','sebastian.salazar@gmail.com','8666-4444','Puntarenas','2025-06-21'),
('Gabriela','Castillo','Ruiz','gabriela.castillo@gmail.com','8666-5555','San Jose','2025-07-02'),
('Luis','Fernandez','Alfaro','luis.fernandez@gmail.com','8666-6666','Alajuela','2025-07-10'),
('Mariana','Quesada','Campos','mariana.quesada@gmail.com','8666-7777','Heredia','2025-07-18'),
('Diego','Molina','Rojas','diego.molina@gmail.com','8666-8888','Cartago','2025-07-26'),
('Ana','Vega','Sanchez','ana.vega@gmail.com','8666-9999','Limon','2025-08-04'),
('Carlos','Jimenez','Mendez','carlos.jimenez@gmail.com','8555-1111','Guanacaste','2025-08-12'),
('Laura','Sanchez','Herrera','laura.sanchez@gmail.com','8555-2222','Puntarenas','2025-08-20'),
('Fernando','Rojas','Castro','fernando.rojas@gmail.com','8555-3333','San Jose','2025-08-28'),
('Natalia','Alfaro','Gomez','natalia.alfaro@gmail.com','8555-4444','Alajuela','2025-09-06'),
('Javier','Mora','Vargas','javier.mora@gmail.com','8555-5555','Heredia','2025-09-14'),
('Paula','Soto','Navarro','paula.soto@gmail.com','8555-6666','Cartago','2025-09-22'),
('Ricardo','Perez','Chaves','ricardo.perez@gmail.com','8555-7777','Limon','2025-09-30'),
('Valentina','Ruiz','Ramirez','valentina.ruiz@gmail.com','8555-8888','Guanacaste','2025-10-08'),
('Alejandro','Campos','Mora','alejandro.campos@gmail.com','8555-9999','San Jose','2025-10-16'),
('Karen','Lopez','Vargas','karen.lopez@gmail.com','8444-1111','Alajuela','2025-10-24'),
('Esteban','Herrera','Soto','esteban.herrera@gmail.com','8444-2222','Heredia','2025-11-02'),
('Melissa','Castro','Rojas','melissa.castro@gmail.com','8444-3333','Cartago','2025-11-10'),
('Roberto','Mendez','Jimenez','roberto.mendez@gmail.com','8444-4444','Puntarenas','2025-11-18'),
('Gabriela','Vargas','Salas','gabriela.vargas@gmail.com','8444-5555','Liberia','2025-11-26'),
('Oscar','Ramirez','Diaz','oscar.ramirez@gmail.com','8444-6666','San Jose','2025-12-04'),
('Patricia','Mora','Castro','patricia.mora@gmail.com','8444-7777','Alajuela','2025-12-12'),
('Cristian','Sanchez','Vega','cristian.sanchez@gmail.com','8444-8888','Heredia','2025-12-20'),
('Monica','Alfaro','Perez','monica.alfaro@gmail.com','8444-9999','Cartago','2025-12-28'),
('Adrian','Rojas','Mendez','adrian.rojas@gmail.com','8333-1111','Limon','2026-01-06'),
('Nicole','Jimenez','Lopez','nicole.jimenez@gmail.com','8333-2222','Guanacaste','2026-01-14'),
('Mauricio','Chaves','Soto','mauricio.chaves@gmail.com','8333-3333','San Jose','2026-01-22'),
('Fernanda','Vega','Herrera','fernanda.vega@gmail.com','8333-4444','Alajuela','2026-01-30'),
('Jonathan','Salazar','Mora','jonathan.salazar@gmail.com','8333-5555','Heredia','2026-02-08'),
('Carolina','Castillo','Rojas','carolina.castillo@gmail.com','8333-6666','Cartago','2026-02-16'),
('Pablo','Fernandez','Diaz','pablo.fernandez@gmail.com','8333-7777','Puntarenas','2026-02-24'),
('Alejandra','Quesada','Vargas','alejandra.quesada@gmail.com','8333-8888','Liberia','2026-03-04'),
('Rafael','Molina','Soto','rafael.molina@gmail.com','8333-9999','San Jose','2026-03-12'),
('Jessica','Navarro','Mora','jessica.navarro@gmail.com','8222-1111','Alajuela','2026-03-20'),
('Manuel','Gomez','Rojas','manuel.gomez@gmail.com','8222-2222','Heredia','2026-03-28'),
('Silvia','Rodriguez','Castro','silvia.rodriguez@gmail.com','8222-3333','Cartago','2026-04-06'),
('Hector','Vargas','Jimenez','hector.vargas@gmail.com','8222-4444','Limon','2026-04-14'),
('Beatriz','Ramirez','Sanchez','beatriz.ramirez@gmail.com','8222-5555','Guanacaste','2026-04-22'),
('Marco','Herrera','Vega','marco.herrera@gmail.com','8222-6666','Puntarenas','2026-04-30'),
('Diana','Mendez','Lopez','diana.mendez@gmail.com','8222-7777','San Jose','2026-05-08'),
('Victor','Alfaro','Rojas','victor.alfaro@gmail.com','8222-8888','Alajuela','2026-05-16'),
('Rebeca','Chaves','Mora','rebeca.chaves@gmail.com','8222-9999','Heredia','2026-05-24'),
('Gustavo','Soto','Perez','gustavo.soto@gmail.com','8111-1111','Cartago','2026-06-02'),
('Elena','Salas','Castro','elena.salas@gmail.com','8111-2222','Limon','2026-06-10'),
('Rodrigo','Campos','Vargas','rodrigo.campos@gmail.com','8111-3333','Guanacaste','2026-06-18'),
('Veronica','Mora','Jimenez','veronica.mora@gmail.com','8111-4444','San Jose','2026-06-26'),
('Sergio','Rojas','Herrera','sergio.rojas@gmail.com','8111-5555','Alajuela','2026-07-04'),
('Karla','Vega','Sanchez','karla.vega@gmail.com','8111-6666','Heredia','2026-07-10'),
('Alberto','Jimenez','Mendez','alberto.jimenez@gmail.com','8111-7777','Cartago','2026-07-16'),
('Cecilia','Castro','Lopez','cecilia.castro@gmail.com','8111-8888','Puntarenas','2026-07-22'),
('Tomas','Mora','Rojas','tomas.mora@gmail.com','8111-9999','Liberia','2026-07-27'),
('Lucia','Sanchez','Vargas','lucia.sanchez@gmail.com','8999-1111','San Jose','2026-08-01'),
('Enrique','Perez','Castro','enrique.perez@gmail.com','8999-2222','Alajuela','2026-08-03'),
('Fabiola','Ruiz','Jimenez','fabiola.ruiz@gmail.com','8999-3333','Heredia','2026-08-05'),
('Martin','Navarro','Mora','martin.navarro@gmail.com','8999-4444','Cartago','2026-08-07'),
('Rosa','Alvarado','Soto','rosa.alvarado@gmail.com','8999-5555','Guanacaste','2026-08-09'),
('Kevin','Salazar','Lopez','kevin.salazar@gmail.com','8999-6666','Limon','2026-08-10'),
('Adriana','Mendez','Rojas','adriana.mendez@gmail.com','8999-7777','Puntarenas','2026-08-11'),
('Nicolas','Vargas','Herrera','nicolas.vargas@gmail.com','8999-8888','Liberia','2026-08-11');

select *
from clientes;

INSERT INTO categorias(nombre_categoria, descripcion, fecha_creacion)
VALUES
('Tecnologia','Productos tecnologicos y dispositivos electronicos','2025-01-10'),
('Computacion','Computadoras, laptops y accesorios','2025-01-25'),
('Telefonia','Telefonos celulares y accesorios','2025-02-15'),
('Audio','Audifonos, parlantes y equipos de sonido','2025-03-05'),
('Hogar','Productos para el hogar y uso diario','2025-03-22'),
('Oficina','Articulos para oficina y trabajo','2025-04-18'),
('Gaming','Productos y accesorios para videojuegos','2025-05-12'),
('Electrodomesticos','Electrodomesticos para el hogar','2025-06-20'),
('Accesorios','Accesorios para dispositivos electronicos','2025-08-08'),
('Seguridad','Productos de seguridad y vigilancia','2026-01-15');

select*
from categorias;

INSERT INTO proveedores(nombre_proveedor, contacto, correo_electronico, direccion, ciudad, fecha_registro, estado, numero_telefono)
VALUES
('Tech Solutions CR','Ana Martinez','ana.martinez@techsolutionscr.com','Avenida Central, Edificio 5','San Jose','2025-01-08','Activo','2222-1001'),

('CompuMarket CR','Carlos Hernandez','carlos.hernandez@compumarketcr.com','Barrio Mexico, Calle 8','San Jose','2025-01-20','Activo','2222-1002'),

('Digital World','Laura Rodriguez','laura.rodriguez@digitalworldcr.com','Centro Comercial Plaza Real','Heredia','2025-02-12','Activo','2261-1003'),

('Electronica Tica','Jose Vargas','jose.vargas@electronicatica.com','Avenida 2, Local 10','Alajuela','2025-02-28','Activo','2440-1004'),

('Gadget Center','Maria Castro','maria.castro@gadgetcentercr.com','Centro Comercial Central','Cartago','2025-03-15','Activo','2551-1005'),

('Importadora Pacifico','Luis Ramirez','luis.ramirez@importadorapacifico.com','Zona Comercial Pacifico','Puntarenas','2025-03-30','Activo','2661-1006'),

('Caribe Electronics','Sofia Morales','sofia.morales@caribeelectronics.com','Avenida Principal, Local 4','Limon','2025-04-14','Activo','2755-1007'),

('Guanacaste Tech','Daniel Chaves','daniel.chaves@guanacastetech.com','Barrio Los Angeles, Calle 3','Liberia','2025-04-29','Activo','2690-1008'),

('Office Pro CR','Andrea Gomez','andrea.gomez@officeprocr.com','Zona Industrial Norte','Heredia','2025-05-16','Activo','2262-1009'),

('Smart Devices CR','Fernando Sanchez','fernando.sanchez@smartdevicescr.com','Boulevard Comercial, Local 12','Alajuela','2025-06-02','Activo','2441-1010'),

('Audio Center','Natalia Rojas','natalia.rojas@audiocentercr.com','Avenida Central, Edificio 8','San Jose','2025-06-21','Activo','2223-1011'),

('Gaming Store CR','Diego Salazar','diego.salazar@gamingstorecr.com','Centro Comercial Gamer','Cartago','2025-07-10','Activo','2552-1012'),

('Electro Hogar','Camila Herrera','camila.herrera@electrohogarcr.com','Calle Principal, Local 6','San Jose','2025-08-05','Inactivo','2224-1013'),

('Security Plus CR','Andres Gomez','andres.gomez@securitypluscr.com','Zona Comercial Oeste','Alajuela','2025-09-18','Activo','2442-1014'),

('Global Imports CR','Valeria Mendez','valeria.mendez@globalimportscr.com','Zona Franca, Edificio 2','Heredia','2025-10-07','Activo','2263-1015'),

('Data Systems CR','Ricardo Perez','ricardo.perez@datasystemscr.com','Parque Industrial Norte','San Jose','2025-11-12','Activo','2225-1016'),

('Home Technology','Paula Soto','paula.soto@hometechnologycr.com','Centro Comercial La Sabana','San Jose','2025-12-03','Inactivo','2226-1017'),

('Pro Electronics','Javier Mora','javier.mora@proelectronicscr.com','Avenida 5, Local 15','Heredia','2026-01-18','Activo','2264-1018'),

('Costa Rica Imports','Mariana Quesada','mariana.quesada@crimports.com','Zona Comercial Guanacaste','Liberia','2026-03-09','Activo','2691-1019'),

('Future Tech CR','Sebastian Salazar','sebastian.salazar@futuretechcr.com','Centro Empresarial Pacifico','Puntarenas','2026-05-22','Activo','2662-1020');

select*
from proveedores;


INSERT INTO productos(nombre_producto, descripcion, precio, stock, id_categoria, id_proveedor)
VALUES
-- TECNOLOGIA
('Smart TV 50 pulgadas','Televisor inteligente 4K',389900.00,15,1,1),
('Smart TV 43 pulgadas','Televisor inteligente Full HD',279900.00,22,1,3),
('Tablet 10 pulgadas','Tablet Android de 10 pulgadas',149900.00,30,1,5),
('Tablet Pro 12 pulgadas','Tablet de alto rendimiento',329900.00,12,1,10),
('Smartwatch Pro','Reloj inteligente deportivo',89900.00,35,1,15),
('Smartwatch Active','Reloj inteligente para actividad fisica',59900.00,42,1,18),
('Camara Digital','Camara digital compacta',219900.00,10,1,6),
('Proyector HD','Proyector multimedia HD',179900.00,18,1,8),
('Monitor Inteligente 32','Monitor inteligente de 32 pulgadas',249900.00,14,1,12),
('Hub Inteligente USB','Hub USB multipuerto',39900.00,55,1,20),

-- COMPUTACION
('Laptop Lenovo IdeaPad','Laptop para trabajo y estudio',349900.00,18,2,2),
('Laptop HP 15','Laptop de 15 pulgadas',429900.00,12,2,4),
('Laptop Dell Inspiron','Laptop para oficina y estudio',489900.00,10,2,1),
('Laptop Asus VivoBook','Laptop compacta para trabajo',399900.00,16,2,10),
('Laptop Acer Aspire','Laptop de uso general',329900.00,20,2,3),
('PC Escritorio','Computadora de escritorio',459900.00,8,2,16),
('Mini PC','Computadora compacta',239900.00,15,2,18),
('Teclado Mecanico','Teclado mecanico RGB',45900.00,50,2,12),
('Mouse Inalambrico','Mouse ergonomico inalambrico',18900.00,75,2,5),
('Mouse Gaming','Mouse gaming RGB',29900.00,60,2,13),
('Monitor 24 pulgadas','Monitor Full HD',109900.00,25,2,9),
('Monitor 27 pulgadas','Monitor IPS de 27 pulgadas',169900.00,18,2,14),
('Memoria RAM 16GB','Memoria DDR4 16GB',32900.00,40,2,2),
('Disco SSD 1TB','Unidad de almacenamiento SSD',69900.00,35,2,16),
('Disco SSD 500GB','Unidad SSD de 500GB',44900.00,45,2,7),

-- TELEFONIA
('iPhone 15','Smartphone Apple 128GB',499900.00,8,3,15),
('Samsung Galaxy A55','Smartphone Samsung gama media',229900.00,20,3,3),
('Samsung Galaxy S24','Smartphone Samsung gama alta',449900.00,9,3,18),
('Xiaomi Redmi Note','Smartphone Xiaomi',149900.00,30,3,10),
('Motorola G84','Smartphone Motorola',139900.00,25,3,4),
('Honor X8','Smartphone Honor',129900.00,22,3,19),
('Cargador USB-C','Cargador rapido USB-C',15900.00,80,3,6),
('Cargador Inalambrico','Base de carga inalambrica',24900.00,55,3,11),
('Cable USB-C','Cable USB-C de carga rapida',6900.00,120,3,5),
('Power Bank 20000mAh','Bateria portatil de alta capacidad',29900.00,65,3,20),

-- AUDIO
('Audifonos Bluetooth','Audifonos inalambricos',35900.00,70,4,7),
('Audifonos Premium','Audifonos con cancelacion de ruido',129900.00,25,4,11),
('Audifonos Gaming','Audifonos para videojuegos',59900.00,40,4,13),
('Parlante Bluetooth','Parlante portatil Bluetooth',49900.00,50,4,6),
('Parlante Premium','Parlante de alta potencia',159900.00,18,4,17),
('Barra de Sonido','Barra de sonido para TV',119900.00,20,4,8),
('Microfono USB','Microfono USB para streaming',69900.00,30,4,12),
('Microfono Profesional','Microfono profesional de estudio',189900.00,10,4,16),
('Adaptador Bluetooth','Adaptador Bluetooth USB',12900.00,85,4,5),
('Radio Portatil','Radio portatil digital',29900.00,35,4,9),

-- HOGAR
('Aspiradora Robot','Aspiradora robot inteligente',249900.00,12,5,17),
('Aspiradora Vertical','Aspiradora vertical para hogar',119900.00,20,5,14),
('Lampara LED','Lampara LED de escritorio',18900.00,70,5,5),
('Lampara Inteligente','Lampara inteligente WiFi',29900.00,45,5,1),
('Ventilador Torre','Ventilador de torre',69900.00,25,5,8),
('Purificador de Aire','Purificador de aire domestico',149900.00,15,5,18),
('Organizador Cocina','Organizador multiuso para cocina',12900.00,80,5,6),
('Balanza Digital','Balanza digital para hogar',19900.00,50,5,10),
('Cafetera Programable','Cafetera programable electrica',79900.00,22,5,19),
('Set de Cocina','Set de utensilios para cocina',39900.00,40,5,20),

-- OFICINA
('Silla Ergonomica','Silla ergonomica para oficina',159900.00,15,6,14),
('Escritorio Oficina','Escritorio para oficina',129900.00,12,6,17),
('Lampara Escritorio','Lampara LED para escritorio',24900.00,55,6,5),
('Calculadora Cientifica','Calculadora cientifica avanzada',18900.00,60,6,9),
('Grapadora Profesional','Grapadora para oficina',8900.00,80,6,6),
('Archivador Metalico','Archivador metalico de oficina',89900.00,18,6,16),
('Pizarra Blanca','Pizarra blanca para oficina',45900.00,25,6,8),
('Impresora Multifuncional','Impresora para oficina',189900.00,10,6,4),
('Escaner Documentos','Escaner de documentos',139900.00,12,6,2),
('Destructora Papel','Destructora de documentos',69900.00,15,6,18),

-- GAMING
('PlayStation 5','Consola PlayStation 5',399900.00,10,7,13),
('Xbox Series X','Consola Xbox Series X',379900.00,8,7,17),
('Nintendo Switch','Consola Nintendo Switch',219900.00,15,7,19),
('Control PS5','Control inalambrico para PS5',69900.00,35,7,13),
('Control Xbox','Control inalambrico Xbox',59900.00,40,7,17),
('Silla Gaming','Silla ergonomica gaming',179900.00,12,7,12),
('Mouse Gaming Pro','Mouse gaming profesional',49900.00,30,7,13),
('Teclado Gaming RGB','Teclado mecanico RGB',69900.00,25,7,12),
('Monitor Gaming 27','Monitor gaming 27 pulgadas',249900.00,14,7,18),
('Headset Gaming','Headset gaming con microfono',79900.00,30,7,11),

-- ELECTRODOMESTICOS
('Refrigeradora','Refrigeradora de dos puertas',499900.00,6,8,17),
('Microondas','Microondas digital',89900.00,20,8,8),
('Licuadora','Licuadora de alta potencia',49900.00,35,8,14),
('Freidora de Aire','Freidora de aire digital',79900.00,30,8,19),
('Arrocera Electrica','Arrocera electrica automatica',39900.00,40,8,6),
('Horno Electrico','Horno electrico multifuncional',109900.00,15,8,17),
('Cafetera Espresso','Cafetera espresso domestica',159900.00,12,8,20),
('Batidora','Batidora electrica de cocina',59900.00,25,8,14),
('Sandwichera','Sandwichera electrica',29900.00,45,8,8),
('Plancha de Ropa','Plancha electrica para ropa',34900.00,35,8,3),

-- ACCESORIOS
('Funda para Laptop','Funda protectora para laptop',19900.00,70,9,2),
('Mochila Laptop','Mochila para computadora portatil',35900.00,50,9,7),
('Soporte Laptop','Soporte ajustable para laptop',24900.00,45,9,12),
('Soporte Celular','Soporte de escritorio para celular',9900.00,90,9,5),
('Adaptador USB','Adaptador USB multiproposito',7900.00,100,9,6),
('Cable HDMI','Cable HDMI de alta velocidad',9900.00,85,9,8),
('Cable DisplayPort','Cable DisplayPort',12900.00,65,9,16),
('Webcam HD','Camara web Full HD',39900.00,40,9,1),
('Mouse Pad XL','Mouse pad gaming grande',15900.00,75,9,13),
('Regleta Electrica','Regleta con proteccion',19900.00,60,9,20),

-- SEGURIDAD
('Camara Seguridad WiFi','Camara de seguridad inteligente',49900.00,35,10,14),
('Camara Exterior','Camara de seguridad exterior',89900.00,20,10,16),
('Kit Camaras 4','Kit de cuatro camaras',249900.00,8,10,17),
('Videoportero','Videoportero inteligente',129900.00,12,10,18),
('Alarma Inteligente','Sistema de alarma para hogar',149900.00,15,10,20),
('Sensor Movimiento','Sensor de movimiento WiFi',29900.00,45,10,1),
('Sensor Puerta','Sensor inteligente para puertas',19900.00,55,10,3),
('Cerradura Inteligente','Cerradura digital inteligente',159900.00,10,10,15),
('Control Acceso','Sistema de control de acceso',219900.00,7,10,19),
('Detector Humo','Detector inteligente de humo',39900.00,40,10,6);

INSERT INTO pedidos
(id_cliente, fecha_pedido, estado, total)
VALUES
(36,'2025-01-05','entregado',NULL),
(37,'2025-01-08','entregado',NULL),
(38,'2025-01-12','enviado',NULL),
(39,'2025-01-15','entregado',NULL),
(40,'2025-01-20','pendiente',NULL),
(41,'2025-01-25','entregado',NULL),
(42,'2025-02-02','enviado',NULL),
(43,'2025-02-06','entregado',NULL),
(44,'2025-02-10','entregado',NULL),
(45,'2025-02-14','cancelado',NULL),
(46,'2025-02-18','entregado',NULL),
(47,'2025-02-22','enviado',NULL),
(48,'2025-03-01','entregado',NULL),
(49,'2025-03-05','entregado',NULL),
(50,'2025-03-09','pendiente',NULL),
(51,'2025-03-14','entregado',NULL),
(52,'2025-03-18','enviado',NULL),
(53,'2025-03-22','entregado',NULL),
(54,'2025-03-27','entregado',NULL),
(55,'2025-03-30','cancelado',NULL);
 
INSERT INTO pedidos
(id_cliente, fecha_pedido, estado, total)
SELECT
    36 + ((n - 1) % 80) AS id_cliente,

    DATEADD(
        DAY,
        (n * 2) % 580,
        CAST('2025-01-01' AS DATE)
    ) AS fecha_pedido,

    CASE
        WHEN n % 25 = 0 THEN 'cancelado'
        WHEN n % 8 = 0 THEN 'pendiente'
        WHEN n % 5 = 0 THEN 'enviado'
        ELSE 'entregado'
    END AS estado,

    NULL AS total

FROM
(
    SELECT TOP 280
        ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS n
    FROM sys.objects a
    CROSS JOIN sys.objects b
) AS numeros;


INSERT INTO detalle_pedido
(id_pedido, id_producto, cantidad, precio_unitario)
SELECT TOP 700
    p.id_pedido,
    pr.id_producto,
    ((ABS(CHECKSUM(NEWID())) % 4) + 1) AS cantidad,
    pr.precio AS precio_unitario
FROM pedidos p
CROSS JOIN productos pr
WHERE p.id_pedido >= 2
ORDER BY NEWID();




UPDATE p
SET total = d.total_pedido
FROM pedidos p
INNER JOIN (
    SELECT
        id_pedido,
        SUM(cantidad * precio_unitario) AS total_pedido
    FROM detalle_pedido
    GROUP BY id_pedido
) d
ON p.id_pedido = d.id_pedido;


--CONSULTAS

--Mostrar nombre , apellido_1 , ciudad de los clientes

SELECT nombre, apellido_1, ciudad
FROM clientes;

--Mostrar los productos que cuestan más de ₡100 000.

select*
from productos
where precio > 100000;

--Mostrar los proveedores que son de San José.
select*
from proveedores
where ciudad = 'San Jose';

--Ordenar los productos del más caro al más barato.

select *
from productos
order by precio  desc;


--Ordenar los productos Del más barato al más caro.

select*
from productos
order by precio ;

--Mostrar los 5 productos más caros.
select top 5*
from productos
order by precio desc;


--Clientes cuyo nombre empieza con A.

select nombre
from clientes
where nombre like 'A%';


--Productos que contienen la palabra "Laptop".

select *
from productos
where nombre_producto like '%laptop%';


--Productos entre ₡50 000 y ₡200 000.

select *
from productos 
where precio between 50000 and 200000;

--Mostrar los pedidos con el nombre del cliente
SELECT
    p.id_pedido,
    c.nombre,
    c.apellido_1,
    p.estado,
    p.total
FROM pedidos p
INNER JOIN clientes c
ON p.id_cliente = c.id_cliente;

--Mostrar qué producto se compró en cada pedido.
SELECT
    dp.id_pedido,
    pr.nombre_producto,
    dp.cantidad,
    dp.precio_unitario
FROM detalle_pedido dp
INNER JOIN productos pr
ON dp.id_producto = pr.id_producto;


-- Mostrar el nombre del cliente, el número de pedido, el producto comprado, la cantidad y el precio unitario.

SELECT
    c.nombre,
    c.apellido_1,
    p.id_pedido,
    pr.nombre_producto,
    dp.cantidad,
    dp.precio_unitario
FROM clientes c
INNER JOIN pedidos p
ON c.id_cliente = p.id_cliente
INNER JOIN detalle_pedido dp
ON p.id_pedido = dp.id_pedido
INNER JOIN productos pr
ON dp.id_producto = pr.id_producto;


-- Mostrar todos los productos con su categoría.
SELECT
    p.nombre_producto,
    c.nombre_categoria,
    p.precio
FROM productos p
LEFT JOIN categorias c
ON p.id_categoria = c.id_categoria;

-- Mostrar todas las categorías y los productos registrados en cada una.
SELECT
    c.nombre_categoria,
    p.nombre_producto
FROM categorias c
LEFT JOIN productos p
ON c.id_categoria = p.id_categoria;



-- Contar la cantidad de clientes registrados. 

select count (*) as cantidad_clientes_registrados 
from clientes;

-- Contar la cantidad de productos registrados.

select count(*) cantidad_productos_registrados
from productos;


-- Calcular el total de ventas registradas

select sum (total) as total_ventas_registradas 
from pedidos;


-- Mostrar el precio promedio de los productos.

select avg (precio) as precio_promedio_producto
from productos;


-- Mostrar el producto con el precio más bajo.

select min (precio) as producto_precio_bajo 
from productos;


-- Mostrar el producto con el precio más alto.

select max (precio) as producto_precio_alto 
from productos;



-- Contar la cantidad de pedidos según su estado.

select estado,  count (*) as pedidos_estado 
from pedidos
group by estado;


-- Contar la cantidad de productos por categoría.

select id_categoria, count (*) as producto_categoria 
from productos 
group by id_categoria;

-- Calcular el total vendido según el estado del pedido.

select estado  , sum (total) as total_vendido
from pedidos
group by estado ;

-- Calcular el precio promedio de los productos por categoría.

select id_categoria, avg (precio) as precio_promedio 
from productos
group by id_categoria;


-- Mostrar los estados con más de 2 pedidos.

select estado , count (*) as cantidad_pedidos
from pedidos
group by estado 
having count(*) >2;


-- Mostrar las categorías que tienen más de un producto.

select  id_categoria, count (*) as categoria_producto
from productos
group by id_categoria
having count (*) > 1;

-- Mostrar los clientes que han realizado más de un pedido.
SELECT
    c.nombre,
    c.apellido_1,
    COUNT(p.id_pedido) AS cantidad_pedidos
FROM clientes c
INNER JOIN pedidos p
ON c.id_cliente = p.id_cliente
GROUP BY c.nombre, c.apellido_1
HAVING COUNT(p.id_pedido) > 1;


-- Mostrar los proveedores que suministran más de un producto.
SELECT
    pr.nombre_proveedor,
    COUNT(p.id_producto) AS cantidad_productos
FROM proveedores pr
INNER JOIN productos p
ON pr.id_proveedor = p.id_proveedor
GROUP BY pr.nombre_proveedor
HAVING COUNT(p.id_producto) > 1;


-- Mostrar el producto con el precio más alto.

select *
from productos
where precio =
(
select max (Precio)
from productos
);


-- Mostrar el producto con el precio más bajo.

select *
from productos 
where precio =
(
select min (precio)
from productos
);


-- Mostrar los clientes que han realizado al menos un pedido.
SELECT
    nombre,
    apellido_1
FROM clientes
WHERE id_cliente IN
(
    SELECT id_cliente
    FROM pedidos
);

--Mostrar todos los productos con su categoría.

CREATE VIEW vw_ProductosCategoria
AS

SELECT
    p.nombre_producto,
    c.nombre_categoria,
    p.precio

FROM productos p
INNER JOIN categorias c
ON p.id_categoria = c.id_categoria;

SELECT *
FROM vw_ProductosCategoria;


--Mostrar el cliente, el pedido y el producto.

CREATE VIEW vw_ReporteVentas
AS

SELECT
    c.nombre,
    c.apellido_1,
    p.id_pedido,
    pr.nombre_producto,
    dp.cantidad,
    dp.precio_unitario

FROM clientes c
INNER JOIN pedidos p
ON c.id_cliente = p.id_cliente

INNER JOIN detalle_pedido dp
ON p.id_pedido = dp.id_pedido

INNER JOIN productos pr
ON dp.id_producto = pr.id_producto;

select *
from vw_ReporteVentas;


--Mostrar la posición de cada producto según su precio, 
--junto con el nombre del producto y su precio, ordenando los productos del más caro al más barato.
SELECT
    ROW_NUMBER() OVER(ORDER BY precio DESC) AS posicion,
    nombre_producto,
    precio
FROM productos;

--Mostrar la posición de cada cliente según la fecha en que se registró, 
--junto con el nombre del cliente y la fecha de registro. El cliente más antiguo debe tener la posición 1.

select ROW_NUMBER() OVER(ORDER BY fecha_registro asc ) as fecha_registro ,
nombre, fecha_registro
from clientes;



--Mostrar el ranking de los productos según su precio, junto con el nombre del producto y el precio. 
--Si dos productos tienen el mismo precio, deben tener el mismo puesto.

select RANK() OVER (ORDER BY precio desc) AS ranking_precio,
nombre_producto , precio
from productos;


--Mostrar el ranking de los productos según su precio usando DENSE_RANK(),
--mostrando el nombre del producto y el precio. El producto más caro debe tener el puesto 1.

select DENSE_RANK() over (order by precio desc) as ranking_precio,
nombre_producto , precio
from productos;

--Mostrar cada producto con su precio actual y también mostrar el precio del producto anterior, 
--ordenando los productos por precio de menor a mayor.

SELECT 
    nombre_producto,
    precio,
    LAG(precio) OVER(ORDER BY precio) AS precio_anterior
FROM productos;


--Mostrar cada producto con su precio actual y el precio del siguiente producto, 
--ordenando los productos por precio de menor a mayor.

select nombre_producto , precio ,
lead(precio) over (order by precio ) as precio_siguiente
from productos;


--Mostrar cada pedido con su total y además mostrar el total acumulado de ventas de todos los pedidos.
select id_pedido ,total , 
sum(total) over(order by id_pedido ) as acumulado_total
from pedidos;



--Mostrar el ranking de productos por precio, pero reiniciando el ranking dentro de cada categoría.

SELECT RANK() OVER(PARTITION BY id_categoria ORDER BY precio desc) AS ranking_producto,
    nombre_producto,
    precio,
    id_categoria
FROM productos;


--Mostrar cada producto con su precio y el precio promedio de los productos de su misma categoría.
select  id_producto , id_categoria, 
avg(precio) over(partition by id_categoria) as precio_promedio
from productos;

--Mostrar cada pedido con su total y además mostrar cuánto dinero ha gastado ese cliente en todos sus pedidos.

SELEct id_pedido,id_cliente,total,
 SUM(total) OVER(PARTITION BY id_cliente) AS total_gastado_cliente
FROM pedidos;



---Mostrar cada pedido, su total y qué porcentaje representa ese pedido del total gastado por el cliente.
SELECT id_pedido,id_cliente,total,(total * 100.0 / SUM(total) OVER(PARTITION BY id_cliente)) AS porcentaje_cliente
FROM pedidos;


--Clasificar los productos en 4 grupos según su precio, donde el grupo 1 sean los productos más caros y el grupo 4 los más baratos.
SELECT nombre_producto,precio,
    NTILE(4) OVER(ORDER BY precio DESC) AS grupo_precio
FROM productos;

--Crear un procedimiento que reciba un cliente y muestre todos sus pedidos.

CREATE PROCEDURE buscar_pedidos_cliente
    @id_cliente int
AS
BEGIN

    SELECT
        id_pedido,
        id_cliente,
        fecha_pedido,
        estado,
        total
    FROM pedidos
    WHERE id_cliente = 1

END;

EXEC buscar_pedidos_cliente 1;


--Recibir un id_categoria y mostrar todos los productos que pertenecen a esa categoría.

CREATE PROCEDURE buscar_productos_categoria
    @id_categoria INT
AS
BEGIN

    SELECT
        id_producto,
        nombre_producto,
        precio,
        stock,
        id_categoria
    FROM productos
    WHERE id_categoria = @id_categoria;

END;

EXEC buscar_productos_categoria 3;

-- Muestra los pedidos realizados dentro de un rango de fechas seleccionado, 
--incluyendo información del cliente, fecha del pedido y monto total de la venta.

CREATE PROCEDURE reporte_ventas_fecha
    @fecha_inicio DATE,
    @fecha_fin DATE
AS
BEGIN

    SELECT
        id_pedido,
        id_cliente,
        fecha_pedido,
        total
    FROM pedidos
    WHERE fecha_pedido BETWEEN @fecha_inicio AND @fecha_fin;

END;

EXEC reporte_ventas_fecha '2026-01-01', '2026-03-31';

--cree esta tabla para hacer trigger 
CREATE TABLE historial_pedidos
(
    id_historial INT IDENTITY PRIMARY KEY,
    id_pedido INT,
    estado_anterior VARCHAR(50),
    estado_nuevo VARCHAR(50),
    fecha_cambio DATETIME DEFAULT GETDATE()
);

CREATE TRIGGER trg_historial_estado_pedido
ON pedidos
AFTER UPDATE
AS
BEGIN

    INSERT INTO historial_pedidos
    (
        id_pedido,
        estado_anterior,
        estado_nuevo
    )

    SELECT
        d.id_pedido,
        d.estado AS estado_anterior,
        i.estado AS estado_nuevo
    FROM deleted d
    INNER JOIN inserted i
    ON d.id_pedido = i.id_pedido
    WHERE d.estado <> i.estado;

END;


--: Actualizar stock automáticamente cuando se realiza una venta.

CREATE TRIGGER trg_actualizar_stock
ON detalle_pedido
AFTER INSERT
AS
BEGIN

    UPDATE productos
    SET stock = stock - i.cantidad
    FROM productos p
    INNER JOIN inserted i
    ON p.id_producto = i.id_producto;

END;





SELECT id_producto, nombre_producto, stock
FROM productos
WHERE id_producto = 32;




--2. Productos más vendidos
SELECT TOP 10
    p.nombre_producto,
    SUM(d.cantidad) AS unidades_vendidas
FROM detalle_pedido d
INNER JOIN productos p
    ON d.id_producto = p.id_producto
INNER JOIN pedidos pe
    ON d.id_pedido = pe.id_pedido
WHERE pe.estado <> 'cancelado'
GROUP BY p.nombre_producto
ORDER BY unidades_vendidas DESC;


--Ventas por año
SELECT
    YEAR(fecha_pedido) AS año,
    SUM(total) AS ventas_totales
FROM pedidos
WHERE estado <> 'cancelado'
GROUP BY YEAR(fecha_pedido)
ORDER BY año;


--. Ventas por categoría
SELECT
    c.nombre_categoria,
    SUM(d.cantidad * d.precio_unitario) AS ventas
FROM detalle_pedido d
INNER JOIN productos p
    ON d.id_producto = p.id_producto
INNER JOIN categorias c
    ON p.id_categoria = c.id_categoria
INNER JOIN pedidos pe
    ON d.id_pedido = pe.id_pedido
WHERE pe.estado <> 'cancelado'
GROUP BY c.nombre_categoria
ORDER BY ventas DESC;