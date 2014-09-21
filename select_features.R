# This script select features (mean and std) in
# the feature names extracted using read_features.R

source("./read_features.R")

featureNames <- readFeatureNames()
meanStdFeatureNames <- featureNames[grep("(mean|std)", featureNames)]
