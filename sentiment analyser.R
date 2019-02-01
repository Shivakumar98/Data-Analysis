# the below 10 lines are for Sentence input 

library(sentimentr)
some_text=c('this is a beautiful day','i am not feeling good. I hate it when it happens','The product is good but expensive at this price','i love you')
sentiment(some_text)
sentiment_by(some_text)
help("packageName=sentimentr")

extract_sentiment_terms(some_text)

plot(sentiment(some_text))


# the below code are for text file input
getwd()
setwd("C:\\Users\\Shiva\\Documents\\R\\Projects")
readLines("sentiment.txt")

str(readLines("sentiment.txt"))

#cleaning the txt
paste(readLines("sentiment.txt"),collapse = " ")


text=paste(readLines("sentiment.txt"),collapse = " ")


#remove punctuation marks and colons hyphen etc
text2=gsub(pattern="\\W", replacement=" ", text)
text2

#removing numbers in txt file
text3=gsub(pattern="\\d", replacement=" ", text2)
text3

#to lower case
tolower(text3)

library(tm)

#the words that doesnot mean anything to a sentiment
stopwords()

#remove stop words

text4=removeWords(text3,stopwords())
text4

#remove single letter word
text5=gsub(pattern="\\b[A-z]\\b{1}", replacement=" ", text4)
text5

library(stringr)
library(wordcloud)

textbag=str_split(text5,pattern="\\s+")
textbag

textbag=unlist(textbag)
textbag

## anaylsis
analysis=extract_sentiment_terms(textbag)
plot(sentiment(textbag))
sentiment(textbag)



poswords=paste(readLines("positive_words.txt"),collapse = " ")
poswords
poswords=str_split(poswords,pattern="\\s+")
poswords
poswords=unlist(poswords)
poswords
match(textbag,poswords)
pos=sum(!is.na(match(textbag,poswords)))

negwods=paste(readLines("negative_words.txt"),collapse = " ")
negwods
negwods=str_split(negwods,pattern="\\s+")
negwods
negwods=unlist(negwods)
negwods
match(textbag,negwods)
neg=sum(!is.na(match(textbag,negwods)))

score=pos-neg
score

# analyse them as you want

wordcloud(textbag)
wordcloud(textbag,min.freq = 80)

wordcloud(textbag,min.freq = 10,order=FALSE)

wordcloud(textbag,min.freq = 150,order=FALSE,scale = c(2,0.5),color =rainbow(6) )


# stopwords()


