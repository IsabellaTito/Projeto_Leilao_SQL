/*
  ==============================================================
  Descrição: Consulta na base de dados simulando demandas reais
             de informações desejáveis.
  ==============================================================
*/

-- Consulta para mostrar as instituições cadastradas e os leilões
SELECT
ins.nome "Instituição",
le.codigo "Código"
FROM INSTITUICAO ins
LEFT JOIN LEILAO le ON ins.matricula = le.matric_instituicao;

-- Consulta para obter os lances válidos para o primeiro leilão, juntamente com todas as informações do leilão e do lance
SELECT
le.codigo "Leilão",
le.data_fim "Termino",
lo.preco_minimo "Mínimo",
la.data "Data",
la.hora "Hora",
la.valor "Valor do Lance",
co.nome "Comprador"
FROM LEILAO le
JOIN LOTE lo ON le.codigo = lo.codigo_leilao
JOIN LANCE la ON lo.id = la.id_lote
JOIN COMPRADOR co ON la.matric_comprador = co.matricula
WHERE le.codigo = 11
AND la.data <= le.data_fim
ORDER BY la.data, la.hora;

-- Consulta para mostrar o ganhador da primeiro leilão
SELECT
ins.sigla "Instituição",
le.codigo "Leilão",
le.data_fim "Termino",
la.data "Data do lance",
la.hora "Hora do lance",
la.valor "Valor do lance",
co.nome "Ganhador"
FROM INSTITUICAO ins
JOIN LEILAO le ON ins.matricula = le.matric_instituicao
JOIN LOTE lo ON le.codigo = lo.codigo_leilao
JOIN LANCE la ON lo.id = la.id_lote
JOIN COMPRADOR co ON co.matricula = la.matric_comprador
WHERE lo.id = 1111
AND la.valor IN (SELECT MAX(la.valor)
FROM LEILAO le
JOIN LOTE lo ON le.codigo = lo.codigo_leilao
JOIN LANCE la ON lo.id = la.id_lote
WHERE la.id_lote = 1111 AND la.data <= le.data_fim);

-- Consulta para obter todos as mercadorias do primeiro leilão
SELECT
ins.sigla "Instituicao",
le.codigo "Leilão",
me.nome "Produto",
me.quantidade "Quantidade",
me.recinto_armazenador
FROM INSTITUICAO ins
JOIN LEILAO le ON ins.matricula = le.matric_instituicao
JOIN LOTE lo ON le.codigo = lo.codigo_leilao
JOIN MERCADORIA me ON lo.id = me.id_lote
WHERE le.codigo = 11;

-- Consultas com valor médio dos lances por lote
SELECT
ins.sigla "Sigla da Institução",
le.codigo "Código do Leilão",
la.id_lote "Lote",
AVG(la.valor)"Valor médio dos Lances"
FROM INSTITUICAO ins
JOIN LEILAO le ON ins.matricula = le.matric_instituicao
JOIN LOTE lo ON lo.codigo_leilao=le.codigo
JOIN LANCE la ON la.id_lote=lo.id
GROUP BY la.id_lote;

-- Valores máximos e mínimos dos lances agrupados por lote
SELECT
ins.sigla "Sigla da Institução",
le.codigo "Código do Leilão",
la.id_lote "Lote",
MAX(la.valor) "Maior Lance",
MIN(la.valor) "Menor Lance"
FROM INSTITUICAO ins
JOIN LEILAO le ON ins.matricula = le.matric_instituicao
JOIN LOTE lo ON lo.codigo_leilao=le.codigo
JOIN LANCE la ON la.id_lote=lo.id
GROUP BY la.id_lote;

-- Total de lances em cada lote
SELECT
ins.sigla "Sigla da Institução",
le.codigo "Código do Leilão",
la.id_lote "Lote",
COUNT(la.valor)"Quant. de Lances"
FROM INSTITUICAO ins
JOIN LEILAO le ON ins.matricula = le.matric_instituicao
JOIN LOTE lo ON lo.codigo_leilao=le.codigo
JOIN LANCE la ON la.id_lote=lo.id
GROUP BY la.id_lote
ORDER BY COUNT(la.valor) DESC;

-- Consulta dos lotes que tiveram mais de cinco lances
SELECT
ins.sigla "Sigla da Institução",
le.codigo "Código do Leilão",
la.id_lote "Lote",
COUNT(la.valor) "Quant. de Lances"
FROM INSTITUICAO ins
JOIN LEILAO le ON ins.matricula = le.matric_instituicao
JOIN LOTE lo ON lo.codigo_leilao=le.codigo
JOIN LANCE la ON la.id_lote=lo.id
GROUP BY la.id_lote
HAVING COUNT(la.valor)>5
ORDER BY COUNT(la.valor)DESC;

-- Seleção em ordem decrescente da quantidade de lances por compradores
SELECT
co.nome "Comprador",
COUNT(*) "Quantidade de lances"
FROM COMPRADOR co
LEFT JOIN LANCE la ON la.matric_comprador = co.matricula
GROUP BY co.nome
ORDER BY COUNT(*) DESC;

-- Quantidade de mercadorias por leilão em ordem decrescente
SELECT
ins.sigla "Instituição",
le.codigo "Leilao",
SUM(me.quantidade) "Quantidade de mercadorias"
FROM INSTITUICAO ins
JOIN LEILAO le ON ins.matricula = le.matric_instituicao
JOIN LOTE lo ON le.codigo = lo.codigo_leilao
JOIN MERCADORIA me ON lo.id = me.id_lote
GROUP BY lo.id
ORDER BY 3 DESC;

-- Consulta para obter o ganhador do quarto leilão
SELECT
ins.nome "Instituição",
le.codigo "Leilão",
la.hora "Hora do lance",
la.valor "Valor do lance",
co.nome "Ganhador"
FROM INSTITUICAO ins
JOIN LEILAO le ON ins.matricula = le.matric_instituicao
JOIN LOTE lo ON le.codigo = lo.codigo_leilao
JOIN LANCE la ON lo.id = la.id_lote
JOIN COMPRADOR co ON la.matric_comprador = co.matricula
WHERE la.valor IN (SELECT MAX(la.valor)
FROM LANCE la WHERE la.id_lote = 1722);

-- Apresentação de todos os tipos de lotes incluindo os que não tem nenhum lote associado
SELECT
ti.nome "Tipo do lote",
COUNT(lo.id) "Quant. de lotes"
FROM TIPO ti
LEFT JOIN LOTE lo ON ti.id = lo.id_tipo
GROUP BY ti.nome
HAVING COUNT(lo.id) = 0;

-- Consulta dos leilões ativos na data 06/03/2025
SELECT ins.nome "Instituicao",
le.codigo "Leilão",
lo.id "Lote Leiloado",
le.data_inicio"Data de início",
le.data_fim "Data de Fim"
FROM INSTITUICAO ins
JOIN LEILAO le ON ins.matricula = le.matric_instituicao
JOIN LOTE lo ON lo.codigo_leilao = le.codigo
WHERE le.data_fim>"2025-03-06";

-- Leilões ocorridos entre 2021 e 2025
SELECT
YEAR(data_fim)"Ano",
COUNT(*)"Quant. Leilões"
FROM LEILAO
WHERE YEAR(data_fim)
BETWEEN "2021" AND "2025"
GROUP BY YEAR(data_fim);
