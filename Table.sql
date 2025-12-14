CREATE TABLE Customers (
    customer_id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    phone VARCHAR(20),
    email VARCHAR(100),
    created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE RestaurantTables (
    table_id SERIAL PRIMARY KEY,
    table_number INT UNIQUE NOT NULL,
    capacity INT NOT NULL
);

CREATE TABLE Employees (
    employee_id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    role VARCHAR(50),
    phone VARCHAR(20)
);

CREATE TABLE MenuItems (
    item_id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2),
    stock INT
);

CREATE TABLE Orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES Customers(customer_id),
    table_id INT REFERENCES RestaurantTables(table_id),
    employee_id INT REFERENCES Employees(employee_id),
    order_time TIMESTAMP DEFAULT NOW(),
    order_type VARCHAR(20),
    total_amount DECIMAL(10,2)
);

CREATE TABLE OrderDetails (
    order_id INT REFERENCES Orders(order_id),
    item_id INT REFERENCES MenuItems(item_id),
    quantity INT,
    price_at_that_moment DECIMAL(10,2),
    PRIMARY KEY (order_id, item_id)
);

CREATE TABLE Payments (
    payment_id SERIAL PRIMARY KEY,
    order_id INT REFERENCES Orders(order_id),
    payment_type VARCHAR(20),
    amount DECIMAL(10,2),
    payment_time TIMESTAMP DEFAULT NOW()
);