# Data Analyst Assignment – PlatinumRx

## Overview

This project demonstrates practical problem-solving skills using **SQL, Excel, and Python** across real-world business scenarios such as:

* Clinic revenue analysis
* Hotel booking analytics
* Customer feedback mapping
* Data transformation and validation

The solutions focus on **accuracy, clarity, and interview-ready logic**.

---

## Tech Stack

* **SQL** – Data querying and analytics
* **Excel / Google Sheets** – Data manipulation and reporting
* **Python** – Logic building and string processing

---

##  Project Structure
```
Data_Analyst_Assignment/
│
├── SQL/
│   ├── 01_Hotel_Schema_Setup.sql
│   ├── 02_Hotel_Queries.sql
│   ├── 03_Clinic_Schema_Setup.sql
│   └── 04_Clinic_Queries.sql
│
├── Spreadsheets/
│   └── Ticket_Analysis.xlsx
│
├── Python/
│   ├── 01_Time_Converter.py
│   └── 02_Remove_Duplicates.py
│
└── README.md
```

---

# SQL Section

## Concepts Used

* Joins (INNER, LEFT)
* GROUP BY & Aggregations
* Window Functions (`ROW_NUMBER`, `RANK`)
* Date filtering (`MONTH`, `YEAR`)
* CASE statements
* NULL handling using `COALESCE`

---

## Key Implementations

### Revenue & Profit Analysis

* Revenue grouped by sales channel
* Month-wise profit calculation (Revenue – Expense)

### Customer Insights

* Top 10 customers based on total spending

### Advanced Analytics

* Most profitable clinic per city
* Second least profitable clinic per state

### Hotel Analytics

* Last booked room per user
* Monthly billing calculations
* Most & least ordered items
* Second highest billing per month

---

## Highlights

* Used **window functions for ranking problems**
* Ensured correct joins to avoid aggregation errors
* Handled missing values using `COALESCE`
* Queries structured for **readability and interview explanation**

---

# Excel Section

## Concepts Used

* INDEX + MATCH (instead of VLOOKUP)
* COUNTIFS for conditional aggregation
* IF conditions
* Date-time handling (`INT`, custom formatting)

---

## Problems Solved

### Data Mapping

* Populated `ticket_created_at` using lookup from ticket data

### Time-Based Analysis

* Identified tickets:

  * Closed on the same day
  * Closed within the same hour

### Aggregation

* Outlet-wise ticket counts

---
## Highlights

* Used **INDEX-MATCH for flexible lookup**
* Avoided incorrect text-based comparisons
* Applied clean date-time formatting
* Debugged lookup issues effectively (`#N/A`)

---

# Python Section

## Concepts Used

* Loops (`for`)
* Conditional logic (`if-else`)
* String manipulation
* Arithmetic operations

---

## Problems Solved

### 🔹 Time Conversion

* Converted minutes into readable format

  * Example: `130 → 2 hrs 10 minutes`

### Duplicate Removal

* Removed duplicate characters while preserving order

---

## Highlights

* Maintained order while removing duplicates
* Handled formatting edge cases
* Implemented clean and readable logic

---

# Key Strengths

* Clean and structured implementation
* Interview-ready logic and explanations
* Proper handling of edge cases
* Real-world problem-solving approach
* Consistent coding style across all sections

# Author

**Akilraj K R**
B.Tech – Computer Science and Business Systems
Aspiring Data Analyst / Business Data Analysis using SQL, Excel & Python




