from bs4 import BeautifulSoup as BS
import requests as req
from rake_nltk import Rake

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
    content_list = section.find_all("p")
    if content_list == None:
        continue
    content = ""
    for sub_content in content_list:
        sub_content = sub_content.get_text(strip=True)
        content += sub_content+"\n"
    
    article[content_title] = content

r = Rake(max_length=1)
r.extract_keywords_from_text(article["Abstract"])
keywords = r.get_ranked_phrases()[:5]

#second flow
article_str = ""
for k,v in article.items():
    article_str += k+ "\n" + v + "\n"

slicing_num = 500
article_list = [article_str[i:i+slicing_num] for i in range(0, len(article_str), slicing_num)]

keyword_count = {}
for keyword in keywords:
    count_list = list(map(lambda x:x.count(keyword), article_list))
    keyword_count[keyword] = count_list

print(keyword_count)

