create	database country;
use country;

CREATE TABLE region (
idregion INT PRIMARY KEY AUTO_INCREMENT,
namereg	varchar(25)	NOT NULL UNIQUE,
yearreg INT 
);

CREATE TABLE province (
idprovince INT PRIMARY KEY AUTO_INCREMENT,
namepro varchar(25) NOT NULL UNIQUE,
capital varchar(25),
population INT,
area INT,
coast BOOLEAN,
idregion INT,
FOREIGN KEY (idregion) REFERENCES region (idregion)
);

create table river (
idriver int PRIMARY KEY AUTO_INCREMENT,
nameriv varchar(25) NOT NULL UNIQUE,
kms INT,
sea varchar(25)
);

create table pro_riv (
idprovince INT,
idriver INT,
PRIMARY KEY (idprovince, idriver),
FOREIGN KEY (idprovince) REFERENCES province (idprovince),
FOREIGN KEY (idriver) REFERENCES river(idriver)

);

create table mountain (
idmountain	INT PRIMARY key	AUTO_INCREMENT,
namemou varchar(25) not NULL UNIQUE,
maxheight INT
);

create table pro_mou(
idmountain INT,
idprovince INT,
PRIMARY key(idmountain, idprovince),
FOREIGN key	(idmountain) REFERENCES mountain(idmountain),
FOREIGN key (idprovince) REFERENCES province(idprovince)

);

-- Insertion of some sample records
insert into region(idregion, namereg, yearreg)
values 
(Null,'Andalucia', 1977),
(Null, 'Aragon', 1982),
(null, 'Extremadura', 1983),
(null, 'Galicia', 1978);

insert	into province(idprovince, namepro, capital, population, area, coast, idregion)
values
(null, 'almeria', null, 760964, 8774, true, 1 ),
(null, 'cadiz', null, 1262420, 7435, true, 1),
(null, 'cordoba', null, 774313, 13771, false, 1),
(null, 'huelva', null, 538789, 10128, true, 1),
(null, 'jaen', null, 617604, 13496, false, 1),
(null, 'granada', null, 940974, 12531, true, 1),
(null, 'malaga', null, 1791183, 7308, true, 1),
(null, 'sevilla', null, 1977664, 14036, false, 1),
(null, 'huesca', null,  230087, 15626, false, 2),
(null, 'zaragoza', null, 998443, 17274, false, 2),
(null, 'teruel', null, 136091, 14804, false, 2);

 insert into river( idriver, nameriv, kms, sea)
 values
 (null, 'odiel', 128, 'atlantico'),
 (null, 'guadalquivir', 657, 'atlantico');
 
 insert into pro_riv (idprovince, idriver)
 values
 (4, 1),
 (5, 2),
 (3, 2),
 (8, 2),
 (2, 2),
 (4, 2);
 
 
 

insert into mountain (idmountain, namemou, maxheight)
values
(null, 'cordillera penibetica', 3479),
(null, 'sierra morena', 1323);

insert into pro_mou ( idmountain, idprovince)
values
(1, 2),
(1, 7),
(1, 6),
(1, 1);
