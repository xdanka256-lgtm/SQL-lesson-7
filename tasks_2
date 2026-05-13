CREATE TABLE orders(
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	order_no TEXT UNIQUE,
	address TEXT NOT NULL,
	phone TEXR NOT NULL,
	ordered_at TEXT DEFAULT (date('now'))
);

CREATE TABLE products(
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	name TEXT NOT NULL,
	unit_price REAL NOT NULL CHECK(unit_price >=0)
);

CREATE TABLE sales (
	order_id INTEGER NOT NULL,
	product_id INTEGER NOT NULL,
	qty INTEGER NOT NULL DEFAULT 1 CHECK(qty >0),
	PRIMARY KEY (order_id, product_id),
	FOREIGN KEY (order_id) REFERENCES orders(id),
	FOREIGN KEY (product_id) REFERENCES products(id)
);

INSERT INTO orders (id, order_no, address, phone, ordered_at)
VALUES
          (1, 'ORD-1001', '12 Lake St, Boston',  '+1-555-0101', '2026-01-05'),
          (2, 'ORD-1002', '12 Lake St, Boston',  '+1-555-0101', '2026-01-07'),
          (3, 'ORD-1003', '88 Pine Ave, Seattle', '+1-555-0202', '2026-01-09'),
          (4, 'ORD-1004', '44 Nile Rd, Cairo',    '+1-555-0303', '2026-01-10'),
          (5, 'ORD-1005', '77 Hill Rd, Austin',   '+1-555-0404', '2026-01-11'); -- no sales rows

INSERT INTO products (id, name, unit_price)
VALUES
  (1, 'Laptop', 1200),
  (2, 'Mouse', 25),
  (3, 'Keyboard', 80),
  (4, 'Webcam', 95),
  (5, 'Monitor', 280),
  (6, 'Desk Lamp', 35),
  (7, 'USB Hub', 40);

INSERT INTO sales (order_id, product_id, qty)
VALUES
  (1, 1, 1),
  (1, 2, 2),
  (1, 3, 1),
  (2, 4, 1),
  (2, 7, 2),
  (3, 5, 1),
  (3, 6, 3),
  (4, 2, 1),
  (4, 7, 1);
  
SELECT 
	o.order_no,
	o.address,
	o.phone,
	p.name AS product_name,
	s.qty,
	p.unit_price,
	s.qty * p.unit_price AS total
FROM sales AS s
INNER JOIN orders AS o
	ON s.order_id = o.id
INNER JOIN products AS p
	ON s.product_id = p.id;
 
SELECT 	
	o.order_no,
	o.address,
	o.phone,
	coalesce(SUM(s.qty),0) AS total_items,
	coalesce(SUM(s.qty * p.unit_price), 0) AS total_price
FROM orders AS o
LEFT JOIN sales AS s
	ON o.id = s.order_id
LEFT JOIN products AS p 
	ON s.product_id = p.id
GROUP BY o.id,o.order_no,o.address,o.phone;

