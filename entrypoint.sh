#!/bin/bash

#whoami
#ls -la /
#ls -la /github
#time=$(git log -1 --date=short --format=%ai $(git log --oneline $(git show-ref --tags |tail -2 |head -1|awk '{print $1}')..@|tail -1|awk '{print $1}')|sed 's/ /T/g' )

cd /github/workspace
time=$(git log -1 --date=short --format=%ai $(git log --oneline $(git show-ref --tags |tail -2 |head -1|awk '{print $1}')..@|tail -1|awk '{print $1}')|sed 's/ /T/g' )

changelog=$(gh pr list -B main -s closed --json 'title,createdAt,url'  -q ".[]|select(.createdAt >= \"$time\")" | jq -r '[ .title, .url]|@tsv')

changelog="${changelog//'%'/'%25'}"
changelog="${changelog//$'\n'/'%0A'}"
changelog="${changelog//$'\r'/'%0D'}"
echo "::set-output name=changelog::$changelog"