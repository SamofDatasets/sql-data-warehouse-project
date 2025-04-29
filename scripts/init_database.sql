/* 
==================================================
Create Database 'DataWarehouse'
==================================================
Script Purpose:
	This script creates a new database named 'DataWarehouse',
	It checks if the database already exists and drops it if it does before creating.
	This script also sets up three schemas within the database: 'bronze', 'silver' and 'gold'

Warning:
	Running this script will drop any database named 'DataWarehouse' and delete all its content permanently
	Ensure you have proper backups before proceeding
*/

USE master;
GO

-- Drop and recreate the 'DataWarehouse' Database
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN
	ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
	DROP DATABASE DataWarehouse;
END;
GO

-- Create the 'DataWarehouse' Database
CREATE DATABASE DataWarehouse;
GO

USE DataWarehouse;
GO

-- Create Schemas; 'bronze', 'silver' and 'gold'
CREATE SCHEMA bronze;
GO

CREATE SCHEMA silver;
GO

CREATE SCHEMA gold;
GO
