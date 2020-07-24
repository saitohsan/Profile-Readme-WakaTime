#! /bin/bash

if [ -z "${INPUT_GITHUB_TOKEN}" ]; then
    echo "error: not found GITHUB_TOKEN"
    exit 1
fi

remote_repo="https://${INPUT_GITHUB_ACTOR}:${INPUT_GITHUB_TOKEN}@github.com/${INPUT_GITHUB_REPOSITORY}.git"
git config http.sslVerify false
git config user.email "actions@users.noreply.github.com"
git config user.name "The Bot Airium"
git remote add publisher "${remote_repo}"
git show-ref
git branch --verbose
echo "Git config added"

git checkout master

cp stat.svg image
echo "Copied New Image"

git add "stat.svg"
git commit -m "Automated Update :alien:"
git pull --rebase publisher master 
git push publisher master
echo "Git Push Successful"