import os
import mysql.connector
from dotenv import load_dotenv

load_dotenv() #Ładuje plik .env 

polaczenie = mysql.connector.connect(
    host=os.getenv("DB_HOST"),
    port=int(os.getenv("DB_PORT")),
    user=os.getenv("DB_USER"),
    password=os.getenv("DB_PASSWORD"),
)

print("Połączono z MySQL:", polaczenie.is_connected())  #Sprawdza, czy jest połączenie między bazą danych a programem
polaczenie.close()