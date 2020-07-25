#! /bin/bash
pwd
if [ -z "${INPUT_GITHUB_TOKEN}" ]; then
    echo "error: not found GITHUB_TOKEN"
    exit 1
fi
clone_repo="https://github.com/${GITHUB_ACTOR}/${GITHUB_ACTOR}.git"
git clone "${clone_repo}"

if [[ ! -f "stat.svg" ]]; then
    echo "File Lost"
    exit 1
fi

if [[ ! -d "${GITHUB_ACTOR}/images" ]]; then
    mkdir "${GITHUB_ACTOR}/images"
    echo "Images Folder created"
fi

cp stat.svg "${GITHUB_ACTOR}/images"
echo "Copied New Image"

cd "${GITHUB_ACTOR}"
ls images/

remote_repo="https://${GITHUB_ACTOR}:${INPUT_GITHUB_TOKEN}@github.com/${GITHUB_REPOSITORY}.git"
git config user.email "actions@users.noreply.github.com"
git config user.name "github-actions[bot]"
echo "Added name email"

git show-ref
git branch --verbose
echo "Git config added"

git remote add publisher "${remote_repo}"
git remote -v

git checkout master

git add .
git commit -m "Automated Update :alien:"
git pull
git push publisher master
echo "Git Push Successful"