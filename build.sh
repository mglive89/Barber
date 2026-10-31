#!/bin/sh
# Rigenera la PWA (index.html e sw.js nella radice) a partire da src/index.html.
set -e
cd "$(dirname "$0")"
VER=$(cat src/index.html src/sw.template.js vendor/* | sha1sum | cut -c1-10)
{
cat <<HEAD
<!doctype html>
<html lang="it"><head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1,viewport-fit=cover">
<meta name="theme-color" content="#16191d">
<meta name="description" content="Analisi del viso e consigli di taglio e colore per barbershop e parrucchiere.">
<link rel="manifest" href="manifest.webmanifest">
<link rel="icon" href="icons/icon-192.png" type="image/png">
<link rel="apple-touch-icon" href="icons/apple-touch-icon.png">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-title" content="Specchio">
<meta name="apple-mobile-web-app-status-bar-style" content="black-translucent">
<style>:root{padding-top:env(safe-area-inset-top,0px);padding-bottom:env(safe-area-inset-bottom,0px)}body{margin:0}</style>
</head><body>
HEAD
cat src/index.html
printf '\n</body></html>\n'
} > index.html
sed "s/__VERSION__/$VER/" src/sw.template.js > sw.js
echo "PWA generata, versione cache $VER"
