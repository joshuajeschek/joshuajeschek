#!/bin/bash
SRC=$(curl -s https://xkcd.com/info.0.json | jq -r '.img')
ALT=$(curl -s https://xkcd.com/info.0.json | jq -r '.alt')

echo "SRC: $SRC"
echo "ALT: $ALT"

sed -i -e 's|id="xkcd" [^>]* height|id="xkcd" src="'"${SRC}"'" alt="'"${ALT}"'" height|g' README.md

cat README.md
