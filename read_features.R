# read_features.R
# This scripts performs the reading of features
# from features.txt into a vector. Only the names
# are kept, the indices at the beginning of the line
# are ignored.

# Loading components from other files
source("./functions.R")

# datasetName expects "test" or "train"
readFeatures <- function(datasetName) {
  data <- readFeaturesData(datasetName)
  names(data) <- readFeatureNames()
  return(data)
}

# Implementation methods

# Returns a data.frame of the features data in the
# specified dataset ("test" or "train")
readFeaturesData <- function(datasetName) {
  return(as.data.frame(readTableFromFile(datasetName, "X", datasetName)))
}

readFeatureNames <- function() {
  table <- readTableFromFile(".", "features")
  return(table[,2])
}