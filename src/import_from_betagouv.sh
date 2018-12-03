#!/bin/bash
pwd
cd ../../project
mkdir -p betagouv
cd betagouv
git clone https://github.com/betagouv/beta.gouv.fr.git
betagouv_dir='~/project/betagouv/beta.gouv.fr'
startups_dir='~/project/betagouv/beta.gouv.fr/content/_startups'
authors_dir='~/project/betagouv/beta.gouv.fr/content/_authors'
startup_dir='~/project/portail/src/content/startup'
people_dir='~/project/portail/src/content/people'
cd "$startups_dir"
pwd
grep -rl "mtes" > startups.txt
cp startups.txt ../_authors
cd ../_authors
pwd
grep -rl "MTES" >> authors.txt

function get_authors {
 IFS='.'
 read -ra ADDR <<< "$startup_file"
 i=0
 for startup in "${ADDR[@]}"; do
    if [ "$i" == 0 ]; then
     find . -type f -name '*.md' | xargs grep -rl "$startup" >> authors.txt
     i=$(( i + 1 ))
    fi
 done
 IFS=' '
}

function remove_old_files {
   mv _index.md _index.md.bak
   rm *.md
   mv _index.md.bak _index.md
}

cd "$startup_dir"
pwd
remove_old_files

cd "$startups_dir"

while read -r line; do
 pwd
 cp ../_startups/"$line" "$startup_dir"
 startup_file="$line"
 get_authors 
done < startups.txt

while read -r line; do
 pwd
 cp "$line" "$startup_dir"
done < startups.txt

cd "$people_dir"
pwd
remove_old_files

cd "$authors_dir"

while read -r line; do
 pwd
 cp "$line" "$people_dir"
done < authors.txt