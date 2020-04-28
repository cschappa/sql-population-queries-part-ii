-- run on command line via 'sqlite3 -init population_queries.sql db.sqlite'
-- How many entries in the database are from Africa?
-- A: 56
SELECT COUNT(*)
FROM countries
WHERE continent = 'Africa';


-- What was the total population of Oceania in 2005?
-- A: 32.66417 M
SELECT SUM(population_years.population) AS 'oceania_total_population'
FROM countries
JOIN population_years
  ON countries.id = population_years.country_id
WHERE continent = 'Oceania'
  AND year = 2005;

-- What is the average population of countries in South America in 2003?
-- 25.8906514285714 M
SELECT AVG(population_years.population) AS 'average_country_population'
FROM countries
JOIN population_years
  ON countries.id = population_years.country_id
WHERE continent = 'South America'
  AND year = 2003;


-- What country had the smallest population in 2007?
-- A: Niue, 216k
SELECT countries.name, MIN(population_years.population) AS 'population'
FROM countries
JOIN population_years
  ON countries.id = population_years.country_id
WHERE year = 2007;


-- What is the average population of Poland during the time period covered by this dataset
-- A: 38.5606790909091 M
SELECT AVG(population_years.population) AS 'poland_avg_population'
FROM countries
JOIN population_years
  ON countries.id = population_years.country_id
WHERE countries.name = 'Poland';


-- How many countries have the word "The" in their name?
-- A: 2
SELECT COUNT(*)
FROM countries
WHERE name LIKE '% The%';


-- What was the total population of each continent in 2010?
/*
  country       | population (Millions)
  Asia          | 4133.09148
  Africa        | 1015.47846
  Europe        | 723.06044
  North America | 539.79456
  South America | 396.58235
  Oceania       | 34.95696
*/
SELECT countries.continent, SUM(population_years.population) AS 'population'
FROM countries
JOIN population_years
  ON countries.id = population_years.country_id
WHERE population_years.year = 2010
GROUP BY 1
ORDER BY 2 DESC;
