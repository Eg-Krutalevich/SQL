/*Create table cities:*/
CREATE TABLE cities (
id INT PRIMARY KEY,
country VARCHAR,
city VARCHAR,
population INT
);

/*Add information:*/
INSERT INTO cities VALUES 
(1, 'Belarus', 'Minsk', 1986572),
(2, 'Ukraine', 'Kiev', 2951952),
(3, 'Russia', 'Moscow', 12655050),
(4, 'Poland', 'Warsaw', 1796580),
(5, 'Litva', 'Vilnus', 588412),
(6, 'Latvia', 'Riga', 614618),
(7, 'Moldova', 'Kishinev', 689824),
(8, 'Estonia', 'Talin', 445688)

/*Create table countries:*/
CREATE TABLE countries (
id INT PRIMARY KEY,
numberCode VARCHAR,
post INT,
squar INT
);

/*Add information:*/
INSERT INTO countries VALUES 
(1, '+375', 210000, 348),
(2, '+380', 01000, 839),
(3, '+7', 131000, 2561),
(4, '+48', 9135, 517),
(5, '+370',  104000, 401),
(6, '371', 11727, 159)

/*Output of all data from the table cities:*/
SELECT * FROM cities;

/*Output of all data from the table countries:*/
SELECT * FROM countries;

/*Output data where country are Russia and Moldova from the table cities:*/
SELECT * FROM cities WHERE country = 'Russia' OR country = 'Moldova';

/*Output country from the table country where order by is desc limit 4:*/
SELECT country FROM cities WHERE id ORDER BY id DESC LIMIT 4;

/*Output of all data from the table where id between (3,7):*/
SELECT * FROM cities WHERE ID BETWEEN 3 and 7;

/*Output all the table cities where name  "%M%":*/
SELECT * FROM cities WHERE city LIKE '%M%';

/*Output sum(ID) from the table where id >= 4:*/
SELECT sum(id) AS sumID FROM cities WHERE ID >= 4;

/*Output avg(ID) from the table where id = 5:*/
SELECT avg(id) AS avgID FROM cities WHERE ID = 5;

/*Output max(ID) from the table where city = 'Talin':*/
SELECT max(id) AS maxID FROM cities WHERE city = 'Talin';

/*Udpate string from the table city where id = 3:*/
UPDATE cities SET city = 'Dublin' WHERE id = 3;

/*Union two tables*/
SELECT * FROM cities UNION SELECT * FROM countries;

/*Inner join:*/
SELECT cities.id, cities.city, countries.id, countries.post FROM cities INNER JOIN countries ON cities.id = countries.id;

/*Left join:*/
SELECT cities.id, cities.city, countries.id, countries.post FROM cities LEFT JOIN countries ON cities.id = countries.id;

/*Cross join:*/
SELECT cities.id, cities.city, countries.id, countries.post FROM cities CROSS JOIN countries ON cities.id = countries.id;

/*Attached select:*/
SELECT post FROM countries WHERE id = (SELECT id FROM cities WHERE population = 1796580);

/*Attached insert:*/
INSERT INTO countries SELECT * FROM cities where city = 'Dublin';

/*Attached delete:*/
DELETE FROM countries WHERE id > (SELECT id FROM cities WHERE city = 'Kiev');

/*Drop all table:*/
DROP TABLE cities;

/*Drop all table:*/
DROP TABLE countries;
