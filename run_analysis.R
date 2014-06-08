# Coursera "Getting and Cleaning Data" (getdata-004) course project
#

# ===================================================================================================
# = read labels for groups and measures (see dataset documentation in "UCI HAR Dataset/readme.txt") =
# ===================================================================================================
classlabels <- read.table("UCI HAR Dataset/activity_labels.txt")
measurelabels <- read.table("UCI HAR Dataset/features.txt")

# ======================
# = read training data =
# ======================
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

