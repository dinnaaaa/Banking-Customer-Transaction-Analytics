# Banking Customer & Transaction Analytics

### Analyzing Customer Behavior, Transaction Patterns, and Banking Performance Using SQL and Python

## 1. Latar Belakang

Data transaksi perbankan dapat digunakan untuk memahami aktivitas nasabah, pola transaksi, nilai transaksi, serta perubahan aktivitas berdasarkan waktu.

Project ini berfokus pada **Data Analysis dan Business Intelligence** dengan memanfaatkan data nasabah dan transaksi perbankan untuk menghasilkan insight yang dapat membantu memahami:

- aktivitas dan karakteristik nasabah,
- pola dan nilai transaksi,
- aktivitas transaksi berdasarkan waktu,
- kontribusi nasabah terhadap total nilai transaksi,
- serta indikator performa transaksi perbankan.

Project tidak hanya berfokus pada pembuatan visualisasi, tetapi mencakup proses:

**Data Validation → Data Cleaning → Data Preparation → SQL Analysis → Exploratory Data Analysis → KPI → Visualization → Business Insights → Recommendations → Dashboard**

---

## 2. Tujuan Project

Tujuan utama project ini adalah:

1. Memahami karakteristik dan struktur data transaksi perbankan.
2. Melakukan validasi dan pembersihan data sebelum analisis.
3. Menggunakan SQL untuk melakukan analisis data secara terstruktur.
4. Menganalisis perilaku dan aktivitas nasabah.
5. Mengidentifikasi pola dan tren transaksi.
6. Menghasilkan KPI yang relevan untuk menggambarkan performa transaksi.
7. Membuat visualisasi yang mudah dipahami.
8. Menghasilkan business insights dan recommendations berdasarkan hasil analisis.

---

## 3. Fokus Analisis

### A. Customer Analysis

Analisis customer dilakukan untuk memahami aktivitas dan kontribusi nasabah.

Analisis mencakup:

- Jumlah nasabah.
- Frekuensi transaksi per nasabah.
- Total nilai transaksi per nasabah.
- Rata-rata nilai transaksi per nasabah.
- Segmentasi nasabah berdasarkan total nilai transaksi.
- Kontribusi setiap segmen terhadap total nilai transaksi.
- Nasabah dengan total nilai transaksi tertinggi.
- Nasabah dengan frekuensi transaksi tertinggi.

### B. Transaction Analysis

Analisis transaksi dilakukan untuk memahami volume dan nilai transaksi.

Analisis mencakup:

- Total transaksi.
- Total nilai transaksi.
- Rata-rata nilai transaksi.
- Median nilai transaksi.
- Nilai transaksi minimum dan maksimum.
- Distribusi nilai transaksi.
- Analisis transaksi berdasarkan rentang nilai transaksi.

### C. Time & Trend Analysis

Analisis waktu dilakukan untuk memahami pola aktivitas transaksi.

Analisis mencakup:

- Tren jumlah transaksi berdasarkan tanggal.
- Tren nilai transaksi berdasarkan tanggal.
- Aktivitas transaksi berdasarkan bulan.
- Aktivitas transaksi berdasarkan hari.
- Aktivitas transaksi berdasarkan jam.
- Aktivitas transaksi berdasarkan periode waktu.
- Identifikasi periode dengan aktivitas transaksi tertinggi.

### D. Banking Performance / KPI Analysis

KPI yang digunakan disesuaikan dengan kolom dan karakteristik dataset.

KPI utama:

- Total Customers
- Total Transactions
- Total Transaction Value
- Average Transaction Value
- Median Transaction Value
- Average Transactions per Customer

---

## 4. Business Questions

Project ini menjawab beberapa pertanyaan bisnis utama:

### Customer

1. Berapa jumlah nasabah yang terdapat dalam dataset?
2. Bagaimana aktivitas transaksi nasabah?
3. Nasabah mana yang memiliki total nilai transaksi tertinggi?
4. Bagaimana distribusi nasabah berdasarkan nilai transaksi?
5. Segmen nasabah mana yang memberikan kontribusi terbesar terhadap total nilai transaksi?

### Transaction

6. Berapa total transaksi dan total nilai transaksi?
7. Bagaimana distribusi nilai transaksi?
8. Rentang nilai transaksi mana yang memiliki jumlah transaksi terbanyak?
9. Rentang nilai transaksi mana yang memberikan kontribusi nilai terbesar?

