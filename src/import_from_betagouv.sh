#!/bin/bash
startup_dir='../../../../portail/src/content/startup'
startups_dir='../../../../betagouv/beta.gouv.fr/content/_startups'
people_dir='../../../../portail/src/content/people'
authors_dir='../../../../betagouv/beta.gouv.fr/content/_authors'
pwd
cd ../../project
mkdir -p betagouv
cd betagouv
pwd
git clone https://github.com/betagouv/beta.gouv.fr.git
cd beta.gouv.fr/content/_startups
pwd
ls
grep -rl "mtes" > startups.txt
cp startups.txt ../_authors
cd ../_authors
echo "Import des startups:\n"
echo < startups.txt
pwd
ls
grep -rl "MTES" >> authors.txt
echo "Import des auteurs:\n"
echo < authors.txt

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
 echo "Import des auteurs:\n"
 echo < authors.txt
 IFS=' '
}

function remove_old_files {
 pwd
 ls
 mv _index.md _index.md.bak
 rm *.md
 mv _index.md.bak _index.md
}

cd "$startup_dir"
remove_old_files

cd "$startups_dir"

echo "Import des startups:\n"
echo < startups.txt

while read -r line; do
 pwd
 cp "$line" "$startup_dir"
 startup_file="$line"
 get_authors 
done < startups.txt

while read -r line; do
 pwd
 cp "$line" "$startup_dir"
done < startups.txt

cd "$people_dir"
remove_old_files

cd "$authors_dir"

echo "Import des auteurs:\n"
echo < authors.txt

while read -r line; do
 pwd
 ls
 cp "$line" "$people_dir"
done < authors.txt