USE sakila;
-- 등급(rating)별로 다음 정보를 조회하세요:
-- - 등급, 영화 개수
SELECT rating, COUNT(*) 
FROM film
GROUP BY rating;
-- - 영화 개수가 많은 순서로 정렬
SELECT rating, COUNT(*) FROM film
GROUP BY rating ORDER BY COUNT(*) DESC;

-- 등급(rating)별로 다음 정보를 조회하세요:
-- - 등급
SELECT rating FROM film
GROUP BY rating;
-- - 영화 개수
SELECT rating,COUNT(*) FROM film
GROUP BY rating;
-- - 평균 대여료 (소수점 둘째 자리)
SELECT 
    rating,                           -- 등급
    COUNT(*) AS 영화개수,             -- 등급별 영화 수
    ROUND(AVG(rental_rate), 2) AS 평균대여료,  -- 평균 대여료 (소수점 둘째 자리까지)
    MAX(rental_rate) AS 최고대여료    -- 최고 대여료
FROM film
GROUP BY rating;
-- - 최고 대여료

-- - 최저 대여료
SELECT
	rating,
    MIN(rental_rate) AS '최저 대여료'
FROM film
GROUP BY rating;

-- - 대여료 내림차순 정렬
SELECT
    rating,
    MAX(rental_rate) AS 최고대여료
FROM film
GROUP BY rating
ORDER BY 최고대여료 DESC;

-- 등급별 통계에서 영화가 100개 이상인 등급만 조회하세요:
-- - 등급
SELECT
	rating
FROM film
GROUP BY rating
HAVING COUNT(*)>=100;
-- - 영화 개수
SELECT
	rating,
    COUNT(*)
FROM film
GROUP BY rating
HAVING COUNT(*)>=100;
-- - 평균 대여료
SELECT
	rating,
    AVG(rental_rate)
FROM film
GROUP BY rating
HAVING COUNT(*)>=100;

-- 대여료가 2.99 이상인 영화만 집계하여, 등급별 통계를 조회하세요.
-- 단, 해당 등급의 영화가 50개 이상인 경우만 표시:
-- - 등급
-- - 영화 개수
-- - 평균 대여료
SELECT
	rating, COUNT(*), AVG(rental_rate)
    FROM film
    WHERE rental_rate >= 2.99
    GROUP BY rating
    HAVING COUNT(*) >= 50;

-- 배우(actor) 테이블에서 성(last_name)별 배우 수를 조회하세요:
-- - 성
-- - 배우 수
-- - 배우가 2명 이상인 성만 표시
-- - 배우 수 내림차순 정렬
SELECT
	last_name, COUNT(*)
    FROM actor
    GROUP BY last_name
    HAVING COUNT(*) >=2
    ORDER BY COUNT(*) DESC;
    
    