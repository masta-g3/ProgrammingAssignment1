pollutantmean <- function(directory, pollutant, id = 1:332) {
  
  ##Loading the file names into a list
  myFiles<-list.files(path=directory,pattern=".csv", full.names=TRUE)
  
  ##Create a numeric vector for holding numeric values
  mydata <- numeric()
  for(i in id) {
    ##Combine all the data into a single large file
    mydata <- rbind(mydata,read.csv(myFiles[i]))
  }
  ##Calculate the mean for the given pollutant. 
  mean(mydata[ ,pollutant],na.rm=TRUE)
  
}