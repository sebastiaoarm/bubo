-- DESABILITANDO O SUPORTE ÀS CHAVES ESTRANGEIRAS --
PRAGMA foreign_keys = OFF;

-- CURSO --
DROP TABLE IF EXISTS curso;
CREATE TABLE curso (
id INTEGER NOT NULL,
nome TEXT NOT NULL,
descricao TEXT NOT NULL,
criado TEXT NOT NULL DEFAULT (DATETIME ('NOW', 'LOCALTIME')),
modificado TEXT,
ativo TEXT NOT NULL DEFAULT 'SIM',
CHECK (ativo IN ('SIM', 'NÃO')),
PRIMARY KEY (id),
UNIQUE (nome, ativo));

-- DISCIPLINA --
DROP TABLE IF EXISTS disciplina;
CREATE TABLE disciplina (
id INTEGER NOT NULL,
nome TEXT NOT NULL,
descricao TEXT NOT NULL,
criado TEXT NOT NULL DEFAULT (DATETIME ('NOW', 'LOCALTIME')),
modificado TEXT,
ativo TEXT NOT NULL DEFAULT 'SIM',
CHECK (ativo IN ('SIM', 'NÃO')),
PRIMARY KEY (id));

-- REQUISITOS POR DISCIPLINAS (RELAÇÃO N:N ENTRE DISCIPLINA E DISCIPLINA) --
DROP TABLE IF EXISTS requisito_por_disciplina;
CREATE TABLE requisito_por_disciplina (
id_disciplina INTEGER NOT NULL,
id_disciplina_requisito INTEGER NOT NULL,
PRIMARY KEY (id_disciplina, id_disciplina_requisito),
FOREIGN KEY (id_disciplina) REFERENCES disciplina (id) ON DELETE RESTRICT ON UPDATE CASCADE,
FOREIGN KEY (id_disciplina_requisito) REFERENCES disciplina (id) ON DELETE RESTRICT ON UPDATE CASCADE);

-- DISCIPLINAS POR CURSOS (RELAÇÃO N:N ENTRE CURSO E DISCIPLINA) --
DROP TABLE IF EXISTS disciplina_por_curso;
CREATE TABLE disciplina_por_curso (
id_curso INTEGER NOT NULL,
id_disciplina INTEGER NOT NULL,
PRIMARY KEY (id_curso, id_disciplina),
FOREIGN KEY (id_curso) REFERENCES curso (id) ON DELETE RESTRICT ON UPDATE CASCADE,
FOREIGN KEY (id_disciplina) REFERENCES disciplina (id) ON DELETE RESTRICT ON UPDATE CASCADE);

-- MATERIAL --
DROP TABLE IF EXISTS material;
CREATE TABLE material (
id INTEGER NOT NULL,
titulo TEXT NOT NULL,
resumo TEXT NOT NULL,
conteudo TEXT NOT NULL,
criado TEXT NOT NULL DEFAULT (DATETIME ('NOW', 'LOCALTIME')),
modificado TEXT,
ativo TEXT NOT NULL DEFAULT 'SIM',
CHECK (ativo IN ('SIM', 'NÃO')),
PRIMARY KEY (id));

-- REQUISITOS POR MATERIAIS (RELAÇÃO N:N ENTRE MATERIAL E MATERIAL) --
DROP TABLE IF EXISTS requisito_por_material;
CREATE TABLE requisito_por_material (
id_material INTEGER NOT NULL,
id_material_requisito INTEGER NOT NULL,
PRIMARY KEY (id_material, id_material_requisito),
FOREIGN KEY (id_material) REFERENCES material (id) ON DELETE RESTRICT ON UPDATE CASCADE,
FOREIGN KEY (id_material_requisito) REFERENCES material (id) ON DELETE RESTRICT ON UPDATE CASCADE);

-- MATERIAIS POR DISCIPLINAS (RELAÇÃO N:N ENTRE DISCIPLINA E MATERIAL) --
DROP TABLE IF EXISTS material_por_disciplina;
CREATE TABLE material_por_disciplina (
id_disciplina INTEGER NOT NULL,
id_material INTEGER NOT NULL,
PRIMARY KEY (id_disciplina, id_material),
FOREIGN KEY (id_disciplina) REFERENCES disciplina (id) ON DELETE RESTRICT ON UPDATE CASCADE,
FOREIGN KEY (id_material) REFERENCES material (id) ON DELETE RESTRICT ON UPDATE CASCADE);

