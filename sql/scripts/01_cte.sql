-- Questão 1) Liste o valor médio gasto por cliente usando uma CTE para calcular o total de cada cliente.

WITH total_por_cliente AS (
  SELECT c.customer_id,
         c.nome,
         SUM(o.valor_total) AS total_gasto
  FROM customers c
  JOIN orders o ON c.customer_id = o.customer_id
  GROUP BY c.customer_id, c.nome
)
SELECT nome, total_gasto
FROM total_por_cliente
ORDER BY total_gasto DESC;
