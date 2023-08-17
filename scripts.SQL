CREATE DATABASE first_database;

/* cria segunda database */
CREATE DATABASE second_database;

/* conecta a second_database */
\c second_database;

/* cria first_table */
CREATE TABLE first_table();

/* cria second_table */
CREATE TABLE second_table();

/* vê mais detalhes sobre a tabela */
\d second_database

/* CRIA UMA COLUNA CHAMADA first_column DO TIPO INT */
ALTER TABLE second_table ADD COLUMN first_column INT; 

/* cria uma coluna chamada id do tipo INT */
ALTER TABLE second_table ADD COLUMN id INT;

/* cria uma coluna chamada age do tipo int */
ALTER TABLE second_table ADD COLUMN age INT;

/* remove a coluna age */
ALTER TABLE second_table DROP COLUMN age;

/* remove first_column */
ALTER TABLE second_table DROP COLUMN first_column;

/* adiciona uma coluna com nome "name" do tipo varchar(30) */
ALTER TABLE second_table ADD COLUMN name VARCHAR(30);

/* troca o nome da coluna "name" para "username" */
ALTER TABLE second_table RENAME COLUMN name TO username;

/* insere valor de id e username em second_table */
INSERT INTO second_table(id, username) VALUES(1, 'Samus');

/* mostra os valores de uma tabela */
SELECT * FROM second_table;

/* insere valor de id 2 e username Mario em second_table */
INSERT INTO second_table(id, username) VALUES(2, 'Mario');

/* insere valor de id 3 e username Luigi em second_table */
INSERT INTO second_table(id, username) VALUES(3, 'Luigi');

/* deleta luigi da tabela second_table */
DELETE FROM second_table WHERE username='Luigi';

/* deleta Mario da tabela second_table */
DELETE FROM second_table WHERE username='Mario';

/* deleta Samus da tabela second_table */
DELETE FROM second_table WHERE username='Samus';

/* deleta a coluna username da tabela second_table */
ALTER TABLE second_table DROP COLUMN username;

/* deleta a coluna id da tabela second_table */
ALTER TABLE second_table DROP COLUMN id;

/* deleta a tabela second_table */
DROP TABLE second_table;

/* deleta a tabela first_table */
DROP TABLE first_table;

/* renomeia o primeiro banco de dados */
ALTER DATABASE first_database RENAME TO mario_database;

/* conecta a mario_database */
\c mario_database

/* deleta o segundo banco de dados */
DROP DATABASE second_database;

/* cria a tabela characters */
CREATE TABLE characters();

/* adiciona a tabela characters uma coluna id do tipo SERIAL */
ALTER TABLE characters ADD COLUMN character_id SERIAL;

/* adiciona a tabela characters uma coluna chamada name do tipo VARCHAR(30)
E NOT NULL
 */
ALTER TABLE characters ADD COLUMN name VARCHAR(30) NOT NULL;

/* adiciona a tabela characters uma coluna chamada homeland
 do tipo VARCHAR(60) */
ALTER TABLE characters ADD COLUMN homeland VARCHAR(60);

/* adiciona a tabela characters uma coluna chamada color
 do tipo VARCHAR(30) */
ALTER TABLE characters ADD COLUMN favorite_color VARCHAR(30);

/* insere dados do Mario */
INSERT INTO characters(name, homeland, favorite_color) VALUES ('Mario', 'Mushroom Kingdom', 'Red');

/* confere os valores da tabela */
SELECT * FROM characters;

/* insere dados do Luigi */
INSERT INTO characters(name, homeland, favorite_color) VALUES ('Luigi', 'Mushroom Kingdom', 'Green');

/* insere dados da Peach */
INSERT INTO characters(name, homeland, favorite_color) VALUES ('Peach', 'Mushroom Kingdom', 'Pink');

/* como eu poderia inserir mais de uma linha por vez */
INSERT INTO characters(name, homeland, favorite_color)
VALUES('Mario', 'Mushroom Kingdom', 'Red'),
('Luigi', 'Mushroom Kingdom', 'Green'),
('Peach', 'Mushroom Kingdom', 'Pink');

/* insere dois registros, Toadstool e Bowser*/
INSERT INTO characters(name, homeland, favorite_color)
VALUES
('Toadstool', 'Mushroom Kingdom', 'Red'),
('Bowser', 'Mushroom Kingdom', 'Green');

/* insere dois registros, Daisy e Yoshi */
INSERT INTO characters(name, homeland, favorite_color)
VALUES
('Daisy', 'Sarasaland', 'Yellow'),
('Yoshi', 'Dinosaur Land', 'Green');

/* atualiza valor da coluna favorite_color da Daisy */
UPDATE characters SET favorite_color='Orange'
WHERE name='Daisy';

/* atualizar o nome toadstool para toad */
UPDATE characters SET name='Toad' WHERE favorite_color='Red';

/* atualizou 2, erradamente ... porque tinha mais de um registro 
com favorite_color='Red'
*/

/* atualizar o "Toad" para "Mario" novamente, mas colocando a condicao
character_id=1
*/
UPDATE characters SET name='Mario'
WHERE character_id=1;

