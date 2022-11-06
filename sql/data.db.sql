BEGIN TRANSACTION;
DROP TABLE IF EXISTS "doctrine_migration_versions";
CREATE TABLE IF NOT EXISTS "doctrine_migration_versions" (
	"version"	VARCHAR(191) NOT NULL,
	"executed_at"	DATETIME DEFAULT NULL,
	"execution_time"	INTEGER DEFAULT NULL,
	PRIMARY KEY("version")
);
DROP TABLE IF EXISTS "invoice";
CREATE TABLE IF NOT EXISTS "invoice" (
	"id"	INTEGER NOT NULL,
	"date"	DATE DEFAULT NULL,
	"number"	INTEGER DEFAULT NULL,
	"customer_id"	INTEGER NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
DROP TABLE IF EXISTS "invoice_lines";
CREATE TABLE IF NOT EXISTS "invoice_lines" (
	"id"	INTEGER NOT NULL,
	"invoice_id"	INTEGER DEFAULT NULL,
	"description"	CLOB NOT NULL,
	"quantity"	INTEGER NOT NULL,
	"amount"	NUMERIC(12, 2) NOT NULL,
	"vat"	NUMERIC(12, 2) NOT NULL,
	"total_vat"	NUMERIC(12, 2) NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT),
	CONSTRAINT "FK_72DBDC232989F1FD" FOREIGN KEY("invoice_id") REFERENCES "invoice"("id") ON UPDATE NO ACTION ON DELETE NO ACTION NOT DEFERRABLE INITIALLY IMMEDIATE
);
INSERT INTO "doctrine_migration_versions" ("version","executed_at","execution_time") VALUES ('DoctrineMigrations\Version20221105211906','2022-11-05 21:20:17',21);
INSERT INTO "doctrine_migration_versions" ("version","executed_at","execution_time") VALUES ('DoctrineMigrations\Version20221106005153','2022-11-06 00:52:02',37);
INSERT INTO "invoice" ("id","date","number","customer_id") VALUES (1,'2018-01-01',4,3);
INSERT INTO "invoice" ("id","date","number","customer_id") VALUES (2,'2018-01-01',4,3);
INSERT INTO "invoice" ("id","date","number","customer_id") VALUES (3,'2018-01-01',4,3);
INSERT INTO "invoice" ("id","date","number","customer_id") VALUES (4,'2018-01-01',4,3);
INSERT INTO "invoice" ("id","date","number","customer_id") VALUES (5,'2018-01-01',4,3);
INSERT INTO "invoice" ("id","date","number","customer_id") VALUES (6,'2018-01-01',4,3);
INSERT INTO "invoice" ("id","date","number","customer_id") VALUES (7,'2018-01-01',4,3);
INSERT INTO "invoice" ("id","date","number","customer_id") VALUES (8,'2018-01-01',4,3);
INSERT INTO "invoice" ("id","date","number","customer_id") VALUES (9,'2019-02-02',11,4);
INSERT INTO "invoice" ("id","date","number","customer_id") VALUES (10,NULL,9,5);
INSERT INTO "invoice" ("id","date","number","customer_id") VALUES (11,'2022-11-06',7,6);
INSERT INTO "invoice" ("id","date","number","customer_id") VALUES (12,'2022-11-06',5,5);
INSERT INTO "invoice" ("id","date","number","customer_id") VALUES (13,'2022-11-06',5,5);
INSERT INTO "invoice" ("id","date","number","customer_id") VALUES (14,'2022-11-06',7,7);
INSERT INTO "invoice" ("id","date","number","customer_id") VALUES (15,'2022-11-06',6,5);
INSERT INTO "invoice" ("id","date","number","customer_id") VALUES (16,'2022-11-06',4,6);
INSERT INTO "invoice_lines" ("id","invoice_id","description","quantity","amount","vat","total_vat") VALUES (1,9,'Je Teste encore',4,12,12,12);
INSERT INTO "invoice_lines" ("id","invoice_id","description","quantity","amount","vat","total_vat") VALUES (2,10,'Je Test juste poursavoir là ou j''ne sui',3,12,12,12);
INSERT INTO "invoice_lines" ("id","invoice_id","description","quantity","amount","vat","total_vat") VALUES (3,11,'jaa',1,12,12,12);
INSERT INTO "invoice_lines" ("id","invoice_id","description","quantity","amount","vat","total_vat") VALUES (4,14,'jghfkghfghfskghsfklh',8,120.12,0.33,317.1168);
INSERT INTO "invoice_lines" ("id","invoice_id","description","quantity","amount","vat","total_vat") VALUES (5,15,'Je test encore',4,12,0.2,9.6);
INSERT INTO "invoice_lines" ("id","invoice_id","description","quantity","amount","vat","total_vat") VALUES (6,16,'dflghflghfl',4,2.1,0.4,3.36);
DROP INDEX IF EXISTS "IDX_72DBDC232989F1FD";
CREATE INDEX IF NOT EXISTS "IDX_72DBDC232989F1FD" ON "invoice_lines" (
	"invoice_id"
);
COMMIT;
