-- 1

-- 2 - Calcular quantos dias se passaram desde o pedido
SELECT * FROM orders;
SELECT order_id AS order_num, dt_pedido, valor_total, status, 
ROUND(JULIANDAY(DATE('now')) - JULIANDAY(dt_pedido)) AS dias_passados_desde_pedido
FROM orders;

-- 3
