#! /bin/bash
git config user.email "185067@nith.ac.in"
git config user.name "avinal"
python main.py
cp new.txt image
git add .
git commit -m "Bot updated the file"
git push origin master