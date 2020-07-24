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

remote_repo="https://${GITHUB_ACTOR}:${INPUT_GITHUB_TOKEN}@github.com/${GITHUB_REPOSITORY}.git"
echo "$remote_repo"

git config http.sslVerify false
git config user.email "actions@users.noreply.github.com"
git config user.name "The Bot Airium"
echo "Added name email"
git remote add publisher "${remote_repo}"
echo "Add publisher"
git show-ref
git branch --verbose
echo "Git config added"

git checkout master

git add "stat.svg"
git commit -m "Automated Update :alien:"
git pull --rebase publisher master 
git push publisher master
echo "Git Push Successful"