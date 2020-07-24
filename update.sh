#! /bin/bash
git config user.email "185067@nith.ac.in"
git config user.name "avinal"
echo "Git config added"

pip install -r requirements.txt
echo "Requirements Installed"

python main.py
echo "Python Script Run Successful"

cp stat.svg image
echo "Copied New Image"

git add "stat.svg"
git commit -m "I didn't update the file :alien:"
git push origin master
echo "Git Push Successful"