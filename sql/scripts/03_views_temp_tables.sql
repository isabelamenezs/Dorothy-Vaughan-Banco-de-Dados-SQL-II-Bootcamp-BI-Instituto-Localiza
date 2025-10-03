-- Questão 1) Crie uma View que mostre o faturamento diário consolidado.

CREATE VIEW faturamento_diario AS
SELECT 
    dt_pedido,
    SUM(valor_total) AS faturamento
FROM orders
WHERE status = 'Pago'
GROUP BY dt_pedido;

SELECT * FROM faturamento_diario;
