EMAIL MAPPAFIGYELO - HTA GUI v8

INDITAS

Elsodleges inditas:
  emailopener_gui.hta

Ha erre kattintva nem tortenik semmi, hasznald ezt:
  emailopener_gui_start.vbs

Ez nem nyit CMD ablakot. Csak annyit csinal, hogy a Windows sajat mshta.exe programjaval megnyitja a HTA feluletet.

MI VALTOZOTT v8-BAN?

- A HTA normal talcara minimalizalasa marad.
- A jobb also tray ikonra csukas tovabbra sincs benne.
- A Windowszal inditas tovabbra sem a GUI-t inditja, hanem a rejtett figyelot.
- Bekerult egy kulon GUI indito: emailopener_gui_start.vbs.
- A HTA SINGLEINSTANCE beallitasa ki lett kapcsolva, hogy egy beragadt regi HTA peldany ne akadalyozza az ujranyitast.

WINDOWSZAL INDULAS

A GUI-ban a kovetkezo opciot kell bekapcsolni:
  Windowszal induljon a rejtett figyeles, GUI nelkul

Ez a Startup mappaba parancsikont tesz, ami az emailopener_hidden_start.vbs fajlt inditja.
Ez rejtetten inditja az emailopener.bat figyelot, tehat Windows indulasakor nem jelenik meg GUI es nem jelenik meg CMD ablak.

LEALLITAS

Ha a rejtett figyelo fut:
1. Nyisd meg a GUI-t.
2. Kattints a Leallitas gombra.

A GUI egy exit.txt fajlt hoz letre, ezt a hatterben futo BAT figyelo par masodpercen belul eszreveszi, majd kilep.

FONTOS

A csomagot eloszor csomagold ki egy normal mappaba. Ne kozvetlenul a ZIP-bol inditsd.

Ha a Windows blokkolja a letoltott fajlokat:
1. Jobb klikk a ZIP fajlon.
2. Tulajdonsagok.
3. Ha van ilyen: Tiltas feloldasa / Unblock.
4. OK.
5. Ezutan csomagold ki ujra.
