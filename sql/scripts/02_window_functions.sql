--1)Para cada cliente, mostre o valor do pedido e o rank dos pedidos (maior → menor).
SELECT 
    c.nome AS nome_cliente,
    o.valor_total AS valor_pedido,
    RANK() OVER (ORDER BY o.valor_total DESC) AS rank_pedido
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id;

--2)Media movel de 3 pedidos para cada cliente
SELECT
	customer_id,
	order_id,
	dt_pedido,
	valor_total,
	ROUND(AVG(valor_total) OVER (
	PARTITION BY customer_id
	ORDER BY dt_pedido
	ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
	), 2
	) AS media_dos_ultimos_3_pedidos
FROM orders;

--3) Mostre o valor do primeiro e do último pedido de cada cliente usando FIRST_VALUE e LAST_VALUE

SELECT 
    c.nome AS cliente,
    o.order_id,
    o.dt_pedido,
    o.valor_total,
    FIRST_VALUE(o.valor_total) OVER (
        PARTITION BY c.customer_id 
        ORDER BY o.dt_pedido ASC
    ) AS primeiro_pedido,
    LAST_VALUE(o.valor_total) OVER (
        PARTITION BY c.customer_id 
        ORDER BY o.dt_pedido ASC
        ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
    ) AS ultimo_pedido
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
ORDER BY c.nome, o.dt_pedido;
