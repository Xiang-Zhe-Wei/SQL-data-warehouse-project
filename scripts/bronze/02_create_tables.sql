/*
===============================================================
DDL 腳本：建立 Bronze 層資料表（Create Bronze Tables）
===============================================================
腳本用途：
    在 'bronze' database 中建立 6 張原始資料表，
    若資料表已存在，會先刪除再重新建立。
    需要重新定義 bronze 資料表結構時，執行此腳本。

    來源系統 -> 資料表：
        CRM：crm_cust_info、crm_prd_info、crm_sales_details
        ERP：erp_cust_az12、erp_loc_a101、erp_px_cat_g1v2

    註：原課程以 SQL Server 的 IF OBJECT_ID(...) IS NOT NULL
        判斷資料表是否存在，MySQL 改用 DROP TABLE IF EXISTS。

前置條件：
    已執行 01_init_database.sql，建立 'bronze' database。

警告：
    執行此腳本會刪除並重建上述 6 張資料表，
    其中所有資料將永久消失，需重新執行 03_load_bronze.sql 匯入。
===============================================================
*/

DROP TABLE IF EXISTS bronze.crm_cust_info;
CREATE TABLE bronze.crm_cust_info(
	cst_id INT,
	cst_key VARCHAR(50),
	cst_firstname VARCHAR(50),
	cst_lastname VARCHAR(50),
	cst_marital_status VARCHAR(50),
	cst_gndr VARCHAR(50),
	cst_create_date DATE
);

DROP TABLE IF EXISTS bronze.crm_prd_info;
CREATE TABLE bronze.crm_prd_info(
	prd_id INT,
	prd_key VARCHAR(50),
	prd_nm VARCHAR(50),
	prd_cost INT,
	prd_line VARCHAR(50),
	prd_start_dt DATETIME,
	prd_end_dt DATETIME
);

DROP TABLE IF EXISTS bronze.crm_sales_details;
CREATE TABLE bronze.crm_sales_details(
	sls_ord_num VARCHAR(50),
	sls_prd_key VARCHAR(50), 
	sls_cust_id INT,
	sls_order_dt INT,
	sls_ship_dt INT,	
	sls_due_dt INT,
	sls_sales INT,
	sls_quantity INT,
	sls_price INT
);


DROP TABLE IF EXISTS bronze.erp_cust_az12;
CREATE TABLE bronze.erp_cust_az12(
	CID VARCHAR(50),
	BDATE DATETIME,
	GEN VARCHAR(50)
);

DROP TABLE IF EXISTS bronze.erp_loc_a101;
CREATE TABLE bronze.erp_loc_a101(
	CID VARCHAR(50),
	CNTRY VARCHAR(50)
);

DROP TABLE IF EXISTS bronze.erp_px_cat_g1v2;
CREATE TABLE bronze.erp_px_cat_g1v2(
	ID VARCHAR(50),
	CAT VARCHAR(50),
	SUBCAT VARCHAR(50),
	MAINTENANCE VARCHAR(50)
);