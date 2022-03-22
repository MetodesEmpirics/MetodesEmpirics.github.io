## ----preamble, echo=FALSE-----------------------------------------------------
library(readr)
library(dplyr)
library(ggplot2)
library(reshape2)
library(ggpubr)


## ---- echo=FALSE, warning=FALSE, message=FALSE--------------------------------

swow <- read_csv('data/local/swow/swow-rw-common.csv')
mn <- read_csv('data/local/mn/mn-rw-common.csv')
distr <- read_csv('data/local/distributional/distr_long.csv')
mx_swow <- as.matrix(swow[,2:dim(swow)[2]])
rownames(mx_swow) <- colnames(mx_swow)
mx_mn <- as.matrix(mn[,2:dim(mn)[2]])
rownames(mx_mn) <- colnames(mx_mn)
mx_distr <- as.matrix(distr[,2:dim(distr)[2]])
rownames(mx_distr) <- colnames(mx_distr)



## ---- echo=FALSE--------------------------------------------------------------
topN <- function(X,word,top_n){
  X <- X %>% select(X1,!!as.name(word)) %>%
             arrange(desc(!!as.name(word))) %>%
             slice_head(n=top_n) %>%
             filter(!!as.name(word) > 0 & !!as.name(word) < 1)

return(X)
}

print('Top 5 neighbors for a sample of MN-RW')
topN(mn,'ambulance',5)
topN(mn,'man',5)
topN(mn,'zombie',5)
topN(mn,'bird',5)
topN(mn,'shirt',5)
print('### ### ###')

print('Top 5 neighbors for a sample of SWOW-RW')
topN(swow,'ambulance',5)
topN(swow,'man',5)
topN(swow,'zombie',5)
topN(swow,'bird',5)
topN(swow,'shirt',5)
print('### ### ###')

print('Top 5 neighbors for a sample of word embeddings')
topN(distr,'ambulance',5)
topN(distr,'man',5)
topN(distr,'zombie',5)
topN(distr,'bird',5)
topN(distr,'shirt',5)


