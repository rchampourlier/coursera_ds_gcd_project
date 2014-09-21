# read_activities.R
# This scripts reads the activities from the specified dataset
# and convert integer activities into the descriptive activity
# names.

# Loading components from other files
source("./functions.R")

# datasetName expects "test" or "train"
readActivities <- function(datasetName) {
  data <- readActivitiesData(datasetName)
  return(sapply(data, activityLabelForValue, simplify=array))
}

# Implementation methods

# Returns a data.frame of the features data in the
# specified dataset ("test" or "train")
readActivitiesData <- function(datasetName) {
  return(readVectorFromFile(datasetName, "y", datasetName))
}

# Reads the activity labels, ignoring the index at the begining
# since it exactly correspond to the line number.
activityLabels <- readTableFromFile("", "activity_labels")[,2]

# This function takes an integer (or string mappable to integer)
# value and converts it to the activity label.
activityLabelForValue <- function(value) {
  activityLabels[as.integer(value)]
}