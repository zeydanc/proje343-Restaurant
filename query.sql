
//*(JOIN)*//
SELECT o.order_id, c.name, o.order_time, o.total_amount
FROM Orders o
JOIN Customers c ON o.customer_id = c.customer_id;

//*(GROUP BY + COUNT)*//
SELECT order_id, COUNT(item_id) AS total_items
FROM OrderDetails
GROUP BY order_id;

//*(ORDER BY + LIMIT)*//
SELECT name, stock
FROM MenuItems
ORDER BY stock DESC
LIMIT 5;

//*(JOIN + GROUP BY)*//
SELECT e.name, e.role, COUNT(o.order_id) AS total_orders
FROM Employees e
LEFT JOIN Orders o ON e.employee_id = o.employee_id
GROUP BY e.employee_id, e.name, e.role;

//*(subquery + aggregate)*//
SELECT name, total_orders
FROM (
    SELECT c.name, COUNT(o.order_id) AS total_orders
    FROM Customers c
    JOIN Orders o ON c.customer_id = o.customer_id
    GROUP BY c.customer_id, c.name
) AS t
ORDER BY total_orders DESC
LIMIT 1;

/*(JOIN + SUM)*/
SELECT m.name, SUM(od.quantity) AS total_sold
FROM OrderDetails od
JOIN MenuItems m ON od.item_id = m.item_id
GROUP BY m.item_id, m.name
ORDER BY total_sold DESC
LIMIT 1;

/*(DATE fonksiyonu)*/
SELECT *
FROM Orders
WHERE DATE(order_time) = CURRENT_DATE;

/*(AVG)*/
SELECT AVG(capacity) AS average_capacity
FROM RestaurantTables;

/*(WHERE + AVG)*/
SELECT category, AVG(price) AS avg_price
FROM MenuItems
WHERE category = 'meal'
GROUP BY category;

/*(SUM + GROUP BY)*/
SELECT c.name, SUM(p.amount) AS total_spent
FROM Payments p
JOIN Orders o ON p.order_id = o.order_id
JOIN Customers c ON o.customer_id = c.customer_id
GROUP BY c.customer_id, c.name
ORDER BY total_spent DESC
LIMIT 1;

/*(AVG + GROUP BY)*/
SELECT AVG(item_count) AS avg_items_per_order
FROM (
    SELECT order_id, SUM(quantity) AS item_count
    FROM OrderDetails
    GROUP BY order_id
) AS t;

/*(subquery)*/
SELECT name, price
FROM MenuItems
WHERE price > (SELECT AVG(price) FROM MenuItems);
/*(LIKE - string function)*/
SELECT name, price
FROM MenuItems
WHERE name ILIKE '%a%';

/*(WHERE + SUM)*/
SELECT SUM(total_amount) AS takeaway_total
FROM Orders
WHERE order_type = 'takeaway';

/*(JOIN + GROUP BY)*/
SELECT rt.table_number, SUM(o.total_amount) AS total_revenue
FROM Orders o
JOIN RestaurantTables rt ON o.table_id = rt.table_id
GROUP BY rt.table_id, rt.table_number
ORDER BY total_revenue DESC;