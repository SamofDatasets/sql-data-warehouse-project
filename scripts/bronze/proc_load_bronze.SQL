/* 
===============================================================================
Stored Procedure: Load Bronze Layer (Source -> Bronze)
===============================================================================
Script Purpose:
    This stored procedure loads data into the 'bronze' schema from external CSV files. 
    It performs the following actions:
    - Truncates the bronze tables before loading data.
    - Uses the `BULK INSERT` command to load data from CSV files into the bronze tables.

Parameters:
    None. 
    This stored procedure does not accept any parameters or return any values.

Usage Example:
    EXEC bronze.load_bronze;
*/

CREATE OR ALTER PROCEDURE bronze.load_bronze
AS
BEGIN

    BEGIN TRY
		PRINT '==========================================='
        PRINT 'Starting data load into Bronze Layer...';
		PRINT '==========================================='

        ----------------------------------------------------------------------
        -- CRM Source: Load Customer Information
        ----------------------------------------------------------------------
        PRINT '==========================================='
		PRINT 'Loading CRM Customer Info...';
        TRUNCATE TABLE bronze.crm_cust_info;
        BULK INSERT bronze.crm_cust_info
        FROM 'C:\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            TABLOCK
        );
		PRINT 'CRM Customer Info loaded.';

        ----------------------------------------------------------------------
        -- CRM Source: Load Product Information
        ----------------------------------------------------------------------
        PRINT '==========================================='
		PRINT 'Loading CRM Product Info...';
        TRUNCATE TABLE bronze.crm_prd_info;
        BULK INSERT bronze.crm_prd_info
        FROM 'C:\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            TABLOCK
        );
		PRINT 'CRM Product Info loaded.';

        ----------------------------------------------------------------------
        -- CRM Source: Load Sales Details
        ----------------------------------------------------------------------
        PRINT '==========================================='
		PRINT 'Loading CRM Sales Details...';
        TRUNCATE TABLE bronze.crm_sales_details;
        BULK INSERT bronze.crm_sales_details
        FROM 'C:\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            TABLOCK
        );
		PRINT 'CRM Sales Details loaded.';

        ----------------------------------------------------------------------
        -- ERP Source: Load Customer AZ12 Data
        ----------------------------------------------------------------------
        PRINT '==========================================='
		PRINT 'Loading ERP Customer AZ12...';
        TRUNCATE TABLE bronze.erp_cust_az12;
        BULK INSERT bronze.erp_cust_az12
        FROM 'C:\sql-data-warehouse-project\datasets\source_erp\CUST_AZ12.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            TABLOCK
        );
		PRINT 'ERP Customer AZ12 loaded.';

        ----------------------------------------------------------------------
        -- ERP Source: Load Location A101 Data
        ----------------------------------------------------------------------
        PRINT '==========================================='
		PRINT 'Loading ERP Location A101...';
        TRUNCATE TABLE bronze.erp_loc_a101;
        BULK INSERT bronze.erp_loc_a101
        FROM 'C:\sql-data-warehouse-project\datasets\source_erp\LOC_A101.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            TABLOCK
        );
		PRINT 'ERP Location A101 loaded.';

        ----------------------------------------------------------------------
        -- ERP Source: Load Product Category G1V2 Data
        ----------------------------------------------------------------------
        PRINT '==========================================='
		PRINT 'Loading ERP Product Category G1V2...';
        TRUNCATE TABLE bronze.erp_px_cat_g1v2;
        BULK INSERT bronze.erp_px_cat_g1v2
        FROM 'C:\sql-data-warehouse-project\datasets\source_erp\PX_CAT_G1V2.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            TABLOCK
        );
		PRINT 'ERP Product Category G1V2 loaded.';

		PRINT '==========================================='
        PRINT 'Data load into Bronze Layer completed successfully.';
    END TRY
    BEGIN CATCH
		PRINT '==========================================='
        PRINT 'An error occurred during Bronze data load.';
		PRINT '==========================================='
        PRINT ERROR_MESSAGE();
    END CATCH
END;
