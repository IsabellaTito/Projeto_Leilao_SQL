/*
  ==============================================================
  Descrição: Comando para inserção, atualização e remoções para
             simular atualizações no banco de dados.
  ==============================================================
*/

INSERT INSTITUICAO VALUES (7,"FACHADA","FAKE");
INSERT LEILAO VALUES (17,7,"2000-06-04","2000-12-11");
INSERT LOTE VALUES (3333,"Disponível",400,17,128);
INSERT LANCE VALUES (1111111,1000,"2025-02-02","12:03:01",3333,20211211);

UPDATE INSTITUICAO SET sigla="F" WHERE matricula = 7;
UPDATE LOTE SET situacao="Indisponível" WHERE id=3333;

UPDATE LOTE
SET preco_minimo=(SELECT MAX(valor) FROM LANCE WHERE id_lote=3333)
WHERE id=3333;

DELETE la
FROM LANCE la
JOIN LOTE lo ON la.id_lote = lo.id
WHERE lo.id = 3333;

DELETE lo
FROM LOTE lo
JOIN LEILAO le ON lo.codigo_leilao=le.codigo
WHERE le.codigo = 17;

DELETE le
FROM LEILAO le
JOIN INSTITUICAO ins ON ins.matricula = le.matric_instituicao
WHERE ins.matricula =7;

DELETE FROM INSTITUICAO WHERE matricula =7;
