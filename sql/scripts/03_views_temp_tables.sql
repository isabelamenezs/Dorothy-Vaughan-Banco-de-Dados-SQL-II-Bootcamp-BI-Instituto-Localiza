-- Questão 1) Crie uma View que mostre o faturamento diário consolidado.

CREATE VIEW faturamento_diario AS
SELECT 
    dt_pedido,
    SUM(valor_total) AS faturamento
FROM orders
WHERE status = 'Pago'
GROUP BY dt_pedido;

SELECT * FROM faturamento_diario;

-- Questão 2) Crie uma Tabela temporária com os clientes que fizeram compras nos últimos 30 dias.

DROP TABLE IF EXISTS clientes_ultimos_30dias;

CREATE TEMP TABLE clientes_ultimos_30dias AS
SELECT DISTINCT c.customer_id,
       c.nome
FROM customers c
JOIN orders o 
     ON c.customer_id = o.customer_id
WHERE o.dt_pedido >= DATE('now', '-30 days');

SELECT * FROM clientes_ultimos_30dias;