/* atualiza cor favorita de tod para Blue */
UPDATE characters SET favorite_color='Blue' WHERE character_id=4;

/* atualiza a favorite_color de bowser */
UPDATE characters SET favorite_color='Yellow'
WHERE character_id=5; 

/* atualiza homeland do bowser */
UPDATE characters SET homeland='Koopa Kingdom' WHERE character_id=5;

/* projeta a tabela de forma ordenada 'por coluna' */
SELECT * FROM characters ORDER BY character_id;

/* coloca primary key em name 
isso adiciona a CONSTRAINT characters_pkey
*/
ALTER TABLE characters ADD PRIMARY KEY(name);

/* deletar a CONSTRAINT characters_pkey  */
ALTER TABLE characters
DROP CONSTRAINT characters_pkey;

/* Adiciona character_id como PRIMARY KEY */
ALTER TABLE characters
ADD PRIMARY KEY(character_id);

/* cria uma nova tabela chamada more_info */
CREATE TABLE more_info();

/* cria uma coluna chamada more_info_id em more_info */
ALTER TABLE more_info ADD COLUMN more_info_id SERIAL;

/* adiciona primary key para more_info_id */
ALTER TABLE more_info ADD PRIMARY KEY(more_info_id);

/* adiciona coluna birthday do tipo DATE na tabela more_info */
ALTER TABLE more_info ADD COLUMN birthday DATE;

/* adiciona coluna height do tipo INT na tabela more_info */
ALTER TABLE more_info ADD COLUMN height INT;

/* adiciona coluna weight do tipo NUMERIC(4, 1)
fica por exemplo: '123.0'
(no máximo 4 números, sendo 1 deles a casa decimal)
 na tabela more_info */
ALTER TABLE more_info ADD COLUMN weight NUMERIC(4, 1);

/* cria uma fk (column) em more_info 
chamada 'character_id' que referencia a coluna character_id
da tabela characters
 */
/* relacionamento 1-1 */ 
ALTER TABLE more_info ADD character_id INT REFERENCES
characters(character_id);

/* adiciona unique para fk character_id em more_info */
/* "more_info_character_id_key" UNIQUE CONSTRAINT, btree (character_id) */
ALTER TABLE more_info ADD UNIQUE(character_id);

/* adiciona not null para fk character_id em more_info */
ALTER TABLE more_info ALTER character_id SET NOT NULL;

/* projeta character_id da tabela characters */
SELECT character_id FROM characters;

/* projeta character_id, name da tabela characters */
SELECT character_id, name FROM characters;

/* insere more_info para 'Mario' */
INSERT INTO more_info(birthday, height, weight, character_id)
VALUES('1981-07-09', 155, 64.5, 1);

/* projeta character_id, name da tabela characters */
SELECT character_id, name FROM characters;

/* insere more_info para 'Luigi' */
INSERT INTO more_info(birthday, height, weight, character_id)
VALUES('1983-07-14', 175, 48.8, 2);

/* projeta character_id, name da tabela characters */
SELECT character_id, name FROM characters;

/* insere more_info para 'Peach' */
INSERT INTO more_info(birthday, height, weight, character_id)
VALUES('1985-10-18', 173, 52.2, 3);

/* projeta character_id e name de toad */
SELECT character_id, name FROM characters
WHERE name='Toad';

/* insere more_info para 'Toad' */
INSERT INTO more_info(birthday, height, weight, character_id)
VALUES('1950-01-10', 66, 35.6, 4);

/* projeta character_id e name de Bowser */
SELECT character_id, name FROM characters
WHERE name='Bowser';

/* insere more_info para 'Bowser' */
INSERT INTO more_info(birthday, height, weight, character_id)
VALUES('1990-10-29', 258, 300, 5);

/* projeta character_id e name de Daisy */
SELECT character_id, name FROM characters
WHERE name='Daisy';

/* insere more_info para 'Daisy' */
INSERT INTO more_info(birthday, height, weight, character_id)
VALUES('1989-07-31', NULL, NULL, 6);

/* projeta character_id e name de Yoshi */
SELECT character_id, name FROM characters
WHERE name='Yoshi';

/* insere more_info para 'Yoshi' */
INSERT INTO more_info(birthday, height, weight, character_id)
VALUES('1990-04-13', 162, 59.1, 7);

/* altera a coluna height em more_info para height_in_cm */
ALTER TABLE more_info RENAME COLUMN height TO height_in_cm;

/* altera a coluna weight em more_info para weight_in_kg */
ALTER TABLE more_info RENAME COLUMN weight TO weight_in_kg;

/* cria uma nova tabela, já inicializando colunas na criação */
CREATE TABLE sounds(sound_id SERIAL PRIMARY KEY);

/* adiciona uma coluna 'filename' do tipo VARCHAR(40) NOT NULL E UNIQUE */
ALTER TABLE sounds ADD COLUMN filename VARCHAR(40) NOT NULL UNIQUE;

/* cria fk character_id 
RELACIONAMENTO -> 1-n
*/
ALTER TABLE sounds ADD COLUMN charater_id INT NOT NULL
REFERENCES characters(character_id);

