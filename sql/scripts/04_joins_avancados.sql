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
