
# coding: utf-8

# In[106]:


#Import Dependencies
from bs4 import BeautifulSoup as bs

import requests
import pandas as pd


# In[107]:


# Target URL for scrapping
url = 'https://mars.nasa.gov/news'


# In[108]:


#Check URL request
html = requests.get(url)
html
#yey


# In[109]:


#View HTML code
soup = bs(html.text, 'html.parser')
#soup()


# In[110]:


#Collect all titles

news_titles = soup.find_all('div', class_="content_title")

news_t=[]

for news_title in news_titles:
    news_t.append(news_title.text)
    print(news_title.text)


# In[111]:


#Collect all paragraphs

news_paras = soup.find_all('div', class_="rollover_description_inner")

news_p=[]
for news_para in news_paras:
    news_p.append(news_para.text)
    print(news_para.text)


# In[130]:


# Target URL for scrapping
url2 = 'https://twitter.com/marswxreport?lang=en'


# In[131]:


html2 = requests.get(url2)
html2
#double yey


# In[132]:


soup2 = bs(html2.text, 'html.parser')
soup2


# In[133]:


mars_weathers = soup2.find_all('p', class_="TweetTextSize TweetTextSize--normal js-tweet-text tweet-text")

mars_w=[]

for mars_weather in mars_weathers:
    mars_w.append(mars_weather.text)
    print(mars_weather.text)


# Someone brought down the Space-Facts/Mars website

# In[134]:


#Mars Hemispheres

hemisphere_image_urls = [
    {"title": "Valles Marineris Hemisphere", "img_url": "https://astrogeology.usgs.gov/cache/images/04085d99ec3713883a9a57f42be9c725_valles_marineris_enhanced.tif_thumb.png"},
    {"title": "Cerberus Hemisphere", "img_url": "https://astrogeology.usgs.gov/cache/images/dfaf3849e74bf973b59eb50dab52b583_cerberus_enhanced.tif_thumb.png"},
    {"title": "Schiaparelli Hemisphere", "img_url": "https://astrogeology.usgs.gov/cache/images/7677c0a006b83871b5a2f66985ab5857_schiaparelli_enhanced.tif_thumb.png"},
    {"title": "Syrtis Major Hemisphere", "img_url": "https://astrogeology.usgs.gov/cache/images/aae41197e40d6d4f3ea557f8cfe51d15_syrtis_major_enhanced.tif_thumb.png"},
]

