--
-- RESPOSTA
--
-- RELATÓRIO: Extrair do banco de dados um relatório de saldo por conta e geral.
--

-- Saldo geral
SELECT SUM(l.valor) AS saldo
FROM conta c
INNER JOIN lancamento l ON c.id = l.id_conta
WHERE l.situacao = 'PAGO'

-- Saldo por conta
SELECT c.nome, c.agencia, c.conta_corrente, SUM(l.valor) AS saldo
FROM conta c
INNER JOIN lancamento l ON c.id = l.id_conta
WHERE l.situacao = 'PAGO'
GROUP BY c.nome, c.agencia, c.conta_corrente
ORDER BY c.nome
