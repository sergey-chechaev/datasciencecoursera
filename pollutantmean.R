pollutantmean <- function(directory, pollutant, id = 1:332) {  
  result = 0
  for (i in id){
    s <- sprintf("%03d", i);
    path <- paste(c(directory,'/',s,'.','csv'), collapse='')
    d <- read.csv(path) 
    if (pollutant=="sulfate"){
      sulfate <- d$sulfate[!is.na(d$sulfate)]
      result <- c(result,sulfate)
    }
    if(pollutant=="nitrate"){
      nitrate <- d$nitrate[!is.na(d$nitrate)]
      result <- c(result,nitrate)
    }
  }
  return(round(mean(result),3))
}

