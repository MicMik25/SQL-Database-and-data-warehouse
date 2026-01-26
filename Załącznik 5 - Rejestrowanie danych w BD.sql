/*By zapewnić poprawne działanie, proszę nie zmieniać kolejności uruchamiania skryptów poniżej: */

/* #1 Uzupełnianie tabeli województwa */
insert into dbo.wojewodztwo (nazwa_wojewodztwa)
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

/* #2 Uzupełnianie tabeli statusy zamówień */
insert into dbo.zam_statusy (nazwa_statusu)
values ('Kupione'),
('Opłacone'),
('Oczekujące na dostawę'),
('W dostawie'),
('Dostarczone');

/* #3 Uzupełnianie tabeli metody płatności */
insert into dbo.zam_platnosci (metoda_platnosci)
values ('Przelew bankowy'),
('Przelew tradycyjny'),
('PayPal'),
('BLIK'),
('Karta kredytowa/debetowa'),
('Gotówką przy odbiorze');

/* #4 Uzupełnianie tabeli metody dostawy */
insert into dbo.zam_dostawcy(dostawca,opis)
values ('Pocztex48','Kurier Poczty Polskiej'),
('InPost Paczkomat 24/7','Dostawa do paczkomatu InPost'),
('Kurier InPost','Dostawa na adres Inpost'),
('Kurier DPD','Dostawa na adres DPD'),
('Punkt DPD Pickup','Dostawa do punktu DPD Pickup'),
('Kurier DHL','Dostawa na adres DHL'),
('Punkt DHL POP','Dostawa do punktu DHL POP'),
('Kurier FedEx','Dostawa na adres FedEx'),
('Kurier UPS','Dostawa na adres UPS');

/* #5 Uzupełnianie tabeli pracownicy */
insert into dbo.pracownicy (nazwisko,imie,data_zatrudnienia)
values ('Kononowicz','Krzysztof','2023-09-01'),
('Suchodolski','Wojciech','2021-06-01'),
('Geremek','Andrzej','2023-05-21'),
('Andrzejewski','Jarosław','2021-10-01'),
('Łoś','Jan','2021-03-11'),
('Nowak','Sławomir','2023-12-12'),
('Niewiński','Krzysztof','2022-07-11'),
('Wojeciechowski','Paweł','2019-09-09'),
('Olszański','Wojciech','2022-07-22'),
('Osadowski','Marcin','2021-01-21');

/* #6 Uzupełnianie tabeli kategorie */
insert into dbo.kategorie (nazwa_kategorii)
values ('Smartfony i telefony'),
('Laptopy i komputery'),
('Telewizory i monitory'),
('Konsole'),
('Gry'),
('Akcesoria');

/* #7 Uzupełnianie tabeli podkategorie */
insert into dbo.podkategorie (kategorie_id_kategorii, Nazwa_podkategorii)
values ('1','Android'),
('1','Apple'),
('1','Inne'),
('2','Laptopy biurowe'),
('2','Laptopy gamingowe'),
('2','PC'),
('3','Telewizory'),
('3','Monitory'),
('4','XBOX'),
('4','PlayStation'),
('4','Nintendo'),
('5','Gry na PC'),
('5','Gry na XBOX'),
('5','Gry na Playstation'),
('5','Gry na Nintendo'),
('6','Myszki'),
('6','Klawiatury'),
('6','Słuchawki');

/* #8 Uzupełnianie tabeli kody rabatowe */
insert into dbo.kody_rabatowe (kod_rabatowy,data_waznosci,kwota_rabatu)
values ('XD2137','2024-06-01','21.37'),
('SALE50','2024-08-31','50.00'),
('PROMO15','2024-07-31','15.00'),
('XMAS25','2024-12-31','25.00'),
('BLFDAY10','2024-11-30','10.00');

/* #9 Uzupełnianie tabeli klient */
insert into dbo.klient (nazwisko,imie,adres_email,numer_telefonu,nip,nazwa_firmy)
values ('Kiepski','Ferdynand','ferdekkiepski@gmail.com','666-111-333',null,null),
('Paździoch','Marian','mpazdzioch@interia.pl','593-322-111',null,null),
('Boczek','Arnold','arnoldboczek@wp.pl','711-321-455',null,null),
('Paleta','Wiesław','paletawiesiek@o2.pl','601-104-401','777-333-22-11','Wiesł-BUD'),
('Barakowski','Ryszard','rysiekzbaraków@tlen.pl','544-330-221','533-221-65-30','SuperInfKomp'),
('Jędrzejewski','Andrzej','je-wski-andr@gmail.com','738-291-119','533-123-45-67','Jędrek Komputerowiec Sp. z O.O.');

