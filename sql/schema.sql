--Criação das tabelas
-- Clientes
CREATE TABLE customers (
 customer_id INTEGER PRIMARY KEY,
 nome TEXT NOT NULL,
 email TEXT UNIQUE,
 dt_cadastro DATE
);

-- Pedidos
CREATE TABLE orders (
 order_id INTEGER PRIMARY KEY,
 customer_id INTEGER,
 dt_pedido DATE,
 valor_total DECIMAL(10,2),
 status TEXT CHECK(status IN ('Pendente','Pago','Cancelado')),
 FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- Produtos
CREATE TABLE products (
 product_id INTEGER PRIMARY KEY,
 nome TEXT NOT NULL,
 preco DECIMAL(10,2),
 categoria TEXT
);

-- Itens do Pedido
CREATE TABLE order_items (
 order_item_id INTEGER PRIMARY KEY,
 order_id INTEGER,
 product_id INTEGER,
 quantidade INTEGER,
 preco_unitario DECIMAL(10,2),
 FOREIGN KEY (order_id) REFERENCES orders(order_id),
 FOREIGN KEY (product_id) REFERENCES products(product_id)
)
