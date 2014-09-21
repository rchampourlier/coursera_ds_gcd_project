# Loading components from other files
source("./functions.R")
source("./read_features.R")

# Requirement 1:
# Merges the training and the test sets to create one data set.
testFeatures <- readFeatures("test")
trainFeatures <- readFeatures("train")
mergedDataset <- rbind(testFeatures, trainFeatures)
# mergedDataset now contains the requirements for project's step 1

# Requirement 2:
# Extracts only the measurements on the mean and standard
# deviation for each measurement.
source("./select_features.R")
meanStdDataset <- mergedDataset[,meanStdFeatureNames]

# Requirement 3
# Uses descriptive activity names to name the activities in the data set

source("./read_activities.R")
testActivities <- readActivities("test")
trainActivities <- readActivities("train")
meanStdDataset$activity <- c(testActivities, trainActivities)

# Requirement 4
# Appropriately labels the data set with descriptive variable names. 
# I consider it's already good, the meanStdDataset names are the
# feature names and "activity", so it's as descriptive as possible
# for a set of 79 features!
# However, since requirement 5 requires to work from the dataset
# at this stage and it requires the subject values which are lacking
# from meanStdDataset, I will add them now.
source("./read_subjects.R")
testSubjects <- readSubjects("test")
trainSubjects <- readSubjects("train")
meanStdDataset$subject <- c(testSubjects, trainSubjects)

# Requirement 5
# From the data set in step 4, creates a second, independent tidy data
# set with the average of each variable for each activity and each subject.
resultDataset <- aggregate(meanStdDataset[1:79], list(meanStdDataset$activity, meanStdDataset$subject), mean)

# Generating the projects results
write.table(resultDataset, row.name=FALSE, file="out.txt")