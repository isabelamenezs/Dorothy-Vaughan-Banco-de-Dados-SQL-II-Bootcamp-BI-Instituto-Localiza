-- 1)crie um indíce em orders (customer_id, dt_pedido) e explique quando ele será usado

CREATE INDEX idx_orders_customer_date
ON orders (customer_id, dt_pedido);

-- 3 Identifique consultas que podem ser reescritas usando CTE materializada para melhorar a performance
