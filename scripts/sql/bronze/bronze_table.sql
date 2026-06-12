/*
=============================================================================================
Creating Bronze Tables
=============================================================================================
*/

if OBJECT_ID ('bronze.gdp' , 'U') is not null
	drop table bronze.gdp;

create table bronze.gdp(
	country nvarchar(100),
	iso3_code nvarchar(50),
	year int,
	gdp float null
);

if OBJECT_ID ('bronze.gdp_growth' , 'U') is not null
	drop table bronze.gdp_growth;

create table bronze.gdp_growth(
	country nvarchar(100),
	iso3_code nvarchar(50),
	year int,
	gdp_growth float null
);

if OBJECT_ID ('bronze.inflation' , 'U') is not null
	drop table bronze.inflation;

create table bronze.inflation(
	country nvarchar(100),
	iso3_code nvarchar(50),
	year int,
	inflation float null
);

if OBJECT_ID ('bronze.life_expectancy' , 'U') is not null
	drop table bronze.life_expectancy;
create table bronze.life_expectancy(
	country nvarchar(100),
	iso3_code nvarchar(50),
	year int,
	life_expectancy float null
);

if OBJECT_ID ('bronze.population' , 'U') is not null
	drop table bronze.population;
create table bronze.population(
	country nvarchar(100),
	iso3_code nvarchar(50),
	year int,
	population float null
);

if OBJECT_ID ('bronze.unemployment' , 'U') is not null
	drop table bronze.unemployment;
create table bronze.unemployment(
	country nvarchar(100),
	iso3_code nvarchar(50),
	year int,
	unemployment float null
);
