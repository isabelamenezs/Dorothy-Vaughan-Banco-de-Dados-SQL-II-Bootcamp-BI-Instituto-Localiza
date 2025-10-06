
-- 1) Manipulação de Strings e Conversão : Mostre apenas o domínio do e-mail dos clientes (parte depois do @).


-- 2) Converta o nome dos clientes para MAIÚSCULAS.


-- 3) Crie uma coluna calculada que concatene o nome do cliente com o ID do pedido (ex.: "João - Pedido 123")

SELECT 
    c.nome || ' - Pedido ' || o.order_id AS cliente_pedido
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id;
