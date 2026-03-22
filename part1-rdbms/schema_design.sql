-- ============================================
-- TABLE: customers
-- ============================================
CREATE TABLE customers (
customer_id VARCHAR(10) PRIMARY KEY,
customer_name VARCHAR(100) NOT NULL,
customer_email VARCHAR(100) NOT NULL,
customer_city VARCHAR(50) NOT NULL
);

-- ============================================
-- TABLE: products
-- ============================================
CREATE TABLE products (
product_id VARCHAR(10) PRIMARY KEY,
product_name VARCHAR(100) NOT NULL,
category VARCHAR(50) NOT NULL,
unit_price INT NOT NULL
);

-- ============================================
-- TABLE: sales_reps
-- ============================================
CREATE TABLE sales_reps (
sales_rep_id VARCHAR(10) PRIMARY KEY,
sales_rep_name VARCHAR(100) NOT NULL,
sales_rep_email VARCHAR(100) NOT NULL,
office_address VARCHAR(200) NOT NULL
);

-- ============================================
-- TABLE: orders
-- ============================================
CREATE TABLE orders (
order_id VARCHAR(10) PRIMARY KEY,
order_date DATE NOT NULL,
customer_id VARCHAR(10) NOT NULL,
sales_rep_id VARCHAR(10) NOT NULL,
FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
FOREIGN KEY (sales_rep_id) REFERENCES sales_reps(sales_rep_id)
);

-- ============================================
-- TABLE: order_items
-- ============================================
CREATE TABLE order_items (
order_id VARCHAR(10),
product_id VARCHAR(10),
quantity INT NOT NULL,
PRIMARY KEY (order_id, product_id),
FOREIGN KEY (order_id) REFERENCES orders(order_id),
FOREIGN KEY (product_id) REFERENCES products(product_id)
);
-- ============================================
-- INSERT INTO customers
-- ============================================
INSERT INTO customers VALUES
('C002', 'Priya Sharma', 'priya@gmail.com', 'Delhi'),
('C004', 'Sneha Iyer', 'sneha@gmail.com', 'Chennai'),
('C001', 'Rohan Mehta', 'rohan@gmail.com', 'Mumbai'),
('C006', 'Neha Gupta', 'neha@gmail.com', 'Delhi'),
('C007', 'Arjun Nair', 'arjun@gmail.com', 'Bangalore');

-- ============================================
-- INSERT INTO products
-- ============================================
INSERT INTO products VALUES
('P001', 'Laptop', 'Electronics', 55000),
('P002', 'Mouse', 'Electronics', 800),
('P005', 'Headphones', 'Electronics', 3200),
('P006', 'Standing Desk', 'Furniture', 22000),
('P007', 'Pen Set', 'Stationary', 250);

-- ============================================
-- INSERT INTO sales_reps
-- ============================================
INSERT INTO sales_reps VALUES
('SR01', 'Deepak Joshi', 'deepak@corp.com', 'Mumbai HQ, Nariman Point, Mumbai - 400021'),
('SR02', 'Anita Desai', 'anita@corp.com', 'Delhi Office, Connaught Place, New Delhi - 110001'),
('SR03', 'Ravi Kumar', 'ravi@corp.com', 'South Zone, MG Road, Bangalore - 560001');

-- ============================================
-- INSERT INTO orders
-- ============================================
INSERT INTO orders VALUES
('ORD1000', '2023-05-21', 'C002', 'SR03'),
('ORD1001', '2023-02-22', 'C004', 'SR03'),
('ORD1002', '2023-01-17', 'C002', 'SR02'),
('ORD1003', '2023-09-16', 'C002', 'SR01'),
('ORD1004', '2023-11-29', 'C001', 'SR01');

-- ============================================
-- INSERT INTO order_items
-- ============================================
INSERT INTO order_items VALUES
('ORD1000', 'P001', 2),
('ORD1001', 'P002', 5),
('ORD1002', 'P005', 1),
('ORD1003', 'P002', 5),
('ORD1004', 'P005', 5);






