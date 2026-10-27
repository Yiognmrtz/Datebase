-- Simple queries on database of "Vuelta ciclista a Huelva"

-- 1. Algunas expresiones matemáticas

SELECT 10 + 1 AS e1, 20 * 1.21 AS e2, 20 % 7 AS e3, (2 + 3) * 4 AS e4;

-- 2. Algunas expresiones lógicas

SELECT 4 > 2, 4 < 2, 4 > 2 AND 3 > 5, 4 > 2 OR 3 > 5, TRUE, FALSE, NOT 3 > 5;

SELECT 4 > 2, 4 < 2, 4 > 2 && 3 > 5, 4 > 2 || 3 > 5, TRUE, FALSE, ! (3 > 5);

-- 3. Todos los datos de los ciclistas

SELECT *
FROM cyclist;

-- 4. El nombre y la fecha de nacimiento de los ciclistas belgas

SELECT fullname, birthdate
FROM cyclist
WHERE country = "Bélgica";

-- 5. Equipos que no sean españoles

SELECT *
FROM team
WHERE country != "España";

-- 6. Ciclistas nacidos en los años 1998 y 1999

SELECT *
FROM cyclist
WHERE birthdate >= "1998-01-01" AND birthdate <= "1999-12-31";

-- 7. Ciclistas nacidos en los años 1998 y 2000

SELECT *
FROM cyclist
WHERE birthdate >= "1998-01-01" AND birthdate <= "1998-12-31"
OR birthdate >= "2000-01-01" AND birthdate <= "2000-12-31";

-- 8. Etapas que empiecen o terminen en la capital

SELECT *
FROM stage
WHERE starloc = "Huelva" OR endloc = "Huelva";

-- 9. Etapas que no empicen ni terminen en la capital

SELECT *
FROM stage
WHERE NOT (starloc = "Huelva" OR endloc = "Huelva");

-- también puede solucionarse con AND

SELECT *
FROM stage
WHERE starloc != "Huelva" AND endloc != "Huelva";

-- 10. Todos los datos de las etapas con la distancia en millas

SELECT *, ROUND(kms / 1.60934, 1) AS milles
FROM stage;

-- Operador LIKE para caracteres y fechas
-- Compara el valor de la izquierda con el patrón de la derecha, usando comodines:
-- % un conjunto cualquiera de caracteres
-- _ un carácter cualquiera

-- 11. Ciclistas que tengan "Diaz" en su nombre y apellidos

SELECT *
FROM cyclist
WHERE fullname LIKE "%Diaz%";

-- 12. Ciclistas nacidos en los años 1998 y 2000

SELECT *
FROM cyclist
WHERE birthdate LIKE "1998%" OR birthdate LIKE "2000%";

-- 13. Ciclistas nacidos en octubre de cualquier año

SELECT *
FROM cyclist
WHERE birthdate LIKE "%____-10-__";

-- Función CONCAT concatena cadenas de caracteres

-- 14. Escribe lo siguiente "El ciclista ... nació en ..." 

SELECT CONCAT("El ciclista ", fullname, " nació en ", country) AS mytext
FROM cyclist;

-- Funciones LOWER y UPPER devuelven el texto en minúsculas o mayúsculas

-- 15. Los países en mayúsculas

SELECT UPPER(country)
FROM cyclist;

-- JOIN (equijoin)
-- Es la operación más importante en las bases de datos relacionales.
-- Empareja los registros de la tabla hija con los de la tabla padre.
-- La cardinalidad del resultado es el número de registros en la tabla hija
-- descontando los valores nulos en la clave ajena, si los hay.
-- Los registros de la tabla hija con NULL en la clave ajena no aparecen.
-- Los registros de la tabla padre sin hijos no aparecen.

-- 16. Equijoin de equipos y ciclistas

SELECT * 
FROM team JOIN cyclist ON team.idteam = cyclist.idteam;

-- 17. Equijoin de cyc_sta y cyclist

SELECT *
FROM cyclist JOIN cyc_sta ON cyclist.idcyclist = cyc_sta.idcyclist;

-- 18. Equijoin de cyc_sta y stage

SELECT *
FROM stage s JOIN cyc_sta c ON s.idstage = c.idstage;

-- 19. Todos los datos del equipo donde corre Joao Silva

SELECT t.* 
FROM team t JOIN cyclist c ON t.idteam = c.idteam
WHERE c.fullname LIKE "Joao Silva %";

-- 20. Ciclistas extranjeros que corren en equipos españoles

SELECT c.* 
FROM team t JOIN cyclist c ON t.idteam = c.idteam
WHERE c.country != "España" AND t.country = "España";

-- 21. Identificadores de ciclistas que ganaron alguna etapa

SELECT idcyclist
FROM cyc_sta
WHERE position = 1;

-- 22. Añadir a lo anterior todos los datos de los ciclistas

SELECT *
FROM cyclist JOIN cyc_sta ON cyclist.idcyclist = cyc_sta.idcyclist
WHERE position = 1;

-- 23. Identificador del ciclista que ganó las etapas con salida o
-- llegada en Huelva

SELECT *
FROM stage s JOIN cyc_sta c ON s.idstage = c.idstage
WHERE (s.starloc = "Huelva" OR s.endloc = "Huelva") AND c.position = 1;

-- 24. Identificadores de equipos con ciclistas belgas, sin duplicados
-- La clausula DISTINCT elimina filas duplicadas en el resultado

SELECT DISTINCT idteam
FROM cyclist
WHERE country = "Bélgica";

-- 25. Añadir a lo anterior todos los datos de esos equipos

select	distinct t.*
From cyclist c Join team t ON c.idteam = t.idteam
where c.country = "Bélgica";

-- 26. Equijoin de las tablas team, cyclist y cyc_sta

select *
from team t
join cyclist c on t.idteam = c.idteam
join cyc_sta cs on c.idcyclist = cs.idcyclist;


-- 27. todos los equipos de ciclistas que hayan finalizado etapas en el podium 

select distinct *
from team t
join cyclist c on t.idteam = c.idteam
join cyc_sta cs on c.idcyclist = cs.idcyclist
where cs.position <= 3;


-- 28. equijoin de las tablas cyclist, cyc_sta y stage.

select *
from cyclist c
join cyc_sta cs on c.idcyclist = cs.idcyclist
join stage s on cs.idstage = s.idstage;

-- 29 resultados obtenidos por Carlos Romero en todas las etapas 
select s.*, cs.*
from cyclist c
join cyc_sta cs on c.idcyclist = cs.idcyclist
join stage s on cs.idstage = s.idstage
where c.fullname like "Carlos Romero  %";

-- 30. resultados de todos los ciclistas en la etapa que acabo en jabugo
