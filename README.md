# Coursera Getting and Cleaning Data - Project

## General information

The code for the project is separated in multiple files. The main script file is `run_analysis.R` which relies on other files sourced when running it.

## Working directory

The script assumes its working directory contains the `UCI_HAR_Dataset`, so if you're running the script from the git repo, you should make sure the working directory for the script is the repo's directory.

## Code style

The code is written with readability in mind, so I hope it to be fairly understandable. This is why it's heavily split
in several methods and files.

## How I dealt with the project's requirements

### 1. Merges the training and the test sets to create one data set.

The results of this 1st requirement are in the `mergedDataset` variable in
`run_analysis.R`.

I only read the features from the `X_test.txt` and `X_train.txt` files since the other files
do not contain measurements on mean and standard deviation.

### 2. Extracts only the measurements on the mean and standard deviation for each measurement.

I select features matching this requirement by:

1. Reading feature names from `features.txt`
2. Selecting the feature names containing `mean` or `std` for the measurements on the mean (by using `grep("(mean|std)"`).

This is the purpose of the `select_features.R` script which creates a vector containing the feature names on mean
and standard deviation. I then use this vector to build `meanStdDataset` from `mergedDataset`. `meanStdDataset`
is the dataset matching the project's requirement 2.

### 3. Uses descriptive activity names to name the activities in the data set

To achieve this requirement, I the activity column with activity labels from the
`test` and `train` into `meanStdDataset`. The result is the updated version of
`meanStdDataset` which was added an `activity` column.

### 4. Appropriately labels the data set with descriptive variable names.

For this requirement, I consider the current state of my dataset acceptable because the columns
are named from the feature names, and I just added the `activity` named column.

I just add the `subject` column at this step since it is required for requirement 5.

### 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

The expected dataset is saved in `resultDataset` and is obtained by using the `aggregate` function, grouping by
the `activity` and `subject` columns.

## Result

The result file, `out.txt` is committed into the repository and the generation command
is at the end of the script.
