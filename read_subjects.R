# read_subjects.R
# This scripts reads the subjects from the specified dataset.

# Loading components from other files
source("./functions.R")

# datasetName expects "test" or "train"
readSubjects <- function(datasetName) {
  return(readVectorFromFile(datasetName, "subject", datasetName))
}