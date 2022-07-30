/*
    CODICE CHE HO SCRITTO IO DA [https://www.youtube.com/watch?v=p3qvj9hO_Bo]
    PER CREAZIONE DEL PRIMO DATABASE, QUELLO CHE HO SCRITTO DOPO SONO GLI ESERCIZI DA LUI PROPOSTI
    (Tutto ciò viene comodo per i concetti principali di SQL)
*/

CREATE DATABASE record_company;
USE record_company;
CREATE TABLE test(
	test_column INT 
);
ALTER TABLE test
ADD another_column VARCHAR(255);
DROP TABLE test;
CREATE TABLE bands(
	id INT NOT NULL AUTO_INCREMENT,
	name VARCHAR(255) NOT NULL,
    PRIMARY KEY (id)
);
CREATE TABLE albums(
	id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    year INT NOT NULL,
    band_id INT NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY(band_id) REFERENCES bands(id)
);
INSERT INTO bands (name)
VALUES ('Iron Maiden');

INSERT INTO bands (name)
VALUES ('Deuce'),('Avenged Sevenfold'), ('Ankord');

SELECT * FROM bands LIMIT 2;
SELECT name FROM bands;
SELECT id AS 'ID', name AS "Band Name"
FROM bands;
SELECT * FROM bands ORDER BY name;

ALTER table albums
MODIFY year int;

INSERT INTO albums (name, year, band_id)
VALUES ('The Number of the Beast', 1985, 1),
		('Power Slave', 1984, 1),
        ('Nightmare',2018,2),
        ('Nightmare',2010,3),
        ('Test Album',NULL,3);
SELECT * FROM albums;

SELECT DISTINCT name FROM albums;
UPDATE albums
SEt year = 1982
where id = 21;

SELECT * FROM albums
where year < 2000;

SELECT * FROM albums
where name like '%er%' OR band_id = 2;

select * from albums
where year = 1984 AND band_id = 1;

select * from albums
where year between 2000 and 2018;

select * from albums
where year is null;

delete from albums where id = 25;



SELECT * FROM bands
JOIN albums ON bands.id = albums.band_id;

SELECT * FROM albums
right JOIN bands ON bands.id = albums.band_id;



select avg(year) from albums;

select sum(year) from albums;



select band_id, count(band_id) from albums
group by band_id;


select b.name as band_name, count(a.id) as num_albums
from bands as b
left join albums as a on b.id = a.band_id
where b.name = "Deuce"
group by b.id
having count(a.id) = 1;


  