-- QUESTÃO --
DROP TABLE IF EXISTS questao;
CREATE TABLE questao (
id INTEGER NOT NULL,
id_material INTEGER NOT NULL,
texto TEXT NOT NULL,
criado TEXT NOT NULL DEFAULT (DATETIME ('NOW', 'LOCALTIME')),
modificado TEXT,
ativo TEXT NOT NULL DEFAULT 'SIM',
CHECK (ativo IN ('SIM', 'NÃO')),
PRIMARY KEY (id),
FOREIGN KEY (id_material) REFERENCES material (id) ON DELETE RESTRICT ON UPDATE CASCADE);

-- RESPOSTA --
DROP TABLE IF EXISTS resposta;
CREATE TABLE resposta (
id INTEGER NOT NULL,
id_questao INTEGER NOT NULL,
texto TEXT NOT NULL,
validade TEXT NOT NULL,
criado TEXT NOT NULL DEFAULT (DATETIME ('NOW', 'LOCALTIME')),
modificado TEXT,
ativo TEXT NOT NULL DEFAULT 'SIM',
CHECK (validade IN ('certa', 'errada')),
CHECK (ativo IN ('SIM', 'NÃO')),
PRIMARY KEY (id),
FOREIGN KEY (id_questao) REFERENCES questao (id) ON DELETE RESTRICT ON UPDATE CASCADE);

-- USUÁRIO --
DROP TABLE IF EXISTS usuario;
CREATE TABLE usuario (
id INTEGER NOT NULL,
perfil TEXT NOT NULL,
nome TEXT NOT NULL,
email TEXT NOT NULL,
senha_md5 TEXT NOT NULL,
observacao TEXT,
criado TEXT NOT NULL DEFAULT (DATETIME ('NOW', 'LOCALTIME')),
modificado TEXT,
ativo TEXT NOT NULL DEFAULT 'SIM',
CHECK (perfil IN ('ADMINISTRADOR', 'APRENDIZ', 'TUTOR')),
CHECK (email LIKE '%_@%_.%_'),
CHECK (ativo IN ('SIM', 'NÃO')),
UNIQUE (email),
PRIMARY KEY (id));

-- MATRÍCULAS (RELAÇÃO N:N ENTRE CURSOS E USUÁRIOS) --
DROP TABLE IF EXISTS matricula;
CREATE TABLE matricula (
id_curso INTEGER NOT NULL,
id_usuario INTEGER NOT NULL,
criado TEXT NOT NULL DEFAULT (DATETIME ('NOW', 'LOCALTIME')),
modificado TEXT,
ativo TEXT NOT NULL DEFAULT 'SIM',
CHECK (ativo IN ('SIM', 'NÃO')),
PRIMARY KEY (id_curso, id_usuario),
FOREIGN KEY (id_curso) REFERENCES curso (id) ON DELETE RESTRICT ON UPDATE CASCADE,
FOREIGN KEY (id_usuario) REFERENCES usuario (id) ON DELETE RESTRICT ON UPDATE CASCADE);

-- TUTORIAS (RELAÇÃO N:N ENTRE DISCIPLINAS E USUÁRIOS) --
DROP TABLE IF EXISTS tutoria;
CREATE TABLE tutoria (
id_disciplina INTEGER NOT NULL,
id_usuario INTEGER NOT NULL,
criado TEXT NOT NULL DEFAULT (DATETIME ('NOW', 'LOCALTIME')),
modificado TEXT,
ativo TEXT NOT NULL DEFAULT 'SIM',
CHECK (ativo IN ('SIM', 'NÃO')),
PRIMARY KEY (id_disciplina, id_usuario),
FOREIGN KEY (id_disciplina) REFERENCES disciplina (id) ON DELETE RESTRICT ON UPDATE CASCADE,
FOREIGN KEY (id_usuario) REFERENCES usuario (id) ON DELETE RESTRICT ON UPDATE CASCADE);

-- VISITAS (MATERIAL X USUARIO) --
DROP TABLE IF EXISTS visita;
CREATE TABLE visita (
id_material INTEGER NOT NULL,
id_usuario INTEGER NOT NULL,
data_e_hora TEXT NOT NULL DEFAULT (DATETIME ('NOW', 'LOCALTIME')),
FOREIGN KEY (id_material) REFERENCES material (id) ON DELETE RESTRICT ON UPDATE CASCADE,
FOREIGN KEY (id_usuario) REFERENCES usuario (id) ON DELETE RESTRICT ON UPDATE CASCADE);

-- AVALIAÇÃO (RELAÇÃO N:N ENTRE MATERIAL E USUÁRIO) --
DROP TABLE IF EXISTS avaliacao;
CREATE TABLE avaliacao (
id INTEGER NOT NULL,
id_material INTEGER NOT NULL,
id_usuario INTEGER NOT NULL,
criado TEXT NOT NULL DEFAULT (DATETIME ('NOW', 'LOCALTIME')),
modificado TEXT,
ativo TEXT NOT NULL DEFAULT 'SIM',
CHECK (ativo IN ('SIM', 'NÃO')),
PRIMARY KEY (id),
FOREIGN KEY (id_material) REFERENCES material (id) ON DELETE RESTRICT ON UPDATE CASCADE,
FOREIGN KEY (id_usuario) REFERENCES usuario (id) ON DELETE RESTRICT ON UPDATE CASCADE);

