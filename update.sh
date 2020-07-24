#! /bin/bash
git config user.email "185067@nith.ac.in"
git config user.name "avinal"
python main.py
cp stat.svg image
git add stat.svg
git commit -m "I didn't update the file :alien:"
git push origin master