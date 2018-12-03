#!/bin/bash
ROOT='/root/project/portail'
startup_dir="$ROOT/src/content/startup"
people_dir="$ROOT/src/content/people"

function remove_old_files {
   pwd
   ls
   mv _index.md _index.md.bak
   rm *.md
   mv _index.md.bak _index.md
}

cd "$startup_dir"
remove_old_files

cp "$ROOT/artifacts/startups/." "$startup_dir"

cd "$people_dir"
remove_old_files

cp "$ROOT/artifacts/authors/." "$people_dir"