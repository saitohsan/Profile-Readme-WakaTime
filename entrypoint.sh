#! /bin/bash
pwd
if [ -z "${INPUT_GITHUB_TOKEN}" ]; then
    echo "error: not found GITHUB_TOKEN"
    exit 1
fi
clone_repo="https://github.com/${GITHUB_ACTOR}/${GITHUB_ACTOR}.git"
git clone "${clone_repo}"

cp stat.svg "${GITHUB_ACTOR}/image"
echo "Copied New Image"

cd "${GITHUB_ACTOR}"
ls image
git config user.email "actions@users.noreply.github.com"
git config user.name "The Bot Airium"
echo "Added name email"

git show-ref
git branch --verbose
echo "Git config added"

git remote -v

git checkout master

git add .
git commit -m "Automated Update :alien:"
git pull
git push origin master
echo "Git Push Successful"