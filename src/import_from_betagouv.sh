#!/bin/bash
startup_dir='/root/project/portail/src/content/startup'
startups_dir='/root/project/betagouv/beta.gouv.fr/content/_startups'
people_dir='/root/project/portail/src/content/people'
authors_dir='/root/project/betagouv/beta.gouv.fr/content/_authors'
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
echo "Import des startups:"
cat startups.txt | xargs echo
grep -rl "MTES" >> authors.txt
echo "Import des auteurs:"
cat authors.txt | xargs echo

function get_authors {
 IFS='.'
 read -ra ADDR <<< "$startup_file"
 i=0
 for startup in "${ADDR[@]}"; do
    if [ "$i" == 0 ]; then
     echo "$startup"
     find . -type f -name '*.md' | xargs grep -rl "$startup" >> authors.txt
     i=$(( i + 1 ))
    fi
 done
 echo "Import des auteurs:"
 cat authors.txt | xargs echo
 IFS=' '
}

function remove_old_files {
 mv _index.md _index.md.bak
 rm *.md
 mv _index.md.bak _index.md
}

cd "$startup_dir"
remove_old_files

cd "$startups_dir"

echo "Import des startups:"
cat startups.txt | xargs echo

while read -r line; do
 echo "$line"
 cp "$line" "$startup_dir"
 startup_file="$line"
 get_authors 
done < startups.txt

while read -r line; do
 echo "$line"
 cp "$line" "$startup_dir"
done < startups.txt

cd "$people_dir"
remove_old_files

cd "$authors_dir"

echo "Import des auteurs:"
cat authors.txt | xargs echo

while read -r line; do
 echo "$line"
 cp "$line" "$people_dir"
done < authors.txt