### Trend

10. Bagaimana aktivitas transaksi berdasarkan waktu?
11. Kapan periode dengan aktivitas transaksi tertinggi?
12. Bagaimana pola transaksi berdasarkan hari dan jam?

### Business Performance

13. Segmen nasabah mana yang memberikan kontribusi terbesar?
14. Periode waktu mana yang memiliki aktivitas transaksi tertinggi?
15. Insight apa yang dapat digunakan untuk mendukung pengambilan keputusan?
16. Rekomendasi apa yang dapat diberikan berdasarkan hasil analisis?

---

## 5. Dataset

Dataset yang digunakan adalah:

**bank_transactions.csv**

Dataset memiliki informasi utama mengenai nasabah dan transaksi, yaitu:

- TransactionID
- CustomerID
- CustomerDOB
- CustGender
- CustLocation
- CustAccountBalance
- TransactionDate
- TransactionTime
- TransactionAmount (INR)

Dataset terdiri dari:

- **1.048.567 transaksi**
- **884.265 nasabah unik**
- **9 kolom awal**

Dataset mencakup periode transaksi:

**1 Agustus 2016 – 21 Oktober 2016**

dengan **55 tanggal transaksi unik**.

> Dataset mentah tidak disertakan dalam repository karena ukuran file yang besar. Struktur dan proses analisis tetap dapat dipelajari melalui notebook dan SQL analysis.

---

## 6. Metodologi Project

Alur project:

```text
BANK TRANSACTIONS DATASET
          ↓
1. Data Understanding
          ↓
2. Data Validation
          ↓
3. Data Cleaning
          ↓
4. Data Preparation
          ↓
5. SQL Database Setup
          ↓
6. SQL Data Analysis
          ↓
7. Exploratory Data Analysis
          ↓
8. Customer Analysis
          ↓
9. Transaction Analysis
          ↓
10. Time & Trend Analysis
          ↓
11. KPI Analysis
          ↓
12. Data Visualization
          ↓
13. Business Insights
          ↓
14. Recommendations
          ↓
15. Dashboard
          ↓
16. GitHub Portfolio

```
## 7. Data Validation & Data Cleaning

Sebelum dilakukan analisis, dataset melalui proses validasi dan pembersihan.

Validasi dilakukan terhadap:

-  Missing values. 
-  Duplicate rows. 
-  Duplicate Transaction ID. 
-  Nilai gender yang tidak valid. 
-  Customer date of birth. 
-  Transaction date. 
-  Transaction time. 
-  Transaction amount. 
-  Customer account balance. 
-  Customer age. 

### Hasil Validasi

-  Duplicate rows: **0** 
-  Duplicate Transaction ID: **0** 
-  Transaction date invalid: **0** 
-  Transaction time invalid: **0** 
-  Negative transaction amount: **0** 
-  Negative account balance: **0** 

Nilai gender yang tidak valid dikonversi menjadi `Unknown`.

Data tanggal lahir yang tidak valid atau tidak masuk akal ditangani selama proses cleaning.

Kolom tanggal dan waktu transaksi kemudian dikonversi ke format yang sesuai dan digunakan untuk membuat fitur waktu seperti:

-  TransactionDateTime 
-  TransactionHour 
-  TransactionYear 
-  TransactionMonth 
-  TransactionDay 
-  TransactionMonthName 
-  TransactionDayName 

Customer age juga dihitung dan divalidasi berdasarkan tanggal lahir dan tanggal transaksi.

---

## 8. SQL Analysis

SQL digunakan sebagai salah satu bagian utama dalam project untuk melakukan analisis data secara terstruktur.

Analisis SQL mencakup:

-  Total customers dan transactions. 
-  Transaction value summary. 
-  Top customers berdasarkan transaction value. 
-  Customer transaction frequency. 
-  Transaction performance berdasarkan bulan. 
-  Transaction performance berdasarkan jam. 
-  Transaction performance berdasarkan hari. 
-  Customer value segmentation. 
-  Transaction value range. 
-  Daily transaction performance. 
-  Peak transaction days. 
-  Transaction activity berdasarkan time period. 
-  Transaction value distribution. 

Teknik SQL yang digunakan:

```
```

```
SELECT
WHERE
GROUP BY
ORDER BY
HAVING
COUNT
SUM
AVG
MIN
MAX
DISTINCT
CASE WHEN
CTE
Window Function
Date/Time Functions
```

