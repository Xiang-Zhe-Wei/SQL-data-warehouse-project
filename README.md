# 資料倉儲與分析專案（Data Warehouse and Analytics Project）

使用 MySQL 從零建立一套現代化資料倉儲，整合 ERP 與 CRM 兩個來源系統的銷售資料，經過清理、轉換與建模後，產出可直接用於商業分析的報表與洞察。

> 📌 **出處說明**
> 本專案以 [Data With Baraa 的 SQL Data Warehouse 課程](https://github.com/DataWithBaraa/sql-data-warehouse-project) 為基礎，原課程使用 SQL Server，我將整個專案改寫為 **MySQL** 版本，並在此基礎上延伸加入了自己的功能（見下方「我的延伸」）。原專案採用 MIT 授權。

---

## 🏗️ 資料架構

本專案採用 **Medallion Architecture（獎牌式架構）**，分為三層：

| 層級 | 用途 | 處理方式 |
|------|------|----------|
| **Bronze（銅層）** | 原始資料區 | 以 `LOAD DATA INFILE` 將 CSV 檔案原封不動匯入 MySQL，保留來源資料原貌 |
| **Silver（銀層）** | 清理後資料區 | 進行資料清洗、標準化與正規化，處理缺值、重複與格式不一致 |
| **Gold（金層）** | 商業資料區 | 以星狀模型（Star Schema）建立事實表與維度表，供報表與分析使用 |

<!-- 建議放上你自己用 draw.io 畫的架構圖 -->
<!-- ![資料架構圖](docs/data_architecture.png) -->

---

## 📖 專案內容

1. **資料架構設計**：規劃 Bronze / Silver / Gold 三層架構
2. **ETL 流程**：撰寫 SQL 腳本完成資料擷取、轉換與載入
3. **資料建模**：設計事實表與維度表，優化分析查詢效能
4. **分析與報表**：以 SQL 分析客戶行為、產品表現與銷售趨勢

---

## 🎯 專案需求

### 資料工程：建立資料倉儲

- **資料來源**：匯入 ERP 與 CRM 兩個系統提供的 CSV 檔
- **資料品質**：在分析前找出並修正資料品質問題
- **資料整合**：將兩個來源合併成單一、好用的分析用資料模型
- **範圍**：只處理最新資料，不保留歷史版本
- **文件**：撰寫清楚的資料模型說明，讓業務與分析人員都能理解

### 資料分析：BI 與報表

以 SQL 產出以下面向的分析洞察：

- 客戶行為
- 產品表現
- 銷售趨勢

---

## 🚀 我的延伸

<!-- 這是最重要的一段！寫你在原課程之外自己加了什麼 -->

- [x] **從 SQL Server 移植到 MySQL**：改寫 T-SQL 專屬語法（例如 `BULK INSERT` 改為 `LOAD DATA INFILE`、`ISNULL` 改為 `IFNULL`、`TRY...CATCH` 改為 `DECLARE HANDLER`），並以 MySQL 的 database 取代 SQL Server 的 schema 來區分三層
- [ ] 延伸 1：
- [ ] 延伸 2：
- [ ] 延伸 3：

---

## 📂 專案結構

```
sql-data-warehouse-project/
│
├── datasets/          # 原始資料（ERP 與 CRM 的 CSV 檔）
│
├── docs/              # 專案文件
│   ├── data_architecture.drawio   # 資料架構圖
│   ├── data_flow.drawio           # 資料流程圖
│   ├── data_models.drawio         # 資料模型（星狀模型）
│   ├── data_catalog.md            # 資料目錄與欄位說明
│   └── naming-conventions.md      # 命名規則
│
├── scripts/           # SQL 腳本
│   ├── bronze/        # 擷取與載入原始資料
│   ├── silver/        # 資料清理與轉換
│   └── gold/          # 建立分析用模型
│
├── tests/             # 資料品質測試
│
├── README.md
└── LICENSE
```

---

## ⚙️ 如何執行

1. 安裝 [MySQL 8.0 以上版本](https://dev.mysql.com/downloads/mysql/) 與 [MySQL Workbench](https://dev.mysql.com/downloads/workbench/)
   - 匯入 CSV 前需開啟 `local_infile`：
     ```sql
     SET GLOBAL local_infile = 1;
     ```
2. Clone 本專案
   ```bash
   git clone https://github.com/你的帳號/你的repo名稱.git
   ```
3. 依序執行 `scripts/` 內的腳本：
   - `bronze/`：建立 `bronze`、`silver`、`gold` 三個 database，載入原始資料
   - `silver/`：清理與轉換資料
   - `gold/`：建立事實表與維度表的 view
4. 執行 `tests/` 內的腳本檢查資料品質

---

## 💡 學到的東西

<!-- 用自己的話寫，面試官很愛看這段 -->

- （例如：理解為什麼要把原始資料和清理後資料分層存放）
- （例如：遇到 ERP 與 CRM 客戶 ID 格式不一致時，如何設計對應邏輯）
- （例如：星狀模型如何讓分析查詢變得更簡單、更快）

---

## 🛡️ 授權

本專案基於 MIT 授權的原始專案改作，原始版權聲明保留於 [LICENSE](LICENSE) 檔中。

---

## 👋 關於我

嗨！我是 **Che-Wei, Hsiang**，熱愛資料科學的學生。
