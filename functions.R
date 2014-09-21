# functions
# 
# Defines the functions used by run_analysis.R

readVectorFromFile <- function(directory, dataName, setName=NULL) {
  filepath <- makeFilePath(directory, dataName, setName)
  return(scan(filepath, what="", sep="\n"))
}

readTableFromFile <- function(directory, dataName, setName=NULL) {
  filepath <- makeFilePath(directory, dataName, setName)
  return(read.table(filepath, stringsAsFactors = FALSE))
}

makeFilePath <- function(directory, dataName, setName) {
  if(is.null(setName)) {
    return(paste("UCI_HAR_Dataset/", directory, "/", dataName, ".txt", sep=""))
  }
  else {
    return(paste("UCI_HAR_Dataset/", directory, "/", dataName, "_", setName, ".txt", sep=""))
  }
}