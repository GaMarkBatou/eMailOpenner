Email mappafigyelo - HTA GUI v11
=================================

Cel
---
A program egy kivalasztott mappat figyel. Ha .eml vagy .msg fajlt talal, atmasolja a processed almappaba, torli az eredetit, majd megnyitja az atmasolt fajlt.

Mi valtozott a v11-ben?
-----------------------
A Windowszal inditas iranya vissza lett allitva HTA alapura:

- Windows indulaskor a HTA GUI indul el.
- A HTA GUI automatikusan elinditja a hatterben futo figyelest.
- A figyeles tovabbra is a GUI-tol fuggetlenul fut tovabb.
- A GUI kesobb bezarhato, a figyeles nem all le.
- Leallitani tovabbra is csak a GUI Leallitas gombjaval kell.

Ez azert keszult igy, mert a sima rejtett VBS automatikus inditas egyes gepeken nem indult el megbizhatoan, mikozben a HTA inditas korabban mukodott.

Inditas kezzel
--------------
A GUI inditasa:

  emailopener_gui.hta

Ha duplakattintasra nem nyilik meg, hasznald ezt:

  emailopener_gui_start.vbs

Alap hasznalat
--------------
1. Inditsd el az emailopener_gui.hta fajlt.
2. Tallozas gombbal valaszd ki a figyelendo mappat.
3. Kattints a Figyeles inditasa gombra.
4. A GUI bezarhato, a figyeles tovabb fut.
5. Leallitashoz nyisd meg ujra a GUI-t, majd kattints a Leallitas gombra.

Windowszal inditas
------------------
A jelolonegyzet neve:

  Windowszal induljon a GUI, es automatikusan inditsa a figyelest

Bekapcsolas utan Windows indulaskor a HTA GUI nyilik meg, majd automatikusan meghivja a figyeles inditasat.

A beallitas ket helyre is bekerul:

1. Startup mappas parancsikon
2. HKCU Run registry bejegyzes

Fontos: a beallitas utan a csomag mappajat ne helyezd at, mert az automatikus inditas az aktualis fajlhelyre mutat.

Leallitas
---------
A hatterben futo figyelest a GUI Leallitas gombja allitja le.

A GUI ablak bezarasa vagy talcara lerakasa nem allitja le a figyelest.

Fajlok
------
emailopener_gui.hta
  Grafikus felulet. Windows indulaskor is ez indul, ha az automatikus inditas be van kapcsolva.

emailopener_gui_start.vbs
  Alternativ GUI indito, ha a .hta tarsitas nem mukodik.

emailopener_hidden_start.vbs
  Rejtett hatterindito. A GUI ezt hivja meg a BAT rejtett inditasahoz.

emailopener.bat
  A tenyleges mappafigyelo motor.

emailopener.ico
  Ikon.

emailopener_config.ini
  Automatikusan jon letre. A beallitott figyelendo mappat tarolja.

exit.txt
  Ideiglenes leallitasi jelzo fajl. A Leallitas gomb hozza letre.

emailopener_startup_log.txt
  Inditasi ellenorzo naplo, amelyet a rejtett indito irhat.

Hibaellenorzes
--------------
Ha Windowszal nem indulna:

1. Inditsd el kezzel az emailopener_gui.hta fajlt.
2. Ellenorizd, hogy a figyelendo mappa meg letezik-e.
3. Kapcsold ki, majd vissza a Windowszal inditas jelolonegyzetet.
4. Ne helyezd at a csomag mappajat a beallitas utan.

ZIP tiltasanak feloldasa
------------------------
Ha a HTA/VBS nem indul:

1. Jobb klikk a ZIP fajlon.
2. Tulajdonsagok.
3. Tiltas feloldasa / Unblock, ha van ilyen opcio.
4. Ezutan csomagold ki ujra.