-- RESPOSTAS POR QUESTÕES POR AVALIAÇÕES (RELAÇÃO N:N ENTRE AVALIAÇÃO, QUESTÃO E RESPOSTA) --
DROP TABLE IF EXISTS resposta_por_questao_por_avaliacao;
CREATE TABLE resposta_por_questao_por_avaliacao (
id INTEGER NOT NULL,
id_avaliacao INTEGER NOT NULL,
id_questao INTEGER NOT NULL,
id_resposta INTEGER NOT NULL,
criado TEXT NOT NULL DEFAULT (DATETIME ('NOW', 'LOCALTIME')),
modificado TEXT,
ativo TEXT NOT NULL DEFAULT 'SIM',
CHECK (ativo IN ('SIM', 'NÃO')),
PRIMARY KEY (id),
FOREIGN KEY (id_avaliacao) REFERENCES avaliacao (id) ON DELETE RESTRICT ON UPDATE CASCADE,
FOREIGN KEY (id_questao) REFERENCES questao (id) ON DELETE RESTRICT ON UPDATE CASCADE,
FOREIGN KEY (id_resposta) REFERENCES resposta (id) ON DELETE RESTRICT ON UPDATE CASCADE);

-- LOG --
DROP TABLE IF EXISTS log;
CREATE TABLE log (
id INTEGER NOT NULL,
id_usuario INTEGER NOT NULL,
acao TEXT NOT NULL,
criado TEXT NOT NULL DEFAULT (DATETIME ('NOW', 'LOCALTIME')),
PRIMARY KEY (id),
FOREIGN KEY (id_usuario) REFERENCES usuario (id) ON DELETE RESTRICT ON UPDATE CASCADE);

-- GATILHOS: PREENCHEM OS CAMPOS 'modificado' NAS TABELAS QUANDO QUALQUER MODIFICAÇÃO É FEITA

-- NA TABELA 'curso'...
DROP TRIGGER IF EXISTS update_curso;
CREATE TRIGGER update_curso UPDATE ON curso
BEGIN
UPDATE curso SET modificado = (DATETIME ('NOW', 'LOCALTIME')) WHERE id = new.id;
END;

-- NA TABELA 'disciplina'...
DROP TRIGGER IF EXISTS update_disciplina;
CREATE TRIGGER update_disciplina UPDATE ON disciplina
BEGIN
UPDATE disciplina SET modificado = (DATETIME ('NOW', 'LOCALTIME')) WHERE id = new.id;
END;

-- NA TABELA 'material'...
DROP TRIGGER IF EXISTS update_material;
CREATE TRIGGER update_material UPDATE ON material
BEGIN
UPDATE material SET modificado = (DATETIME ('NOW', 'LOCALTIME')) WHERE id = new.id;
END;

-- NA TABELA 'questao'...
DROP TRIGGER IF EXISTS update_questao;
CREATE TRIGGER update_questao UPDATE ON questao
BEGIN
UPDATE questao SET modificado = (DATETIME ('NOW', 'LOCALTIME')) WHERE id = new.id;
END;

-- NA TABELA 'resposta'...
DROP TRIGGER IF EXISTS update_resposta;
CREATE TRIGGER update_resposta UPDATE ON resposta
BEGIN
UPDATE resposta SET modificado = (DATETIME ('NOW', 'LOCALTIME')) WHERE id = new.id;
END;

-- NA TABELA 'usuario'...
DROP TRIGGER IF EXISTS update_usuario;
CREATE TRIGGER update_usuario UPDATE ON usuario
BEGIN
UPDATE usuario SET modificado = (DATETIME ('NOW', 'LOCALTIME')) WHERE id = new.id;
END;

-- HABILITANDO O SUPORTE ÀS CHAVES ESTRANGEIRAS --
PRAGMA foreign_keys = ON;

-- INSERINDO DADOS... --
INSERT INTO usuario (perfil, nome, email, senha_md5) VALUES ('ADMINISTRADOR', 'SEBASTIAO ARLUSSON RAMOS MOURA', 'sebastiaoarm@gmail.com', 'abe6db4c9f5484fae8d79f2e868a673c'); -- senha: masterkey
INSERT INTO usuario (perfil, nome, email, senha_md5) VALUES ('ADMINISTRADOR', 'ROMARIZ DA SILVA BARROS', 'romarizsb@gmail.com', 'e13a7d84fb859b9f372ecada1101cbfc'); -- senha: aprende