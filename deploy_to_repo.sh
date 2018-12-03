#!/bin/bash
pwd
ls
rm -rf docs
mv src/docs .
git config credential.helper 'cache --timeout=120'
git config user.email "<circleci>"
git config user.name "CircleCi"
status=$(git status -s)
empty=''
if [ "$status" = "$empty" ]; then 
    echo "Pas de modifications dans docs. Pas de deploy."
    exit 0
else
    git add .
    git commit -m "Update site from circleci" -m "[ci skip]"
    git push origin master
fi