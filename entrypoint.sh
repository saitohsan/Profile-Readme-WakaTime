#! /bin/bash
if [ -z "${INPUT_GITHUB_TOKEN}" ]; then
    echo "error: not found GITHUB_TOKEN"
    exit 1
fi

clone_repo="https://github.com/${GITHUB_ACTOR}/${GITHUB_ACTOR}.git"
git clone "${clone_repo}"
echo "Repository Cloned"

if [[ ! -f "stat.*" ]]; then
    echo "error: file lost! existing"
    exit 1
fi

if [[ ! -d "${GITHUB_ACTOR}/images" ]]
then
    mkdir -p "${GITHUB_ACTOR}/images"
    echo "images folder created"
else
    rm "${GITHUB_ACTOR}/images/stat.svg" 
    rm "${GITHUB_ACTOR}/images/stat.png" 
    echo "old images removed"
fi

cp stat.svg "${GITHUB_ACTOR}/images"
cp stat.png "${GITHUB_ACTOR}/images"
echo "copied new images"

cd "${GITHUB_ACTOR}"

remote_repo="https://${GITHUB_ACTOR}:${INPUT_GITHUB_TOKEN}@github.com/${GITHUB_REPOSITORY}.git"
git config user.email "41898282+github-actions[bot]@users.noreply.github.com"
git config user.name "GitHub Actions"
echo "git credential added" 

git remote add publisher "${remote_repo}"
git remote -v

git checkout master

git add .
git commit -m "Automated Coding Activity Update :alien:"
git pull
git push publisher master
echo "image update successfull"
