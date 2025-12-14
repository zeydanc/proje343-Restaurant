[17:26, 11/26/2025] Zehra Taş 343 Proje: INSERT INTO Customers (name, phone, email)
VALUES
('Ahmet Yılmaz', '5551234567', 'ahmet@example.com'),
('Zeynep Demir', '5559876543', 'zeynep@example.com'),
('Mehmet Kaya', '5554443322', 'mehmet@example.com');
[17:26, 11/26/2025] Zehra Taş 343 Proje: INSERT INTO RestaurantTables (table_number, capacity)
VALUES
(1, 4),
(2, 2),
(3, 6),
(4, 4);
[17:27, 11/26/2025] Zehra Taş 343 Proje: INSERT INTO Employees (name, role, phone)
VALUES
('Elif Karaca', 'waiter', '5321112233'),
('Murat Şahin', 'chef', '5323334455'),
('Ceren Aksoy', 'cashier', '5327778899');
[17:27, 11/26/2025] Zehra Taş 343 Proje: INSERT INTO MenuItems (name, category, price, stock)
VALUES
('Margherita Pizza', 'meal', 120.00, 20),
('Chicken Burger', 'meal', 95.00, 15),
('Cola', 'drink', 25.00, 50),
('Tiramisu', 'dessert', 45.00, 10),
('Lemonade', 'drink', 30.00, 40);
[17:27, 11/26/2025] Zehra Taş 343 Proje: INSERT INTO Orders (customer_id, table_id, employee_id, order_type, total_amount)
VALUES
(1, 1, 1, 'dine-in', 215.00),
(2, 2, 1, 'dine-in', 150.00),
(3, NULL, 3, 'takeaway', 95.00);
[17:27, 11/26/2025] Zehra Taş 343 Proje: INSERT INTO OrderDetails (order_id, item_id, quantity, price_at_that_moment)
VALUES
-- Order 1 items
(1, 1, 1, 120.00),   -- 1 Margherita Pizza
(1, 3, 2, 25.00),    -- 2 Cola

-- Order 2 items
(2, 2, 1, 95.00),    -- Chicken Burger
(2, 5, 1, 30.00),    -- Lemonade

-- Order 3 items (takeaway)
(3, 2, 1, 95.00);    -- Chicken Burger
[17:27, 11/26/2025] Zehra Taş 343 Proje: INSERT INTO Payments (order_id, payment_type, amount)
VALUES
(1, 'card', 215.00),
(2, 'cash', 150.00),
(3, 'card', 95.00);