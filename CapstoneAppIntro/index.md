---
title       : Next Word Prediction App Introduction
subtitle    : Coursera Data Science Specialization Capstone
author      : Liyang Qin
job         : 
framework   : revealjs        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---
## Next Word Prediction App Introduction
Coursera Data Science Specialization Capstone
### [Liyang Qin](https://github.com/LiyangQin)

--- . class # Background
## Road to a quicker typing experience
The development of this application start with one question:
how to improve user's typing experience on mobile devices.
To solve this problem, one way is to automatically **PREDICT** the next word based on words already entered.

> 
[Information theory](https://en.wikipedia.org/wiki/Information_theory)
[NLP](https://en.wikipedia.org/wiki/Natural_language_processing)
[n-grams](https://en.wikipedia.org/wiki/N-gram)
[Markov property](https://en.wikipedia.org/wiki/Markov_property)

--- .class1 # Algorithm 1
## N-gram Language Model
- The app simply give the highest probability guess of the next word. By counting **TERM FREQUENCIES** of common words, we summarized a table of their probability. 
  + P(word) = Count(word)/Count(Entries)
- Under Markov assumption, we assume the probability of the next words is only related to the closest words before it. 
  + P(w2|w1) = p(w2,w1)/p(w2) [bigram model]
  + p(w3|w2,w1) = p(w3,w2,w1)/p(w2|w1)/p(w1) [trigram model]
- In practice, the most frequent words is most likely "the" "and" "for" etc. For more meaningful result, our cleaning stage have elimilated those **STOP WORDS**

--- .class1 # WEB
### Building corpus with web resources
Our data comes from 3 types of web resources: news, blog, and twitter. Those material were pre-organized and can be accessed from [Capstone Dataset](https://d396qusza40orc.cloudfront.net/dsscapstone/dataset/Coursera-SwiftKey.zip)

### Balancing between n-gram
- After training the n-gram statistical table, we applied **STUPIC BACKOFF** method to rank the prediction words. If a word can not be found in its 3-gram table, it ***backoff*** to 2-gram table. A backoff ratio is assigned to represent that the 2-gram result is less ideal than the 3-gram result. Our model uses 0.4 for the ratio.
- Stupid backoff is inexpensive to calculate and suitable for our application on the web

--- .class1 Application
## How to use
- Enter your sentence without the word you want to predict. The app will run automatically.
- The app give the first 3 predictions for your sentence and a word cloud for the first 20 probabilities.
- You can confirm the input by the "You Entered" section
- More information can be found on the "About this App" tab
- App Access: [Next Word Prediction App](https://liyangqin.shinyapps.io/NextWordPredictionApp/)
- Exploratory analysis: [Data Exploration](https://rpubs.com/)

### Read more:
[Large Language Models in Machine Translation](http://www.aclweb.org/anthology/D07-1090.pdf)
[Speach and Language Processing - ngram](https://lagunita.stanford.edu/c4x/Engineering/CS-224N/asset/slp4.pdf)
