/*
=============================================================================
Stored Procedure: Load Bronze Layer (Bronze -> Silver)
=============================================================================
Script Purpose:
  -Bulk Insertion of all data at once
  -This saves time and effort all at once.

Usage Example:
      EXEC bronze.load_bronze;
=============================================================================
*/

create or alter procedure bronze.load_bronze as
begin
	begin try
		print '======================================================'
		print 'Loading Bronze Layer'
		print '======================================================'

		/* Truncating and then inserting Data */
		print '>> Truncating Table: bronze.gdp'
		truncate table bronze.gdp

		print '>> Inserting Data Into: bronze.gdp'
		bulk insert bronze.gdp
		from 'C:\Users\mu pc\Desktop\Projects\Project 2\datasets\bronze.gdp.csv'
		with(
			firstrow = 2,
			fieldterminator = ';',
			tablock
		);

		/* Truncating and then inserting Data */
		print '>> Truncating Table: bronze.gdp_growth'
		truncate table bronze.gdp_growth

		print '>> Inserting Data Into: bronze.gdp_growth'
		bulk insert bronze.gdp_growth
		from 'C:\Users\mu pc\Desktop\Projects\Project 2\datasets\bronze.gdp_growth.csv'
		with(
			firstrow = 2,
			fieldterminator = ';',
			tablock
		);

		/* Truncating and then inserting Data */
		print '>> Truncating Table: bronze.inflation'
		truncate table bronze.inflation

		print '>> Inserting Data Into: bronze.inflation'
		bulk insert bronze.inflation
		from 'C:\Users\mu pc\Desktop\Projects\Project 2\datasets\bronze.inflation.csv'
		with(
			firstrow = 2,
			fieldterminator = ';',
			tablock
		);

		/* Truncating and then inserting Data */
		print '>> Truncating Table: bronze.life_expectancy'
		truncate table bronze.life_expectancy

		print '>> Inserting Data Into: bronze.life_expectancy'
		bulk insert bronze.life_expectancy
		from 'C:\Users\mu pc\Desktop\Projects\Project 2\datasets\bronze.life_expectancy.csv'
		with(
			firstrow = 2,
			fieldterminator = ';',
			tablock
		);

		/* Truncating and then inserting Data */
		print '>> Truncating Table: bronze.population'
		truncate table bronze.population

		print '>> Inserting Data Into: bronze.population'
		bulk insert bronze.population
		from 'C:\Users\mu pc\Desktop\Projects\Project 2\datasets\bronze.population.csv'
		with(
			firstrow = 2,
			fieldterminator = ';',
			tablock
		);

		/* Truncating and then inserting Data */
		print '>> Truncating Table: bronze.unemployment'
		truncate table bronze.unemployment

		print '>> Inserting Data Into: bronze.unemployment'
		bulk insert bronze.unemployment
		from 'C:\Users\mu pc\Desktop\Projects\Project 2\datasets\bronze.unemployment.csv'
		with(
			firstrow = 2,
			fieldterminator = ';',
			tablock
		);
	end try
	begin catch
		print '=========================================';
		print 'Error Occured During Loading Bronze Layer';
		print 'Error Message' + Error_message();
		print 'Error Message' + cast(error_number() as nvarchar);
		print '=========================================';
	end catch
end