# Sakila 데이터로 익히는 데이터 분석과 SQL
# 사용 데이터베이스: Sakila
# USE sakila; 

# 1. 영화 테이블(film) 에서 총 영화 수 알아내기
SELECT COUNT(*) FROM film;

# 2. 영화 테이블(film) 에서 영화 등급 종류 알아내기, 각 영화의 영화 등급은 rating 컬럼에 들어 있음
SELECT DISTINCT rating FROM film;

# 3. 양화 테이블(film) 에서 영화 release 연도 종류 알아내기, 각 영화의 release 연도는 release_year 컬럼에 있음
SELECT release_year FROM film;

# 4. 영화 렌탈 테이블(rental) 에서 10개 데이터만 출력하기, rental 테이블은 DVD 를 언제, 누가 빌려갔고, 반환했는지에 대한 정보를 가지고 있음
SELECT * FROM rental LIMIT 10;

# 5. 영화 렌탈 테이블(rental) 에서 inventory_id 가 367 인 로우(Row) 전체 출력하기, inventory_id 는 빌려간 DVD 의ID 를 의미함
SELECT * FROM rental WHERE inventory_id = 367;

# 6. customer 테이블에서 customer 수 알아내기
SELECT COUNT(*) FROM customer;

#7. payment 테이블에서 렌탈비용 합계, 평균, 최대값, 최소값 구하기, payment 테이블은 렌탈 비용을 포함한 정보를 담고있는 테이블임
SELECT SUM(amount), AVG(amount), MAX(amount), MIN(amount) FROM payment;

#8. 영화 렌탈 테이블(rental) 에서 inventory_id 가 367 이고, staff_id가 1인 로우(Row) 전체 출력하기
SELECT * FROM rental WHERE inventory_id = 367 AND staff_id = 1;

# 9. 영화(film table)에 매겨진 등급(rating) 종류를 모두 출력하시요 (GROUP BY 를 사용하세요)
SELECT rating FROM film GROUP BY rating;

# 10. 영화(film table)에 매겨진 등급(rating) 종류에 따른 영화 갯수를 모두 출력하시요 (rating 값과 각 rating 값에 따른 영화 갯수를 출력하세요)
SELECT rating, COUNT(*) FROM film GROUP BY rating;

# 11. 영화(film table)에서 영화가 PG 또는 G 등급의 영화 수를 각 등급별로 출력하세요 (rating 값과 각 rating 값에 따른 영화 갯수를 출력하세요)
SELECT rating, COUNT(*) FROM film WHERE rating = 'PG' OR rating = 'G' GROUP BY rating;

# 12. 영화(film table)에서 영화가 G 등급인 영화 제목을 출력하세요
SELECT title FROM film WHERE rating = 'G' LIMIT 10;

# 13. 영화(film table)에서 영화가 PG 또는 G 등급인 영화 제목을 출력하세요
SELECT title FROM film WHERE rating = 'G' OR rating = 'PG';

# 14. 영화(film table)에서 release 연도가 2006 또는 2007 연도이고, 영화가 PG 또는 G 등급인 영화 제목을 출력하세요
 SELECT title FROM film WHERE (release_year = 2006 OR release_year = 2007) AND (rating = 'G' OR rating = 'PG');

# film테이블에서 rating (등급)으로 그룹을 묶어서, 각 등급별 영화 갯수와 rating (등급), 각 그룹별 평균 rental_rate (렌탈 비용) 출력하세요
SELECT rating, COUNT(*), AVG(rental_rate) FROM film GROUP BY rating;

# 18. film테이블에서 rating (등급)으로 그룹을 묶어서, 각 등급별 영화 갯수와 각 등급별 평균 렌탈 비용 출력하기, 단 평균 렌탈비용이 높은 순으로 출력하기 (등급과 각 등급별 갯수, 각 등급별 평균 렌탈 비용 출력하기)
SELECT 
	rating, COUNT(*), AVG(rental_rate) 
FROM film 
GROUP BY rating 
ORDER BY AVG(rental_rate) DESC;

# 19. film테이블에서 rating (등급)으로 그룹을 묶어서, 각 등급별 영화 갯수와 rating (등급),
#각 그룹별 평균 rental_rate (렌탈 비용) 출력하되, 영화 갯수와 평균 렌탈 비용은 각각 total_films, avg_rental_rate 으로 출력하고
# avg_rental_rate이 높은 순으로 출력하시오
SELECT rating, 
	COUNT(*) AS total_films, 
    AVG(rental_rate) AS avg_rental_rate 
FROM film 
GROUP BY rating 
ORDER BY avg_rental_rate DESC;

# 20. 각 등급별 영화 길이가 130분 이상인 영화의 갯수와 등급을 출력해보세요
SELECT 
	rating, COUNT(*) 
FROM film
WHERE length >= 130
GROUP BY rating;