Window function digunakan dalam analisis distribusi nilai transaksi, termasuk perhitungan median menggunakan pendekatan `ROW_NUMBER()`.

## 9. Python Analysis

Python digunakan untuk melakukan:

-  Data loading. 
-  Data understanding. 
-  Data validation. 
-  Data cleaning. 
-  Data transformation. 
-  Customer-level aggregation. 
-  Transaction analysis. 
-  Time-based analysis. 
-  KPI calculation. 
-  Exploratory data analysis. 
-  Data visualization. 
-  Export hasil analisis. 

### Library

-  Pandas 
-  NumPy 
-  Matplotlib 
-  Seaborn 
-  SQLAlchemy 

---

## 10. Key Performance Indicators

| KPIHasil                          |                   |
| --------------------------------- | ----------------- |
| Total Customers                   | 884.265           |
| Total Transactions                | 1.048.567         |
| Total Transaction Value           | ₹1.650.795.731,57 |
| Average Transaction Value         | ₹1.574,34         |
| Median Transaction Value          | ₹459,03           |
| Average Transactions per Customer | 1,19              |

---

## 11. Key Business Insights

### 1. Aktivitas Nasabah

Terdapat **884.265 nasabah unik** dengan total **1.048.567 transaksi**.

Rata-rata transaksi per nasabah adalah **1,19**, sedangkan median frekuensi transaksi adalah **1 transaksi**.

Sebanyak **83,76% nasabah tercatat hanya melakukan satu transaksi**.

Hal ini menunjukkan bahwa sebagian besar nasabah dalam dataset memiliki aktivitas transaksi yang relatif rendah.

### 2. Kontribusi Segmen Nasabah

Segmentasi berdasarkan total nilai transaksi menunjukkan:

| SegmenProporsi NasabahKontribusi Nilai Transaksi |        |        |
| ------------------------------------------------ | ------ | ------ |
| Low                                              | 50,00% | 5,83%  |
| Medium                                           | 40,00% | 30,90% |
| High                                             | 10,00% | 63,27% |

Segmen **High** hanya mencakup sekitar **10% nasabah**, tetapi memberikan kontribusi sekitar **63,27% dari total nilai transaksi**.

### 3. Distribusi Nilai Transaksi

Median nilai transaksi sebesar **₹459,03**, sedangkan rata-rata sebesar **₹1.574,34**.

Perbedaan tersebut menunjukkan bahwa distribusi nilai transaksi bersifat **right-skewed**, yaitu terdapat sejumlah transaksi bernilai besar yang meningkatkan nilai rata-rata.

### 4. Pola Transaksi Berdasarkan Waktu

Periode **18:00–23:59** memiliki jumlah transaksi tertinggi.

Sementara itu, periode **12:00–17:59** memiliki total nilai transaksi tertinggi.

### 5. Pola Berdasarkan Hari

**Minggu** memiliki jumlah transaksi dan total nilai transaksi tertinggi dibandingkan hari lainnya.

### 6. Rentang Nilai Transaksi

Rentang **₹0–500** memiliki jumlah transaksi terbanyak.

Sementara itu, rentang **₹1.001–5.000** memberikan kontribusi total nilai transaksi terbesar.

### 7. Periode Data

Dataset mencakup periode **1 Agustus–21 Oktober 2016** dengan 55 tanggal transaksi unik.

Beberapa tanggal tidak tersedia dan bulan Oktober hanya mencakup sebagian periode.

Oleh karena itu, perubahan pada akhir periode perlu diinterpretasikan dengan hati-hati dan tidak langsung dianggap sebagai penurunan performa bulanan.

---

## 12. Business Recommendations

Berdasarkan hasil analisis, beberapa rekomendasi yang dapat diberikan adalah:

### 1. Fokus pada Nasabah Bernilai Tinggi

Nasabah pada segmen High memberikan kontribusi sekitar 63,27% terhadap total nilai transaksi.

Oleh karena itu, strategi retensi dan relationship management dapat lebih difokuskan pada kelompok nasabah bernilai tinggi.

### 2. Meningkatkan Repeat Transaction

Sebagian besar nasabah hanya memiliki satu transaksi.

Program engagement dapat dievaluasi untuk mendorong nasabah melakukan transaksi kembali.

### 3. Optimalisasi Periode Aktivitas Tinggi

