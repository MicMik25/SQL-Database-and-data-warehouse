CREATE DATABASE Sklep_hd
GO
use Sklep_hd
go
-- Table: F_Obnizka
CREATE TABLE F_Obnizka (
    id_sprzedazy int,
    id_typ_obnizki int  NULL,
    kwota_obnizki float  NULL,
    CONSTRAINT F_Obnizka_pk PRIMARY KEY (id_sprzedazy)
) ;

-- Table: F_Sprzedaz
CREATE TABLE F_Sprzedaz (
    id_sprzedazy int identity(1,1)  NOT NULL,
    data_sprzedazy date  NULL,
    id_wojewodztwo int  NULL,
    id_metoda_platn int  NULL,
    id_dostawca int  NULL,
    id_produkt int  NULL,
    ilosc smallint  NULL,
    cena float  NULL,
    wartosc float  NULL,
    CONSTRAINT F_Sprzedaz_pk PRIMARY KEY (id_sprzedazy)
) ;

-- Table: W_Czas
CREATE TABLE W_Czas (
    kod_czasu date  NOT NULL,
    dzien smallint  NULL,
    miesiac smallint  NULL,
    kwartal_roku smallint  NULL,
    rok smallint  NULL,
    dz_tyg smallint  NULL,
    miesiac_nazwa varchar(100)  NULL,
    dz_tyg_nazwa varchar(50)  NULL,
    CONSTRAINT W_Czas_pk PRIMARY KEY (kod_czasu)
) ;

-- Table: W_Dostawca
CREATE TABLE W_Dostawca (
    id_dostawca int identity(1,1)  NOT NULL,
    dostawca varchar(100)  NOT NULL,
    CONSTRAINT W_Dostawca_pk PRIMARY KEY (id_dostawca)
) ;

-- Table: W_Metoda_platn
CREATE TABLE W_Metoda_platn (
    id_metoda_platn int identity(1,1)  NOT NULL,
    metoda_platn varchar(100)  NOT NULL,
    CONSTRAINT W_Metoda_platn_pk PRIMARY KEY (id_metoda_platn)
) ;

-- Table: W_Produkt
CREATE TABLE W_Produkt (
    id_produkt int identity(1,1)  NOT NULL,
    produkt varchar(100)  NOT NULL,
    podkategoria varchar(100)  NOT NULL,
    kategoria varchar(100)  NOT NULL,
    CONSTRAINT W_Produkt_pk PRIMARY KEY (id_produkt)
) ;

-- Table: W_Typ_Obnizki
CREATE TABLE W_Typ_Obnizki (
    id_typ_obnizki int identity(1,1)  NOT NULL,
    typ_obnizki varchar(100)  NOT NULL,
    CONSTRAINT W_Typ_Obnizki_pk PRIMARY KEY (id_typ_obnizki)
) ;

-- Table: W_Wojewodztwo
CREATE TABLE W_Wojewodztwo (
    id_wojewodztwo int identity(1,1)  NOT NULL,
    wojewodztwo varchar(100)  NOT NULL,
    CONSTRAINT W_Wojewodztwo_pk PRIMARY KEY (id_wojewodztwo)
) ;

-- foreign keys
-- Reference: F_Obnizka_F_Sprzedaz (table: F_Obnizka)
ALTER TABLE F_Obnizka ADD CONSTRAINT F_Obnizka_F_Sprzedaz
    FOREIGN KEY (id_sprzedazy)
    REFERENCES F_Sprzedaz (id_sprzedazy);

-- Reference: F_Obnizka_W_Typ_Obnizki (table: F_Obnizka)
ALTER TABLE F_Obnizka ADD CONSTRAINT F_Obnizka_W_Typ_Obnizki
    FOREIGN KEY (id_typ_obnizki)
    REFERENCES W_Typ_Obnizki (id_typ_obnizki);

-- Reference: F_Sprzedaz_W_Czas (table: F_Sprzedaz)
ALTER TABLE F_Sprzedaz ADD CONSTRAINT F_Sprzedaz_W_Czas
    FOREIGN KEY (data_sprzedazy)
    REFERENCES W_Czas (kod_czasu);

-- Reference: F_Sprzedaz_W_Dostawca (table: F_Sprzedaz)
ALTER TABLE F_Sprzedaz ADD CONSTRAINT F_Sprzedaz_W_Dostawca
    FOREIGN KEY (id_dostawca)
    REFERENCES W_Dostawca (id_dostawca);

-- Reference: F_Sprzedaz_W_Metoda_platn (table: F_Sprzedaz)
ALTER TABLE F_Sprzedaz ADD CONSTRAINT F_Sprzedaz_W_Metoda_platn
    FOREIGN KEY (id_metoda_platn)
    REFERENCES W_Metoda_platn (id_metoda_platn);

-- Reference: F_Sprzedaz_W_Produkt (table: F_Sprzedaz)
ALTER TABLE F_Sprzedaz ADD CONSTRAINT F_Sprzedaz_W_Produkt
    FOREIGN KEY (id_produkt)
    REFERENCES W_Produkt (id_produkt);

-- Reference: F_Sprzedaz_W_Wojewodztwo (table: F_Sprzedaz)
ALTER TABLE F_Sprzedaz ADD CONSTRAINT F_Sprzedaz_W_Wojewodztwo
    FOREIGN KEY (id_wojewodztwo)
    REFERENCES W_Wojewodztwo (id_wojewodztwo);

-- End of file.

