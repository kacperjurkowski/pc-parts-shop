INSERT INTO Uzytkownik (uzytkownikID, rola, imie, nazwisko, email, haslo_hash, telefon, is_active, created_at) -- Wstawianie danych dla tabeli Uzytkownik
VALUES
    (1, 'klient', 'Bartosz', 'Starkowski', 'bartosz.starkowski@example.com', 'hash_testowy_1', '595 404 129', TRUE, '2026-11-12 21:26:00'),
    (2, 'klient', 'Patryk', 'Małecki', 'mallecckii@example.com', 'hash_testowy_2', '566 322 814', TRUE, '2025-06-11 13:22:00'),
    (3, 'klient', 'Tomasz', 'Chmurowski', 'tomeczek.chmurka@example.com', 'hash_testowy_3', '342 424 546', TRUE, '2025-04-26 09:47:00'),
    (4, 'administrator', 'Kacper', 'Jurkowski', 'kacper.jurkowski122@example.com', 'hash_testowy_4', '424 123 553', TRUE, '2025-10-10 14:18:00'),
    (5, 'administrator', 'Mateusz', 'Woźniak', 'mati_wozniak67@example.com', 'hash_testowy_5', '755 123 424', TRUE, '2025-10-10 14:16:00'),
    (6, 'klient', 'Wiktor', 'Marcinek', 'raptoressa@example.com', 'hash_testowy_6', '123 456 789', TRUE, '2026-11-12 01:42:00'),
    (7, 'klient', 'Patryk', 'Talerz', 'liczbapido@example.com', 'hash_testowy_7', '222 444 555', FALSE, '2025-01-01 02:26:00'),
    (8, 'klient', 'Kuba', 'Cebula', 'superautomamy@example.com', 'hash_testowy_8', '222 222 221', TRUE, '2026-01-29 05:23:00'),
    (9, 'klient', 'Igor', 'Romanowski', 'igorrecky@example.com', 'hash_testowy_9', '482 492 411', TRUE, '2025-07-07 06:17:00'),
    (10, 'klient', 'Hubert', 'Eldorado', 'huber.eldorado7@example.com', 'hash_testowy_10', '876 455 681', FALSE, '2025-05-25 16:38:00');

INSERT INTO Zamowienie (zamowienieID, uzytkownikID, status, data_zlozenia, created_at, updated_at)             -- Wstawianie danych dla tabeli Zamowienie
VALUES
    (1, 2, 'dostarczone', '2026-09-03 18:22:00', '2026-09-03 18:10:00', '2026-09-06 10:00:00'),
    (2, 3, 'dostarczone', '2026-09-10 20:05:00', '2026-09-10 19:50:00', '2026-09-13 12:30:00'),
    (3, 9, 'wysłane',     '2026-10-02 09:14:00', '2026-10-02 09:00:00', '2026-10-03 08:00:00'),
    (4, 7, 'dostarczone', '2025-11-20 17:35:00', '2025-11-20 17:20:00', '2025-11-24 11:15:00'),
    (5, 8, 'opłacone',    '2026-11-05 21:30:00', '2026-11-05 21:20:00', '2026-11-05 21:32:00'),
    (6, 2, 'anulowane',   '2026-10-15 16:00:00', '2026-10-15 15:40:00', '2026-10-15 18:45:00'),
    (7, 6, 'nowe',        '2026-11-12 02:05:00', '2026-11-12 01:50:00', '2026-11-12 02:05:00'),
    (8, 1, 'koszyk',      NULL,                  '2026-11-12 21:40:00', '2026-11-12 21:45:00'),
    (9, 3, 'koszyk',      NULL,                  '2026-11-10 17:00:00', '2026-11-10 17:05:00');

INSERT INTO Konfiguracja (konfiguracjaID, uzytkownikID, token)                                                 -- Wstawianie danych dla tabeli Konifguracja
VALUES
    (1, 1, 'k7Qx9Lm2'),
    (2, 9, 'Zp4Rt8Wa'),
    (3, 6, 'Hs3Nv6Qe');
    
