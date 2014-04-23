corr <- function(directory, threshold = 0) {
  source("complete.R")
  com<-complete("specdata")
  la<-com$nobs>threshold
  r<-com$id[la]
  result = 0
  for (i in r){
    s <- sprintf("%03d", i);
    path <- paste(c(directory,'/',s,'.','csv'), collapse='')
    d <- read.csv(path) 
    d <-d[complete.cases(d),]
    sulfate <- d$sulfate[!is.na(d$sulfate)]
    nitrate <- d$nitrate[!is.na(d$nitrate)]
    result<-cor(sulfate,nitrate,use="complete.obs")
    #result <- c(cor(sulfate,nitrate,use="complete.obs"),result)
  }
  return(result)
}