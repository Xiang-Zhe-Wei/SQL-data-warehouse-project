SET @batch_start_time = NOW();

SELECT "====================================" AS "";
SELECT "Loading Bronze Layer"  AS "";
SELECT "====================================" AS "";

SET GLOBAL local_infile = 1;

SELECT "------------------------------------" AS "";
SELECT "Loading CRM Tables"  AS "";
SELECT "------------------------------------" AS "";

SET @start_time = NOW();
SELECT ">> Truncating Table: bronze.crm_cust_info"  AS "";
TRUNCATE TABLE bronze.crm_cust_info;

SELECT ">> Inserting Data Into Table: bronze.crm_cust_info"  AS "";
LOAD DATA LOCAL INFILE '/Users/xiangzhewei/學習/DS/SQL/sql-data-warehouse-project/datasets/source_crm/cust_info.csv'
INTO TABLE bronze.crm_cust_info
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;
SET @end_time = NOW();
SELECT CONCAT(">> Load Duration: ", TIMESTAMPDIFF(SECOND, @start_time, @end_time), " seconds") AS "";
SELECT "-----------------" AS "";

SET @start_time = NOW();
SELECT ">> Truncating Table: bronze.crm_prd_info"  AS "";
TRUNCATE TABLE bronze.crm_prd_info;

SELECT ">> Inserting Data Into Table: bronze.crm_prd_info"  AS "";
LOAD DATA LOCAL INFILE '/Users/xiangzhewei/學習/DS/SQL/sql-data-warehouse-project/datasets/source_crm/prd_info.csv'
INTO TABLE bronze.crm_prd_info
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;
SET @end_time = NOW();
SELECT CONCAT(">> Load Duration: ", TIMESTAMPDIFF(SECOND, @start_time, @end_time), " seconds") AS "";
SELECT "-----------------" AS "";

SET @start_time = NOW();
SELECT ">> Truncating Table: bronze.crm_sales_details"  AS "";
TRUNCATE TABLE bronze.crm_sales_details;

SELECT ">> Inserting Data Into Table: bronze.crm_sales_details"  AS "";
LOAD DATA LOCAL INFILE '/Users/xiangzhewei/學習/DS/SQL/sql-data-warehouse-project/datasets/source_crm/sales_details.csv'
INTO TABLE bronze.crm_sales_details
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;
SET @end_time = NOW();
SELECT CONCAT(">> Load Duration: ", TIMESTAMPDIFF(SECOND, @start_time, @end_time), " seconds") AS "";
SELECT "-----------------" AS "";

SELECT "------------------------------------" AS "";
SELECT "Loading ERP Tables"  AS "";
SELECT "------------------------------------" AS "";

SET @start_time = NOW();
SELECT ">> Truncating Table: bronze.erp_cust_az12"  AS "";
TRUNCATE TABLE bronze.erp_cust_az12;

SELECT ">> Inserting Data Into Table: bronze.erp_cust_az12"  AS "";
LOAD DATA LOCAL INFILE '/Users/xiangzhewei/學習/DS/SQL/sql-data-warehouse-project/datasets/source_erp/CUST_AZ12.csv'
INTO TABLE bronze.erp_cust_az12
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;
SET @end_time = NOW();
SELECT CONCAT(">> Load Duration: ", TIMESTAMPDIFF(SECOND, @start_time, @end_time), " seconds") AS "";
SELECT "-----------------" AS "";

SET @start_time = NOW();
SELECT ">> Truncating Table: bronze.erp_loc_a101"  AS "";
TRUNCATE TABLE bronze.erp_loc_a101;

SELECT ">> Inserting Data Into Table: bronze.erp_loc_a101"  AS "";
LOAD DATA LOCAL INFILE '/Users/xiangzhewei/學習/DS/SQL/sql-data-warehouse-project/datasets/source_erp/LOC_A101.csv'
INTO TABLE bronze.erp_loc_a101
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;
SET @end_time = NOW();
SELECT CONCAT(">> Load Duration: ", TIMESTAMPDIFF(SECOND, @start_time, @end_time), " seconds") AS "";
SELECT "-----------------" AS "";

SET @start_time = NOW();
SELECT ">> Truncating Table: bronze.erp_px_cat_g1v2"  AS "";
TRUNCATE TABLE bronze.erp_px_cat_g1v2;

SELECT ">> Inserting Data Into Table: bronze.erp_px_cat_g1v2"  AS "";
LOAD DATA LOCAL INFILE '/Users/xiangzhewei/學習/DS/SQL/sql-data-warehouse-project/datasets/source_erp/PX_CAT_G1V2.csv'
INTO TABLE bronze.erp_px_cat_g1v2
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;
SET @end_time = NOW();
SELECT CONCAT(">> Load Duration: ", TIMESTAMPDIFF(SECOND, @start_time, @end_time), " seconds") AS "";
SELECT "-----------------" AS "";

SET @batch_end_time = NOW();
SELECT "====================================" AS "";
SELECT "Loading Bronze Layer is Completed" AS "";
SELECT CONCAT("  -- Total Load Duration: ", TIMESTAMPDIFF(SECOND, @batch_start_time, @batch_end_time), " seconds") AS "";
SELECT "====================================" AS "";
