-- 1)crie um indíce em orders (customer_id, dt_pedido) e explique quando ele será usado

CREATE INDEX idx_orders_customer_date
ON orders (customer_id, dt_pedido);

-- 3 Identifique consultas que podem ser reescritas usando CTE materializada para melhorar a performance
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
