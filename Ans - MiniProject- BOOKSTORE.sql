
--•	Select all books and their prices.
SELECT Title,Price 
FROM BOOK;

--•	Get all customers who bought books by authors from the UK.
SELECT DISTINCT c.Name
FROM CUSTOMERS c 
JOIN [ORDER] O ON c.CustomerID = o.CustomerID
JOIN ORDERDETAILS od on o.[OrderID]= od.OrderID 
JOIN BOOK b on od.BookID = b.BookID
Join AUTHOR a on b.AuthorID = a.AuthorID
WHERE a.Country='UK';

--•	Show the total number of books per genre
SELECT Genre, COUNT(*) AS TotalBooks
FROM BOOK
GROUP BY Genre;

--•	Find books that cost more than $14.
SELECT Title, Price
FROM BOOK
WHERE Price >14;

--•	List customers and the titles of the books they purchased.
SELECT c.Name AS Customer, b.Title AS BOOK
FROM CUSTOMERS c 
JOIN [Order] o ON c.CustomerID = o.CustomerID
JOIN OrderDetails od ON o.OrderID = od.OrderID
JOIN BOOK b ON od.BookID = b.BookID;

--•	List all books along with their author and genre.
SELECT b.Title, b.Genre, a.Name
FROM BOOK b
JOIN AUTHOR a ON b.AuthorID=a.AuthorID;

--•	Find customers who ordered books costing more than $12.
SELECT DISTINCT c.Name
FROM CUSTOMERS c
JOIN [ORDER] o ON c.CustomerID= o.customerID
JOIN [ORDERDETAILS] od ON o.OrderID=od.OrderID
JOIN BOOK b ON od.BookID=b.BookID
WHERE Price>12;

--•	Find the top 3 best-selling books by quantity.
SELECT TOP 3 b.Title,SUM(od.Quantity) AS TotalSales
FROM [ORDERDETAILS] od
JOIN BOOK b ON od.BookID=b.BookID
JOIN AUTHOR a ON  b.AuthorID=a.AuthorID
GROUP BY b.Title 
ORDER BY TotalSales DESC

--•	Get the total revenue per genre.
SELECT b.Genre, SUM(Price * Quantity) AS TotalRevenue 
FROM BOOK b
JOIN ORDERDETAILS od ON b.BookID = od.BookID
GROUP BY Genre;

--•	Find the average price per author.
SELECT a.Name AS Author, AVG(b.Price) AS AvgPrice
FROM AUTHOR a
JOIN BOOK b ON a.AuthorID = b.AuthorID
GROUP BY a.Name;

