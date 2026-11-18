#!/usr/bin/env bash
# Instala (ou atualiza) o Pocket Pup a partir da última versão publicada.
set -euo pipefail
URL="https://github.com/jpclopes99/PocketPup/releases/latest/download/PocketPup.zip"
TMP=$(mktemp -d)
echo "⬇️  A descarregar o Pocket Pup…"
curl -fsSL "$URL" -o "$TMP/PocketPup.zip"
ditto -x -k "$TMP/PocketPup.zip" "$TMP"
pkill -x PocketPup 2>/dev/null || true
rm -rf "/Applications/Pocket Pup.app"
mv "$TMP/Pocket Pup.app" "/Applications/Pocket Pup.app"
xattr -dr com.apple.quarantine "/Applications/Pocket Pup.app" 2>/dev/null || true
rm -rf "$TMP"
open "/Applications/Pocket Pup.app"
echo "🐶 Pocket Pup instalado em /Applications. As próximas atualizações chegam sozinhas."
