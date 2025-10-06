-- 1) Mostrar apenas o ano da data de cadastro dos clientes
SELECT 
	c.customer_id,
	c.nome,
	STRFTIME('%Y', c.dt_cadastro) AS ano_cadastro
FROM customers c;

-- 2) Calcular quantos dias se passaram desde o pedido
SELECT * FROM orders;
SELECT order_id AS order_num, dt_pedido, valor_total, status, 
ROUND(JULIANDAY(DATE('now')) - JULIANDAY(dt_pedido)) AS dias_passados_desde_pedido
FROM orders;

-- 3) Adicionar 7 dias à data do pedido (ex.: prazo de entrega)
SELECT
	o.order_id,
	o.dt_pedido,
	DATE(o.dt_pedido, '+7 days') AS prazo_de_entrega
FROM orders o;
