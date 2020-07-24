#! /bin/bash
python main.py
git clone https://github.com/avinal/README-Python-Experiment.git 
cp new.txt README-Python-Experiments/image
cd README-Python-Experiment
git add new.txt
git commit -m "Updated file"
git push origin master