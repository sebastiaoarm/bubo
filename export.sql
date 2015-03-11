-- Creator:       MySQL Workbench 6.0.9/ExportSQLite plugin 2009.12.02
-- Author:        sebastiao.moura
-- Caption:       New Model
-- Project:       Name of the project
-- Changed:       2014-03-27 12:03
-- Created:       2014-03-17 12:12
PRAGMA foreign_keys = OFF;

-- Schema: mydb
BEGIN;
CREATE TABLE "curso"(
  "id" INTEGER PRIMARY KEY NOT NULL,
  "nome" TEXT NOT NULL,
  "descricao" TEXT NOT NULL,
  "criado" TEXT NOT NULL,
  "modificado" TEXT,
  "ativo" TEXT NOT NULL
);
CREATE TABLE "disciplina"(
  "id" INTEGER PRIMARY KEY NOT NULL,
  "nome" TEXT NOT NULL,
  "descricao" TEXT NOT NULL,
  "criado" TEXT NOT NULL,
  "modificado" TEXT,
  "ativo" TEXT NOT NULL
);
CREATE TABLE "material"(
  "id" INTEGER PRIMARY KEY NOT NULL,
  "titulo" TEXT NOT NULL,
  "resumo" TEXT NOT NULL,
  "conteudo" TEXT NOT NULL,
  "criado" TEXT NOT NULL,
  "modificado" TEXT,
  "ativo" TEXT NOT NULL
);
CREATE TABLE "disciplina_material1"(
  "id_disciplina" INTEGER NOT NULL,
  "id_material" INTEGER NOT NULL,
  PRIMARY KEY("id_disciplina","id_material"),
  CONSTRAINT "fk_disciplina_material1_disciplina1"
    FOREIGN KEY("id_disciplina")
    REFERENCES "disciplina"("id")
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT "fk_disciplina_material1_material1"
    FOREIGN KEY("id_material")
    REFERENCES "material"("id")
    ON DELETE RESTRICT
    ON UPDATE CASCADE
);
CREATE INDEX "disciplina_material1.fk_disciplina_material1_material1_idx" ON "disciplina_material1"("id_material");
CREATE INDEX "disciplina_material1.fk_disciplina_material1_disciplina1_idx" ON "disciplina_material1"("id_disciplina");
CREATE TABLE "material_requisito"(
  "id_material" INTEGER NOT NULL,
  "id_material_requisito" INTEGER NOT NULL,
  PRIMARY KEY("id_material","id_material_requisito"),
  CONSTRAINT "fk_material_material_material1"
    FOREIGN KEY("id_material")
    REFERENCES "material"("id")
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT "fk_material_material_material2"
    FOREIGN KEY("id_material_requisito")
    REFERENCES "material"("id")
    ON DELETE RESTRICT
    ON UPDATE CASCADE
);
CREATE INDEX "material_requisito.fk_material_material_material2_idx" ON "material_requisito"("id_material_requisito");
CREATE INDEX "material_requisito.fk_material_material_material1_idx" ON "material_requisito"("id_material");
CREATE TABLE "disciplina_requisito"(
  "id_disciplina" INTEGER NOT NULL,
  "id_disciplina_requisito" INTEGER NOT NULL,
  PRIMARY KEY("id_disciplina","id_disciplina_requisito"),
  CONSTRAINT "fk_disciplina_disciplina_disciplina1"
    FOREIGN KEY("id_disciplina")
    REFERENCES "disciplina"("id")
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT "fk_disciplina_disciplina_disciplina2"
    FOREIGN KEY("id_disciplina_requisito")
    REFERENCES "disciplina"("id")
    ON DELETE RESTRICT
    ON UPDATE CASCADE
);
CREATE INDEX "disciplina_requisito.fk_disciplina_disciplina_disciplina2_idx" ON "disciplina_requisito"("id_disciplina_requisito");
CREATE INDEX "disciplina_requisito.fk_disciplina_disciplina_disciplina1_idx" ON "disciplina_requisito"("id_disciplina");
CREATE TABLE "curso_disciplina"(
  "id_curso" INTEGER NOT NULL,
  "id_disciplina" INTEGER NOT NULL,
  PRIMARY KEY("id_curso","id_disciplina"),
  CONSTRAINT "fk_curso_disciplina_curso1"
    FOREIGN KEY("id_curso")
    REFERENCES "curso"("id")
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT "fk_curso_disciplina_disciplina1"
    FOREIGN KEY("id_disciplina")
    REFERENCES "disciplina"("id")
    ON DELETE RESTRICT
    ON UPDATE CASCADE
);
CREATE INDEX "curso_disciplina.fk_curso_disciplina_disciplina1_idx" ON "curso_disciplina"("id_disciplina");
CREATE INDEX "curso_disciplina.fk_curso_disciplina_curso1_idx" ON "curso_disciplina"("id_curso");
CREATE TABLE "questao"(
  "id" INTEGER NOT NULL,
  "id_material" INTEGER NOT NULL,
  "texto" TEXT NOT NULL,
  "criado" TEXT NOT NULL,
  "modificado" TEXT,
  "ativo" TEXT NOT NULL,
  PRIMARY KEY("id","id_material"),
  CONSTRAINT "fk_questao_material1"
    FOREIGN KEY("id_material")
    REFERENCES "material"("id")
    ON DELETE RESTRICT
    ON UPDATE CASCADE
);
CREATE INDEX "questao.fk_questao_material1_idx" ON "questao"("id_material");
COMMIT;
