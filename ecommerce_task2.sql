-- Table: customers
CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(191) UNIQUE,
    phone VARCHAR(15),
    address TEXT
);

-- Table: products
CREATE TABLE products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    description TEXT,
    price DECIMAL(10,2),
    stock INT
);

-- Table: orders
CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    status VARCHAR(50),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- Table: order_items
CREATE TABLE order_items (
    item_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    price DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Insert: customers
INSERT INTO customers (name, email, phone, address)
VALUES 
('Ravi Kumar', 'ravi@example.com', '9998887776', 'Delhi'),
('Neha Sharma', 'neha@example.com', NULL, 'Mumbai'),
('Amit Singh', 'amit@example.com', '8887776665', NULL);

-- Insert: products
INSERT INTO products (name, description, price, stock)
VALUES 
('Laptop', '14 inch Laptop', 45000.00, 10),
('Phone', 'Smartphone 6 inch', 25000.00, 15),
('Headphones', NULL, 2000.00, 30);

-- Insert: orders
INSERT INTO orders (customer_id, order_date, status)
VALUES 
(1, '2025-08-01', 'Confirmed'),
(2, '2025-08-02', 'Shipped');

-- Insert: order_items
INSERT INTO order_items (order_id, product_id, quantity, price)
VALUES 
(1, 1, 1, 45000.00),
(1, 3, 2, 4000.00),
(2, 2, 1, 25000.00);

-- Update: stock of product with id 3
UPDATE products SET stock = stock - 2 WHERE product_id = 3;

-- Delete: remove customer named Amit Singh
DELETE FROM customers WHERE name = 'Amit Singh';

-- Insert using SELECT: duplicate product with id 2
INSERT INTO products (name, description, price, stock)
SELECT name, description, price, stock FROM products WHERE product_id = 2;