/* #10 Uzupełnianie tabeli adresy dostawy */
insert into dbo.adresy_dostawy(wojewodztwo_id_wojewodztwo,ulica,numer_budynku,kod_pocztowy,miejscowosc,numer_lokalu)
values ('9','Szkolna','17','13-201','Białystok',null),
('9','Marii Konopnickiej','3','16-300','Augustów','10'),
('3','Korfantego','13','01-532','Katowice','6'),
('2','Mandarynkowa','1','95-100','Zgierz',null),
('12','Inowrocławska','4','51-020','Toruń',null),
('10','Kaszubska','11','22-331','Starogard Gdański','8'),
('7','Górska','5','44-026','Wrocław',null),
('14','Letnia','95A','89-999','Ostrowiec Świętokrzyski','75'),
('5','Kolejowa','88','63-231','Poznań','1');

/* #11 Uzupełnianie tabeli produkty */
insert into dbo.produkty (podkategorie_id_podkategorii,nazwa_produktu,cena_jednostkowa,stan_magazynowy,opis)
values ('2','Iphone 13','3200','50','Idealny dla początkującego użytkownika Apple'),
('2','Iphone 14','3600','60','Starszy brat 13stki z większą ilością RAM'),
('2','Iphone 14 PRO','4500','50','Najmocniejsza wersja dla wymagającyh użytkowników'),
('1','Samsung Galaxy A54','2000','30','Średnia półka od Samsunga'),
('1','Samsung Galaxy S23','4000','30','Flagowy Samsung'),
('1','Xiaomi Redmi 12PRO','1500','20','Chiński powiew taniości'),
('3','Nokia 3310','500','10','Ponadczasowy i pancerny telefon retro'),
('4','OfficeTop2k22','2000','20','Świetny wybór do pracy biurowej'),
('5','ASUS TurboSpeed','5000','10','Mistrz gamingowej wydajności'),
('6','Dell Optiplex 5050','1700','10','Średniej klasy pecet do nieskomplikowanych zadań'),
('7','Samsung SmartTV','2000','15','Inteligenty telewizor od Samsunga'),
('7','Sony Bravia','1400','20','Płaskoekranowiec od Sony'),
('7','Sharp ULTRA LED','2900','20','Najwyższa ostrość obrazu'),
('8','Samsung SyncMaster','400','10','Budżetowa propozycja od Samsunga'),
('8','LG Flatroon','350','10','KLasyka wśród monitorów'),
('8','Iyama X1','200','10','Budżetowa opcja prosto z Chin'),
('9','Xbox 360','500','5','Klasyczna konsola Microsoft'),
('9','Xbox ONE','1300','10','Godny następca kultowego klasyka'),
('10','Playstation 4','800','12','Tania i dobra plejka'),
('10','Playstation 5','1300','15','Mocna konsola do gamingowych maratonów'),
('11','Nintendo Wii','100','5','Gamingowe doznania z kontrolerem ruchu'),
('12','Grand Theft Auto 5','100','10','Bestseller Rockstar'),
('13','FarCry4','80','10','Strzelanka w Kyracie'),
('14','Watchdogs','70','10','Hakerskie przygody w Chicago'),
('15','JustDance','60','10','Taneczne emocje w Twojej konsoli'),
('16','A4 Tech Bloody V7','100','15','Dobra i tania mysz gamingowa'),
('17','Xklawix','20','11','Chińska klawiatura do klikania'),
('18','Natec Genesis Sound','30','10','Budżetowe słuchawki dla początkujących gamerów');


/* #12 Uzupełnianie tabeli listy życzeń */
insert into dbo.listy_zyczen(klient_id_klienta,nazwa_listy_zyczen)
values ('1','Lista Ferdka'),
('2','Lista Mariana'),
('3','Lista Arnolda');

/* #13 Uzupełnianie tabeli konwersacje */
Insert into dbo.konwersacje(klient_id_klienta,pracownicy_id_pracownika,tresc,data)
values('1','4','Dzień dobry, czy między świętami wysyłacie paczki?','2023-12-30'),
('1','4','Dzień dobry, niestety sklep był w tym czasie nieczynny.','2024-01-03');

/* #14 Uzupełnianie tabeli oceny produktów */
insert into dbo.oceny(produkty_id_produktu,klient_id_klienta,data_wystawienia,opis)
values('13','1','2024-01-07','Telewizorek prima sorcik, sąsiad takiego nie ma'),
('7','2','2024-01-06','Dzięki tej Nokii mogłem cofnąć się wspomnieniami do czasów młodości, polecam!'),
('24','6','2024-01-05','Dobra gierka, idealna na prezent urodzinowy dla kuzyna');

/* #15 Uzupełnianie tabeli promocje */
insert into dbo.promocje(produkty_id_produktu,nazwa_promocji,cena_promocyjna,opis_promocji)
values('1','APPLE13PROMO','3000','Zniżka dwie stówki na Iphone13'),
('6','Miłośnik chińskich telefonów','1300','Teraz Twój chiński smartfon 200 złotych taniej!'),
('12','Urodziny Sony','1700','Z okazji urodzin Sony, telewizory z linii Bravia w nowych, niższych cenach');

/* #16 Uzupełnianie tabeli pozycje listy życzeń */

