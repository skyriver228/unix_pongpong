from configparser import SectionProxy
from bs4 import BeautifulSoup as BS
import requests as req

url = "https://www.nature.com/articles/s41467-022-29811-6#Abs1"
res = req.get(url)
# print(res.text)

soup = BS(res.text, "html.parser")

title = soup.h1.get_text(strip=True)
print(title)

sections = soup.find_all("section")
print(len(sections))