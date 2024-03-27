--
-- RESPOSTA
--
-- RELATÓRIO: Extrair do banco de dados um relatório de Clientes VIP vs Normais.
--   Um cliente "normal" possui uma nota de 0 à 3 e um cliente VIP de 4 à 5.
--

SELECT 'Normal' AS categoria, nome_empresarial, cnpj, nota, telefone, email, endereco, complemento, bairro, cidade, estado, cep
FROM cliente
WHERE situacao = 'ATIVO' AND nota <= 3
UNION
SELECT 'VIP' AS categoria, nome_empresarial, cnpj, nota, telefone, email, endereco, complemento, bairro, cidade, estado, cep
FROM cliente
WHERE situacao = 'ATIVO' AND nota > 3
ORDER BY nota DESC, nome_empresarial