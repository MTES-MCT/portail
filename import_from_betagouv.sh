#!/bin/bash

startup_dir="$CIRCLE_WORKING_DIRECTORY/src/content/startup"
people_dir="$CIRCLE_WORKING_DIRECTORY/src/content/people"

function remove_old_files {
   pwd
   ls
   mv _index.md _index.md.bak
   rm *.md
   mv _index.md.bak _index.md
}

cd "$startup_dir"
remove_old_files

cp "$CIRCLE_WORKING_DIRECTORY/artifacts/startups/." "$startup_dir"

cd "$people_dir"
remove_old_files

cp "$CIRCLE_WORKING_DIRECTORY/artifacts/authors/." "$people_dir"