-- =========================
-- STAR SCHEMA DESIGN
-- =========================

-- Notes:
-- Dates converted to YYYY-MM-DD format
-- Categories standardized to: Electronics, Clothing, Groceries
-- Surrogate keys used for efficient joins

-- =========================
-- DIMENSION TABLES
-- =========================

CREATE TABLE dim_date (
date_id INTEGER PRIMARY KEY,
full_date DATE NOT NULL,
day INTEGER,
month INTEGER,
year INTEGER
);

CREATE TABLE dim_store (
store_id INTEGER PRIMARY KEY,
store_name TEXT NOT NULL,
city TEXT NOT NULL
);

CREATE TABLE dim_product (
product_id INTEGER PRIMARY KEY,
product_name TEXT NOT NULL,
category TEXT NOT NULL
);

CREATE TABLE dim_customer (
customer_id TEXT PRIMARY KEY
);

-- =========================
-- FACT TABLE
-- =========================

CREATE TABLE fact_sales (
sales_id INTEGER PRIMARY KEY,
date_id INTEGER,
store_id INTEGER,
product_id INTEGER,
customer_id TEXT,
quantity INTEGER NOT NULL,
unit_price REAL NOT NULL,
total_amount REAL NOT NULL,

FOREIGN KEY (date_id) REFERENCES dim_date(date_id),
FOREIGN KEY (store_id) REFERENCES dim_store(store_id),
FOREIGN KEY (product_id) REFERENCES dim_product(product_id),
FOREIGN KEY (customer_id) REFERENCES dim_customer(customer_id)
);

-- =========================
-- DIM DATE
-- =========================

INSERT INTO dim_date VALUES
(1, '2023-08-29', 29, 8, 2023),
(2, '2023-12-12', 12, 12, 2023),
(3, '2023-02-05', 5, 2, 2023),
(4, '2023-02-20', 20, 2, 2023),
(5, '2023-01-15', 15, 1, 2023),
(6, '2023-08-09', 9, 8, 2023),
(7, '2023-03-31', 31, 3, 2023),
(8, '2023-10-26', 26, 10, 2023),
(9, '2023-12-08', 8, 12, 2023),
(10, '2023-08-15', 15, 8, 2023),
(11, '2023-06-04', 4, 6, 2023);

-- =========================
-- DIM STORE
-- =========================

INSERT INTO dim_store VALUES
(1, 'Chennai Anna', 'Chennai'),
(2, 'Delhi South', 'Delhi'),
(3, 'Bangalore MG', 'Bangalore'),
(4, 'Pune FC Road', 'Pune');

-- =========================
-- DIM PRODUCT
-- =========================

INSERT INTO dim_product VALUES
(1, 'Speaker', 'Electronics'),
(2, 'Tablet', 'Electronics'),
(3, 'Phone', 'Electronics'),
(4, 'Smartwatch', 'Electronics'),
(5, 'Atta 10kg', 'Groceries'),
(6, 'Jeans', 'Clothing'),
(7, 'Biscuits', 'Groceries'),
(8, 'Jacket', 'Clothing');

-- =========================
-- DIM CUSTOMER
-- =========================

INSERT INTO dim_customer VALUES
('CUST045'),
('CUST021'),
('CUST019'),
('CUST007'),
('CUST004'),
('CUST027'),
('CUST025'),
('CUST041'),
('CUST030'),
('CUST020'),
('CUST031');

-- =========================
-- FACT SALES
-- =========================

INSERT INTO fact_sales VALUES
(1, 1, 1, 1, 'CUST045', 3, 49262.78, 147788.34),
(2, 2, 1, 2, 'CUST021', 11, 23226.12, 255487.32),
(3, 3, 1, 3, 'CUST019', 20, 48703.39, 974067.80),
(4, 4, 2, 2, 'CUST007', 14, 23226.12, 325165.68),
(5, 5, 1, 4, 'CUST004', 10, 58851.01, 588510.10),
(6, 6, 3, 5, 'CUST027', 12, 52464.00, 629568.00),
(7, 7, 4, 4, 'CUST025', 6, 58851.01, 353106.06),
(8, 8, 4, 6, 'CUST041', 16, 2317.47, 37079.52),
(9, 9, 3, 7, 'CUST030', 9, 27469.99, 247229.91),
(10, 10, 3, 4, 'CUST020', 3, 58851.01, 176553.03),
(11, 11, 1, 8, 'CUST031', 15, 30187.24, 452808.60);
