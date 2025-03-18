/*
  ==============================================================
  Descrição: Povoando as tabelas da base de dados, com 
             informações representando situações reais.
  ==============================================================
*/

-- Povoando a tabela de INSTITUIÇÃO
INSERT INTO INSTITUICAO VALUES
	(1,"Receita Federal", "RF"),
	(2,"Departamento Estadual de Transito","DETRAN-PB"),
	(3,"Leilões Imobiliários", "LI"),
	(4,"Matheus Importes", "MI"),
	(5,"La Bella Jóias","LBJ"),
	(6, "The Right Wine", "TRW");
	
-- Criando Leilões para povoar a tabela LEILÃO
INSERT INTO LEILAO VALUES
	(11,2,"2025-01-15","2025-01-31"),
	(12,3,"2025-02-01","2025-03-21"),
	(13,1,"2024-06-01","2024-12-01"),
	(14,5,"2022-04-05","2022-05-10"),
	(15,4,"2024-12-23","2024-12-24"),
	(16,4,"2025-03-05", "2025-03-12");
	
--Criação dos tipos de lotes
INSERT INTO TIPO VALUES
	(123,"Automóvel","Carros novos, seminovos ou apreendidos"),
	(124,"Imóvel","Casas e apartamentos, novos ou penhorados"),
	(125,"Vestuário","Roupas novas ou apreendidas"),
	(126,"Informática","Produtos eletrônicos novos, importados ou confiscados"),
	(127,"Jóias",NULL),
	(128, "Diversos", NULL),
	(129, "Instrumento Musical",NULL);

--Inserindo lotes
INSERT INTO LOTE VALUES
	(1111,"Disponível",50000,11,123),
	(1234,"Disponível",435000,12,124),
	(1321,"Disponível",25000,13,125),
	(1587,"Disponível",42000,14,127),
	(1722,"Disponível",12000,15,126),
	(1652,"Disponível", 980, 16, 126);
	
