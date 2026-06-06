Email mappafigyelo - README
============================

Rendeltetes
-----------
Ez az eszkoz egy kijelolt mappat figyel, es az oda bekerulo .eml vagy .msg fajlokat automatikusan megnyitja az alapertelmezett levelezoprogrammal. A feldolgozott fajlokat a figyelt mappan beluli processed almappaba helyezi.

Csomag tartalma
---------------
- emailopener_gui.hta
  A grafikus felulet. Ezt kell inditani.

- emailopener.bat
  A hatterben futo mappafigyelo motor. A GUI ezt inditja rejtetten.

- emailopener.ico
  Az alkalmazas ikonja.

- emailopener_gui_readme.txt / README_email_mappafigyelo.txt
  Hasznalati leiras.

Telepites
---------
1. Csomagold ki a ZIP teljes tartalmat egy tetszoleges mappaba.
2. Fontos: az emailopener_gui.hta, emailopener.bat es emailopener.ico ugyanabban a mappaban legyen.
3. Inditsd el az emailopener_gui.hta fajlt.

Hasznalat
---------
1. A Tallozas gombbal valaszd ki a figyelendo mappat.
2. Kattints a Figyeles inditasa gombra.
3. Ha a mappaba .eml vagy .msg fajl kerul, a program:
   - atmasolja a fajlt a processed almappaba,
   - torli az eredeti fajlt a figyelt mappabol,
   - megnyitja a processed almappaba kerult fajlt.
4. A Leallitas gombbal leallithato a figyeles.
5. Az ablak bezarasakor a figyeles is leall.

Windowszal indulas
------------------
Az Induljon el automatikusan a Windowszal jelolonegyzet bekapcsolasakor a program parancsikont hoz letre a felhasznalo Startup mappajaban.

Bekapcsolva:
- a GUI automatikusan elindul Windows bejelentkezes utan,
- a mentett mappaval elinditja a figyelest.

Kikapcsolva:
- a Startup parancsikon torlesre kerul.

Minimalizalas
-------------
Ez a verzio normal Windows talcara minimalizalhato. Nem a jobb also ertesitesi teruletre/tray ikonra csukodik.

Fontos tudnivalok
-----------------
- A program HTA alapu, ezert Windowson az mshta.exe futtatja.
- A .bat fajlt nem kell kulon elinditani.
- A GUI rejtetten inditja a mappafigyelest, ezert nem kell lathato CMD ablaknak megjelennie.
- A figyeles 3 masodpercenkent ellenorzi a kivalasztott mappat.
- A figyelt mappaban automatikusan letrejon egy processed almappa.
- A fajlok megnyitasa a Windows alapertelmezett .eml / .msg tarsitasat hasznalja.

Hibaelharitas
-------------

Nem indul a GUI
- Ellenorizd, hogy a ZIP ki lett-e csomagolva.
- Ne kozvetlenul a ZIP-bol inditsd a HTA fajlt.
- Ellenorizd, hogy az emailopener_gui.hta es az emailopener.bat ugyanabban a mappaban van-e.

A Tallozas gomb nem mukodik
- Ird vagy masold be kezzel a figyelendo mappa teljes eleresi utjat.
- Pelda: C:\Users\Felhasznalo\Documents\EmailInput

Nem nyilik meg az .eml vagy .msg fajl
- Ellenorizd, hogy van-e alapertelmezett program rendelve az adott fajltipushoz.
- .msg fajlokhoz altalaban Microsoft Outlook szukseges.
- .eml fajlokhoz Outlook, Windows Mail vagy mas kompatibilis levelezoprogram hasznalhato.

Nem indul automatikusan Windowszal
- Kapcsold ki, majd vissza az automatikus inditas jelolonegyzetet.
- Ellenorizd, hogy a program mappaja nem lett-e athelyezve a beallitas utan.
- Ha athelyezed a programot, az automatikus inditast ujra be kell kapcsolni.

Lathato CMD ablak jelenik meg
- A GUI-bol inditsd a figyelest, ne az emailopener.bat fajlt kozvetlenul.

Megjegyzes fejlesztoknek
------------------------
A GUI az emailopener_config.ini fajlba menti a beallitasokat ugyanabba a mappaba, ahol a HTA talalhato. A figyeles leallitasahoz exit.txt fajlt hoz letre, amit a batch motor figyel es kilepeskor torol.
