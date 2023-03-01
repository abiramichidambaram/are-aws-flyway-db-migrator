CREATE TABLE IF NOT EXISTS products (
product_no integer PRIMARY KEY,
name text,
price numeric
);

CREATE TABLE IF NOT EXISTS orders (
order_id integer PRIMARY KEY,
product_no integer references products,
quantity integer,
order_date timestamp(0) without time zone
);
