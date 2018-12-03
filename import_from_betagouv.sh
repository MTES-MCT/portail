#!/bin/bash

startup_dir='/root/project/portail/src/content/startup'
people_dir='/root/project/portail/src/content/people'

function remove_old_files {
   pwd
   ls
   mv _index.md _index.md.bak
   rm *.md
   mv _index.md.bak _index.md
}

cd "$startup_dir"
remove_old_files

cp /tmp/artifacts/startups/. "$startup_dir"

cd "$people_dir"
remove_old_files

cp /tmp/artifacts/authors/. "$people_dir"