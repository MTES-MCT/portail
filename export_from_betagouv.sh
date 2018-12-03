#!/bin/bash

mkdir -p artifacts
mkdir -p artifacts/startups
mkdir -p artifacts/authors
mkdir -p betagouv
cd betagouv
pwd
git clone https://github.com/betagouv/beta.gouv.fr.git
cd beta.gouv.fr/content/_startups
pwd
grep -rl "mtes" > "$CIRCLE_WORKING_DIRECTORY/artifacts/startups.txt"
cd ../_authors
grep -rl "MTES" > "$CIRCLE_WORKING_DIRECTORY/artifacts/authors.txt"

function get_authors {
 IFS='.'
 read -ra ADDR <<< "$startup_file"
 i=0
 cd 
 for startup in "${ADDR[@]}"; do
    if [ "$i" == 0 ]; then
     echo "startup: $startup"
     find . -type f -name '*.md' | xargs grep -rl "$startup" >> "$CIRCLE_WORKING_DIRECTORY/artifacts/authors.txt"
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
done < "$CIRCLE_WORKING_DIRECTORY/artifacts/startups.txt"


while read -r line; do
 cp "$line" "$CIRCLE_WORKING_DIRECTORY/artifacts/authors"
done < "$CIRCLE_WORKING_DIRECTORY/artifacts/authors.txt"

cd ../_startups
pwd
while read -r line; do
 cp "$line" "$CIRCLE_WORKING_DIRECTORY/artifacts/startups"
done < "$CIRCLE_WORKING_DIRECTORY/artifacts/startups.txt"