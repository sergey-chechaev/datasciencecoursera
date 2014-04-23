corr <- function(directory, threshold = 0) {
  source("complete.R")
  completes <- complete(directory)
  thresholded <- completes[completes$nobs > threshold,]
  tids <- thresholded$id
  
  if(length(tids) == 0) {
    list <- vector()
    return(list)
  }
  
  ids <- formatC(tids, width=3, flag="0")
  filenames <- paste(directory, "/", ids, ".csv", sep="")
  files <- lapply(filenames, read.csv)
  list = rep(NA, length(files))
  
  for(i in 1:length(files)) {
    list[i] <- cor(files[[i]]$sulfate, files[[i]]$nitrate, use = "complete.obs")
  }
  list
} 