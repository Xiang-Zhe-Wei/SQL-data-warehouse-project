#!/bin/bash

echo "開始載入 Bronze 層資料..."

/opt/homebrew/bin/mysql --local-infile=1 -D bronze < "/Users/xiangzhewei/學習/DS/SQL/Personal_Project/SQL-data-warehouse-project/scripts/03_load_bronze.sql"

echo "Bronze 層資料載入完成！"

