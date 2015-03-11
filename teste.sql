-- Creator:       MySQL Workbench 6.0.9/ExportSQLite plugin 2009.12.02
-- Author:        sebastiao.moura
-- Caption:       New Model
-- Project:       Name of the project
-- Changed:       2014-03-17 12:33
-- Created:       2014-03-17 12:12
PRAGMA foreign_keys = OFF;

-- Schema: mydb
BEGIN;
CREATE TABLE "curso"(
  "id" INTEGER PRIMARY KEY NOT NULL,
  "nome" TEXT NOT NULL,
  "descricao" TEXT NOT NULL,
  "criado" TEXT NOT NULL DEFAULT '(DATETIME (\'NOW\', \'LOCALTIME\'))',
  "modificado" TEXT,
  "ativo" TEXT NOT NULL
);
COMMIT;
