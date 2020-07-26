library(dplyr)
library(stringr)
library(tidytext)
raw_tech <- read.csv("data/ProjetosAtivos - Jul2020.csv",header = FALSE, sep="")
tech <- data.frame(trimws(gsub(","," ",raw_tech$V1)))
all <- tech %>% unnest_tokens(word, text)
all %>% count(word) %>% 
  with(wordcloud(word,n,colors=brewer.pal(8,"Dark2"),
                 rot.per=0.35,random.order=FALSE))
