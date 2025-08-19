CREATE DATABASE jewelrystore_db;
USE jewelrystore_db;
CREATE TABLE item(ItemID INT, Name VARCHAR(150), Cost INT, PRIMARY KEY(ItemID));
INSERT INTO item VALUES(1,'Engagement ring',2500),(2,'Silver brooch',400),(3,'Earrings',350),(4,'Luxury watch',1250),(5,'Golden bracelet',800), (6,'Gemstone',1500);
CREATE TABLE mg_orders(OrderID INT, ItemID INT, Quantity INT, Cost INT, OrderDate DATE, DeliveryDate DATE, OrderStatus VARCHAR(50), PRIMARY KEY(OrderID));
INSERT INTO mg_orders VALUES(1,1,50,122000,'2022-04-05','2022-05-25', 'Delivered'),(2,2,75,28000,'2022-03-08',NULL, 'In progress'), (3,3,80,25000,'2022-05-19','2022-06-08', 'Delivered'), (4,4,45,100000,'2022-01-10',NULL, 'In progress'),(5,5,70,56000,'2022-05-19',NULL, 'In progress'),(6,6,60,90000,'2022-06-10','2022-06-18', 'Delivered');

-- Task 1: Write a SQL SELECT query using appropriate MySQL string functions to list items, quantities and order status in the following format: Item name–quantity–order status. Item name should be in lower case. Order status should be in upper case.
SELECT CONCAT(LCASE(Name),'-',Quantity,'-', UCASE(OrderStatus)) 
FROM item,mg_orders 
WHERE item.ItemID = mg_orders.ItemID;
-- Task 2: Write a SQL SELECT query using an appropriate date function and a format string to find the name of the weekday on which M&G’s orders are to be delivered.
SELECT DATE_FORMAT(DeliveryDate, '%W')
FROM mg_orders
-- Task 3: Write a SQL SELECT query that calculates the cost of handling each order. This should be 5% of the total order cost. Use an appropriate math function to round that value to 2 decimal places.
SELECT OrderID, ROUND((Cost * 0.05),2) AS HandlingCost 
FROM mg_orders; 
-- Task 4: Review the query that you wrote in the second task. Use an appropriate comparison function to filter out the records that do not have a NULL value in the delivery date column.
SELECT DATE_FORMAT(DeliveryDate,'%W') 
FROM mg_orders 
WHERE !ISNULL(DeliveryDate);

-- Task 5: For delivered orders, show how many days passed from OrderDate to DeliveryDate
SELECT
  o.OrderID,
  DATEDIFF(o.DeliveryDate, o.OrderDate) AS DaysToDeliver
FROM mg_orders AS o
WHERE o.DeliveryDate IS NOT NULL;

-- Task 6: Compute the per-unit price for each order and round to 2 decimals
SELECT
  o.OrderID,
  i.Name AS ItemName,
  ROUND(o.Cost / o.Quantity, 2) AS UnitPrice
FROM mg_orders AS o
JOIN item AS i ON i.ItemID = o.ItemID;

-- Task 7: For orders with status In progress, estimate delivery as 21 days after OrderDate and show the weekday name.
SELECT
  o.OrderID,
  DATE_ADD(o.OrderDate, INTERVAL 21 DAY) AS ExpectedDelivery,
  DATE_FORMAT(DATE_ADD(o.OrderDate, INTERVAL 21 DAY), '%W') AS ExpectedWeekday
FROM mg_orders AS o
WHERE o.OrderStatus = 'In progress';

-- Task 8: Show PENDING if DeliveryDate is NULL, else DELIVERED
SELECT
  o.OrderID,
  CASE
    WHEN o.DeliveryDate IS NULL THEN 'PENDING'
    ELSE 'DELIVERED'
  END AS DeliveryFlag
FROM mg_orders AS o;