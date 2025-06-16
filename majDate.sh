#! /bin/sh

fichier="content/dates.md"

#!/bin/sh

fichier="content/dates"

# Fonction pour convertir un mois français en numéro (indépendamment de la casse)
mois_en_num() {
  case "$(echo "$1" | tr '[:upper:]' '[:lower:]')" in
    janvier) echo 01 ;;
    février) echo 02 ;;
    mars) echo 03 ;;
    avril) echo 04 ;;
    mai) echo 05 ;;
    juin) echo 06 ;;
    juillet) echo 07 ;;
    août) echo 08 ;;
    septembre) echo 09 ;;
    octobre) echo 10 ;;
    novembre) echo 11 ;;
    décembre) echo 12 ;;
    *) echo "??" ;;
  esac
}

ListPastLines(){
# Timestamp de la date d'aujourd'hui
timestamp_aujourdhui=$(date +%s)

while IFS= read -r ligne; do
  # Extraire la date encadrée de ** au début de ligne (avec ou sans tiret)
  case "$ligne" in
    -*\*\**\*\** | \*\**\*\**)
      # Extraire le texte entre **...**
      date_txt=$(echo "$ligne" | sed -n 's/.*\*\*\([^*][^*]*\)\*\*.*/\1/p')

      # Découper la date en mots
      set -- $date_txt
      jour_nom=$1
      jour_num=$2
      mois_nom=$3
      annee=$4

      if [ -n "$jour_nom" ] && [ -n "$jour_num" ] && [ -n "$mois_nom" ] && [ -n "$annee" ]; then
        mois_num=$(mois_en_num "$mois_nom")

        if [ "$mois_num" != "??" ]; then
          # Format ISO de la date extraite
          date_iso="$annee-$mois_num-$(printf %02d "$jour_num")"

          # Convertir en timestamp
          timestamp_date=$(date -d "$date_iso" +%s 2>/dev/null)

          if [ -n "$timestamp_date" ] && [ "$timestamp_date" -lt "$timestamp_aujourdhui" ]; then
            echo "$ligne"
          fi
        fi
      fi
      ;;
  esac
done < "$fichier"
}

list=$(ListPastLines)

echo $list
