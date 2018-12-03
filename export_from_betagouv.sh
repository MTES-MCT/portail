#!/bin/bash
ROOT='/root/project/portail'
mkdir -p artifacts
mkdir -p artifacts/startups
mkdir -p artifacts/authors
mkdir -p betagouv
cd betagouv
pwd
git clone https://github.com/betagouv/beta.gouv.fr.git
cd beta.gouv.fr/content/_startups
grep -rl "mtes" | tee -a "$ROOT/artifacts/startups.txt"
cat "$ROOT/artifacts/startups.txt" | wc -l
cd ../_authors
grep -rl "MTES" | tee -a "$ROOT/artifacts/authors.txt"

function get_authors {
 IFS='.'
 read -ra ADDR <<< "$startup_file"
 i=0
 cd 
 for startup in "${ADDR[@]}"; do
    if [ "$i" == 0 ]; then
     echo "startup: $startup"
     find . -type f -name '*.md' | xargs grep -rl "$startup" | tee -a "$ROOT/artifacts/authors.txt"
     i=$(( i + 1 ))
    fi
 done
 IFS=' '
}

pwd
while read -r line; do
 echo "$line"
 startup_file="$line"
 get_authors 
done < "$ROOT/artifacts/startups.txt"
cat "$ROOT/artifacts/authors.txt" | wc -l


while read -r line; do
 cp "$line" "$ROOT/src/content/people/authors"
done < "$ROOT/artifacts/authors.txt"

cd ../_startups
pwd
while read -r line; do
 cp "$line" "$ROOT/src/content/startup"
done < "$ROOT/artifacts/startups.txt"

rm -rf "$ROOT/betagouv"