Aktivitas transaksi paling tinggi terjadi pada periode 12:00–17:59 dan 18:00–23:59.

Periode tersebut dapat menjadi perhatian dalam perencanaan kapasitas layanan dan kesiapan operasional.

### 4. Evaluasi Aktivitas Akhir Pekan

Minggu memiliki aktivitas transaksi tertinggi.

Aktivitas layanan dan program customer engagement pada akhir pekan dapat dievaluasi lebih lanjut.

### 5. Monitoring Nilai Transaksi

Distribusi nilai transaksi perlu terus dimonitor untuk memahami kontribusi transaksi bernilai rendah hingga tinggi terhadap keseluruhan transaction value.

### 6. Meningkatkan Kelengkapan Data

Karena terdapat tanggal yang tidak tersedia dan periode Oktober tidak mencakup satu bulan penuh, kelengkapan data perlu diperhatikan sebelum melakukan perbandingan performa antarbulan.

---

## 13. Dashboard

Hasil analisis kemudian divisualisasikan dalam **Banking Customer & Transaction Analytics Dashboard**.

Dashboard mencakup:

-  Total Customers. 
-  Total Transactions. 
-  Total Transaction Value. 
-  Average Transaction Value. 
-  Transaction Trend. 
-  Customer Value Segment. 
-  Transaction Value Range. 
-  Transaction Activity berdasarkan Time Period. 
-  Transaction Activity berdasarkan Day. 
-  Key Business Insights. 

### Dashboard Preview



---

## 14. Project Structure

```

```

```
banking-customer-transaction-analytics/
│
├── data/
│   ├── raw/
│   │   └── bank_transactions.csv
│   │
│   └── processed/
│
├── notebooks/
│   └── banking_transaction_analysis.ipynb
│
├── sql/
│   └── banking_analysis.sql
│
├── images/
│
├── dashboard/
│   ├── banking_customer_transaction_dashboard.png
│   ├── dashboard_kpi_cards.png
│   ├── dashboard_transaction_trend.png
│   ├── dashboard_customer_value_segment.png
│   ├── dashboard_transaction_value_range.png
│   ├── dashboard_transaction_time_period.png
│   ├── dashboard_transaction_by_day.png
│   └── business_insights.txt
│
├── requirements.txt
└── .gitignore
```

---

## 15. Tools & Technologies

### Data Processing

-  Python 
-  Pandas 
-  NumPy 

### Database & Query

-  SQL 
-  SQLite 
-  SQLAlchemy 

### Visualization

-  Matplotlib 
-  Seaborn 

### Development

-  Jupyter Notebook 
-  Anaconda 
-  Git 
-  GitHub 

---

## 16. Output Project

Project ini menghasilkan:

1. **Clean Dataset**
    Dataset yang telah melalui proses validation dan cleaning. 
2. **SQL Database**
    Database SQLite untuk melakukan analisis menggunakan SQL. 
3. **SQL Queries**
    Kumpulan query untuk menjawab business questions. 
4. **Jupyter Notebook**
    Berisi proses data understanding, validation, cleaning, analysis, visualization, dan insights. 
5. **Data Visualizations**
    Visualisasi hasil analisis customer, transaction, dan time-based analysis. 
6. **Dashboard**
    Banking Customer & Transaction Analytics Dashboard. 
7. **Business Insights**
    Insight utama yang ditemukan dari hasil analisis. 
8. **Recommendations**
    Rekomendasi berdasarkan hasil analisis. 

---

## 17. Kesimpulan

**Banking Customer & Transaction Analytics** merupakan project Data Analytics yang menerapkan proses analisis secara end-to-end, mulai dari data validation dan data cleaning hingga SQL analysis, Python analysis, KPI calculation, visualization, dashboard development, business insights, dan recommendations.

Hasil analisis menunjukkan bahwa sebagian besar nasabah memiliki frekuensi transaksi yang rendah, sementara sebagian kecil nasabah bernilai tinggi memberikan kontribusi besar terhadap total nilai transaksi.

Selain itu, terdapat pola aktivitas transaksi berdasarkan waktu dan hari yang dapat digunakan sebagai dasar untuk memahami perilaku transaksi dan mendukung pengambilan keputusan berbasis data.

Project ini menunjukkan penerapan kemampuan:

**SQL + Python + Data Analysis + Data Visualization + KPI + Business Intelligence + Dashboard**

```

```

```
```
