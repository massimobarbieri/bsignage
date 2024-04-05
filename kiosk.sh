#!/bin/bash

# Array con gli URL e la durata del sonno per ciascun sito
# TODO: Questo codice portarlo all'esterno creando un file di configurazione
urls=(
    "https://www.dscg.unimore.it/ 3"
    "http://www.aule.unimore.it/index.php?page=0&content=view_prenotazioni&vista=day&area=65&_lang=it 5"
    "http://www.aule.unimore.it/index.php?page=1&content=view_prenotazioni&vista=day&area=65&_lang=it 5"
    "http://www.aule.unimore.it/digitalSignage.php?layout=9 15"
    # Aggiungi altri siti come necessario
)

# Controlla se Chromium è installato
if ! command -v chromium &> /dev/null; then
    echo "Chromium non è installato. Assicurati di averlo installato prima di eseguire lo script."
    exit 1
fi

# Loop esterno per ciclare attraverso l'array
while true; do
    # Loop attraverso ogni URL nell'array
    for item in "${urls[@]}"; do
        # Estrai l'URL e la durata di sleep da ogni elemento dell'array
        url=$(echo "$item" | awk '{print $1}')
        sleep_duration=$(echo "$item" | awk '{print $2}')

        # Mostra l'URL
        echo "Apro $url per $sleep_duration secondi"

        # Apri Chromium con l'URL specificato
        chromium --no-first-run --disable --disable-translate --disable-infobars --disable-suggestions-service --disable-save-password-bubble --start-maximized --kiosk "$url" &
	#chromium "$url" &

	# Salva il PID di Chromium
        chromium_pid=$!

        # Aspetta per il numero di secondi specificato
        sleep "$sleep_duration"

        # Chiudi Chromium
        kill "$chromium_pid"

    done
done


