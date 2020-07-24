#! /bin/bash
python main.py
cp new.txt image
git add new.txt
git commit -m "Bot updated the file"
git push origin master