-- Create OnlineBooksstore Database

CREATE DATABASE OnlineBookstore;

-- Create  Books Table
DROP TABLE IF EXISTS Books;
CREATE TABLE Books (
    Book_ID SERIAL PRIMARY KEY,
    Title VARCHAR(100),
    Author VARCHAR(100),
    Genre VARCHAR(50),
    Published_Year INT,
    Price NUMERIC(10, 2),
    Stock INT
);


--Create Customers Table

DROP TABLE IF EXISTS customers;
CREATE TABLE Customers (
    Customer_ID SERIAL PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100),
    Phone VARCHAR(15),
    City VARCHAR(50),
    Country VARCHAR(150)
);

--Create Orders Table

DROP TABLE IF EXISTS orders;
CREATE TABLE Orders (
    Order_ID SERIAL PRIMARY KEY,
    Customer_ID INT REFERENCES Customers(Customer_ID),
    Book_ID INT REFERENCES Books(Book_ID),
    Order_Date DATE,
    Quantity INT,
    Total_Amount NUMERIC(10, 2)
);

SELECT MAX(Book_ID)FROM Books;

SELECT * FROM Books;
SELECT * FROM Customers;
SELECT * FROM Orders;


-- Import Data into Books Table
COPY Books(Book_ID, Title, Author, Genre, Published_Year, Price, Stock) 
FROM 'E:\SQL practice files\ST - SQL ALL PRACTICE FILES-2\All Excel Practice Files\Books.csv' 
CSV HEADER;

-- Import Data into Customers Table
COPY Customers(Customer_ID, Name, Email, Phone, City, Country) 
FROM 'E:\SQL practice files\ST - SQL ALL PRACTICE FILES-2\All Excel Practice Files\Customers.csv' 
CSV HEADER;

-- Import Data into Orders Table
COPY Orders(Order_ID, Customer_ID, Book_ID, Order_Date, Quantity, Total_Amount) 
FROM 'E:\SQL practice files\ST - SQL ALL PRACTICE FILES-2\All Excel Practice Files\Orders.csv' 
CSV HEADER;


-- 1) Retrieve all books in the "Fiction" genre:

SELECT * FROM Books
WHERE genre='Fiction';

-- 2) Find books published after the year 1950:

SELECT * FROM Books
WHERE published_year>1950;
 
-- 3) List all customers from the Canada:

SELECT * FROM Customers
WHERE country='Canada';

-- 4) Show orders placed in November 2023:

SELECT * FROM Orders
WHERE ORDER_DATE BETWEEN '2023-11-01' AND '2023-11-30';

-- 5) Retrieve the total stock of books available:

SELECT SUM(stock) AS Total_Stock
FROM Books;


-- 6) Find the details of the most expensive book:

SELECT * FROM Books
ORDER BY Price DESC
LIMIT 1;


-- 7) Show all customers who ordered more than 1 quantity of a book:

SELECT * FROM Orders
WHERE Quantity>1;



-- 8) Retrieve all orders where the total amount exceeds $20:
SELECT * FROM Orders
WHERE total_amount>20;

-- 9) List all genres available in the Books table:
SELECT DISTINCT genre FROM Books;


-- 10) Find the book with the lowest stock:
SELECT * FROM Books 
ORDER BY Stock 
LIMIT 1;



-- 11) Calculate the total revenue generated from all orders:
SELECT SUM(Total_amount) AS Total_Revenue FROM Orders;
-- Advance Questions : 

-- 12) Retrieve the total number of books sold for each genre:

SELECT b.genre,SUM(o.Quantity) AS Total_Books_Sold
FROM Orders o
JOIN Books b ON o.Book_ID=b.Book_ID
GROUP BY  b.genre;

-- 13) Find the average price of books in the "Fantasy" genre:

SELECT AVG(Price) AS Average_Price
FROM Books
WHERE genre='Fantasy';

-- 14) List customers who have placed at least 2 orders:
SELECT Customer_ID,COUNT(Order_ID) AS ORDER_COUNT
FROM Orders
GROUP BY Customer_ID
HAVING COUNT(Order_ID)>=2;



SELECT o.Customer_ID,c.name,COUNT(o.Order_ID) AS ORDER_COUNT
FROM Orders o
JOIN Customers c ON o.Customer_ID=c.Customer_ID
GROUP BY o.Customer_ID, c.name
HAVING COUNT(Order_ID)>=2;

-- 15) Find the most frequently ordered book:
SELECT Book_ID,COUNT(Order_ID) AS ORDER_COUNT
FROM Orders
GROUP BY Book_ID
ORDER BY ORDER_COUNT DESC LIMIT 1;
  
               --OR
SELECT  o.Book_ID, b.Title,COUNT(o.Order_ID) AS ORDER_COUNT
FROM Orders o
JOIN Books b ON O.Book_ID=b.Book_ID
GROUP BY o.Book_ID,b.Title
ORDER BY ORDER_COUNT DESC LIMIT 1;

-- 16) Show the top 3 most expensive books of 'Fantasy' Genre :

SELECT * FROM Books
WHERE genre='Fantasy'
ORDER BY price DESC LIMIT 3;

-- 17) Retrieve the total quantity of books sold by each author:

SELECT b.Author,SUM(o.Quantity) AS Total_Books_Sold
FROM Orders o
JOIN Books b ON o.Book_ID=b.Book_ID
GROUP BY b.Author;

-- 18) List the cities where customers who spent over $30 are located:

SELECT DISTINCT c.City
FROM Orders o
JOIN Customers c ON o.Customer_ID=c.Customer_ID
WHERE o.Total_Amount>30;

-- 19) Find the customer who spent the most on orders:
SELECT c.Customer_ID,c.Name,SUM(o.Total_Amount) AS Total_Spent
FROM Orders o
JOIN Customers c ON o.Customer_ID=c.Customer_ID
GROUP BY c.Customer_ID,c.Name
ORDER BY Total_Spent DESC LIMIT 1;
 

--20) Calculate the stock remaining after fulfilling all orders:

SELECT b.Book_ID,b.Title,b.Stock,COALESCE(SUM(o.Quantity),0)AS Order_Quantity,b.Stock-COALESCE(SUM(o.Quantity),0) AS REMAINING_QUANTITY
FROM Books b
LEFT JOIN Orders o ON b.Book_ID=o.Book_ID
GROUP BY b.Book_ID ORDER BY b.Book_ID;






