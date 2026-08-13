SEMPLICE SISTEMA PER SIGNAGE.
Si tratta di uno script bash che mostra in sequeza diversi siti web per un numero
definito di secondi

## PREREQUISITI
Per costruire il pacchetto serve `dpkg-deb`.

## INSTALLAZIONE
Costruire il pacchetto dalla root del repository:

    bash scripts/build-deb.sh

Il comando produce il file `.deb` in `dist/`.

Installare il pacchetto:

    sudo apt install ./dist/bsignage_1.0.0-1_all.deb

L'installazione automatizza:

* installazione dei file in `/usr/sbin`, `/etc/bsignage`, `/etc/lightdm/lightdm.conf.d` e `/etc/firefox/policies`
* creazione dell'utente `kiosk-user` con home `/home/kiosk-user`
* creazione di `/home/kiosk-user/.config/openbox/autostart`
* configurazione dell'autologin di LightDM sulla sessione `openbox`
* lock della preferenza Firefox `browser.link.open_newwindow = 1`

## ROTAZIONE DELLO SCHERMO
La rotazione dello schermo può essere gestita su /etc/default/bsignage

## URL DA PRESENTARE
Possono essere gestiti su /etc/bsignage/bsegnage.conf utilizzando la sintassi indicata nel file

## ALTRE COSE UTILI DA FARE SU FIREFOX
* Abilitare i popup nei siti che dovete mostrare che necessitano di questa opzione
* Accettare i cookies nei sisti che dovete mostrare
* Se dovete mostrare video abilitare autoplay sui portali che decidete di usare

## USO
Modificare il file /etc/bsignage/bsignage.conf aggiungendo la lista dei siti da mostrare
Una volta modificata la lista riavviare il dm con

     sudo systemctl restart lightdm.service