-- Criando mercadorias para os lotes
INSERT MERCADORIA VALUES
	(12345,"Camaro","Camaro na cor amarela, seminovo do ex-governador
	Chacal do Agreste apreendido", 1, "Pátio DETRAN-PB", 1111),
	(12346,"Jaguar","Jaguar na cor preta, seminovo do ex-governador
	Chacal do Agreste apreendido", 1, "Pátio DETRAN-PB", 1111),
	(14628,"Apartamento Duplex", "Apartamento de reintegração de posse
	localizado na orla de Cabo Branco na cidade de João Pessoa",1,
	"João Pessoa", 1234),
	(15333,"Blusas","Blusas apreendidas durante fiscalização em lojas
	do Recife",500,"Galpão PF", 1321),
	(15334,"Calçados","Calçados apreendidos no aeroporto
	internacional de Recife",230,"Galpão PF",1321),
	(15335,"Agasalhos","Moletons e casacos de pele apreendidos",
	30,"Galpão PF",1321),
	(16978,"Colar","Pingente oval em Ouro Branco 18k
	com Esmeralda e Diamantes",2,"La Bella",1587),
	(16979,"Brinco","Brinco Lustre em Ouro Branco 18k com
	Água Marinha e Diamantes",4,"La Bella",1587),
	(16980,"Anel","Anel solitário em ouro Fiore",1,"La Bella",1587),
	(17329,"PS5","PS5 com um controle e dois jogos originais",
	2,"Lojão MI",1722),
	(17381,"XBOX Series X","XBOX Series X novo com 2 controles
	e 3 meses de Gamepass Ultimate",1,
	"Lojão MI",1722),
	(13568, "Hoverboard", "Skate Elétrico de origem chinesa",1,
	"Lojão MI",1652),
	(13569, "Hoverboard LED", "Skate Elétrico com LED Bluethooth
	de origem Chinesa", 2, "Lojão MI", 1652);

-- Criação de compradores para que possam fazer os lances
INSERT INTO COMPRADOR VALUES
	(20211211,"Leôncio Wally","14.258-123","PB","123.321.444-12",NULL, "Física"),
	(20240602,"Raven Baxter","58.269-452","BA","342.913.534-02",NULL, "Física"),
	(20250219,"Máquina Mistério","21.111-122","SP",NULL,"12.465.137/0001-48", "Jurídica"),
	(20220504,"Comercio e CIA","71.222-333","AC",NULL,"11.555.222/0001-32", "Jurídica"),
	(20151015,"Irmão do Jorel","41.777-111","RJ","777.888.999-10",NULL, "Física");
	(20230725,"Kakashi Hatake", "32.252-154","SP","469.333.778-01",NULL, "Física"),
	(20230922,"Harvest Moon Farm","11.555-485","PE",NULL,"22.654.879/0001-55","Jurídica");
	
-- Povoando a tabela CONTATO
INSERT CONTATO VALUES
	(20211211,"(83)93456-1111"),
	(20240602,"(71)93578-9541"),
	(20250219,"(11)2434-1015"),
	(20220504,"(68)8657-2222"),
	(20151015,"(24)94258-7799"),
	(20211211,"(83)98888-3333"),
	(20230725,"(11)93524-8857"),
	(20230922,"(81)2546-9999");
	
-- POVOANDO A TABELA DE LANCES
-- Lances para arremate do primeiro lote
INSERT INTO LANCE VALUES
	(1234567,63000,"2025-01-17","20:30:05",1111,20211211),
	(1234568,70000,"2025-01-18","10:15:52",1111,20151015),
	(1234569,100000,"2025-01-22","22:01:15",1111,20240602),
	(1234570,120000,"2025-01-25","20:40:00",1111,20211211),
	(1234571,150000,"2025-01-31","15:22:44",1111,20151015),
	(1234572,160000,"2025-02-01","00:05:02",1111,20211211);

-- Lances para arrematar o segundo lote
INSERT INTO LANCE VALUES
	(2578999,440000,"2025-02-06","17:37:19",1234,20240602),
	(2579000,436000,"2025-02-16","09:26:04",1234,20211211),
	(2579001,510000,"2025-02-22","12:42:44",1234,20240602),
	(2579002,580000,"2025-03-01","08:55:22",1234,20250219),
	(2579003,550000,"2025-03-01","16:49:02",1234,20240602);

-- Lances para arremate do terceiro lote
INSERT LANCE VALUE
	(3654121,45000,"2022-04-10","08:45:27",1587,20220504),
	(3654122,55000,"2022-04-25","11:14:03",1587,20211211),
	(3654123,50000,"2022-04-28","21:46:44",1587,20151015);
	
-- Lances para arrematar o quarto lote
INSERT LANCE VALUES
	(4785123,20000,"2024-06-02","10:15:04",1321,20220504),
	(4785124,28000,"2024-06-02","10:40:15",1321,20220504),
	(4785125,26000,"2024-06-03","16:33:47",1321,20211211),
	(4785126,30000,"2024-08-10","18:52:44",1321,20151015),
	(4785127,32000,"2024-09-22","07:24:33",1321,20211211),
	(4785128,36500,"2024-11-16","13:27:02",1321,20220504);

-- Lances para arremate do quinto lote
INSERT INTO LANCE VALUES
	(5432111,12500,"2024-12-23","00:01:30",1722,20151015),
	(5432113,12600,"2024-12-23","03:00:30",1722,20211211),
	(5432114,12700,"2024-12-23","05:10:30",1722,20151015),
	(5432115,13000,"2024-12-23","10:32:30",1722,20240602),
	(5432116,13500,"2024-12-23","18:25:12",1722,20151015),
	(5432117,13700,"2024-12-23","22:10:12",1722,20211211),
	(5432118,13200,"2024-12-23","22:25:21",1722,20151015),
	(5432119,14000,"2024-12-23","23:35:12",1722,20211211),
	(5432120,14100,"2024-12-23","23:30:52",1722,20240602);

-- Lances para arrematar o sexto lote
INSERT INTO LANCE VALUES
	(6001235,1000,"2025-03-06","15:37:06",1652,20250219),
	(6001236,1300,"2025-03-06","17:24:16",1652,20151015),
	(6001237,1200,"2025-03-07","09:15:22",1652,20211211),
	(6001238,1250,"2025-03-10","11:13:54",1652,20250219);
