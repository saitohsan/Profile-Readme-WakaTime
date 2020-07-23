'''
WakaTime progress visualizer
Original File Location https://github.com/athul/waka-readme
'''

import re
import os
import sys
import base64
import datetime
import requests
from github import Github, GithubException

user = 'avinal'
waka_key = os.getenv('INPUT_WAKATIME_API_KEY')
ghtoken = os.getenv('INPUT_GH_TOKEN')
show_title = 'true'

if __name__ == '__main__':
    g = Github(ghtoken)
    try:
        repo = g.get_repo(f"avinal/README-Python-Experiment")
    except GithubException:
        print("Authentication Error. Try saving a GitHub Token in your Repo Secrets or Use the GitHub Actions Token, which is automatically used by the action.")
        sys.exit(1)
    contents = repo.get_contents("image/some.txt")
    new_readme = open("new.txt","w")
    new_readme.write("Hello cosmos")
    repo.update_file(path=contents.path, message='Updated with Dev Metrics',
                         content=new_readme, sha=contents.sha, branch='master')
