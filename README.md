# Profile_Readme-WakaTime

If you use WakaTime to track your coding activity. You can add that to your README as a picture. 
Just add this action to any of your repository and there you have it. See mine below.
## My WakaTime Coding Activity

![Avinal WakaTime Activity](https://github.com/avinal/avinal/blob/master/images/stat.svg)

## How to add one to your README.md
1. First get your WakaTime API Key. You can get it from your [WakaTime](https://wakatime.com) account settings. 
2. Save WakaTime API Key to Repository Secret. Find that by clicking the Settings tab.
3. Click **Action** tab and **choose set up a workflow yourself**.
4. Copy the following code into the opened file
```yml
name: WakaTime stat update in README.md

on:
  push:
    branches: [ master ]
  schedule:
    # Runs at 12 am IST
    - cron: '31 18 * * *'

jobs:
  update-readme:
    name: Update the WakaTime Stat
    runs-on: ubuntu-latest
    steps:
      - uses: avinal/Profile-Readme-WakaTime@1.0
        with:
          WAKATIME_API_KEY: ${{ secrets.WAKATIME_API_KEY }}
          GITHUB_TOKEN: ${{ github.token }}
```


## References
* [Initial Inspiration - waka-readme](https://github.com/athul/waka-readme) by @athul
* [GitHub Language Color Coding Collection](https://github.com/ozh/github-colors) by @ozh
* [GitHub Push Actions](https://github.com/ad-m/github-push-action) by @ad-m

