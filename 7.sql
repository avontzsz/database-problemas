--
-- RESPOSTA
--
-- RELATÓRIO: Extrair do banco de dados um relatório dos maiores clientes devedores e pagadores.
-- 

-- Devedores
SELECT 
  SUM(la.valor) AS total,
  cl.nome_empresarial AS cliente
FROM lancamento la
INNER JOIN cliente cl ON (la.id_cliente = cl.id)
WHERE la.situacao = 'PENDENTE'
AND la.data_vencimento >= NOW()
GROUP BY cliente
ORDER BY total DESC

-- Pagadores
SELECT 
  SUM(la.valor) AS total
  cl.nome_empresarial AS cliente
FROM lancamento la
INNER JOIN cliente cl ON (la.id_cliente = cl.id)
WHERE la.situacao = 'PAGO'
GROUP BY cliente
ORDER BY total DESC