CCREATE TABLE IF NOT EXISTS
	kopas(
	id       BIGSERIAL     PRIMARY KEY,
	selecao  VARCHAR(128)  UNIQUE NOT null,
	qnt_copas int
);

INSERT INTO
	kopas (selecao, qnt_copas)
VALUES
	('Brasil',5),
	('Alemanha',5),
	('Itália',4),
	('Argentina',2),
	('França',2),
	('Uruguai',2),
	('Inglaterra',1),
	('Espanha',1),
	('Japão',1);


SELECT selecao, qnt_copas
FROM kopas ;


UPDATE kopas SET qnt_copas = 4 WHERE selecao  = 'Alemanha';

DELETE FROM kopas WHERE selecao = 'Japão';

SELECT * FROM kopas;


ALTER TABLE kopas ADD COLUMN pts int;

-------------------------OPÇÃO COM USO DO CASE
--UPDATE kopas
--SET pts = (
--CASE
--	WHEN selecao = 'Brasil' THEN 237
--	WHEN selecao = 'Alemanha' THEN 221
--	WHEN selecao = 'Itália' THEN 156
--	WHEN selecao = 'Argentina' THEN 144
--	WHEN selecao = 'França' THEN 115
--	WHEN selecao = 'Uruguai' THEN 84
--	WHEN selecao = 'Inglaterra' THEN 108
--	WHEN selecao = 'Espanha' THEN 105
--	END );

CREATE TABLE IF NOT EXISTS 
points (id  BIGSERIAL PRIMARY KEY, selecao VARCHAR(128) UNIQUE NOT NULL, pts int);

INSERT INTO points (selecao, pts)
VALUES
('Brasil',237),
('Alemanha',221),
('Itália',156),
('Argentina',144),
('França',115),
('Uruguai',84),
('Inglaterra',108),
('Espanha',105);

UPDATE kopas k
SET pts = 
(SELECT pts FROM points WHERE k.selecao = points.selecao);

-------------------------OPÇÃO COM USO INDIVIDUAL DOS DADOS
--UPDATE kopas k SET pts = 237 WHERE selecao = 'Brasil';
--UPDATE kopas k SET pts = 221 WHERE selecao = 'Alemanha';
--UPDATE kopas k SET pts = 156 WHERE selecao = 'Itália';
--UPDATE kopas k SET pts = 144 WHERE selecao = 'Argentina';
--UPDATE kopas k SET pts = 115 WHERE selecao = 'França';
--UPDATE kopas k SET pts = 84 WHERE selecao = 'Uruguai';
--UPDATE kopas k SET pts = 108 WHERE selecao = 'Inglaterra';
--UPDATE kopas k SET pts = 105 WHERE selecao = 'Espanha';

DROP TABLE points;

SELECT * FROM kopas;
