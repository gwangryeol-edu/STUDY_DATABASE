USE world;

SELECT * FROM city WHERE CountryCode = 'KOR';
SELECT * FROM country WHERE Code = 'KOR';

SELECT
	ci.Name AS 도시명,
    co.Name AS 나라명,
    co.Continent AS 대륙,
    ci.Population AS 도시인구,
    co.Population AS 국가인구,
    ci.Population/co.Population AS 도시인구비율
FROM city ci INNER JOIN country co
ON ci.CountryCode = co.Code;

SELECT
	ci.Name AS 도시명,
    co.Name AS 나라명,
    co.Continent AS 대륙,
    ci.Population AS 도시인구,
    co.Population AS 국가인구,
    ci.Population/co.Population AS 도시인구비율
FROM city ci INNER JOIN country co
ON ci.CountryCode = co.Code
WHERE co.Name = 'South Korea';

SELECT
	co.Name,
    COUNT(*)
FROM city ci INNER JOIN country co
ON ci.CountryCode = co.Code
GROUP BY co.Name
ORDER BY COUNT(*) DESC;

SELECT 
	co.continent,
    COUNT(*),
    AVG(ci.Population)
FROM city ci INNER JOIN country co
ON ci.CountryCode = co. Code
GROUP BY co.Continent;

SELECT
	COUNT(DISTINCT co.Code)AS '전체국가수_join',
    (SELECT COUNT(*) FROM country) AS '전체국가수_country'
FROM city ci INNER JOIN country co
ON ci.CountryCode = co.Code;

SELECT
	*
FROM country co LEFT JOIN city ci
ON co.Code = ci.CountryCode
ORDER BY co.Population;

SELECT
	*
FROM country co RIGHT JOIN city ci
ON co.Code = ci.CountryCode
ORDER BY co.Population;

SELECT
	c1.Name, c2.Name
FROM city c1 INNER JOIN city c2
ON c1.ID = c2.ID
WHERE c1.CountryCode = 'KOR';

SELECT
*
FROM country co INNER JOIN city ci ON co.CountryCode
				INNER JOIN countrylanguage cl ON ci.CountryCode = cl.CountryCode;
                

USE sakila;
-- 영화(`film`)와 언어(`language`) 테이블을 조인하여 다음을 조회하세요:
-- - 영화 제목 (`film.title`), 언어 이름 (`language.name`)
SELECT 
 film.title,
 language.name
FROM film INNER JOIN language;

-- 영화와 카테고리를 조인하여 다음을 조회하세요:
-- - 영화 제목, 카테고리 이름, 대여료
SELECT
    film.title,
    category.name,
    film.rental_rate
FROM film INNER JOIN category;

-- 모든 고객(`customer`)과 그들의 대여 내역(`rental`)을 조회하세요.
-- - 고객 이름 (first_name, last_name), 대여 ID (rental_id), 대여 날짜 (rental_date)
SELECT
	cu.first_name,
    cu.last_name,
    re.rental_id,
    re.rental_date
FROM customer cu INNER JOIN rental re
ON cu.customer_id = re.customer_id;

-- 고객별 대여 횟수를 조회하세요. (대여 횟수 0인 고객도 포함)
-- - 고객 이름, 대여 횟수, 대여 횟수가 많은 순서
SELECT
	c.customer_id,
    c.last_name,
    COUNT(r.rental_id) AS rental_count
FROM customer c LEFT JOIN rental r
	ON c.customer_id = r.customer_id
GROUP BY c.customer_id
ORDER BY rental_count DESC;

-- 같은 상영 시간(`length`)을 가진 영화 쌍을 찾으세요.
-- - 영화1 제목, 영화2 제목, 상영 시간, 상위 10개
SELECT
	f1.title, f2.title, f1.length
FROM film f1 INNER JOIN film f2
ON f1.length = f2.length
ORDER BY f1.length DESC
LIMIT 10;


-- ------------- gpt 실습 -----------------
USE world;
-- 1️⃣ 국가별 도시 목록 조회 (world)
-- city와 country를 조인해서 국가 이름과 도시 이름을 함께 출력하세요.
SELECT 
	cn.Name AS conuntry,
    ct.Name AS city
FROM city ct JOIN country cn
ON ct.CountryCode = cn.Code;

-- 2️⃣ 대한민국(KOR) 도시만 조회 (world)
-- city와 country를 조인해서 국가 코드가 'KOR'인 도시 이름만 출력하세요.
SELECT
	ct.Name AS 도시
FROM city ct JOIN country cn
ON ct.CountryCode = cn.Code
WHERE ct.CountryCode = 'KOR';

-- 3️⃣ 영화와 언어 이름 조회 (sakila)
USE sakila;
-- film 테이블과 language 테이블을 조인해서 영화 제목(title)과 언어 이름(name)을 출력하세요.
SELECT
	f.title,
    lg.name
FROM film f JOIN language lg
ON f.language_id = lg.language_id;

-- 4️⃣ 고객별 대여기록 조회 (sakila)
-- 고객 이름, 이메일, 대여일(rental_date)을 출력하세요.
SELECT
	cu.last_name,
    cu.email,
    rn.rental_date
FROM customer cu JOIN rental rn
ON cu.customer_id = rn.customer_id;

-- 5️⃣ 고객별 총 대여 횟수 조회 (sakila)
-- 대여 횟수가 0건인 고객은 제외하고, 고객 이름과 대여 횟수를 구하세요.
SELECT 
    cu.last_name,
    COUNT(rn.rental_id) AS rental_count
FROM customer AS cu
JOIN rental AS rn
    ON cu.customer_id = rn.customer_id
GROUP BY cu.customer_id, cu.last_name;

-- 6️⃣ Action 영화 목록 조회 (sakila)
-- 카테고리가 'Action'인 영화 제목을 출력하세요.
SELECT 
	f.title,
    cg.name
FROM film f JOIN film_category fc
	ON f.film_id = fc.film_id
    JOIN category cg
		ON cg.category_id = fc.category_id 
WHERE cg.name = 'Action';

-- 7️⃣ 고객이 대여한 영화 제목 조회 (sakila)
-- 고객 이름과 대여한 영화 제목을 출력하세요. (중복 제거 시 DISTINCT 사용)
SELECT DISTINCT
	c.last_name,
    f.title
FROM customer c JOIN rental r
	ON c.customer_id = r.customer_id
    JOIN inventory i
		ON i.inventory_id = r.inventory_id
        JOIN film f
        ON f.film_id = i.film_id;
-- 8️⃣ 배우가 출연한 영화 제목 조회 (sakila)
-- actor.first_name = 'NICK' 인 배우가 출연한 영화 목록을 출력하세요.
SELECT
	a.first_name,
	f.title
FROM film_actor fa JOIN actor a
	ON fa.actor_id = a.actor_id
    JOIN film f 
		ON f.film_id = fa.film_id
WHERE a.first_name = 'NICK';