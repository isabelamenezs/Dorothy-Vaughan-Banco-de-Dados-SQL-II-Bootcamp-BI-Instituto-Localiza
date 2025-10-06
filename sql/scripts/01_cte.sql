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

SELECT 
    p.product_id,
    p.nome AS produto,
    p.categoria,
    CASE 
        WHEN COUNT(oi.order_item_id) > 0 THEN 'Vendido'
        ELSE 'Não vendido'
    END AS status_venda
FROM products p
LEFT JOIN order_items oi
    ON p.product_id = oi.product_id
GROUP BY p.product_id, p.nome, p.categoria
ORDER BY p.product_id;
