#!/bin/bash

WORK_DIR="${HOME}/auto_commit"
SINCE_AGO="12 hours ago"

cd $WORK_DIR
COMMIT=`git log --pretty=format:"%cd" --since="${SINCE_AGO}"`
TODAY=`date "+%Y-%m-%d %I:%M %p"`
MSG="💤 AUTO Commit"

if [ "$COMMIT" = "" ]
then
        sed -i '$d' README.md
        echo "<code>${MSG} - ${TODAY}</code>" >> README.md
        echo "</pre>" >> README.md
        git add README.md
        git commit -m "${MSG}"
        git push origin master
else
        RED="\033[0;31m"
        NC="\033[0m"
        printf "FOR TEST:${RED}COMMIT is exist. Exit!${NC}\n"
fi
