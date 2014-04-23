complete <- function(directory, id = 1:332) {  
  result <- NA
  for (i in id){
    s <- sprintf("%03d", i);
    path <- paste(c(directory,'/',s,'.','csv'), collapse='')
    d <- read.csv(path) 
    per<-d[complete.cases(d),]
    result<-rbind(result,(data.frame(id = i, nobs=length(per$ID))))
  }
  return(result[complete.cases(result),])
}