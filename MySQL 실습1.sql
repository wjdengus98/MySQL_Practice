USE world; #사용 데이터베이스: World

# 1. world 데이터베이스에서 모든 국가의 이름과 인구를 조회하는 쿼리 작성
SELECT Name, population FROM country;

# 2. city 테이블에서 모든 도시의 이름(name)과 인구(population)를 조회하는 쿼리를 작성
SELECT Name, population FROM city;

# 3. country 테이블에서 대륙(continent)이 'Asia'인 국가들의 이름(name)과 인구(population)를 조회하는 쿼리를 작성하세요.
SELECT Name, population from country where continent = "Asia";

# 4. country 테이블에서 인구 밀도(population_density = population / surface_area)를 계산하여 조회하는 쿼리를 작성하세요. 결과 컬럼의 이름은 population_density로 설정하세요.
SELECT name, population / surfacearea AS population_density From country;

# 5. city 테이블에서 도시의 이름(name)과 국가 코드(countrycode)를 연결하여 city_country라는 별칭으로 조회하는 쿼리를 작성하세요.
SELECT concat(name, '-', countrycode) as city_country from city;

# 6. country 테이블에서 국가의 이름(name)과 대륙(continent)을 연결하여 name_continent로 조회하는 쿼리를 작성하세요.
SELECT concat(name, ' - ', continent) as name_continent from country;

# 7. city 테이블에서 도시의 이름(name)과 인구(population)를 연결하여 city_population으로 조회하는 쿼리를 작성하세요.
SELECT concat(name, ' - ', population) as city_population from city;

# 8. country 테이블에서 대륙(continent)별로 한 번씩만(중복제거) 조회하는 쿼리를 작성하세요.
SELECT distinct continent from country;

# 9. `city` 테이블에서 각 국가(`countrycode`)별로 한 번씩만(중복제거) 조회하는 쿼리를 작성하세요.
SELECT distinct countrycode from city;

# 10. country 테이블에서 인구(population)와 면적(surfacearea)을 더하여 total_population_area로 조회하는 쿼리를 작성하세요.
SELECT name, population + surfacearea AS total_population_area from country;

# 11. city 테이블에서 인구(population)를 1000으로 나누어 population_in_thousands로 조회하는 쿼리를 작성하세요.
SELECT name, population / 1000 AS population_in_thousands from city;

# 12. country 테이블에서 인구(population)가 1억 명 이상인 국가들을 조회하는 쿼리를 작성하세요.
SELECT name from country WHERE Population >= 100000000;

# 13. city 테이블에서 인구(population)가 100만 명 이상인 도시들을 조회하는 쿼리를 작성하세요.
SELECT name FROM city WHERE Population >= 1000000;

# 14. country 테이블에서 인구(population)를 기준으로 내림차순으로 정렬하여 국가의 이름(name)과 인구를 조회하는 쿼리를 작성하세요.
SELECT name, Population FROM country ORDER BY Population DESC;

# 15. city 테이블에서 인구(population)를 기준으로 오름차순으로 정렬하여 도시의 이름(name)과 인구를 조회하는 쿼리를 작성하세요.
SELECT name, population FROM city ORDER BY Population;

# 16. country 테이블에서 대륙(continent)이 'Europe'인 국가와 인구(population)가 5천만 이상인 국가를 모두 조회하는 쿼리를 작성하세요.(집합 연산 사용, 중복행 제거)
SELECT name, continent, population FROM country WHERE continent = 'Europe'
UNION
SELECT name, continent, population FROM country WHERE population >= 50000000;

# 17. city 테이블에서 이름(name)에 'New'가 포함된 도시와 인구(population)가 50만 이상인 도시를 모두 조회하는 쿼리를 작성하세요.(집합 연산 사용, 중복행 제거)
SELECT name,population FROM city WHERE name LIKE '%New%'
UNION
SELECT name, population FROM city WHERE population >= 500000;

# 18. country 테이블에서 인구(population)가 1천만 이상이고 1억 미만인 국가들을 조회하는 쿼리를 작성하세요.
SELECT name FROM country WHERE Population >= 10000000 and Population < 100000000;

# 19. city 테이블에서 인구(population)가 50만 이상이거나 이름(name)에 'York'가 포함된 도시들을 조회하는 쿼리를 작성하세요.
SELECT name, population FROM city WHERE Population >= 500000 OR NAME LIKE '%York%';

# 20. country 테이블에서 대륙(continent)이 'Africa'이고 인구(population)가 5천만 이상인 국가들을 조회하는 쿼리를 작성하세요.
SELECT name, population FROM country WHERE continent = 'Africa' AND population >= 50000000;

# 21. country 테이블에서 인구(population)가 8천, 6만8천, 7만8천 중 하나와 일치하는 국가들을 조회하는 쿼리를 작성하세요.
SELECT name, population FROM country WHERE population IN (8000, 68000, 78000);

# 22. country 테이블에서 정부 형태(governmentform)가 'Republic'인 국가들을 제외한 나머지 국가를 조회하는 쿼리를 작성하세요.
SELECT name, governmentform FROM country WHERE governmentform NOT IN ('Republic');

# 23. city 테이블에서 도시 이름(name)에 'San'이 포함되거나 인구(population)가 100만 이상인 도시들을 조회하는 쿼리를 작성하세요.
SELECT name, population FROM city WHERE name LIKE '%San%' OR population >= 1000000;

# 24. country 테이블에서 인구(population)가 1천만에서 1억 사이인 국가들을 조회하는 쿼리를 작성하세요.
SELECT name, population FROM country WHERE population BETWEEN 10000000 AND 100000000;

# 25. country 테이블에서 대륙(continent)이 'Asia'인 국가와 대륙(continent)이 'Europe'인 국가를 모두 조회하는 쿼리를 작성하세요.(중복 행 포함)
SELECT name, continent FROM country WHERE continent = 'Asia'
UNION ALL
SELECT name, continent FROM country WHERE continent = 'Europe';