USE world;

SELECT COUNT(*) AS '총 국가 수' FROM country;
SELECT COUNT(LifeExpectancy) FROM country; -- 칼럼 지정시 null 값은 제외하고 카운드
SELECT COUNT(distinct Continent) FROM country;

SELECT SUM(Population) FROM country;
SELECT SUM(Population) FROM country
WHERE Continent = 'Asia';
SELECT SUM(Population) FROM country
WHERE Population >= 100000000;

SELECT ROUND(SUM(SurfaceArea)/10000,2) FROM country;

select avg(Population) FROM country;
select avg(Population) FROM country
WHERE Continent = 'ASIA';

SELECT MAX(Population) FROM country;
SELECT * FROM country
WHERE Population = (SELECT MAX(Population) FROM country); -- 숫자를 반환하기 떄문에 이용 가능

-- 하나의 컬럼에 적용 가능
SELECT
	COUNT(*),
    SUM(Population),
    AVG(Population),
    MAX(Population),
    MIN(Population)
FROM country;

-- null값 처리
SELECT LifeExpectancy FROM country; 
SELECT AVG(LifeExpectancy) FROM country;
-- 선 순위:LifeExpectancy, 후 순위: 30 => null 값인 경우 30으로 쓰겠다.
SELECT AVG(COALESCE(LifeExpectancy, 30)) FROM country;