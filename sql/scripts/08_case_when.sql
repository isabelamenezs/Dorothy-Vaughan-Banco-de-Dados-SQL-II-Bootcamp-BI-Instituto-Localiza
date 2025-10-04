-- 1 - Use CASE WHEN para classificar pedidos em: "Baixo" (<100), "Médio" (100-500), "Alto" (>500).
SELECT order_id, valor_total, status,
CASE
	WHEN valor_total < 100 THEN 'Baixo'
	WHEN valor_total >= 100 AND valor_total <= 500 THEN 'Médio'
	WHEN valor_total > 500 THEN 'Alto'
END AS  classificar_pedidos
FROM orders;

-- 2

-- 3