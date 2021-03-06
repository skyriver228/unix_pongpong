from configparser import SectionProxy
from bs4 import BeautifulSoup as BS
import requests as req

url = "https://www.nature.com/articles/s41467-022-29811-6#Abs1"
res = req.get(url)
# print(res.text)

soup = BS(res.text, "html.parser")

title = soup.h1.get_text(strip=True)
article = {"title":title}

sections = soup.find_all("section")
for section in sections:
    content_title = section.find("h2")
    content_title = content_title.get_text(strip=True)
    content = section.find("p")
    if  content == None:
        continue
    content =  content.get_text(strip=True)
    article[content_title] = content

print(article)