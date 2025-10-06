-- 1 - Use CASE WHEN para classificar pedidos em: "Baixo" (<100), "Médio" (100-500), "Alto" (>500).
SELECT order_id, valor_total, status,
CASE
	WHEN valor_total < 100 THEN 'Baixo'
	WHEN valor_total >= 100 AND valor_total <= 500 THEN 'Médio'
	WHEN valor_total > 500 THEN 'Alto'
END AS  classificar_pedidos
FROM orders;

-- 2 Crie uma coluna calculada que mostre se o cliente está Ativo (pedido nos últimos 6 meses) ou Inativo.
SELECT 
    c.customer_id,
    c.nome,
    CASE 
        WHEN MAX(o.dt_pedido) >= DATE('now', '-6 months') THEN 'Ativo'
        ELSE 'Inativo'
    END AS status_cliente
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.nome;

-- 3 Em um relatório de pedidos, mostre NULL como "Sem valor informado". (Atribuidas a @amanda )
SELECT 
    o.order_id AS "ID do Pedido",
    COALESCE(c.nome, 'Sem valor informado') AS "Nome do Cliente",
    COALESCE(c.email, 'Sem valor informado') AS "E-mail",
    COALESCE(o.dt_pedido, 'Sem valor informado') AS "Data do Pedido",
    COALESCE(CAST(o.valor_total AS TEXT), 'Sem valor informado') AS "Valor Total",
    COALESCE(o.status, 'Sem valor informado') AS "Status"
FROM orders o
LEFT JOIN customers c ON o.customer_id = c.customer_id;