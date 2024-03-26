-- ========== CRIANDO E INSERINDO VALORES NAS TABELAS ============

CREATE TABLE tbl_animais (
  Id	INTEGER PRIMARY KEY AUTOINCREMENT,
  Nome	VARCHAR(50),
  Nasc	DATE,
  Peso	DECIMAL,
  Cor	VARCHAR(50),
  Id_Especie INTEGER,
  FOREIGN KEY (Id_Especie) REFERENCEs tbl_especies (Id)
);
SELECT * FROM tbl_animais;
DROP TABLE tbl_animais;

CREATE TABLE tbl_especies (
  Id		INTEGER PRIMARY KEY AUTOINCREMENT,
  Nome		VARCHAR(50),
  Descricao	LONGTEXT
);
SELECT * FROM tbl_especies;
DROP TABLE tbl_especies;

SELECT * FROM tbl_animais LEFT JOIN tbl_especies WHERE tbl_animais.Id_Especie = tbl_especies.Id;

INSERT INTO tbl_animais (Nome, Nasc, Peso, Cor, Id_Especie) VALUES
('Ágata', 			'2015-04-09', 	13.9, 	'Branco',	'1'), 
('Félix', 			'2016-06-06', 	14.3, 	'Preto',	'2'), 
('Tom', 			'2013-02-08', 	11.2, 	'Azul',		'3'), 
('Garfield', 		'2015-07-06', 	17.1, 	'Laranja',	'1'),
('Frajola', 		'2013-08-01', 	13.7, 	'Preto',	'3'),
('Manda-Chuva',		'2012-02-03', 	12.3, 	'Amarelo',	'2'),
('Snowball', 		'2014-04-06', 	13.2, 	'Preto',	'1'),
('Azulão', 			'2015-08-03', 	11.9, 	'Azul',		'2'),
('Gato de Botas', 	'2012-12-10', 	11.6, 	'Amarelo',	'3'),
('Kitty', 			'2020-04-06', 	11.6, 	'Amarelo',	'3'),
('Milu', 			'2013-02-04', 	17.9, 	'Branco',	'1'),
('Pluto', 			'2012-01-03', 	12.3, 	'Amarelo',	'2'),
('Pateta', 			'2015-05-01', 	17.7, 	'Preto',	'1'),
('Snoopy', 			'2013-07-02', 	18.2, 	'Branco',	'3'),
('Rex', 			'2019-11-03', 	19.7, 	'Beje',		'2'),
('Bidu', 			'2012-09-08', 	12.4, 	'Azul',		'2'),
('Dum Dum', 		'2015-04-06', 	11.2, 	'Laranja',	'1'),
('Muttley', 		'2011-02-03', 	14.3, 	'Laranja',	'3'),
('Scooby', 			'2012-01-02', 	19.9, 	'Marrom',	'1'),
('Rufus', 			'2014-04-05', 	19.7, 	'Branco',	'2'),
('Rex', 			'2021-08-19', 	19.7, 	'Branco',	'1');

INSERT INTO tbl_especies (Nome, Descricao) VALUES
("Cachorro",	"[Texto descritivo para cachorro]"),
("Gato", 		"[Texto descritivo para gato]"),
("Coelho", 		"[Texto descritivo para coelho]");

-- ========== TAREFA DE MANIPULAÇÃO ============

-- ALTERANDO O NOME DE PATETA PARA GOOFY
UPDATE tbl_animais SET Nome = "Goofy" WHERE Nome = "Pateta";

-- ALTERANDO O PESO DE GARFIELD PARA 10
UPDATE tbl_animais SET Peso = 10 WHERE Nome = "Garfield";

-- ALTERANDO A COR DE TODOS OS GATOS PARA LARANJA
UPDATE tbl_animais SET Cor = "Laranja" WHERE Id_Especie = "2";

-- CRIANDO O CAMPO 'ALTURA'
ALTER TABLE tbl_animais ADD COLUMN Altura DECIMAL;

-- CRIANDO UM CAMPO 'OBSERVAÇÃO'
ALTER TABLE tbl_animais ADD COLUMN Observacao LONGTEXT;

-- REMOVENDO TODOS OS ANIMAIS COM PESO SUPERIOR À 200
DELETE FROM tbl_animais WHERE Peso > 200;

-- REMOVENDO TODOS OS ANIMAIS CUJO NOME COMECE COM 'C'
DELETE FROM tbl_animais WHERE Nome LIKE 'C%';

-- REMOVENDO O CAMPO COR
ALTER TABLE tbl_animais DROP COLUMN Cor;

-- AUMENTANDO O ESPAÇO DE ARMAZENAMENTO DE 'NOME' PARA 80 CARACTERES
ALTER TABLE tbl_animais MODIFY Nome VARCHAR(80);

-- REMOVENDO TODOS OS GATOS E CACHORROS
DELETE FROM tbl_animais WHERE Id_Especie = "2" OR Id_Especie = "1";

-- REMOVENDO O CAMPO 'DATA DE NASCIMENTO'
ALTER TABLE tbl_animais DROP COLUMN Nasc;

-- REMOVENDO TODOS OS ANIMAIS
DELETE FROM tbl_animais;

