-- Questão 1) Liste o valor médio gasto por cliente usando uma CTE para calcular o total de cada cliente.

WITH total_por_cliente AS (
  SELECT 
    c.customer_id,
    c.nome,
    SUM(o.valor_total) AS total_gasto,
    AVG(o.valor_total) AS valor_medio
  FROM customers c
  JOIN orders o ON c.customer_id = o.customer_id
  GROUP BY c.customer_id, c.nome
)
SELECT 
  nome, 
  total_gasto, 
  valor_medio
FROM total_por_cliente
ORDER BY total_gasto DESC;


-- 2. Use uma CTE recursiva para gerar uma sequência de datas (últimos 12 meses) e depois faça um LEFT JOIN com os pedidos para mostrar meses sem vendas.

WITH RECURSIVE ultimos_12m AS (
  SELECT DATE('now', 'start of month') AS mes 

  UNION ALL                                   

  SELECT DATE(mes, '-1 month')                 
  FROM ultimos_12m
  WHERE mes > DATE('now', '-11 months', 'start of month'))

SELECT 
	u.mes,
	COUNT(o.order_id) AS quant_pedidos
	FROM ultimos_12m u
	LEFT JOIN orders o ON STRFTIME('%Y-%m', o.dt_pedido) = STRFTIME('%Y-%m', u.mes)
GROUP BY u.mes;
