Getting-and-Cleaning-Data
=========================

Course Project for Coursera course getdata-004 (Getting and Cleaning Data)

### 1. Merge the training and the test sets to create one data set.
### 2. Extract only the measurements on the mean and standard deviation for each measurement.
### 3. Uses descriptive activity names to name the activities in the data set.
### 4. Appropriately labels the data set with descriptive variable names. .

Steps 1,2, and 4 are performed in lines 26-59 of the script.
First, labels for the activity classification and names of the measures are read from the files activity_labels.txt and features.txt, respectively, in the data set and stored as data frames. 

Next, the subject, classification, and measurement data are read from the files subject_train.txt, y_train.txt, and X_train.txt, respectively for the training set (lines 31-35), and the corresponding files for the test set (lines 45-49). The measures are then named appropriately, using the names from features.txt (lines 36, 50). Classifications are stored in the variable "class".

All data for a given set are combined by using the data frame command (lines 38, 52). In this command, the classification (class) are converted to a factor and the levels are appropriately labeled (according to the activity_labels.txt). Subject is also converted to a factor.

A factor variable "source" coding for whether the data are from the training or test data set is added (lines 40, 54).

Training and test data frames are merged by using the merge command (line 58).

Then, step 2 is executed: measures containing mean (but not meanFreq) and std are identified using grep on the names of the data frame (lines 66-70). A reduced data frame containing only these measure variables in addition to the id variables subject, class, and source is created (line 72).

This reduced data frame is written to the text file test_and_training.txt.

### 5. Create a second, independent tidy data set with the average of each variable for each activity and each subject. 

The data set containing only averages by subject and activity is created using melt and dcast from Hadley Wickham's reshape2 package (lines 79-81).