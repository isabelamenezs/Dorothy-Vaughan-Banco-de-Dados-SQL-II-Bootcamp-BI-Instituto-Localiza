-- 1)crie um indíce em orders (customer_id, dt_pedido) e explique quando ele será usado

CREATE INDEX idx_orders_customer_date
ON orders (customer_id, dt_pedido);

-- 2) Compare uma query que faz JOIN com EXISTS E analise qual é mais performática.

EXPLAIN QUERY PLAN
SELECT
     c.nome,
     o.dt_pedido,
     o.valor_total
FROM customers c 
JOIN orders o ON o.customer_id = c.customer_id;

EXPLAIN QUERY PLAN
SELECT
     c.nome
FROM customers c
WHERE EXISTS(
	    SELECT 1
	    FROM orders o
	    WHERE c.customer_id = o.customer_id 
);

-- 3) Identifique consultas que podem ser reescritas usando CTE materializada para melhorar a performance
WITH total_por_cliente AS MATERIALIZED (
    SELECT customer_id, SUM(valor_total) AS total_gasto
    FROM orders
    WHERE status = 'Pago'
    GROUP BY customer_id
)
SELECT 
    c.nome, 
    t.total_gasto
FROM 
    total_por_cliente t
JOIN 
    customers c ON c.customer_id = t.customer_id
WHERE 
    t.total_gasto > 2000;

---------------------------------
WITH pedidos_clientes AS (
    SELECT 
        c.customer_id,
        c.nome,
        o.order_id
    FROM orders o
    JOIN customers c ON o.customer_id = c.customer_id
)
SELECT 
    nome || ' - Pedido ' || order_id AS cliente_pedido
FROM pedidos_clientes;



