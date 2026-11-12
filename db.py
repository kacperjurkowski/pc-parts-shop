import os
import mysql.connector
from dotenv import load_dotenv

load_dotenv()                               #Ładowanie gotowego pliku .env z 

def get_connection():                       #Funkcja, która wywołuje każdy endpoint, a połączenie od razu wskazuje na bazę database = sklep_pc.
    return mysql.connector.connect(
        host=os.getenv("DB_HOST"),
        port=int(os.getenv("DB_PORT", 3306)),
        user=os.getenv("DB_USER"),
        password=os.getenv("DB_PASSWORD"),
        database=os.getenv("DB_NAME"),
    )