INSERT INTO Typ (typID, rodzaj)                                                                                -- Wstawianie danych dla tabeli Typ
VALUES
    (1, 'Procesor'),
    (2, 'Płyta główna'),
    (3, 'RAM'),
    (4, 'Karta graficzna'),
    (5, 'Zasilacz'),
    (6, 'Dysk');

INSERT INTO Produkt (produktID, nazwa, typID, cena, dostepnosc, is_active)                                     -- Wstawianie danych dla tabeli Produkt
VALUES
    (1,  'AMD Ryzen 5 7600',                          1,  899.00, 14, TRUE),
    (2,  'AMD Ryzen 7 7800X3D',                       1, 1799.00,  6, TRUE),
    (3,  'Intel Core i5-14400F',                      1,  749.00, 20, TRUE),
    (4,  'MSI B650 Tomahawk WiFi',                    2,  999.00,  8, TRUE),
    (5,  'ASUS TUF Gaming B650-Plus',                 2,  849.00, 10, TRUE),
    (6,  'Gigabyte B760 Gaming X DDR4',               2,  599.00, 12, TRUE),
    (7,  'Kingston Fury Beast 32 GB DDR5 6000',       3,  449.00, 25, TRUE),
    (8,  'Corsair Vengeance LPX 16 GB DDR4 3200',     3,  189.00, 30, TRUE),
    (9,  'Gigabyte GeForce RTX 4070 SUPER Windforce', 4, 2799.00,  7, TRUE),
    (10, 'Sapphire Radeon RX 7800 XT Pulse',          4, 2399.00,  0, TRUE),
    (11, 'Corsair RM750e',                            5,  449.00, 15, TRUE),
    (12, 'be quiet! Pure Power 12 M 550W',            5,  379.00,  9, TRUE),
    (13, 'Samsung 990 PRO 2 TB',                      6,  799.00, 18, TRUE),
    (14, 'Crucial MX500 1 TB',                        6,  259.00, 22, TRUE),
    (15, 'AMD Ryzen 5 5600X',                         1,  549.00,  3, FALSE);

INSERT INTO PozycjaZamowienia (pozycjaZamowieniaID, zamowienieID, produktID, cena, ilosc)                      -- Wstawianie danych dla tabeli PozycjaZamowienia
VALUES
    (1, 1, 13,  799.00, 1),
    (2, 1,  7,  449.00, 1),
    (3, 2,  1,  899.00, 1),
    (4, 2,  5,  849.00, 1),
    (5, 2,  7,  449.00, 2),
    (6, 2,  9, 2799.00, 1),
    (7, 2, 11,  449.00, 1),
    (8, 3,  3,  749.00, 3),
    (9, 3,  6,  599.00, 3),
    (10, 3,  8,  189.00, 6),
    (11, 3, 14,  259.00, 3),
    (12, 3, 12,  379.00, 3),
    (13, 4, 15,  599.00, 1),
    (14, 4, 14,  279.00, 1),
    (15, 5,  2, 1749.00, 1),
    (16, 5,  4,  999.00, 1),
    (17, 6, 10, 2399.00, 1),
    (18, 7, 13,  799.00, 1),
    (19, 7, 11,  449.00, 1),
    (20, 8,  2,    NULL, 1),
    (21, 8,  9,    NULL, 1),
    (22, 9, 12,    NULL, 1);

INSERT INTO PozycjaKonfiguracji (pozycjaKonfiguracjiID, konfiguracjaID, produktID, ilosc)                      -- Wstawianie danych dla tabeli PozycjaKonfiguracji
VALUES
    (1, 1,  2, 1),
    (2, 1,  4, 1),
    (3, 1,  7, 1),
    (4, 1,  9, 1),
    (5, 1, 11, 1),
    (6, 2,  3, 1),
    (7, 2,  5, 1),
    (8, 2,  8, 2),
    (9, 2, 10, 1),
    (10, 2, 12, 1),
    (11, 3,  1, 1),
    (12, 3,  6, 1),
    (13, 3,  7, 1),
    (14, 3, 13, 1);