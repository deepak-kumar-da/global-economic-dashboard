/*
=============================================================================
Stored Procedure: Load Silver Layer (Bronze -> Silver)
=============================================================================
Script Purpose:
  -This stored procedure will transform the ir-regular data with incorrect and inconsistent values.
  -It performs the following action
    -> Data Enrichment, Data Standardisation & Transformation and Data Cleaning.
    -> Uses the INSERT INTO command to load data from bronze tables to silver tables.

Parameters : None

Usage Example:
      EXEC silver.load_silver;
=============================================================================
*/

create or alter procedure silver.load_silver as
begin
	Begin Try

		print '================================================================================='
		print 'Loading Silver'
		print '================================================================================='


	/*
	=================================================================================
	 INSERTING QUALITY(CLEANED) DATA -> bronze.gdp TO SILVER LAYER 
	=================================================================================
	*/

		print '>> Truncating Table: silver.gdp'
		print '>> Inserting Data Into: silver.gdp'

	-- Truncating Previous Data and Adding New Data to avoid repetition
	truncate table silver.gdp;
	insert into silver.gdp (
		country,
		iso3_code,
		year,
		gdp )


	select 
	country, 

	-- Removing Null from iso3_code 
	isnull(iso3_code,'nil') as iso3_code, 
	year, 
	gdp 
	from (
		select 
			-- Separating Countries those are not identified in db
			country ,
			iso3_code , 
			year , 
			gdp 
			from bronze.gdp
			where country not in ('North America','Central Europe and the Baltics','Caribbean small states','Arab World','Africa Eastern and Southern','Africa Western and Central','Early-demographic dividend','East Asia & Pacific','East Asia & Pacific (excluding high income)','East Asia & Pacific (IDA & IBRD countries)','Euro area','Europe & Central Asia','Europe & Central Asia (excluding high income)','Europe & Central Asia (IDA & IBRD countries)','European Union','Fragile and conflict affected situations','Heavily indebted poor countries (HIPC)','High income','IBRD only','IDA & IBRD total','IDA blend','IDA only','IDA total','Late-demographic dividend','Latin America & Caribbean (excluding high income)','Latin America & the Caribbean (IDA & IBRD countries)','Latin America & Caribbean','Least developed countries: UN classification','Low & middle income','Low income','Lower middle income','Middle East, North Africa, Afghanistan & Pakistan','Middle East, North Africa, Afghanistan & Pakistan (excluding high income)','Middle East, North Africa, Afghanistan & Pakistan (IDA & IBRD)','Middle income','Not classified','OECD members','Other small states','Post-demographic dividend','Pre-demographic dividend','Small states','South Africa','South Asia','South Asia (IDA & IBRD)','Sub-Saharan Africa','Sub-Saharan Africa (excluding high income)','Sub-Saharan Africa (IDA & IBRD countries)','Upper middle income','World')
		) as t 
	where gdp != 0
	/*
	=================================================================================
	 INSERTING QUALITY(CLEANED) DATA -> bronze.gdp_growth TO SILVER LAYER 
	=================================================================================
	*/

		print '>> Truncating Table: silver.gdp_growth'
		print '>> Inserting Data Into: silver.gdp_growth'

	-- Truncating Previous Data and Adding New Data to avoid repetition

	truncate table silver.gdp_growth;

	insert into silver.gdp_growth (
		country,
		iso3_code,
		year,
		gdp_growth )

	select 
	country, 

	-- removed null from iso3_code
	isnull(iso3_code,'nil') as iso3_code, 

	year, 
	gdp_growth 
	from (
		select 
		
			-- Separating Countries those are not identified in db
			country,
			iso3_code,
			year,
			gdp_growth
		from bronze.gdp_growth
		where country not in ('North America','Central Europe and the Baltics','Caribbean small states','Arab World','Africa Eastern and Southern','Africa Western and Central','Early-demographic dividend','East Asia & Pacific','East Asia & Pacific (excluding high income)','East Asia & Pacific (IDA & IBRD countries)','Euro area','Europe & Central Asia','Europe & Central Asia (excluding high income)','Europe & Central Asia (IDA & IBRD countries)','European Union','Fragile and conflict affected situations','Heavily indebted poor countries (HIPC)','High income','IBRD only','IDA & IBRD total','IDA blend','IDA only','IDA total','Late-demographic dividend','Latin America & Caribbean (excluding high income)','Latin America & the Caribbean (IDA & IBRD countries)','Latin America & Caribbean','Least developed countries: UN classification','Low & middle income','Low income','Lower middle income','Middle East, North Africa, Afghanistan & Pakistan','Middle East, North Africa, Afghanistan & Pakistan (excluding high income)','Middle East, North Africa, Afghanistan & Pakistan (IDA & IBRD)','Middle income','Not classified','OECD members','Other small states','Post-demographic dividend','Pre-demographic dividend','Small states','South Africa','South Asia','South Asia (IDA & IBRD)','Sub-Saharan Africa','Sub-Saharan Africa (excluding high income)','Sub-Saharan Africa (IDA & IBRD countries)','Upper middle income','World')
		) as t  
	where gdp_growth is not null

	/*
	=================================================================================
	 INSERTING QUALITY(CLEANED) DATA -> bronze.inflation TO SILVER LAYER 
	=================================================================================
	*/
	
		print '>> Truncating Table: silver.inflation'
		print '>> Inserting Data Into: silver.inflation'

	-- Truncating Previous Data and Adding New Data to avoid repetition

	truncate table silver.inflation;

	insert into silver.inflation (
		country,
		iso3_code,
		year,
		inflation )

	select 
	country, 

	-- removed null from iso3_code
	isnull(iso3_code,'nil') as iso3_code, 

	year, 
	inflation 
	from (
		select 
		
			-- Separating Countries those are not identified in db
			country,
			iso3_code,
			year,
			inflation
		from bronze.inflation
		where country not in ('North America','Central Europe and the Baltics','Caribbean small states','Arab World','Africa Eastern and Southern','Africa Western and Central','Early-demographic dividend','East Asia & Pacific','East Asia & Pacific (excluding high income)','East Asia & Pacific (IDA & IBRD countries)','Euro area','Europe & Central Asia','Europe & Central Asia (excluding high income)','Europe & Central Asia (IDA & IBRD countries)','European Union','Fragile and conflict affected situations','Heavily indebted poor countries (HIPC)','High income','IBRD only','IDA & IBRD total','IDA blend','IDA only','IDA total','Late-demographic dividend','Latin America & Caribbean (excluding high income)','Latin America & the Caribbean (IDA & IBRD countries)','Latin America & Caribbean','Least developed countries: UN classification','Low & middle income','Low income','Lower middle income','Middle East, North Africa, Afghanistan & Pakistan','Middle East, North Africa, Afghanistan & Pakistan (excluding high income)','Middle East, North Africa, Afghanistan & Pakistan (IDA & IBRD)','Middle income','Not classified','OECD members','Other small states','Post-demographic dividend','Pre-demographic dividend','Small states','South Africa','South Asia','South Asia (IDA & IBRD)','Sub-Saharan Africa','Sub-Saharan Africa (excluding high income)','Sub-Saharan Africa (IDA & IBRD countries)','Upper middle income','World')
		) as t  
	where inflation is not null

	/*
	=================================================================================
	 INSERTING QUALITY(CLEANED) DATA -> bronze.life_expectancy TO SILVER LAYER 
	=================================================================================
	*/

		print '>> Truncating Table: silver.life_expectancy'
		print '>> Inserting Data Into: silver.life_expectancy'

	-- Truncating Previous Data and Adding New Data to avoid repetition

	truncate table silver.life_expectancy;

	insert into silver.life_expectancy (
		country,
		iso3_code,
		year,
		life_expectancy )

	select 
	country, 

	-- removed null from iso3_code
	isnull(iso3_code,'nil') as iso3_code, 

	year, 
	life_expectancy 
	from (
		select 
		
			-- Separating Countries those are not identified in db
			country,
			iso3_code,
			year,
			life_expectancy
		from bronze.life_expectancy
		where country not in ('North America','Central Europe and the Baltics','Caribbean small states','Arab World','Africa Eastern and Southern','Africa Western and Central','Early-demographic dividend','East Asia & Pacific','East Asia & Pacific (excluding high income)','East Asia & Pacific (IDA & IBRD countries)','Euro area','Europe & Central Asia','Europe & Central Asia (excluding high income)','Europe & Central Asia (IDA & IBRD countries)','European Union','Fragile and conflict affected situations','Heavily indebted poor countries (HIPC)','High income','IBRD only','IDA & IBRD total','IDA blend','IDA only','IDA total','Late-demographic dividend','Latin America & Caribbean (excluding high income)','Latin America & the Caribbean (IDA & IBRD countries)','Latin America & Caribbean','Least developed countries: UN classification','Low & middle income','Low income','Lower middle income','Middle East, North Africa, Afghanistan & Pakistan','Middle East, North Africa, Afghanistan & Pakistan (excluding high income)','Middle East, North Africa, Afghanistan & Pakistan (IDA & IBRD)','Middle income','Not classified','OECD members','Other small states','Post-demographic dividend','Pre-demographic dividend','Small states','South Africa','South Asia','South Asia (IDA & IBRD)','Sub-Saharan Africa','Sub-Saharan Africa (excluding high income)','Sub-Saharan Africa (IDA & IBRD countries)','Upper middle income','World')
		) as t  
	where life_expectancy is not null

	/*
	=================================================================================
	 INSERTING QUALITY(CLEANED) DATA -> bronze.population TO SILVER LAYER 
	=================================================================================
	*/

		print '>> Truncating Table: silver.population'
		print '>> Inserting Data Into: silver.population'

	-- Truncating Previous Data and Adding New Data to avoid repetition

	truncate table silver.population;

	insert into silver.population (
		country,
		iso3_code,
		year,
		population )

	select 
	country, 

	-- removed null from iso3_code
	isnull(iso3_code,'nil') as iso3_code, 

	year, 
	population 
	from (
		select 
		
			-- Separating Countries those are not identified in db
			country,
			iso3_code,
			year,
			population
		from bronze.population
		where country not in ('North America','Central Europe and the Baltics','Caribbean small states','Arab World','Africa Eastern and Southern','Africa Western and Central','Early-demographic dividend','East Asia & Pacific','East Asia & Pacific (excluding high income)','East Asia & Pacific (IDA & IBRD countries)','Euro area','Europe & Central Asia','Europe & Central Asia (excluding high income)','Europe & Central Asia (IDA & IBRD countries)','European Union','Fragile and conflict affected situations','Heavily indebted poor countries (HIPC)','High income','IBRD only','IDA & IBRD total','IDA blend','IDA only','IDA total','Late-demographic dividend','Latin America & Caribbean (excluding high income)','Latin America & the Caribbean (IDA & IBRD countries)','Latin America & Caribbean','Least developed countries: UN classification','Low & middle income','Low income','Lower middle income','Middle East, North Africa, Afghanistan & Pakistan','Middle East, North Africa, Afghanistan & Pakistan (excluding high income)','Middle East, North Africa, Afghanistan & Pakistan (IDA & IBRD)','Middle income','Not classified','OECD members','Other small states','Post-demographic dividend','Pre-demographic dividend','Small states','South Africa','South Asia','South Asia (IDA & IBRD)','Sub-Saharan Africa','Sub-Saharan Africa (excluding high income)','Sub-Saharan Africa (IDA & IBRD countries)','Upper middle income','World')
		) as t 
	where population is not null
	
	/*
	=================================================================================
	 INSERTING QUALITY(CLEANED) DATA -> bronze.unemployment TO SILVER LAYER 
	=================================================================================
	*/

		print '>> Truncating Table: silver.unemployment'
		print '>> Inserting Data Into: silver.unemployment'

	-- Truncating Previous Data and Adding New Data to avoid repetition

	truncate table silver.unemployment;

	insert into silver.unemployment (
		country,
		iso3_code,
		year,
		unemployment )

	select 
	country, 

	-- removed null from iso3_code
	isnull(iso3_code,'nil') as iso3_code, 

	year, 
	unemployment 
	from (
		select 
		
			-- Separating Countries those are not identified in db
			country,
			iso3_code,
			year,
			unemployment
		from bronze.unemployment
		where country not in ('North America','Central Europe and the Baltics','Caribbean small states','Arab World','Africa Eastern and Southern','Africa Western and Central','Early-demographic dividend','East Asia & Pacific','East Asia & Pacific (excluding high income)','East Asia & Pacific (IDA & IBRD countries)','Euro area','Europe & Central Asia','Europe & Central Asia (excluding high income)','Europe & Central Asia (IDA & IBRD countries)','European Union','Fragile and conflict affected situations','Heavily indebted poor countries (HIPC)','High income','IBRD only','IDA & IBRD total','IDA blend','IDA only','IDA total','Late-demographic dividend','Latin America & Caribbean (excluding high income)','Latin America & the Caribbean (IDA & IBRD countries)','Latin America & Caribbean','Least developed countries: UN classification','Low & middle income','Low income','Lower middle income','Middle East, North Africa, Afghanistan & Pakistan','Middle East, North Africa, Afghanistan & Pakistan (excluding high income)','Middle East, North Africa, Afghanistan & Pakistan (IDA & IBRD)','Middle income','Not classified','OECD members','Other small states','Post-demographic dividend','Pre-demographic dividend','Small states','South Africa','South Asia','South Asia (IDA & IBRD)','Sub-Saharan Africa','Sub-Saharan Africa (excluding high income)','Sub-Saharan Africa (IDA & IBRD countries)','Upper middle income','World')
		) as t  
	where unemployment is not null

	END Try
	Begin Catch
		print '=================================================='
		print 'Error Message' + Error_Message()
		print 'Error Message' + Cast (Error_number() as nvarchar);
		print 'Error Message' + Cast (Error_state() as nvarchar);
		print'=================================================='
	End Catch
END