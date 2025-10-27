USE temp;

-- survived: 생존 여부 (0: 사망, 1: 생존)
-- pclass: 티켓 등급 (1: 1등석, 2: 2등석, 3: 3등석)
-- sex: 성별 (male, female)
-- age: 나이
-- sibsp: 동승한 형제자매/배우자 수
-- parch: 동승한 부모/자녀 수
-- ticket: 티켓 번호
-- fare: 요금
-- cabin: 객실 번호
-- embarked: 탑승 항구 (C: Cherbourg, Q: Queenstown, S: Southampton)

-- -------------------------------------------------------------------------------------------------------------------------------- --

SELECT * FROM titanic;

SELECT * FROM titanic
LIMIT 5;

SELECT 
	COUNT(*) AS row_count
FROM titanic;

SELECT
	SUM(
		CASE 
			WHEN cabin = '' THEN 1 
			ELSE 0
		END) AS missing_cavin
FROM titanic;

SELECT
	MIN(fare),
	MAX(fare),
	ROUND(AVG(fare),2)
FROM titanic;

-- -------------------------------------------------------------------------------------------------------------------------------- --

SELECT
	pclass,
	name,
    ticket,
    fare
FROM titanic
WHERE pclass =1;

SELECT
*
FROM titanic
WHERE embarked ='C';

SELECT
	name,
    age,
    sex
FROM titanic
WHERE age<30 AND survived = 1;

SELECT
	name,
    pclass,
    fare
FROM titanic
ORDER BY fare DESC;

SELECT
	name,age,fare
FROM titanic
WHERE sex = 'female'
ORDER BY age;

-- -------------------------------------------------------------------------------------------------------------------------------- --

SELECT
	ROUND(
	SUM(
    CASE 
		WHEN survived = 1
        THEN 1
        ELSE 0
    END)/
    COUNT(*)
    *100,2) as 전체생존률
FROM titanic;
-- 전제 생존률 2
SELECT
	ROUND(AVG(survived)*100,2)
FROM titanic;

SELECT
	SUM(
    CASE 
		WHEN survived = 1
        THEN 1
        ELSE 0
    END) AS 사망,
    SUM(
    CASE 
		WHEN survived = 0
        THEN 1
        ELSE 0
    END) AS 생존
FROM titanic;

SELECT
	sex,
	count(*),
    SUM(
    CASE 
		WHEN survived = 0
        THEN 1
        ELSE 0
    END) AS 생존,
    ROUND(
	SUM(
    CASE 
		WHEN survived = 1
        THEN 1
        ELSE 0
    END)/
    COUNT(*)
    *100,2) as 전체생존률
FROM titanic
GROUP BY sex
ORDER BY 전체생존률 DESC;
-- 성별별 생존률2
SELECT 
	sex,
    COUNT(*),
    SUM(survived),
    ROUND(AVG(survived)*100,2) AS percent
FROM titanic
GROUP BY sex
ORDER BY percent DESC;

SELECT
	pclass,
	ROUND(
	SUM(
    CASE 
		WHEN survived = 1
        THEN 1
        ELSE 0
    END)/
    COUNT(*)
    *100,2) as 전체생존률
FROM titanic
GROUP BY pclass
ORDER BY pclass;

SELECT
	pclass,
	AVG(fare),
    MIN(fare),
    MAX(fare)
FROM titanic
GROUP BY pclass
ORDER BY pclass;

SELECT
	embarked,
    pclass,
	COUNT(*)
FROM titanic
WHERE embarked IS NOT NULL
GROUP BY embarked, pclass
ORDER BY embarked DESC, pclass DESC;

SELECT
	pclass,
    sex,
    COUNT(*),
    SUM(
    CASE 
		WHEN survived = 0
        THEN 1
        ELSE 0
    END) AS 생존,
    ROUND(
	SUM(
    CASE 
		WHEN survived = 1
        THEN 1
        ELSE 0
    END)/
    COUNT(*)
    *100,2) as 전체생존률
FROM titanic
GROUP BY pclass, sex
ORDER BY pclass DESC, sex DESC;
-- 성별 및 등급별 생존율2
SELECT
	pclass,
    sex,
    COUNT(*),
    SUM(survived),
    AVG(survived)
FROM titanic
GROUP BY sex, pclass
ORDER BY sex, pclass;

SELECT
	CASE
		WHEN sibsp + parch = 0 THEN 'Alone'
		ELSE 'With Family'
    END AS family_status,
    ROUND(
	SUM(
    CASE 
		WHEN survived = 1
        THEN 1
        ELSE 0
    END)/
    COUNT(*)
    *100,2) as 생존률
FROM titanic
GROUP BY family_status;

SELECT
  ROUND(AVG(survived) * 100, 2) AS survival_rate_with_family
FROM titanic
WHERE (sibsp + parch) >= 1;

SELECT
    (1 + sibsp + parch) AS family_size,         -- 가족 규모 (본인 포함)
    COUNT(*) AS passenger_count,                -- 해당 규모의 승객 수
    ROUND(AVG(survived) * 100, 2) AS survival_rate  -- 생존율 (%)
FROM titanic
GROUP BY family_size
ORDER BY family_size;

SELECT
    CASE 
		WHEN age<18 THEN 'child'
		WHEN age<60 THEN 'adult'
		Else 'senior'
	END as age_group,
    COUNT(*) AS survival,
    ROUND(AVG(survived) * 100, 2) AS survival_rate  -- 생존율 (%)
FROM titanic
GROUP BY age_group;


SELECT
    CASE 
		WHEN fare<10 THEN '저가(<10)'
		WHEN fare<29 THEN '중저가(10-29)'
		WHEN fare<99 THEN '중고가(30-99)'
		Else '고가(100+)'
	END as fare_group,
    ROUND(AVG(survived) * 100, 2) AS survival_rate  -- 생존율 (%)
FROM titanic
GROUP BY fare_group
ORDER BY 
	CASE fare_group
		WHEN '저가(<10)' THEN 1
		WHEN '중저가(10-29)' THEN 2
		WHEN '중고가(30-99)' THEN 3
		Else 4;

SELECT
	name, pclass, fare
FROM titanic
WHERE fare > (SELECT AVG(fare) FROM titanic)
ORDER BY fare DESC
LIMIT 20;



SELECT
	name,age,pclass,(SELECT AVG(age) FROM titanic WHERE pclass = 3)
FROM titanic
WHERE pclass =1 AND age > (SELECT AVG(age) FROM titanic WHERE pclass = 3)
ORDER BY age DESC
LIMIT 20;
