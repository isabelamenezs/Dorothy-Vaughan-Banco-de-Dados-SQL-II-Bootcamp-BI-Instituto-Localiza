--1)Para cada cliente, mostre o valor do pedido e o rank dos pedidos (maior → menor).



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
