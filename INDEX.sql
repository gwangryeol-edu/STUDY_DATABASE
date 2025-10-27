USE world;

SHOW INDEX FROM city;

DESCRIBE city;


CREATE INDEX index_city_name ON city(Name);
EXPLAIN SELECT * FROM city WHERE Name = 'Seoul';
-- -> (index x)rows = 4035
-- -> (index o)rows = 1

SHOW INDEX FROM city;

DROP INDEX index_city_name ON city;
