/* 
=================================================================================== 
Creating Dimension: gold.dim_customers
===================================================================================
*/

-- Droping view so that duplicate values doesn't exist
drop view if exists gold.fact_details
go

-- Creating view
create view gold.fact_details as

select 
	a.country,
	a.iso3_code,
	a.year,
	a.gdp,
	b.gdp_growth,
	c.inflation,
	d.life_expectancy,
	e.population,
	f.unemployment

from silver.gdp a

-- Left join table silver.gdp_growth
left join silver.gdp_growth b
on a.country = b.country and a.year = b.year

-- Left join table silver.inflation
left join silver.inflation c
on a.country = c.country and a.year = c.year

-- Left join table silver.life_expectancy
left join silver.life_expectancy d
on a.country = d.country and a.year = d.year

-- Left join table silver.population
left join silver.population e
on a.country = e.country and a.year = e.year

-- Left join table silver.unemployment
left join silver.unemployment f
on a.country = f.country and a.year = f.year