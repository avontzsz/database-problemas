--
-- RESPOSTA
--
-- RELATÓRIO: Extrair do banco de dados um relatório de fluxo de caixa.
--   Ref. da função NOW: https://www.postgresql.org/docs/10/functions-datetime.html
--

SELECT 
  la.data_lancamento, la.data_vencimento, la.parcela, la.total_parcelas, la.valor, la.descricao, la.situacao, 
  ca.nome AS categoria, 
  co.nome AS conta, co.agencia, co.conta_corrente, 
  cl.nome_empresarial AS cliente, fo.nome_empresarial AS fornecedor
FROM lancamento la
INNER JOIN conta co ON (la.id_conta = co.id)
INNER JOIN categoria ca ON (la.id_categoria = ca.id)
LEFT JOIN cliente cl ON (la.id_cliente = cl.id)
LEFT JOIN fornecedor fo ON (la.id_fornecedor = fo.id)
UNION
SELECT 
  NOW() AS data_lancamento, NULL AS data_vencimento, NULL AS parcela, NULL AS total_parcelas, SUM(valor) AS valor, NULL AS descricao, '' AS situacao,
  NULL AS categoria,
  NULL AS conta, NULL AS agencia, NULL AS conta_corrente, 
  NULL cliente, NULL AS fornecedor
FROM lancamento
ORDER BY data_lancamento