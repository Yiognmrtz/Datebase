create	database	car_repair;
use car_repair;

create table customer(
	idcustomer int primary key auto_increment,
     nif varchar(9),
     namecus varchar(45) not	null,
     email varchar(45),
     address varchar(45),
     city varchar(45),
     phone int
);

create	table invoice (
idinvoice int primary key,
releasedate date not null,
idcustomer int not null,
foreign key (idcustomer) references customer (idcustomer)
);

create table product (
idproduct int primary key auto_increment,
descrip varchar(45) not null,
price decimal(7,2) not null,
stock int
);

create table item (
idinvoice int,
idproduct int,
units int,
price decimal(7,2),
primary key (idinvoice, idproduct),
foreign key (idinvoice) references invoice(idinvoice),
foreign key (idproduct) references product(idproduct)
);

insert into customer(idcustomer, nif, namecus, email, address, city, phone)
values
(null, '121212p', 'garcia perez, jose', null, 'gran via 2', 'huelva', 655655655),
(null, '12121221a','garcia peaez, antonio', null, 'recadero 12', 'sevilla', null );

insert into invoice(idinvoice, releasedate, idcustomer)
values
(20250001, '2025-01-23', 2),
(20250002, '2025-02-25', 2),
(20250003, '2025-02-25', 1);
 
 insert into product (idproduct, descrip, price, stock)
 values
 (null, 'battery 45A', 49.99, 100),
 (null, 'battery 65A', 69,99, 25),
 (null, 'oil 20w50', 2, 33);
 
 