/* projeta todos characters order by character_id */
SELECT * FROM characters ORDER BY character_id;

/* insere um sound */
INSERT INTO sounds(filename, character_id)
VALUES('its-a-me.wav', 1);

/* renomeia charater_id na tabela 'sounds' para character_id */
ALTER TABLE sounds RENAME COLUMN charater_id TO character_id;

/* insere um sound 'its-a-me.wav' para Mario */
INSERT INTO sounds(filename, character_id)
VALUES('its-a-me.wav', 1);


/* insere um sound 'yippee.wav' para Mario */
INSERT INTO sounds(filename, character_id)
VALUES('yippee.wav', 1);

/* insere um sound 'ha-ha.wav' para Luigi */
INSERT INTO sounds(filename, character_id)
VALUES('ha-ha.wav', 2);

/* insere um sound 'oh-yeah.wav' para Luigi */
INSERT INTO sounds(filename, character_id)
VALUES('oh-yeah.wav', 2);

/* insere um sound 'yay.wav' e 'woo-hoo.wav' para Peach */
INSERT INTO sounds(filename, character_id)
VALUES('yay.wav', 3), ('woo-hoo.wav', 3);

/* insere um sound 'mm-hmm.wav' para mario
 e 'yahoo.wav' para Peach */
INSERT INTO sounds(filename, character_id)
VALUES('mm-hmm.wav', 3), ('yahoo.wav', 1);

/* conecta a base de dados novamente... */
\c mario_database;

/* cria tabela actions */
CREATE TABLE actions(action_id SERIAL PRIMARY KEY);

/* adiciona coluna action do tipo VARCHAR(20) na tabela actions */
ALTER TABLE actions ADD COLUMN action VARCHAR(30) UNIQUE NOT NULL;

/* insere na coluna action 'run' */
INSERT INTO actions(action) VALUES('run');

/* insere na coluna action 'jump' */
INSERT INTO actions(action) VALUES('jump');

/* insere na coluna action 'duck' */
INSERT INTO actions(action) VALUES('duck');

/* fazendo relação N-N
1- normalmente criamos e usamos uma tabela de junção
 */
CREATE TABLE character_actions();

/* 
como queremos fazer (N)personagens para (N)ações (N-N) 
1. adicionamos a essa tabela uma coluna chamada character_id tipo int not null
 */
ALTER TABLE character_actions ADD COLUMN character_id INT NOT NULL;

/*
agora definimos essa coluna (character_actions) como uma FK
*/
ALTER TABLE character_actions ADD FOREIGN KEY(character_id)
REFERENCES characters(character_id);

/*
agora criamos uma nova coluna para as ações (action_id)
*/
ALTER TABLE character_actions ADD COLUMN action_id INT NOT NULL;

/*
também precisamos definir a action_id como uma FK
*/
ALTER TABLE character_actions ADD FOREIGN KEY(action_id)
REFERENCES actions(action_id);

/*
como criar uma primary key composta (pq é n-n)
*/
ALTER TABLE character_actions 
ADD PRIMARY KEY(character_id, action_id);

/*
inserindo todas as actions para 
Yoshi (character_id: 7)
*/
INSERT INTO character_actions(character_id, action_id)
VALUES(7, 1), (7, 2), (7, 3);

/*
inserindo todas as actions para 
Daisy (character_id: 6)
*/
INSERT INTO character_actions(character_id, action_id)
VALUES(6, 1), (6, 2), (6, 3);

/*
inserindo todas as actions para 
Bowser (character_id: 5)
*/
INSERT INTO character_actions(character_id, action_id)
VALUES(5, 1), (5, 2), (5, 3);

/*
inserindo todas as actions para 
Toad (character_id: 4)
*/
INSERT INTO character_actions(character_id, action_id)
VALUES(4, 1), (4, 2), (4, 3);

/*
inserindo todas as actions para 
Peach (character_id: 3)
*/
INSERT INTO character_actions(character_id, action_id)
VALUES(3, 1), (3, 2), (3, 3);

/*
inserindo todas as actions para 
Luigi (character_id: 2)
*/
INSERT INTO character_actions(character_id, action_id)
VALUES(2, 1), (2, 2), (2, 3);

/*
inserindo todas as actions para 
Mario (character_id: 1)
*/
INSERT INTO character_actions(character_id, action_id)
VALUES(1, 1), (1, 2), (1, 3);

-- ver todas tabelas 
\d 
-- ver characters data
SELECT * FROM characters ORDER BY character_id;

-- ver more_info data;
SELECT * FROM more_info;

/*
ver todas as informações de characters no more_info;
*/
SELECT * FROM characters 
FULL JOIN more_info
ON characters.character_id = more_info.character_id;

/*
ver todos characters no sounds
*/
SELECT * FROM characters
FULL JOIN sounds
ON characters.character_id = sounds.character_id;

/*
ver character_actions com characters e actions (1 - n)
*/
SELECT * FROM character_actions
FULL JOIN characters 
ON character_actions.character_id = characters.character_id
FULL JOIN actions
ON character_actions.action_id = actions.action_id;

/* FIM! */