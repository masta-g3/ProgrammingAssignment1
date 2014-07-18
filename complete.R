complete <- function(directory, id = 1:332) {
  ##Loading the file names into a list
  myFiles <- list.files(path=directory, full.names=T)
  
  ##Initialize objects
  myData <- data.frame()
  nobs <- numeric()
  
  ##Loop over the files for complete cases
  for(i in id) {
    tmpFile <- read.csv(myFiles[i])
    completeCases <- sum(complete.cases(tmpFile))
    nobs <- rbind(nobs, completeCases, deparse.level=0)
  }
  
  ##Align nobs and file name into df
  df <- data.frame(id, nobs)
  df
}