/*
===============================================================
載入 Bronze 層資料（Load Bronze Layer）
===============================================================
腳本用途：
    將來源系統（CRM、ERP）的 CSV 檔匯入 'bronze' database。
    每張表會先 TRUNCATE 清空，再以 LOAD DATA LOCAL INFILE
    原樣匯入，並印出每張表與整批的載入時間。
 
    來源檔案 -> 目標資料表：
        source_crm/cust_info.csv      -> bronze.crm_cust_info
        source_crm/prd_info.csv       -> bronze.crm_prd_info
        source_crm/sales_details.csv  -> bronze.crm_sales_details
        source_erp/CUST_AZ12.csv      -> bronze.erp_cust_az12
        source_erp/LOC_A101.csv       -> bronze.erp_loc_a101
        source_erp/PX_CAT_G1V2.csv    -> bronze.erp_px_cat_g1v2
 
    註：原課程以 SQL Server 的 stored procedure（bronze.load_bronze）
        搭配 BULK INSERT 實作。MySQL 不允許在 stored procedure 中
        使用 LOAD DATA，因此改寫為獨立腳本，以 SELECT 印出訊息
        取代 PRINT。
 
前置條件：
    1. 已執行 01_init_database.sql 與 02_create_tables.sql。
    2. 伺服器與用戶端都需開啟 local_infile：
       - 伺服器：SET GLOBAL local_infile = 1;（需管理員權限）
       - 用戶端：mysql --local-infile=1
    3. 檔案路徑為本機絕對路徑，換電腦執行時需自行修改。
 
使用方式：
    ./run_etl.sh
    或
    mysql --local-infile=1 -D bronze < 03_load_bronze.sql
 
警告：
    執行此腳本會清空（TRUNCATE）上述 6 張 bronze 資料表，
    再重新匯入，原有資料將被覆蓋。
===============================================================
*/

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
