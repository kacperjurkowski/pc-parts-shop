CREATE DATABASE IF NOT EXISTS sklep_pc;
USE sklep_pc;

CREATE TABLE Uzytkownik (
    uzytkownikID int PRIMARY KEY AUTO_INCREMENT,                -- klucz główny uzytkownikID
    rola VARCHAR(35) NOT NULL DEFAULT 'klient',                 -- rola klient/administrator
    imie VARCHAR(35),                                           -- imie string
    nazwisko VARCHAR(35),                                       -- nazwisko string
    email VARCHAR(255) NOT NULL,                                -- email string
    haslo_hash VARCHAR(255) NOT NULL,                           -- haslo_hash string, nigdy hasło jawne
    telefon VARCHAR(15),                                        -- telefon string
    is_active BOOLEAN NOT NULL DEFAULT TRUE,                    -- pole audytowe (dezaktywacja konta)
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,     -- pole audytowe (data utworzenia)
    UNIQUE(email),                                              -- unikalny e-mail (nie może się powtarzać)
    CHECK(rola IN ('klient', 'administrator'))                  -- tylko dwie wartości (klient/administrator)
    );

CREATE TABLE Zamowienie (
    zamowienieID int PRIMARY KEY AUTO_INCREMENT,                                            -- klucz główny zamowienieID
    uzytkownikID int NOT NULL,                                                              -- klucz obcy uzytkownikID z tabeli Uzytkownik
    status VARCHAR(50) NOT NULL DEFAULT 'koszyk',                                           -- status koszyk/nowe/opłacone/wysłane/dostarczone/anulowane
    data_zlozenia DATETIME NULL,                                                            -- data_zlozenia zamówienia w postaci RRRR-MM-DD HH:MM:SS
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,                                 -- pole audytowe w postaci RRRR-MM-DD HH:MM:SS
    updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,     -- pole audytowe w postaci RRRR-MM-DD HH:MM:SS, aktualizowane
    CHECK(status IN ('koszyk', 'nowe', 'opłacone', 'wysłane', 'dostarczone', 'anulowane')), -- tylko wartości (koszyk, nowe, opłacone, wysłane, dostarczone, anulowane)
    FOREIGN KEY(uzytkownikID) REFERENCES Uzytkownik(uzytkownikID)                           -- zamówienie (lub koszyk) należy do istniejącego użytkownika
);

CREATE TABLE Konfiguracja (
    konfiguracjaID int PRIMARY KEY AUTO_INCREMENT,                  -- klucz główny konfiguracjaID
    uzytkownikID int NOT NULL,                                      -- klucz obcy uzytkownikID z tabeli Uzytkownik
    token VARCHAR(50) NOT NULL,                                     -- token string
    UNIQUE(token),                                                  -- token jest unikalny 
    FOREIGN KEY(uzytkownikID) REFERENCES Uzytkownik(uzytkownikID)   -- zestaw należy do istniejącego użytkownika
);

CREATE TABLE Typ (
    typID int PRIMARY KEY AUTO_INCREMENT,           -- klucz główny typID
    rodzaj VARCHAR(50) NOT NULL,                    -- rodzaj string
    UNIQUE(rodzaj)                                  -- rodzaj jest unikalny
);

CREATE TABLE Produkt (
    produktID int PRIMARY KEY AUTO_INCREMENT,       -- klucz główny produktID
    nazwa VARCHAR(150) NOT NULL,                    -- nazwa string
    typID int NOT NULL,                             -- klucz obcy typID z tabeli Typ 
    cena DECIMAL(10,2) NOT NULL,                    -- cena decimal (cena z dokładnością do groszy)
    dostepnosc int NOT NULL,                        -- dostepnosc int
    is_active BOOLEAN NOT NULL DEFAULT TRUE,        -- pole audytowe, FALSE = produkt wycofany z oferty (zostaje w historii zamówień)
    CHECK(cena > 0),                                -- tylko cena > 0
    CHECK(dostepnosc >= 0),                         -- tylko dostepnosc >= 0
    FOREIGN KEY(typID) REFERENCES Typ(typID)        -- produkt musi mieć typ istniejący w słowniku Typ
);

CREATE TABLE PozycjaZamowienia (
    pozycjaZamowieniaID int PRIMARY KEY AUTO_INCREMENT,                 -- klucz główny pozycjaZamowieniaID
    zamowienieID int NOT NULL,                                          -- klucz obcy zamowienieID z tabeli Zamowienie 
    produktID int NOT NULL,                                             -- klucz obcy produktID z tabeli Produkt 
    cena DECIMAL(10,2),                                                 -- cena decimal (cena z dokładnością do groszy), pusta w koszyku, uzupełniana przy złożeniu zamówienia
    ilosc int NOT NULL,                                                 -- ilosc int
    UNIQUE(zamowienieID, produktID),                                    -- produkt występuje w danym zamówieniu najwyżej raz (liczbę sztuk mówi ilosc)
    CHECK(cena IS NULL OR cena > 0),                                    -- tylko cena pusta lub > 0
    CHECK(ilosc > 0),                                                   -- tylko ilosc > 0
    FOREIGN KEY (zamowienieID) REFERENCES Zamowienie(zamowienieID),     -- pozycja należy do istniejącego zamówienia
    FOREIGN KEY (produktID) REFERENCES Produkt(produktID)               -- pozycja dotyczy istniejącego produktu
);

CREATE TABLE PozycjaKonfiguracji (
    pozycjaKonfiguracjiID int PRIMARY KEY AUTO_INCREMENT,                   -- klucz główny pozycjaKonfiguracjiID
    konfiguracjaID int NOT NULL,                                            -- klucz obcy konfiguracjaID z tabeli Konfiguracja
    produktID int NOT NULL,                                                 -- klucz obcy produktID z tabeli Produkt
    ilosc int NOT NULL,                                                     -- ilosc int
    UNIQUE(konfiguracjaID, produktID),                                      -- produkt występuje w danym zestawie najwyżej raz (liczbę sztuk mówi ilosc)
    CHECK(ilosc > 0),                                                       -- tylko ilosc > 0
    FOREIGN KEY(konfiguracjaID) REFERENCES Konfiguracja(konfiguracjaID),    -- pozycja należy do istniejącego zestawu
    FOREIGN KEY(produktID) REFERENCES Produkt(produktID)                    -- pozycja dotyczy istniejącego produktu
);  