-- 1. Liste todos os produtos e indique se foram ou não vendidos (LEFT JOIN).
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

-- Questão 2) Traga os clientes que compraram todos os produtos de uma categoria (pode usar NOT EXISTS). 
SELECT c.customer_id, c.nome
FROM customers c
WHERE NOT EXISTS (
    SELECT 1
    FROM products p
    WHERE p.categoria = 'Casa'
      AND NOT EXISTS (
          SELECT 1
          FROM orders o
          JOIN order_items oi ON o.order_id = oi.order_id
          WHERE o.customer_id = c.customer_id
            AND oi.product_id = p.product_id
      )
);
-- Questão 3) Monte um relatório de clientes que compraram um produto, mas nunca outro (ex.: compraram da categoria "Eletrônicos", mas nunca da categoria "Roupas")
-- A ideia é aqui é fazer especificamente para roupas vs eletronicos, no qual a gente exclui todos que estão com a categoria roupas.
SELECT DISTINCT
c.nome
FROM customers c 
JOIN orders o ON c.customer_id = o.customer_id 
JOIN order_items oi ON o.order_id = oi.order_id 
JOIN products p ON oi.product_id = p.product_id
WHERE o.status = 'Pago'
	AND p.categoria = 'Eletrônicos'
	AND c.customer_id NOT IN (
	SELECT DISTINCT
	c2.customer_id 
	FROM customers c2 
		JOIN orders o2 ON c2.customer_id = o2.customer_id 
		JOIN order_items oi2 ON o2.order_id = oi2.order_id 
		JOIN products p2 ON oi2.product_id = p2.product_id
		WHERE o2.status = 'Pago'
		AND p2.categoria = 'Roupas');
