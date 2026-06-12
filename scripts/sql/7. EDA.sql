/*
============================================================================
EDA Analysis
============================================================================
*/

-- Dataset Overview

-- Total Countries
select distinct(country)
from gold.fact_details

-- Max & Min Year Available by Country
select country,min(year) as min_year,max(year) as max_year
from gold.fact_details
group by country
order by country


-- Missing Value Analysis

-- Nulls
select *
from gold.fact_details
where gdp is null
or	  gdp_growth is null
or    inflation is null
or    life_expectancy is null
or    population is null
or    unemployment is null

-- Top GDP Analysis

-- Top 5 GDP Countries

SELECT top(5) country,
       MAX(gdp) AS max_gdp
FROM gold.fact_details
GROUP BY country
ORDER BY max_gdp DESC

-- Bottom GDP Analysis

-- Bottom 5 GDP Countries

SELECT top(5) country,
       MIN(gdp) AS min_gdp
FROM gold.fact_details
GROUP BY country
ORDER BY min_gdp asc

-- Top Population Countries

SELECT top(5) country,
       MAX(gdp) AS max_population
FROM gold.fact_details
GROUP BY country
ORDER BY max_population DESC

-- Population Growth Analysis

SELECT country,year,
       ((population - lag(population) over(partition by country order by year)) / lag(population) over(partition by country order by year)) *100 as population_growth
FROM gold.fact_details

-- Life Expectancy Ranking

SELECT country,year,
    concat(round(life_expectancy - lag(life_expectancy) over(partition by country order by year),2),'%') as life_expectancy_rate
FROM gold.fact_details

-- Unemployment Ranking

SELECT country,year,
    concat(round(unemployment - lag(unemployment) over(partition by country order by year),2),'%') as unemployment_rate
FROM gold.fact_details

-- Inflation Ranking

SELECT country,year,
    concat(round(inflation - lag(inflation) over(partition by country order by year),2),'%') as inflation_rate
FROM gold.fact_details

-- GDP vs Life Expectancy

select country,year , gdp , life_expectancy
from gold.fact_details
order by gdp desc, life_expectancy desc

-- GDP vs Population

select country,year , gdp , population
from gold.fact_details
order by gdp desc, population desc

-- Inflation vs Unemployment

select country ,year, inflation , unemployment
from gold.fact_details
order by inflation desc, unemployment desc

-- Country Comparision (India & Pakistan)

select *
from gold.fact_details
where country in ( 'India','Pakistan')
order by year desc,country asc

-- Year-over-Year Trend Analysis

-- YoY Analysis of India

select 
year,
gdp,
concat(round(gdp_growth,2),'%') as gdp_growth,
round(inflation,2) as inflation_rate,
round(life_expectancy,0) as life_expectancy,
population - lag(population) over (partition by country order by year) as population_change,
concat(round(unemployment,2),'%') as unemployment_rate
from gold.fact_details
where country = 'India'
order by year desc