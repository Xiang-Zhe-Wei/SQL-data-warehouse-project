/*
===============================================================
建立資料倉儲分層（Bronze / Silver / Gold）
===============================================================
腳本用途：
    建立資料倉儲的三個分層 database：'bronze'、'silver'、'gold'。
    若同名 database 已存在，會先刪除再重新建立，確保環境乾淨。

    註：MySQL 沒有 SQL Server 的「database -> schema」兩層結構，
        SCHEMA 與 DATABASE 為同義詞，因此以三個 database 取代
        原本 DataWarehouse 底下的三個 schema。

警告：
    執行此腳本會刪除 'bronze'、'silver'、'gold' 三個 database，
    其中所有資料將永久消失、無法復原。
    執行前請確認已備份，或確定裡面沒有需要保留的資料。
*/

-- 刪除既有的分層 database
DROP DATABASE IF EXISTS bronze;
DROP DATABASE IF EXISTS silver;
DROP DATABASE IF EXISTS gold;

-- 重新建立三個分層
CREATE DATABASE bronze;   -- 原始資料：CSV 原樣匯入
CREATE DATABASE silver;   -- 清理後資料：清洗、標準化
CREATE DATABASE gold;     -- 商業資料：星狀模型，供分析使用
