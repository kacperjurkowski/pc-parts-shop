CREATE DATABASE IF NOT EXISTS sklep_pc;
USE sklep_pc;

CREATE TABLE Uzytkownik (
    uzytkownikID int PRIMARY KEY AUTO_INCREMENT,
    rola VARCHAR(35) NOT NULL DEFAULT 'klient',
    imie VARCHAR(35),
    nazwisko VARCHAR(35), 
    email VARCHAR(255) NOT NULL,
    haslo_hash VARCHAR(255) NOT NULL,
    telefon VARCHAR(15),
    is_active BOOLEAN NOT NULL DEFAULT TRUE,
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    UNIQUE(email),
    CHECK(rola IN ('klient', 'administrator'))
    );

CREATE TABLE Zamowienie (
    zamowienieID int PRIMARY KEY AUTO_INCREMENT,
    uzytkownikID int NOT NULL,
    status VARCHAR(50) NOT NULL DEFAULT 'koszyk',
    data_zlozenia DATETIME NULL,
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CHECK(status IN ('koszyk', 'nowe', 'opłacone', 'wysłane', 'dostarczone', 'anulowane')),
    FOREIGN KEY(uzytkownikID) REFERENCES Uzytkownik(uzytkownikID)
);

CREATE TABLE Konfiguracja (
    konfiguracjaID int PRIMARY KEY AUTO_INCREMENT,
    uzytkownikID int NOT NULL,
    token VARCHAR(50) NOT NULL,
    UNIQUE(token),
    FOREIGN KEY(uzytkownikID) REFERENCES Uzytkownik(uzytkownikID)
);

CREATE TABLE Typ (
    typID int PRIMARY KEY AUTO_INCREMENT,
    rodzaj VARCHAR(50) NOT NULL,
    UNIQUE(rodzaj)
);

CREATE TABLE Produkt (
    produktID int PRIMARY KEY AUTO_INCREMENT,
    nazwa VARCHAR(150) NOT NULL,
    typID int NOT NULL,
    cena DECIMAL(10,2) NOT NULL,
    dostepnosc int NOT NULL,
    is_active BOOLEAN NOT NULL DEFAULT TRUE,
    CHECK(cena > 0),
    CHECK(dostepnosc >= 0),
    FOREIGN KEY(typID) REFERENCES Typ(typID)
);

CREATE TABLE PozycjaZamowienia (
    pozycjaZamowieniaID int PRIMARY KEY AUTO_INCREMENT,
    zamowienieID int NOT NULL,
    produktID int NOT NULL,
    cena DECIMAL(10,2),
    ilosc int NOT NULL,
    UNIQUE(zamowienieID, produktID),
    CHECK(cena IS NULL OR cena > 0),
    CHECK(ilosc > 0),
    FOREIGN KEY (zamowienieID) REFERENCES Zamowienie(zamowienieID),
    FOREIGN KEY (produktID) REFERENCES Produkt(produktID)
);

CREATE TABLE PozycjaKonfiguracji (
    pozycjaKonfiguracjiID int PRIMARY KEY AUTO_INCREMENT,
    konfiguracjaID int NOT NULL,
    produktID int NOT NULL,
    ilosc int NOT NULL,
    UNIQUE(konfiguracjaID, produktID),
    CHECK(ilosc > 0),
    FOREIGN KEY(konfiguracjaID) REFERENCES Konfiguracja(konfiguracjaID),
    FOREIGN KEY(produktID) REFERENCES Produkt(produktID)
);  