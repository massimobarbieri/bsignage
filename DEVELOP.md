# HOW BSIGNAGE WORKS?
**bsignage** è una applicazione estremamente semplice che trasforma una Debian in un totem per fare Digital Signage. Si tratta di uno script bash che mostra in sequeza diverse pagine web per un numero definito di secondi.

Lo script gira in un ambiente *Debian*, con *Openbox* all'interno della session e dell'utente *kiosk-user*. Il Desktop Environment è gestito da *LightDM* sul quale è impostato l'autologin dell'utente *kiosk-user*. Una volta effettualto il login nel file `/home/kiosk-user/.config/openbox/autostart` viene eseguita la rotazione dello schermo, impostata nel file di configurazione `/etc/default/bsignage` e l'esecuzione di **bsignage**.

**bsignage** legge il file di configurazione `/etc/bsignage/bsignage.conf` nel quale sono elencate la pagine das mostrare e il numero di secondi per pagina.

bsignage è pacchettizzata in un file .deb che colloca nella corretta posizione lo script e i file di configurazione, installa le dipendenze necessarie e effettua le operazioni necessarie post-installazione.

