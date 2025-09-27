
--1. AUTHOR TABELE MANIPULAT 
--see the table 
SELECT*FROM AUTHOR
 
 -- Check for empty strings,null value
SELECT *
FROM AUTHOR
WHERE Name IN ('NULL','-');

   UPDATE AUTHOR
SET Name = 'UNKNOWN'
WHERE AuthorID = 13;

 SELECT * FROM AUTHOR
 
 --DUPLICATE
SELECT Name, COUNT(*) AS DuplicateCount
FROM AUTHOR
GROUP BY Name
HAVING COUNT(*) > 1;

--DELETE DUPLICATES
DELETE FROM AUTHOR
WHERE AuthorID NOT IN (
    SELECT MIN(AuthorID)
    FROM AUTHOR
    GROUP BY Name);

    --SEE THE TABLE 
SELECT * FROM AUTHOR

--2. BOOK TABELE MANIPULAT 
--SEE THE TABLE 
SELECT * FROM BOOK

-- Check for empty strings
SELECT *
FROM BOOK
WHERE Title IN ('NULL','NA','N/A','-')
   OR Genre IN ('NULL','NA','N/A','-');
  
-- Clean Title column
UPDATE BOOK
SET Title = 'UNKNOWN'
WHERE Title IN ('NULL','NA','N/A','-');

-- Clean Genre column
UPDATE BOOK
SET Genre = 'UNKNOWN'
WHERE Genre IN ('NULL','NA','N/A','-');

UPDATE BOOK
SET Price = (SELECT AVG(Price) FROM BOOK WHERE Price IS NOT NULL)
WHERE Price IS NULL;

SELECT * FROM BOOK

-- Find duplicates by Title + AuthorID
SELECT Title, AuthorID, COUNT(*) AS DuplicateCount
FROM BOOK
GROUP BY Title, AuthorID
HAVING COUNT(*) > 1;

--DELETE
DELETE FROM BOOK
WHERE BookID NOT IN (
    SELECT MIN(BookID)
    FROM BOOK
    GROUP BY Title, AuthorID);


--SEE THE CLEAN TABLE 
SELECT *FROM BOOK

--3. CUSTOMER TABLE MANIPULAT 
-- SEE THE ROW TABLE 
SELECT * FROM CUSTOMERS

  -- Check for empty strings
SELECT *
FROM CUSTOMERS
WHERE Name IN ('NULL','NA','N/A','-')
   OR Country IN ('NULL','NA','N/A','-');

 -- Clean Name column
UPDATE CUSTOMERS
SET Name = 'UNKNOWN'
WHERE Name IN ('NULL','NA','N/A','-');

-- Clean Country column
UPDATE CUSTOMERS
SET Country = 'UNKNOWN'
WHERE Country IN ('NULL','NA','N/A','-');

--SEE THE TABLE
SELECT * FROM CUSTOMERS

-- Find duplicates by Title + AuthorID
SELECT Name,Country, COUNT(*) AS DuplicateCount
FROM CUSTOMERS
GROUP BY Name, Country
HAVING COUNT(*) > 1;

--DELETE 
DELETE FROM CUSTOMERS
WHERE CustomerID NOT IN (
    SELECT MIN(CustomerID)
    FROM CUSTOMERS
    GROUP BY Name, Country);

-- SEE THE CLEAN TABLE
SELECT *FROM CUSTOMERS

--4. ORDER TABLE MANIPULAT 
-- SEE THE ROW TABLE 
SELECT* FROM [ORDER]

 -- Check NULL
 SELECT *
FROM [ORDER]
WHERE OrderDate IS NULL;

UPDATE [ORDER]
SET OrderDate = '2024-02-11'
WHERE OrderDate IS NULL; 

--SEE THE TABLE
SELECT *FROM [ORDER]

-- Find duplicates by customerid
SELECT CustomerID, COUNT(*) AS DuplicateCount
FROM [ORDER]
GROUP BY CustomerID
HAVING COUNT(*) > 1;

--DELETE
DELETE FROM [ORDER]
WHERE OrderID NOT IN (
SELECT MIN(OrderID)
FROM [ORDER]
GROUP BY CustomerID);

--SEE THE CLEAN TABLE
SELECT *FROM [ORDER]

--5. ORDERDETAIL TABLE MANIPULAT 
-- SEE THE ROW TABLE 
SELECT * FROM [ORDERDETAILS]

-- Check for empty strings
SELECT *
FROM ORDERDETAILS
WHERE Quantity IS NULL;

UPDATE ORDERDETAILS
SET Quantity = ROUND(
    (SELECT AVG(CAST(Quantity AS FLOAT))
     FROM ORDERDETAILS
     WHERE Quantity IS NOT NULL), 0)
WHERE Quantity IS NULL;

--SEE CLEAN TABLE
SELECT *FROM ORDERDETAILS

-- Find duplicates by customerid
SELECT OrderID, COUNT(*) AS DuplicateCount
FROM ORDERDETAILS
GROUP BY OrderID
HAVING COUNT(*) > 1;

--DELETE
DELETE FROM [ORDERDETAILS]
WHERE OrderDetailID NOT IN (
SELECT MIN(OrderDetailID)
FROM [ORDERDETAILS]
GROUP BY OrderID );

--SEE THE CLEAN TABLE
SELECT *FROM [ORDERDETAILS]
