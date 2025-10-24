USE world;

SELECT * FROM country;

SELECT
	NAME,
	Continent,
	CASE Continent
		WHEN 'ASIA' THEN '아시아'
		WHEN 'Europe' THEN '유럽' 
		ELSE 'etc'
	END
FROM country;

SELECT
	NAME,
    Population,
    CASE
		WHEN Population >= 1000000000 THEN '큰 국가'
        WHEN Population >= 500000000 THEN '중간 국가'
        ELSE '작은 국가'
    END
FROM country;

SELECT
	NAME, Population, GNP,
    CASE
		WHEN (GNP / Population) >= 0.02 THEN '선진국'
        ELSE '선진국은 아님'
    END
FROM country;

SELECT
	NAME, Continent, Population
FROM country
WHERE Population >= 
	CASE Continent
		WHEN 'ASIA' THEN 50000000
        WHEN 'Europe' THEN 30000000
        ELSE 10000000
    END;
    
SELECT
	NAME, Continent, Population
FROM country
ORDER BY
	CASE Continent
		WHEN 'ASIA' THEN Population
        WHEN 'Europe' THEN GNP
        ELSE Population
    END;
    
    
SELECT
	Continent, COUNT(*),
    SUM(CASE WHEN Population > 50000000 THEN 1 ELSE 0 END)
FROM country
GROUP BY Continent;