

```python
# Dependencies
import tweepy
import json
import time
import numpy as np
from datetime import datetime
import matplotlib.pyplot as plt
import pandas as pd
from textwrap import wrap
```


```python
# Import and Initialize Sentiment Analyzer
from vaderSentiment.vaderSentiment import SentimentIntensityAnalyzer
analyzer = SentimentIntensityAnalyzer()
```


```python
# Twitter API Keys
consumer_key = "tMXh9meFOA0LmEs5gItQzoYge"
consumer_secret = "BX9pf0QJGovsY8GTb1i5ID1EUUthEoZjBjWlSjTPv6UnkuRPG6"
access_token = "967428751989538818-iY6p9nP1RGJY3bIJjCWZjoOrRkFIHxr"
access_token_secret = "RgycSRmenY82MvNhR9LQYDhtuFhntXcLchRA3qEu79aph"
```


```python
# Setup Tweepy API Authentication
auth = tweepy.OAuthHandler(consumer_key, consumer_secret)
auth.set_access_token(access_token, access_token_secret)
api = tweepy.API(auth, parser=tweepy.parsers.JSONParser())
```


```python
#counter = 1
target_user = ("@bbc")

# Loop through user
for user in target_user:
        
    # Variables for holding sentiments
    compound_list = []
    positive_list = []
    negative_list = []
    neutral_list = []
    #tweet_times = []
    #tweet_counter = []
    tweet_list = []
    #sentiments = []

    # Loop through twitter pages (20 tweets per page)
    for x in range(1):
        # Get all tweets from home feed
        public_tweets = api.user_timeline(target_user)

        # Loop through all tweets
        for tweet in public_tweets:
             #print(tweet['text'])

            # Run Vader Analysis on each tweet
            compound = analyzer.polarity_scores(tweet["text"])["compound"]
            pos = analyzer.polarity_scores(tweet["text"])["pos"]
            neu = analyzer.polarity_scores(tweet["text"])["neu"]
            neg = analyzer.polarity_scores(tweet["text"])["neg"]
            #tweet_counter = counter
            tweet_list.append(tweet["text"])

            # Add each value to the appropriate list
            compound_list.append(compound)
            positive_list.append(pos)
            negative_list.append(neg)
            neutral_list.append(neu)
            tweet_times.append(tweet["created_at"])
            
            counter = counter + 1
            


    #print("")
    print("User: %s" % (target_user))
    print("Text: %s" % (tweet_list))
    print("Compound: %s" % (compound_list))
    #print("Positive: %s" % (positive_list))
    #print("Neutral: %s" % (neutral_list))
    #print("Negative: %s" % (negative_list))
    #print("Datestamp: %s" % (tweet_times))
    #print("Tweet(s) Ago: %s" % (counter))
```

    User: @bbc
    Text: ["'Harry was looking at his family for the first time in his life'. \n\n💛⚡️✨ David Thewlis reading #HarryPotter is trul… https://t.co/wAyCDFvrX2", "✂️ ‘My hair is a symbol of pride.’\n\n💇🏽💇🏿💇🏾 Six stories about black women's hair.\n👉 https://t.co/NfNvGpKpVi https://t.co/V1qrRJzwfu", 'The little mouse that inspired Pikachu is actually a rabbit! https://t.co/AxOQOaK4dS', "RT @BBCTwo: If you haven't seen #ACSVersace yet, Penélope Cruz as Donatella Versace is everything... https://t.co/lH9kfRGqO2", 'RT @BBCBreakfast: In many ways Hedy Lamarr was the archetypal Hollywood starlet, but the Austrian born actress was also an inventor and the…', 'RT @BBCScotlandNews: A Scottish school has won a prestigious award for its pioneering work helping children with their reading and writing…', 'RT @bbceurovision: A storm is coming.@surieofficial  ⛈ 👉 https://t.co/LYIiBgcZdA https://t.co/heOKLnjo2N', 'RT @BBCTwo: Nostalgia heaven! How many of these 80s &amp; 90s things can you remember? 🤔 #BackInTimeForTea https://t.co/l0R6nHrTj1', "📖 Time to 'embiggen' your vocabulary.\n\nA new word, first heard on @TheSimpsons in 1996, has been added to the… https://t.co/qGvkGgjAcB", 'RT @bbccomedy: WOOF! ❤️#RikMayallDay https://t.co/ioJtvYVFRO', '😱 The most hardcore baptism you’ll ever see. https://t.co/aEsVqMUPQ2', "#InternationalWomensDay is tomorrow, so there's no better time to test how much you know about female suffrage.\n👉… https://t.co/6ulqfr8zyL", "🚂💀 All aboard London's Victorian railway for the dead. https://t.co/L7vJO4ybeD", "😍 The first polar bear cub to be born in the UK for 25 years has emerged at the @RZSS's @HighlandWPark!\n👉… https://t.co/4fhzBaxwjF", 'RT @bbccomedy: Today would have been the 60th birthday of the legend, the genius, the king Rik Mayall. We miss you, sir! #RikMayallDay http…', 'The wreck of a US aircraft carrier that was sunk during WW2 has been found off the coast of Australia. https://t.co/8NQfRdFXTE', "RT @BBCFOUR: There's a very good reason this extreme firework was banned... https://t.co/pdfpcDiJ4h", 'RT @CBeebiesHQ: 3 out of 4 parents wouldn’t be able to save their baby from choking. \n\nLearn how to help in a first aid emergency…https://t…', 'A moving story of how one woman transformed Alzheimer’s research forever. ❤️https://t.co/2fwJDbWT8x', "RT @BBCOne: They've smashed the record for the highest profit EVER on Antiques Road Trip! 😲 https://t.co/TNuRcp2EOq"]
    Compound: [0.0, 0.0, 0.4987, 0.0, 0.0, 0.8555, 0.0, 0.5562, 0.0, 0.0, 0.0, 0.1742, -0.6369, 0.0, -0.2244, -0.4404, 0.4927, 0.4404, 0.0, 0.4926]
    User: @bbc
    Text: ["'Harry was looking at his family for the first time in his life'. \n\n💛⚡️✨ David Thewlis reading #HarryPotter is trul… https://t.co/wAyCDFvrX2", "✂️ ‘My hair is a symbol of pride.’\n\n💇🏽💇🏿💇🏾 Six stories about black women's hair.\n👉 https://t.co/NfNvGpKpVi https://t.co/V1qrRJzwfu", 'The little mouse that inspired Pikachu is actually a rabbit! https://t.co/AxOQOaK4dS', "RT @BBCTwo: If you haven't seen #ACSVersace yet, Penélope Cruz as Donatella Versace is everything... https://t.co/lH9kfRGqO2", 'RT @BBCBreakfast: In many ways Hedy Lamarr was the archetypal Hollywood starlet, but the Austrian born actress was also an inventor and the…', 'RT @BBCScotlandNews: A Scottish school has won a prestigious award for its pioneering work helping children with their reading and writing…', 'RT @bbceurovision: A storm is coming.@surieofficial  ⛈ 👉 https://t.co/LYIiBgcZdA https://t.co/heOKLnjo2N', 'RT @BBCTwo: Nostalgia heaven! How many of these 80s &amp; 90s things can you remember? 🤔 #BackInTimeForTea https://t.co/l0R6nHrTj1', "📖 Time to 'embiggen' your vocabulary.\n\nA new word, first heard on @TheSimpsons in 1996, has been added to the… https://t.co/qGvkGgjAcB", 'RT @bbccomedy: WOOF! ❤️#RikMayallDay https://t.co/ioJtvYVFRO', '😱 The most hardcore baptism you’ll ever see. https://t.co/aEsVqMUPQ2', "#InternationalWomensDay is tomorrow, so there's no better time to test how much you know about female suffrage.\n👉… https://t.co/6ulqfr8zyL", "🚂💀 All aboard London's Victorian railway for the dead. https://t.co/L7vJO4ybeD", "😍 The first polar bear cub to be born in the UK for 25 years has emerged at the @RZSS's @HighlandWPark!\n👉… https://t.co/4fhzBaxwjF", 'RT @bbccomedy: Today would have been the 60th birthday of the legend, the genius, the king Rik Mayall. We miss you, sir! #RikMayallDay http…', 'The wreck of a US aircraft carrier that was sunk during WW2 has been found off the coast of Australia. https://t.co/8NQfRdFXTE', "RT @BBCFOUR: There's a very good reason this extreme firework was banned... https://t.co/pdfpcDiJ4h", 'RT @CBeebiesHQ: 3 out of 4 parents wouldn’t be able to save their baby from choking. \n\nLearn how to help in a first aid emergency…https://t…', 'A moving story of how one woman transformed Alzheimer’s research forever. ❤️https://t.co/2fwJDbWT8x', "RT @BBCOne: They've smashed the record for the highest profit EVER on Antiques Road Trip! 😲 https://t.co/TNuRcp2EOq"]
    Compound: [0.0, 0.0, 0.4987, 0.0, 0.0, 0.8555, 0.0, 0.5562, 0.0, 0.0, 0.0, 0.1742, -0.6369, 0.0, -0.2244, -0.4404, 0.4927, 0.4404, 0.0, 0.4926]
    User: @bbc
    Text: ["'Harry was looking at his family for the first time in his life'. \n\n💛⚡️✨ David Thewlis reading #HarryPotter is trul… https://t.co/wAyCDFvrX2", "✂️ ‘My hair is a symbol of pride.’\n\n💇🏽💇🏿💇🏾 Six stories about black women's hair.\n👉 https://t.co/NfNvGpKpVi https://t.co/V1qrRJzwfu", 'The little mouse that inspired Pikachu is actually a rabbit! https://t.co/AxOQOaK4dS', "RT @BBCTwo: If you haven't seen #ACSVersace yet, Penélope Cruz as Donatella Versace is everything... https://t.co/lH9kfRGqO2", 'RT @BBCBreakfast: In many ways Hedy Lamarr was the archetypal Hollywood starlet, but the Austrian born actress was also an inventor and the…', 'RT @BBCScotlandNews: A Scottish school has won a prestigious award for its pioneering work helping children with their reading and writing…', 'RT @bbceurovision: A storm is coming.@surieofficial  ⛈ 👉 https://t.co/LYIiBgcZdA https://t.co/heOKLnjo2N', 'RT @BBCTwo: Nostalgia heaven! How many of these 80s &amp; 90s things can you remember? 🤔 #BackInTimeForTea https://t.co/l0R6nHrTj1', "📖 Time to 'embiggen' your vocabulary.\n\nA new word, first heard on @TheSimpsons in 1996, has been added to the… https://t.co/qGvkGgjAcB", 'RT @bbccomedy: WOOF! ❤️#RikMayallDay https://t.co/ioJtvYVFRO', '😱 The most hardcore baptism you’ll ever see. https://t.co/aEsVqMUPQ2', "#InternationalWomensDay is tomorrow, so there's no better time to test how much you know about female suffrage.\n👉… https://t.co/6ulqfr8zyL", "🚂💀 All aboard London's Victorian railway for the dead. https://t.co/L7vJO4ybeD", "😍 The first polar bear cub to be born in the UK for 25 years has emerged at the @RZSS's @HighlandWPark!\n👉… https://t.co/4fhzBaxwjF", 'RT @bbccomedy: Today would have been the 60th birthday of the legend, the genius, the king Rik Mayall. We miss you, sir! #RikMayallDay http…', 'The wreck of a US aircraft carrier that was sunk during WW2 has been found off the coast of Australia. https://t.co/8NQfRdFXTE', "RT @BBCFOUR: There's a very good reason this extreme firework was banned... https://t.co/pdfpcDiJ4h", 'RT @CBeebiesHQ: 3 out of 4 parents wouldn’t be able to save their baby from choking. \n\nLearn how to help in a first aid emergency…https://t…', 'A moving story of how one woman transformed Alzheimer’s research forever. ❤️https://t.co/2fwJDbWT8x', "RT @BBCOne: They've smashed the record for the highest profit EVER on Antiques Road Trip! 😲 https://t.co/TNuRcp2EOq"]
    Compound: [0.0, 0.0, 0.4987, 0.0, 0.0, 0.8555, 0.0, 0.5562, 0.0, 0.0, 0.0, 0.1742, -0.6369, 0.0, -0.2244, -0.4404, 0.4927, 0.4404, 0.0, 0.4926]
    User: @bbc
    Text: ["'Harry was looking at his family for the first time in his life'. \n\n💛⚡️✨ David Thewlis reading #HarryPotter is trul… https://t.co/wAyCDFvrX2", "✂️ ‘My hair is a symbol of pride.’\n\n💇🏽💇🏿💇🏾 Six stories about black women's hair.\n👉 https://t.co/NfNvGpKpVi https://t.co/V1qrRJzwfu", 'The little mouse that inspired Pikachu is actually a rabbit! https://t.co/AxOQOaK4dS', "RT @BBCTwo: If you haven't seen #ACSVersace yet, Penélope Cruz as Donatella Versace is everything... https://t.co/lH9kfRGqO2", 'RT @BBCBreakfast: In many ways Hedy Lamarr was the archetypal Hollywood starlet, but the Austrian born actress was also an inventor and the…', 'RT @BBCScotlandNews: A Scottish school has won a prestigious award for its pioneering work helping children with their reading and writing…', 'RT @bbceurovision: A storm is coming.@surieofficial  ⛈ 👉 https://t.co/LYIiBgcZdA https://t.co/heOKLnjo2N', 'RT @BBCTwo: Nostalgia heaven! How many of these 80s &amp; 90s things can you remember? 🤔 #BackInTimeForTea https://t.co/l0R6nHrTj1', "📖 Time to 'embiggen' your vocabulary.\n\nA new word, first heard on @TheSimpsons in 1996, has been added to the… https://t.co/qGvkGgjAcB", 'RT @bbccomedy: WOOF! ❤️#RikMayallDay https://t.co/ioJtvYVFRO', '😱 The most hardcore baptism you’ll ever see. https://t.co/aEsVqMUPQ2', "#InternationalWomensDay is tomorrow, so there's no better time to test how much you know about female suffrage.\n👉… https://t.co/6ulqfr8zyL", "🚂💀 All aboard London's Victorian railway for the dead. https://t.co/L7vJO4ybeD", "😍 The first polar bear cub to be born in the UK for 25 years has emerged at the @RZSS's @HighlandWPark!\n👉… https://t.co/4fhzBaxwjF", 'RT @bbccomedy: Today would have been the 60th birthday of the legend, the genius, the king Rik Mayall. We miss you, sir! #RikMayallDay http…', 'The wreck of a US aircraft carrier that was sunk during WW2 has been found off the coast of Australia. https://t.co/8NQfRdFXTE', "RT @BBCFOUR: There's a very good reason this extreme firework was banned... https://t.co/pdfpcDiJ4h", 'RT @CBeebiesHQ: 3 out of 4 parents wouldn’t be able to save their baby from choking. \n\nLearn how to help in a first aid emergency…https://t…', 'A moving story of how one woman transformed Alzheimer’s research forever. ❤️https://t.co/2fwJDbWT8x', "RT @BBCOne: They've smashed the record for the highest profit EVER on Antiques Road Trip! 😲 https://t.co/TNuRcp2EOq"]
    Compound: [0.0, 0.0, 0.4987, 0.0, 0.0, 0.8555, 0.0, 0.5562, 0.0, 0.0, 0.0, 0.1742, -0.6369, 0.0, -0.2244, -0.4404, 0.4927, 0.4404, 0.0, 0.4926]



```python

# Create plot


plt.scatter(np.arange(len(sentiments_pd["Compound"])),
         sentiments_pd["Compound"],s=80,c=['r','b','y'], marker="o", linewidth=0.8,
         alpha=0.9)



# # Incorporate the other graph properties
plt.title("\n".join(wrap("Sentiment Analysis of Tweets (%s) for %s" % (time.strftime("%x"), target_user),44)))
plt.ylabel("Tweet Polarity")
plt.xlabel("Tweets Ago")
plt.legend(target_user, bbox_to_anchor=(1.00, 1), loc=2, borderaxespad=1.)
plt.savefig('HW7_Scatter_BBC.png')
plt.show()

```


![png](output_5_0.png)

