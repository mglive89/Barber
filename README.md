# Specchio Studio

PWA per barbershop e parrucchiere: riconosce il viso del cliente con la fotocamera e consiglia taglio, barba e colore adatti.

**App:** https://mglive89.github.io/Barber/

## Funzioni
- Fotocamera live con indicatori di posa, luce e distanza; lo scatto analizza 10 fotogrammi. Le foto caricate vengono inquadrate da sole sul viso.
- Forma del viso (ovale, rotondo, quadrato, allungato, cuore, diamante, triangolo), correggibile a mano.
- Carnagione e sottotono, colore occhi, colore capelli attuale.
- Tagli adatti e da evitare per uomo e donna, barba, tavolozza colori.
- Prova colore sui capelli del cliente, con intensità e confronto prima / dopo.
- Archivio clienti sul dispositivo (foto solo con consenso), ricerca, backup e importazione.
- Nome, logo e contatti del salone sulla scheda da stampare o salvare in PDF.
- Funziona offline dopo la prima apertura. Nessuna foto viene inviata a server: il riconoscimento (MediaPipe) gira sul dispositivo.

## Installazione
- **Android / Chrome / Edge:** apri il link e premi «Installa app».
- **iPhone / iPad (Safari):** Condividi → «Aggiungi alla schermata Home».

## Sviluppo
- Il sorgente è `src/index.html`. Dopo una modifica esegui `./build.sh`: rigenera `index.html` e `sw.js` e aggiorna la versione della cache, così i dispositivi scaricano la nuova versione.
- Prova in locale: `python3 -m http.server 8000` e apri http://localhost:8000.
- `vendor/` contiene MediaPipe Tasks Vision 0.10.14 e i modelli Face Landmarker e Hair Segmenter (rinominati `.wasm`).
