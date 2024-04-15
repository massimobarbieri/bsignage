SEMPLICE SISTEMA PER SIGNAGE.
Si tratta di uno script bash che mostra in sequeza diversi siti web per un numero
definito di secondi

## PREREQUISITI
Per iniziare serve un sistema GNU Linux con openbox e autologin su un utente.

Creare l'utente kiosk-user che effettuerà il login automaticamente

    useradd -m kiosk-user

Installare il software necessario

    apt install sudo xorg firefox-esr openbox lightdm

Editare /etc/lightdm/lightdm.conf per abilitare autologin aggiungendo le righe seguenti

    autologin-user=kiosk-user

    user-session=openbox

Creare la directory con i file di configurazione

    mkdir -p /home/kiosk-user/.config/openbox

Creare il file /home/kiosk-user/.config/openbox/autostart con quanto segue

    xrandr -o left -r 60

    xset -dpms s off

    /usr/sbin/bsignage

Configurare firefox visitando la pagina about:config e settando la voce 

   browser.link.open_newwindow = 1

Ulteriori informazioni sono disponibili qui: https://kb.mozillazine.org/Browser.link.open_newwindow

## INSTALLAZIONE
Scaricare da github il file bsignage e metterlo dentro /usr/sbin permettendo l'esecuzione all'utente kiosk-user
Creare la cartella /etc/bsignage e mettere nella cartella il file bsignage.conf scaricato da github

## ALTRE COSE UTILI DA FARE SU FIREFOX
* Abilitare i popup nei siti che dovete mostrare che necessitano di questa opzione
* Accettare i cookies nei sisti che dovete mostrare
* Se dovete mostrare video abilitare autoplay sui portali che decidete di usare

## USO
Modificare il file /etc/bsignage/bsignage.conf aggiungendo la lista dei siti da mostrare
Una volta modificata la lista riavviare il dm con

     sudo systemctl restart lightdm.service