--Uzupełnianie tabeli pozycje listy życzeń tak, aby łączna cena przeliczała się automatycznie
-- i nie trzeba było jej wpisywać z palca
--zasada przeliczania : ilość(tabela pozycje listy życzeń)* cena_jednostkowa(tabela produkt);
insert into dbo.pozycje_listy(listy_zyczen_id_listy_zyczen,produkty_id_produktu,ilosc)
values('1','1','3');

SELECT
    WL.listy_zyczen_id_listy_zyczen,
    WL.produkty_id_produktu,
    WL.ilosc,
    P.cena_jednostkowa,
    WL.ilosc * P.cena_jednostkowa AS laczna_cena
FROM
    dbo.pozycje_listy  WL
JOIN
    dbo.produkty AS P ON WL.produkty_id_produktu = P.id_produktu;

UPDATE WL
SET WL.laczna_cena = WL.ilosc * P.cena_jednostkowa
FROM dbo.pozycje_listy AS WL
JOIN dbo.produkty AS P ON WL.produkty_id_produktu = P.id_produktu;

/* #17 Uzupełnianie tabeli zamówienia */
insert into dbo.zamowienia (klient_id_klienta,zam_statusy_id_zam_statusy,zam_platnosci_id_zam_platnosci,zam_dostawcy_id_zam_dostawcy,
adresy_dostawy_id_adres_dostawy,data_zamowienia,data_dostawy,data_platnosci,kwota_dostawy,kwota_zamowienia,id_listy_zyczen)
values('1','1','1','1','1','2024-01-12','2024-01-16','2024-01-12','9.99',null,null),
('2', '1', '1', '1', '2','2024-01-13', '2024-01-16', '2024-01-13','9.99', null, null),
('3', '1', '1', '1', '3','2024-01-14', '2024-01-16', '2024-01-14','9.99', null, null),
('4', '1', '1', '2', '4','2024-01-14', '2024-01-16', '2024-01-14','10', null, null);

/* #18 Uzupełnianie tabeli użycia kodów rabatowych*/
insert into dbo.uzycia_kodow(klient_id_klienta,kody_rabatowe_id_kodu_rabatowego,data_uzycia,zamowienia_id_zamowienia)
values('2','1','2024-01-13','3'),
('4','2','2024-01-14','4');

/* #19 Uzupełnianie tabeli zamówienia objete promocjami*/
insert into dbo.promocje_zamowienia(zamowienia_id_zamowienia,promocje_id_promocji,data_zarejestrowania)
values ('4','1','2024-01-14');

/* #20 Uzupełnianie tabeli pozycje zamówienia */

/*Kwerenda uzupełniająca pozycje zamówienia biorąca pod uwagę promocje(na produkty) oraz
rabaty (na całe zamówienia) oraz aktualizująca stan magazynowy dla danego produktu*/

insert into dbo.pozycje_zamowienia(zamowienia_id_zamowienia,produkty_id_produktu,cena,ilosc)
values ('4','1','0.00','2');

UPDATE produkty
Set stan_magazynowy = stan_magazynowy - dbo.pozycje_zamowienia.ilosc
from pozycje_zamowienia
where pozycje_zamowienia.produkty_id_produktu = produkty.id_produktu;


UPDATE pozycje_zamowienia
SET cena = ilosc * cena_jednostkowa
FROM pozycje_zamowienia
JOIN produkty ON pozycje_zamowienia.produkty_id_produktu = produkty.ID_produktu

UPDATE zamowienia
SET kwota_zamowienia = (
    SELECT SUM(
        CASE
            WHEN promocje.ID_promocji IS NOT NULL THEN promocje.cena_promocyjna * pozycje_zamowienia.ilosc
            ELSE pozycje_zamowienia.cena * pozycje_zamowienia.ilosc
        END
    ) + zamowienia.kwota_dostawy - COALESCE(SUM(kody_rabatowe.kwota_rabatu), 0)
    FROM pozycje_zamowienia
    LEFT JOIN uzycia_kodow ON uzycia_kodow.zamowienia_id_zamowienia = pozycje_zamowienia.zamowienia_id_zamowienia
    LEFT JOIN kody_rabatowe ON kody_rabatowe.ID_kodu_rabatowego = uzycia_kodow.kody_rabatowe_id_kodu_rabatowego
    LEFT JOIN Promocje ON promocje.produkty_id_produktu = pozycje_zamowienia.produkty_id_produktu
    WHERE pozycje_zamowienia.zamowienia_id_zamowienia = zamowienia.ID_zamowienia
    GROUP BY pozycje_zamowienia.zamowienia_id_zamowienia
)
FROM zamowienia
INNER JOIN pozycje_zamowienia ON zamowienia.ID_zamowienia = pozycje_zamowienia.zamowienia_id_zamowienia
LEFT JOIN Promocje ON promocje.produkty_id_produktu = pozycje_zamowienia.produkty_id_produktu;

/* #21 Uzupełnianie tabeli zwroty */
insert into dbo.zwroty (pozycje_zamowienia_zamowienia_id_zamowienia,pozycje_zamowienia_produkty_id_produktu,data_zwrotu,opis)
values('3','2','2024-01-15','Produkt dotarł z potłuczonym ekranem. Proszę o wymianę');


