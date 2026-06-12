/*
=============================================================================================
Creating Silver Tables
=============================================================================================
*/

if OBJECT_ID ('silver.gdp' , 'U') is not null
	drop table silver.gdp;

create table silver.gdp(
	country nvarchar(100),
	iso3_code nvarchar(50),
	year int,
	gdp float null
);

if OBJECT_ID ('silver.gdp_growth' , 'U') is not null
	drop table silver.gdp_growth;

create table silver.gdp_growth(
	country nvarchar(100),
	iso3_code nvarchar(50),
	year int,
	gdp_growth float null
);

if OBJECT_ID ('silver.inflation' , 'U') is not null
	drop table silver.inflation;

create table silver.inflation(
	country nvarchar(100),
	iso3_code nvarchar(50),
	year int,
	inflation float null
);

if OBJECT_ID ('silver.life_expectancy' , 'U') is not null
	drop table silver.life_expectancy;
create table silver.life_expectancy(
	country nvarchar(100),
	iso3_code nvarchar(50),
	year int,
	life_expectancy float null
);

if OBJECT_ID ('silver.population' , 'U') is not null
	drop table silver.population;
create table silver.population(
	country nvarchar(100),
	iso3_code nvarchar(50),
	year int,
	population float null
);

if OBJECT_ID ('silver.unemployment' , 'U') is not null
	drop table silver.unemployment;
create table silver.unemployment(
	country nvarchar(100),
	iso3_code nvarchar(50),
	year int,
	unemployment float null
);