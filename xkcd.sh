#!/bin/bash
SRC=$(curl -s https://xkcd.com/info.0.json | jq -r '.img')
ALT=$(curl -s https://xkcd.com/info.0.json | jq -r '.alt')

echo "SRC: $SRC"
echo "ALT: $ALT"

sed -i -e 's|<img id="xkcd" [^>]* width|<img id="xkcd" src="'"${SRC}"'" alt="'"${ALT}"'" width|g' README.md

cat README.md
