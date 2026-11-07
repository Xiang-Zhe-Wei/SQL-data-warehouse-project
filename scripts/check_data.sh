#!/bin/bash

echo "===================================="
echo " 開始檢核 Bronze 層資料筆數..."
echo "===================================="

# 執行 MySQL 查詢腳本
mysql -D bronze < "/Users/xiangzhewei/學習/DS/SQL/Personal_Project/SQL-data-warehouse-project/scripts/04_check_load_bronze.sql"

echo "===================================="
echo " 檢核完畢！"
echo "===================================="