-- REMOVENDO A TABELA 'ESPÉCIES'
DROP TABLE tbl_especies;

-- ========== TAREFA DE CONSULTA ============

-- SELECIONANDO TODOS OS ANIMAIS
SELECT * FROM tbl_animais;

-- SELECIONANDO TODOS OS ANIMAIS CUJO PESO SEJA MENOR QUE 13.1
SELECT * FROM tbl_animais WHERE Peso < 13.1;

-- SELECIONANDO TODOS OS ANIMAIS QUE NASCERAM ENTRE FEVEREIRO E DEZEMBTRO DE 2015
SELECT * FROM tbl_animais WHERE Nasc BETWEEN '2015-02-00' AND '2015-12-31';

-- SELECIONANDO TODOS OS ANIMAIS BRANCOS CUJO PESO SEJA MENOR QUE 15
SELECT * FROM tbl_animais WHERE Cor = 'Branco' AND Peso < 15.0;

-- SELECIONANDO NOME, COR E PESO DE TODOS OS ANIMAIS CUJO NOME COMECE COM 'B'
SELECT Nome, Cor, Peso FROM tbl_animais WHERE Nome LIKE 'B%';

-- SELECIONANDO NOME, COR E PESO DE TODOS OS ANIMAIS COM COR VERMELHA, AMARELA, MARROM OU LARANJA
SELECT Nome, Cor, Peso FROM tbl_animais WHERE Cor IN ('Vermelho', 'Amarelo', 'Marrom', 'Laranja');

-- SELECIONANDO NOME, COR, DATA DE NASCIMENTO E PESO DE TODOS OS ANIMAIS ORDENANDO POR IDADE
SELECT Nome, Cor, Nasc, Peso FROM tbl_animais ORDER BY Nasc;

-- SELECIONANDO TODOS OS ANIMAIS CUJO NOME INICIE COM 'C' E NÃO SEJAM BRANCOS
SELECT * FROM tbl_animais WHERE Nome LIKE 'C%' AND not Cor = 'Branco';

-- SELECIONANDO TODOS OS ANIMAIS CUJO NOME CONTENHA 'BA'
SELECT * FROM tbl_animais WHERE Nome LIKE '%ba%';

-- SELECIONANDO TODOS OS ANIMAIS CUJO PESO ESTEJA ENTRE 13 E 15
SELECT * FROM tbl_animais WHERE Peso BETWEEN 13 AND 15;

-- SELECIONANDO TODOS OS ANIMAIS CUJO O PESO NÃO SEJA MAIOR QUE 30, CUJA COR SEJA AMARELO OU ROXO E QUE NASCERAM DEPOIS DE 2012
SELECT * FROM tbl_animais WHERE Peso <= 30 AND Cor in ('Amarelo', 'Roxo') AND Nasc > '2012-00-00';

-- SELECIONANDO TODOS OS CAPRICORNIANOS (QUEM NASCEU ENTRE 22 DE DEZEMBRO E 19 DE JANEIRO)
SELECT * FROM tbl_animais WHERE 
CAST(STRFTIME('%m', Nasc) AS INT) = 12 AND CAST(STRFTIME('%e', Nasc) AS INT) >= 22
OR CAST(STRFTIME('%m', Nasc) AS INT) = 1 AND CAST(STRFTIME('%e', Nasc) AS INT) <= 19;

-- SELECIONANDO TODOS OS ANIMAIS FORMADOS POR MAIS DE UMA PALAVRA (QUE POSSUEM UM ESPAÇO EM BRANCO)
SELECT * FROM tbl_animais WHERE Nome LIKE '% %';

/* ENUNCIADO DE CONSULTA DE SQL
- Selecione todos os animais
- Selecione todos os animais que pesam menos que 13.1
- Selecione todos nasceram entre fevereiro e dezembro de 2015
- Selecione todos os animais brancos que pesam menos que 15.0
- Selecione nome, cor e peso de todos cujo nome comece com ’B’
- Selecione nome, cor e peso de todos com cor vermelha, amarela, marrom e laranja
- Selecione nome, cor, data de nascimento e peso de todos ordenados pelos mais jovens
- Selecione todos os animais cujo nome comece com 'C' e não sejam brancos
- Selecione todos os animais cujo nome contenha 'ba'
- Selecione todos os animais com peso entre 13.0 à 15.0
- Selecione todos os animais que o peso não seja maior que 30, com cor amarelo ou roxo e nascidos depois de 2012
- (Desafio) Selecione todos os capricornianos
- (Desafio) Selecione todos os animais com nome formado por mais de uma palavra.
*/

/* ENUNCIADO DE MANIPULAÇÃO DE SQL
- Altere o nome do Pateta para Goofy;
- Altere o peso do Garfield para 10 quilogramas;
- Altere a cor de todos os gatos para laranja;
- Crie um campo altura para os animais;
- Crie um campo observação para os animais;
- Remova todos os animais que pesam mais que 200 quilogramas.
- Remova todos os animais que o nome inicie com a letra ‘C’.
- Remova o campo cor dos animais;
- Aumente o tamanho do campo nome dos animais para 80 caracteres;
- Remova todos os gatos e cachorros.
- Remova o campo data de nascimento dos animais.
- Remova todos os animais.
- Remova a tabela especies.
*/