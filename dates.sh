#!/bin/bash

set -euo pipefail

DATES="content/dates.md"
PASSES="content/infos/ConcertsPasses.md"

# Vérifier les fichiers
[[ -f "$DATES" && -f "$PASSES" ]] || {
    echo "Erreur : fichier manquant." >&2
    exit 1
}

# Extraire la première date (première ligne commençant par "- ")
DATE=$(sed -n '/^- /{p;q;}' "$DATES")

[[ -n "$DATE" ]] || {
    echo "Aucune date future à transférer." >&2
    exit 1
}

# Lire le numéro du premier concert passé et ajouter 1
NUM=$(sed -n 's/^- \[\([0-9][0-9]*\)\].*/\1/p' "$PASSES" | head -n 1)

[[ "$NUM" =~ ^[0-9]+$ ]] || {
    echo "Impossible de trouver le numéro du premier concert." >&2
    exit 1
}

NUM=$((NUM + 1))

# Retirer le préfixe "- " de la date
DATE=${DATE#- }

# Construire la ligne du concert passé
NOUVELLE_LIGNE="- [$NUM] $DATE"

# Ajouter le concert en tête de la liste, après le titre
TMP=$(mktemp)

awk -v ligne="$NOUVELLE_LIGNE" '
    /^# Liste des concerts du temps passé/ {
        print
        print ""
        print ligne
        next
    }
    { print }
' "$PASSES" > "$TMP"
mv "$TMP" "$PASSES"

# Supprimer la première date de dates.md, en conservant les autres lignes
TMP=$(mktemp)
awk '
    !supprime && /^- / { supprime=1; next }
    { print }
' "$DATES" > "$TMP"

mv "$TMP" "$DATES"

echo "Concert transféré : [$NUM] $DATE"
