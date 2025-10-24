USE sakila;

-- 대여료(`rental_rate`)가 4달러 이상인 영화의 제목과 대여료 조회
SELECT title, rental_rate FROM film WHERE rental_rate >= 4;
-- 상영시간(`length`)이 120분 미만인 영화 조회
SELECT * FROM film WHERE length <120;
-- 등급(`rating`)이 'PG-13'인 영화 조회
SELECT * FROM film WHERE rating = 'PG-13';
-- 등급이 'PG'이고 대여료가 3달러 이상인 영화
SELECT * FROM film WHERE rating = 'PG' AND rental_rate > 3;
-- 등급이 'G' 또는 'PG'인 영화
SELECT * FROM film WHERE rating = 'g' or rating = 'PG';
-- 상영시간이 60분 미만이거나 180분 이상인 영화
SELECT * FROM film WHERE 60>length OR length<120;
-- 제목에 'LOVE'가 포함된 영화 조회
SELECT * FROM film WHERE title LIKE '%LOVE%';
-- 제목이 'THE'로 시작하는 영화 조회
SELECT * FROM film WHERE title LIKE 'THE%';
-- 배우 성(`last_name`)이 'SON'으로 끝나는 배우 조회
SELECT * FROM actor WHERE last_name LIKE '%SON';
-- 등급이 'PG-13'인 영화 중에서 대여료가 2.99달러 이상 4.99달러 이하이고, 상영시간이 90분 이상인 영화
SELECT * FROM film WHERE rental_rate BETWEEN 2.99 AND 4.99 OR length >=90;
