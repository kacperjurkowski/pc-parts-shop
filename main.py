from fastapi import FastAPI
from db import get_connection

app = FastAPI()     #Tworzenie obiektu w pamięci

@app.get("/produkty")               #@app.get / @app.post / @app.put / @app.delete
def lista_produktow():
    polaczenie = get_connection()
    kursor = polaczenie.cursor(dictionary=True)
    kursor.execute("""
        SELECT p.produktID, p.nazwa, t.rodzaj AS typ, p.cena, p.dostepnosc
        FROM Produkt p
        JOIN Typ t ON t.typID = p.typID
        WHERE p.is_active = TRUE
        ORDER BY p.nazwa
    """)
    produkty = kursor.fetchall()
    kursor.close()
    polaczenie.close()
    return produkty