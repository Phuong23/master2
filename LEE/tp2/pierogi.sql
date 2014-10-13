DROP TABLE COMMANDES;
DROP TABLE STOCKS;
DROP TABLE PIEROGIS;

CREATE TABLE PIEROGI."PIEROGIS" (
    "PIE_ID" VARCHAR(10) primary key,
    "PIE_PRIX" numeric
);

CREATE TABLE PIEROGI."STOCKS" (
    "STO_ID" INTEGER generated always as identity primary key,
    "PIE_ID" VARCHAR(10),
    "STO_QUANTITE" numeric
);
alter table PIEROGI."STOCKS" add foreign key ("PIE_ID") references PIEROGI."PIEROGIS";

CREATE TABLE PIEROGI."COMMANDES" (
    "COM_ID" INTEGER generated always as identity primary key,
    "PIE_ID" VARCHAR(10),
    "COM_QUANTITE" numeric,
    "COM_TOTAL" numeric,
    "COM_EMAIL" VARCHAR(20)
);
alter table PIEROGI."COMMANDES" add foreign key ("PIE_ID") references PIEROGI."PIEROGIS";

INSERT INTO PIEROGI."PIEROGIS" VALUES ('viande', 2.0);
INSERT INTO PIEROGI."PIEROGIS" VALUES ('fromage', 3.0);
INSERT INTO PIEROGI."PIEROGIS" VALUES ('myrtilles', 4.0);

INSERT INTO PIEROGI."STOCKS" ("PIE_ID", "STO_QUANTITE") VALUES ('viande', 50);
INSERT INTO PIEROGI."STOCKS" ("PIE_ID", "STO_QUANTITE") VALUES ('fromage', 20);
INSERT INTO PIEROGI."STOCKS" ("PIE_ID", "STO_QUANTITE") VALUES ('myrtilles', 30);

INSERT INTO PIEROGI."COMMANDES" ("PIE_ID", "COM_QUANTITE", "COM_TOTAL", "COM_EMAIL")
        VALUES ('viande', 10, 100, 'email@pierogi.com');
INSERT INTO PIEROGI."COMMANDES" ("PIE_ID", "COM_QUANTITE", "COM_TOTAL", "COM_EMAIL")
        VALUES ('fromage', 20, 200, 'email@pierogi.com');
INSERT INTO PIEROGI."COMMANDES" ("PIE_ID", "COM_QUANTITE", "COM_TOTAL", "COM_EMAIL")
        VALUES ('myrtilles', 30, 300, 'email@pierogi.com');