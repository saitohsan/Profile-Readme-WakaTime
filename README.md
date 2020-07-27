# Profile-Readme-WakaTime
![LICENSE](https://img.shields.io/github/license/avinal/Profile-Readme-WakaTime?style=flat-square)
![Release](https://img.shields.io/github/v/release/avinal/Profile-Readme-WakaTime?style=flat-square)

If you use WakaTime to track your coding activity. You can add that to your README as a picture. 
Just add this action to any of your repository and there you have it. See mine below.

## My WakaTime Coding Activity
<img src="https://github.com/avinal/avinal/blob/master/images/stat.svg" alt="Avinal WakaTime Activity"/>

## How to add one to your README.md
1. First get your WakaTime API Key. You can get it from your [WakaTime](https://wakatime.com) account settings. 
2. Save WakaTime API Key to Repository Secret. Find that by clicking the Settings tab. Keep the name of secret as **WAKATIME_API_SECRET**.
3. Add following line in your README.md of your repo.
  ```html
  <img src="https://github.com/<username>/<repository-name>/blob/master/images/stat.svg" alt="Alternative Text"/>
  Example: <img src="https://github.com/avinal/avinal/blob/master/images/stat.svg" alt="Avinal WakaTime Activity"/>
  ```
  You can use this method to embed in web pages too. 
  
4. Click **Action** tab and **choose set up a workflow yourself**.
5. Copy the following code into the opened file, you can search for **WakaTime Stat** in marketplace tab for assistance.
```yml
name: WakaTime stat update in README.md

on:
  schedule:
    # Runs at 12 am  '0 0 * * *'  UTC
    - cron: '1 0 * * *'

jobs:
  update-readme:
    name: Update the WakaTime Stat
    runs-on: ubuntu-latest
    steps:
      # Use avinal/Profile-Readme-WakaTime@<latest-release-tag> for latest stable release
      - uses: avinal/Profile-Readme-WakaTime@master
        with:
          WAKATIME_API_KEY: ${{ secrets.WAKATIME_API_KEY }}
          GITHUB_TOKEN: ${{ github.token }}
```

## References
* [Initial Inspiration - waka-readme](https://github.com/athul/waka-readme) by @athul
* [GitHub Language Color Coding Collection](https://github.com/ozh/github-colors) by @ozh
* [GitHub Push Actions](https://github.com/ad-m/github-push-action) by @ad-m

