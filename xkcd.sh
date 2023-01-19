#!/bin/bash
SRC=$(curl -s https://xkcd.com/info.0.json | jq -r '.img')
ALT=$(curl -s https://xkcd.com/info.0.json | jq -r '.alt')

echo "SRC: $SRC"
echo "ALT: $ALT"

sed -i -e 's|id="xkcd-img" [^>]* height|id="xkcd-img" src="'"${SRC}"'" alt="'"${ALT}"'" height|g' README.md
sed -i -e 's|id="xkcd-a" [^>]* href|id="xkcd-a" title="'"${ALT}"'" href|g' README.md

cat README.md
