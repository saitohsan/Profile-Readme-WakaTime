#! /bin/bash
git clone https://github.com/avinal/README-Python-Experiment.git 
cd README-Python-Experiment
cp new.txt image
git add new.txt
git commit -m "Updated file"
git push origin master