USE sakila;
-- 전체 영화 개수
SELECT COUNT(*) FROM film;
-- 등급(rating)이 'PG'인 영화 개수
SELECT COUNT(*) FROM film WHERE rating = 'PG';
-- 서로 다른 등급(rating)의 개수
SELECT COUNT(DISTINCT rating) FROM film;
-- 모든 영화의 대여료(rental_rate) 합계
SELECT SUM(rental_rate) FROM film;
-- 모든 영화의 평균 대여료 (소수점 둘째 자리)
SELECT ROUND(AVG(rental_rate),2) FROM film;
-- 등급이 'R'인 영화의 평균 대여료
SELECT AVG(rental_rate) FROM film WHERE rating = 'R';
-- 가장 비싼 대여료와 해당 영화 제목
-- (SELECT title MAX(rental_rate) FROM film);
SELECT title FROM film WHERE rental_rate = (SELECT MAX(rental_rate) FROM film);
SELECT title, rental_rate FROM film ORDER BY rental_rate DESC LIMIT 1;
-- 가장 긴 상영 시간(length)과 해당 영화 제목
SELECT length, title FROM film ORDER BY length DESC LIMIT 1;
-- 가장 짧은 상영 시간과 해당 영화 제목
SELECT length, title FROM film ORDER BY length LIMIT 1;
-- film 테이블의 다음 통계를 한 번에 조회하세요 
-- 전체 영화 수, 총 대여료 합계, 평균 대여료, 최고 대여료, 최저 대여료, 평균 상영 시간
SELECT
	COUNT(*),
    SUM(rental_rate),
    AVG(rental_rate),
    MAX(rental_rate),
    MIN(rental_rate),
    AVG(length)
FROM film;