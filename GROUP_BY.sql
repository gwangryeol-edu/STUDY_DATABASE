USE world;

SELECT * FROM country;

SELECT Continent, COUNT(*) FROM country
GROUP BY Continent;

SELECT Continent, COUNT(*) FROM country
GROUP BY Continent ORDER BY COUNT(*) DESC;

SELECT
	continent,
    COUNT(*),
    ROUND(AVG(Population)/1000000,0) AS '인구 수',
    AVG(LifeExpectancy)
FROM country
GROUP BY Continent
ORDER BY '인구 수'
 DESC;
 
SELECT 
	Continent, 
	Region,
	COUNT(*)
FROM country
GROUP BY Continent, Region
ORDER BY Continent, COUNT(*);

SELECT Continent, COUNT(*)
FROM country
WHERE Population >= 100000000
GROUP BY Continent;

SELECT Continent, COUNT(*)
FROM country
GROUP BY Continent
HAVING AVG(Population) > 2000000;

