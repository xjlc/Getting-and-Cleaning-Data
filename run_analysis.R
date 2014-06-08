# Coursera "Getting and Cleaning Data" (getdata-004) course project
#
# The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.  
# 
# One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 
# 
# http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
# 
# Here are the data for the project: 
# 
# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
#
# You should create one R script called run_analysis.R that does the following. 
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names. 
# 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

# =============================================================================
# = 1. Merge the training and the test sets to create one data set.           =
# = 3. Uses descriptive activity names to name the activities in the data set =
# = 4. Appropriately labels the data set with descriptive variable names.     =
# =============================================================================
# read labels for groups and measures (see dataset documentation in "UCI HAR Dataset/readme.txt")
classlabels <- read.table("UCI HAR Dataset/activity_labels.txt")
measurelabels <- read.table("UCI HAR Dataset/features.txt")

# read training data
# 1. subjects
train.subject <- read.table("UCI HAR Dataset/train/subject_train.txt")
# 2. classification
train.class <- read.table("UCI HAR Dataset/train/y_train.txt")
# 3. measures N x 561
train.measures <- read.table("UCI HAR Dataset/train/X_train.txt")
names(train.measures) <- measurelabels[,2]
# construct training data frame: join subject, classification, and measures; convert subject to factor; convert classification to factor, using the appropriate labels from y_train.txt; 
training <- data.frame(subject=as.factor(train.subject[[1]]), class=factor(train.class[[1]], levels=classlabels[,1], labels=classlabels[,2]), train.measures)
# add a factor source and specify that this is the training data
training$source <- factor("training", levels=c("training", "test"))
nrow(training) # 7352

# read test data
# 1. subjects
test.subject <- read.table("UCI HAR Dataset/test/subject_test.txt")
# 2. classification
test.class <- read.table("UCI HAR Dataset/test/y_test.txt")
# 3. measures N x 561
test.measures <- read.table("UCI HAR Dataset/test/X_test.txt")
names(test.measures) <- measurelabels[,2]
# construct test data frame: join subject, classification, and measures; convert subject to factor; convert classification to factor, using the appropriate labels from y_train.txt; 
test <- data.frame(subject=as.factor(test.subject[[1]]), class=factor(test.class[[1]], levels=classlabels[,1], labels=classlabels[,2]), test.measures)
# add a factor source and specify that this is the test data
test$source <- factor("test", levels=c("training", "test"))
nrow(test) # 2947

# merge training and test data using merge (we could have used rbind instead)
dat <- merge(training, test, all=TRUE)
nrow(dat) # 10299

# ==============================================================================================
# = 2. Extract only the measurements on the mean and standard deviation for each measurement.  =
# ==============================================================================================

meanCols <- grep("mean", names(dat))
nonmeanCols <- grep("meanFreq", names(dat))
meanCols <- meanCols[!(meanCols %in% nonmeanCols)]
stdCols <- grep("std", names(dat))
useCols <- c("subject", "class", "source", names(dat)[sort(c(meanCols, stdCols))])

dat2 <- dat[, useCols]

# ========================================================================================================================
# = 5. Create a second, independent tidy data set with the average of each variable for each activity and each subject.  =
# ========================================================================================================================
