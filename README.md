# 📚 SQL Bookstore Project 

## 📖 Project Overview

This project is an **Online Bookstore Database Management System** developed using **PostgreSQL**. The project demonstrates database creation, relational table design, CSV data import, and SQL query writing to solve real-world business problems.

The database consists of three related tables (Books, Customers, and Orders). Data was imported from CSV files, and 20 SQL business queries were written to analyze sales, customers, books, and inventory.

---

## 🗄️ Database Structure

### 📚 Books
Stores information about books.

- Book_ID (Primary Key)
- Title
- Author
- Genre
- Published_Year
- Price
- Stock

### 👥 Customers
Stores customer information.

- Customer_ID (Primary Key)
- Name
- Email
- Phone
- City
- Country

### 🛒 Orders
Stores order details.

- Order_ID (Primary Key)
- Customer_ID (Foreign Key)
- Book_ID (Foreign Key)
- Order_Date
- Quantity
- Total_Amount

### 🔗 Table Relationships

- One customer can place multiple orders.
- One book can appear in multiple orders.
- Customer_ID and Book_ID are used as Foreign Keys in the Orders table.

---

## 🚀 Project Workflow

### Step 1
Created the **OnlineBookstore** database.

### Step 2
Created three relational tables:
- Books
- Customers
- Orders

### Step 3
Imported data from CSV files using the PostgreSQL **COPY** command.

CSV Files:
- Books.csv
- Customers.csv
- Orders.csv

### Step 4
Solved 20 real-world SQL business questions using PostgreSQL.

---

## 📊 SQL Concepts Used

- SELECT
- WHERE
- ORDER BY
- GROUP BY
- HAVING
- INNER JOIN
- LEFT JOIN
- Aggregate Functions (COUNT, SUM, AVG)
- DISTINCT
- LIMIT
- COALESCE

---

## 📈 Business Problems Solved

✔ Retrieve Fiction books

✔ Find books published after 1950

✔ List customers from Canada

✔ Show orders placed in November 2023

✔ Calculate total available stock

✔ Find the most expensive book

✔ Find customers who ordered more than one book

✔ Retrieve orders with total amount greater than $20

✔ List all available book genres

✔ Find the book with the lowest stock

✔ Calculate total revenue

✔ Calculate books sold by genre

✔ Find customers with at least two orders

✔ Find the most frequently ordered book

✔ Show the top 3 expensive Fantasy books

✔ Calculate books sold by each author

✔ Find cities of customers who spent more than $30

✔ Find the highest spending customer

✔ Calculate remaining stock after fulfilling all orders

✔ Solve additional SQL analytical queries

---

## 🛠️ Technologies Used

- PostgreSQL
- SQL
- CSV Files

---

## 💡 Skills Demonstrated

- Database Design
- Relational Database Management
- Primary Keys & Foreign Keys
- Data Import using COPY Command
- SQL Query Writing
- Joins
- Aggregate Functions
- Business Data Analysis
- Inventory Analysis
- Customer Analysis
- Sales Analysis

---

## 🎯 Project Outcome

Successfully designed an Online Bookstore relational database, imported data from CSV files, established relationships using Primary and Foreign Keys, and solved 20 real-world SQL business problems using PostgreSQL.

---


## 👨‍💻 Author

**Ajit Rana**

Aspiring Data Analyst | Advanced Excel | SQL | Power BI | Python |Open to Work
