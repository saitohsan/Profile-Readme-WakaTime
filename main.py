import datetime
import json
import os
import sys

import matplotlib.pyplot as plt
import numpy as np
import requests

waka_key = 'a6b6f104-35ce-4752-9fef-b0579f4ee461'


def this_week() -> str:
    """Returns a week streak"""
    week_end = datetime.datetime.today() - datetime.timedelta(days=1)
    week_start = week_end - datetime.timedelta(days=7)
    print("week header created")
    return (
        f"Week: {week_start.strftime('%d %B, %Y')} - {week_end.strftime('%d %B, %Y')}"
    )


def make_graph(data: list):
    """Make progress graph from API graph"""
    fig, ax = plt.subplots(figsize=(10, 2))
    with open("/colors.json") as json_file:
        color_data = json.load(json_file)
    y_pos = np.arange(len(data[0]))
    bars = ax.barh(y_pos, data[2])
    ax.set_yticks(y_pos)
    ax.get_xaxis().set_ticks([])
    ax.set_yticklabels(data[0])
    ax.set_title(this_week())
    ax.invert_yaxis()
    plt.box(False)
    for i, bar in enumerate(bars):
        if data[0][i] in color_data:
            bar.set_color(color_data[data[0][i]]["color"])
        x_value = bar.get_width()
        y_values = bar.get_y() + bar.get_height() / 2
        plt.annotate(
            data[1][i],
            (x_value, y_values),
            xytext=(4, 0),
            textcoords="offset points",
            va="center",
            ha="left",
        )
    plt.savefig("stat.svg", bbox_inches="tight")
    plt.savefig("stat.png", bbox_inches="tight")
    print("new image generated")


def get_stats() -> list:
    """Gets API data and returns markdown progress"""
    data = requests.get(
        f"https://wakatime.com/api/v1/users/current/stats/last_7_days?api_key={waka_key}"
    ).json()

    try:
        lang_data = data["data"]["languages"]
    except KeyError:
        print("error: please add your WakaTime API key to the Repository Secrets")
        sys.exit(1)

    lang_list = []
    time_list = []
    percent_list = []
    pad = len(max([l["name"] for l in lang_data[:5]], key=len))
    for lang in lang_data[:5]:
        lang_list.append(lang["name"])
        time_list.append(lang["text"])
        percent_list.append(lang["percent"])
    data_list = [lang_list, time_list, percent_list]
    print("coding data collected")
    return data_list


if __name__ == "__main__":
    waka_stat = get_stats()
    make_graph(waka_stat)
    print("python script run successful")
