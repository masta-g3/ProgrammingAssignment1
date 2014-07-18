corr <- function(directory, threshold = 0) {

  ##Get File function
  getfile <- function(directory, num = 1:332) {
    if(num < 10) {
      a <- paste(directory, "/00", num, '.csv', sep="")
    } else if(num < 100) {
      a <- paste(directory, "/0", num, '.csv', sep="")
    } else {
      a <- paste(directory,"/", num, '.csv', sep="")
    }  
    read.csv(a)
  }
  
  ##Loading the file names into a list
  myFiles <- list.files(path=directory, full.names=T)
  q <- length(myFiles)
  z <-numeric()

  ##Inititalize objects
  output <- numeric()
  fin <- data.frame()
  
  ##Obtain the files that are over the threshold
  allFiles <- complete(directory, 1:q)
  compFiles <- allFiles$id[allFiles$nobs > threshold]
  compFiles

  ##Loop over these files to get the correlations
  for(items in compFiles) {
    fin <- getfile(directory, items)
    clean_fin <- na.omit(fin)   ##a clean dataframe witout NA, using na.omit
    z <- c(z, round(cor(clean_fin$sulfate,clean_fin$nitrate),4)) ## on each loop, do corelation of sulfate, nitrate columns
  }
  z
}