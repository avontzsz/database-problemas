--
-- RESPOSTA
--
-- RELATÓRIO: Extrair do banco de dados um relatório de gastos por categoria.
--

SELECT c.nome, SUM(l.valor) AS saldo
FROM categoria c
INNER JOIN lancamento l ON c.id = l.id_categoria
GROUP BY c.nome
ORDER BY c.nome