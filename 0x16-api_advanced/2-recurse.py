#!/usr/bin/python3
"""recurse"""
import requests


def recurse(subreddit, hot_list=[], count=0, after=""):
    url = f'https://www.reddit.com/r/{subreddit}/hot.json'
    headers = {"User-Agent": "-"}
    params = {"after": after, "count": count, "limit": 100}
    response = requests.get(url, headers=headers, params=params,
                            allow_redirects=False)
    if response.status_code == 404:
        return None
    results = response.json().get("data")
    after = results.get("after")
    count += results.get("dist")
    for c in results.get("children"):
        hot_list.append(c.get("data").get("title"))

    if after is not None:
        return recurse(subreddit, hot_list, count, after)
    return hot_list
