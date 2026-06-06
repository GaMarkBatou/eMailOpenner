Email mappafigyelo - README
============================

Rendeltetes
-----------
Ez az eszkoz egy kijelolt mappat figyel, es az oda bekerulo .eml vagy .msg fajlokat automatikusan megnyitja az alapertelmezett levelezoprogrammal. A feldolgozott fajlokat a figyelt mappan beluli processed almappaba helyezi.

Csomag tartalma
---------------
- emailopener_gui.hta
  Grafikus felulet. Ezt csak beallitasra, kezi inditasra vagy leallitasra kell megnyitni.

- emailopener.bat
  A hatterben futo mappafigyelo motor.

- emailopener_hidden_start.vbs
  Rejtett indito. Windows indulaskor ez indul el, es ez inditja rejtetten az emailopener.bat fajlt.

- emailopener.ico
  Az alkalmazas ikonja.

- README_email_mappafigyelo.txt
  Ez a hasznalati leiras.

Telepites
---------
1. Csomagold ki a ZIP teljes tartalmat egy tetszoleges mappaba.
2. Fontos: az osszes fajl maradjon ugyanabban a mappaban.
3. Inditsd el az emailopener_gui.hta fajlt.
4. Valaszd ki a figyelendo mappat.
5. Kattints a Mentes gombra.

Hasznalat GUI-bol
-----------------
1. A Tallozas gombbal valaszd ki a figyelendo mappat.
2. Kattints a Figyeles inditasa gombra.
3. Ha a mappaba .eml vagy .msg fajl kerul, a program:
   - atmasolja a fajlt a processed almappaba,
   - torli az eredeti fajlt a figyelt mappabol,
   - megnyitja a processed almappaba kerult fajlt.
4. A Leallitas gombbal leallithato a figyeles.

Windowszal indulas GUI nelkul
-----------------------------
Az uj verzio lenyege, hogy Windows indulaskor mar nem a GUI indul el.

Ha bekapcsolod ezt:

  Windowszal induljon a rejtett figyeles, GUI nelkul

akkor a program parancsikont hoz letre a felhasznalo Startup mappajaban.
Ez a parancsikon az emailopener_hidden_start.vbs fajlt inditja, amely rejtetten elinditja az emailopener.bat figyelot.

Eredmeny:
- Windows indulaskor nem jelenik meg GUI ablak.
- Nem jelenik meg CMD ablak.
- A mappafigyeles megis elindul a korabban mentett mappaval.

Rejtett figyeles leallitasa
---------------------------
Ha a figyeles Windowszal indult el rejtetten:

1. Nyisd meg az emailopener_gui.hta fajlt.
2. Kattints a Leallitas gombra.
3. A GUI letrehoz egy exit.txt fajlt.
4. A hatterben futo batch figyelo ezt eszleli, majd par masodpercen belul kilep.

Fontos: a GUI nem feltetlenul tudja biztosan kijelezni, hogy a Windowszal indult rejtett figyeles eppen fut-e. A Leallitas gomb ettol fuggetlenul mukodik, mert a hatterfolyamat az exit.txt fajlt figyeli.

Automatikus inditas kikapcsolasa
--------------------------------
1. Nyisd meg az emailopener_gui.hta fajlt.
2. Vedd ki a pipat a Windowszal induljon a rejtett figyeles, GUI nelkul opciobol.
3. A Startup parancsikon torlesre kerul.

Minimalizalas
-------------
A GUI normal Windows talcara minimalizalhato. Nem a jobb also ertesitesi teruletre/tray ikonra csukodik.

Fontos tudnivalok
-----------------
- A GUI HTA alapu, ezert Windowson az mshta.exe futtatja.
- A rejtett inditast a wscript.exe futtatja.
- A .bat fajlt nem kell kulon elinditani.
- A figyeles 3 masodpercenkent ellenorzi a kivalasztott mappat.
- A figyelt mappaban automatikusan letrejon egy processed almappa.
- A fajlok megnyitasa a Windows alapertelmezett .eml / .msg tarsitasat hasznalja.

Hibaelharitas
-------------

Windowszal nem indul el a figyeles
- Nyisd meg a GUI-t.
- Ellenorizd, hogy a figyelendo mappa ki van-e valasztva.
- Kattints a Mentes gombra.
- Kapcsold ki, majd vissza az automatikus inditast.
- Ne helyezd at a program mappajat az automatikus inditas beallitasa utan. Ha athelyezed, kapcsold be ujra az automatikus inditast.

Nem nyilik meg az .eml vagy .msg fajl
- Ellenorizd, hogy van-e alapertelmezett program rendelve az adott fajltipushoz.
- .msg fajlokhoz altalaban Microsoft Outlook szukseges.
- .eml fajlokhoz Outlook, Windows Mail vagy mas kompatibilis levelezoprogram hasznalhato.

Lathato CMD ablak jelenik meg
- Ne az emailopener.bat fajlt inditsd kozvetlenul.
- Windowszal inditashoz a GUI-ban kapcsold be a rejtett figyelest.

Megjegyzes fejlesztoknek
------------------------
A GUI az emailopener_config.ini fajlba menti a beallitasokat ugyanabba a mappaba, ahol a HTA talalhato.
A rejtett indito ebből olvassa ki a figyelendo mappat.
A figyeles leallitasahoz a GUI exit.txt fajlt hoz letre, amit a batch motor figyel es kilepeskor torol.
