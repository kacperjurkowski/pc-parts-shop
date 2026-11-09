# pc-parts-shop
Sklep internetowy z podzespołami komputerowymi i konfiguratorem zgodności. Projekt zaliczeniowy z przedmiotu Bazy Danych.

## Instalacja MySQL (Windows)

1. Pobierz [**MySQL Installer**](https://dev.mysql.com/downloads/installer/)
   - wybierz **mysql-installer-community-8.0.46.0.msi**
2. Uruchom instalator i wybierz typ instalacji **Custom**, a następnie zaznacz:
   - `MySQL Servers → MySQL Server → MySQL Server 8.0 → MySQL Server 8.0.46 – X64`,
   - `Applications → MySQL Workbench → MySQL Workbench 8.0 → wersja X64`.
3. Kliknij **Execute**, aby zainstalować wybrane produkty, a następnie przejdź do konfiguracji serwera.
4. W konfiguracji serwera:
   - `Config Type:` Development Computer, port 3306,
   - `Authentication Method:` pozostaw zalecaną opcję (Use Strong Password Encryption),
   - `Accounts and Roles:` ustaw własne hasło i wpisz je w **.env**,
   - zaznacz opcję uruchamiania MySQL jako **usługi Windows** przy starcie systemu.
5. Sprawdź, czy serwer działa: uruchom MySQL Workbench i połącz się z `localhost:3306` jako `root`, aby sprawdzić, czy serwer działa.


### Instalacja bibliotek Pythona

W głównym folderze projektu wykonaj:

```bash
python -m pip install -r requirements.txt
```
