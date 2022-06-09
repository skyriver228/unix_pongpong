from ast import keyword
from bs4 import BeautifulSoup as BS
import requests as req
from datetime import date
from rake_nltk import Rake
import uvicorn
from fastapi import FastAPI
from pydantic import BaseModel, HttpUrl

app = FastAPI()

class Url(BaseModel):
    url: str

class SelectedKeywords(BaseModel):
    url:str
    article: str
    keywords: list

@app.post("/input")
def input_url(url:Url):
    def getting_keyword(url):
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

        article_str = ""
        for k,v in article.items():
            article_str += k+ "\n\n" + v + "\n"

        result = {}
        result["url"] = url
        result["keywords"] = keywords
        result["article"] = article_str

        return result
    result = getting_keyword(url.url)
    return result

@app.post("/analysis")
def analysis(selected_keywords:SelectedKeywords):
    def counting_keywords(article_str, keywords):
        slicing_num = 500
        article_list = [article_str[i:i+slicing_num] for i in range(0, len(article_str), slicing_num)]

        keyword_count = {}
        for keyword in keywords:
            count_list = list(map(lambda x:x.count(keyword), article_list))
            keyword_count[keyword] = count_list
        return keyword_count
    keyword_count = counting_keywords(selected_keywords.article, selected_keywords.keywords)
    result = {}
    result["url"] = selected_keywords.url
    result["keywords"] = keyword_count
    result["article"] = selected_keywords.article
    result["date"] = date.today().isoformat()
    return result
    

if __name__ == "__main__":
    uvicorn.run("flow:app", reload=True)
