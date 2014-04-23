pollutantmean <- function(directory, pollutant, id = 1:332) {  
  for (i in id){
    s <- sprintf("%03d", i);
    path <- paste(c(directory,'/',s,'.','csv'), collapse='')
    d <- read.csv(path) 
    if (pollutant=="sulfate"){
      sulfate <- d$sulfate[!is.na(d$sulfate)]
      return(mean(sulfate))
    }
    if(pollutant=="nitrate"){
      nitrate <- d$nitrate[!is.na(d$nitrate)]
      return(mean(nitrate))
    }
  }
}