from urllib.request import urlopen
from urllib.request import urlretrieve
import re

import AdvancedHTMLParser
def get_urls(day_before, days):
    url = 'http://www.bing.com/HPImageArchive.aspx?format=xml&idx=%d&n=%d&mkt=zh-cn' % (day_before, days)
    respond = urlopen(url)
    html = respond.read()
    parser = AdvancedHTMLParser.AdvancedHTMLParser()
    parser.parseStr(html)
    items = parser.getElementsByTagName("url")
    urls = [item.innerHTML for item in items]
    pattern = re.compile(r"1366x768")
    urls = [pattern.sub(r'1920x1080', url) for url in urls]
    return urls


def get_images(day_before, days):
    pattern = re.compile(r"\/")
    for url in get_urls(day_before, days):
        match = pattern.split(url)
        if match and (len(match) >= 0):
            image_name = match[-1]
            urlretrieve("http://www.bing.com" + url, image_name)


if __name__ == "__main__":
    get_images(0, 10)

