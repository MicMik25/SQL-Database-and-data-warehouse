/*By zapewnić poprawne działanie, proszę nie zmieniać kolejności uruchamiania skryptów poniżej: */

/*Uzupełnianie wymiaru województwo */
insert into dbo.W_Wojewodztwo(wojewodztwo)
values ('Łódzkie'),
('Śląskie'),
('Mazowieckie'),
('Wielkopolskie'),
('Opolskie'),
('Dolnośląskie'),
('Warmińsko-Mazurskie'),
('Podlaskie'),
('Pomorskie'),
('Zachodniopomorskie'),
('Kujawsko-Pomorskie'),
('Podkarpackie'),
('Świętokrzyskie'),
('Lubelskie'),
('Lubuskie'),
('Małopolskie');

/*Uzupełnianie wymiaru typ obniżki */
use Sklep_hd
insert into dbo.W_Typ_Obnizki(typ_obnizki)
values('Promocja'),
('Kod rabatowy');

/*Uzupełnianie wymiaru metoda płatności */
use Sklep_hd
insert into dbo.W_Metoda_platn(metoda_platn)
values ('BLIK'),
('Przelew online'),
('Przelew tradycyjny'),
('Karta'),
('Paypal'),
('Paysafecard');

/*Uzupełnianie wymiaru dostawca */
insert into dbo.W_Dostawca (dostawca)
values ('DPD'),
('DHL'),
('FedEX'),
('UPS'),
('Poczta Polska'),
('InPost'),
('GLS');

/*Uzupełnianie wymiaru produkt */
insert into dbo.W_Produkt(produkt,podkategoria,kategoria)
values ('Iphone13','Apple','Smartfony i telefony'),
('Samsung Galaxy S23','Android','Smartfony i telefony'),
('Xbox360','XBOX','Konsole'),
('PlayStation 4','PlayStation','Konsole');

/*Uzupełnianie wymiaru czas */
insert into dbo.W_Czas(kod_czasu,dzien,miesiac,kwartal_roku,rok,dz_tyg,miesiac_nazwa,dz_tyg_nazwa)
values ('2024-01-31','31','1','1','2024','3','Styczeń','Środa'),
('2024-02-01','01','2','1','2024','4','Luty','Czwartek'),
('2024-02-02','02','2','1','2024','5','Luty','Piątek');

/*Uzupełnianie tabeli faktu sprzedaż */
insert into dbo.F_Sprzedaz(data_sprzedazy,id_wojewodztwo,id_metoda_platn,id_dostawca,id_produkt,ilosc,cena,wartosc)
values ('2024-01-31','1','1','1','1','1','3200','3200'),
('2024-02-01','2','2','2','2','1','3500','3500')

/*Uzupełnianie tabeli faktu obniżka */
insert into dbo.F_Obnizka (id_sprzedazy,id_typ_obnizki,kwota_obnizki)
values('1','2','10');

