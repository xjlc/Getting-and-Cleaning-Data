The measures come from the "Human Activity Recognition Using Smartphones Dataset" [1], Version 1.0, as available via the UCI machine learning repository. 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

### Experimental study design

According to the original documentation, the experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

### Information about variables, including units; summary choices made

1. Info about the variables, including units
(a) New variables not in the original data set

Subject and activity classification were recoded as factors from the original numerical data. Source was computed as a new factor variable, indicating whether the data are from the test or training set.

Name     type    content		

subject  factor  subject	
class    factor  activity classification (as in activity_labels.txt: walking, sitting, standing, laying etc.)
source   factor  were data obtained from training or test set?


(b) variables in the original data set (for documentation, see below)


A description of the meaning of these measures ("features" in machine learning lingo) is taken from the original data set documentation (see below). Note that, with respect to units of measurement, "features are normalized and bounded within [-1,1]".

"The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
[...]
"
The original documentation lists more measures, which we do not include here, because we selected only means and standard deviations according to course project instructions.



In detail, the measures contained in the resulting data set are 

Name                        type      

tBodyAcc.mean...X           numeric
tBodyAcc.mean...Y           numeric
tBodyAcc.mean...Z           numeric
tBodyAcc.std...X            numeric
tBodyAcc.std...Y            numeric
tBodyAcc.std...Z            numeric
tGravityAcc.mean...X        numeric
tGravityAcc.mean...Y        numeric
tGravityAcc.mean...Z        numeric
tGravityAcc.std...X         numeric
tGravityAcc.std...Y         numeric
tGravityAcc.std...Z         numeric
tBodyAccJerk.mean...X       numeric
tBodyAccJerk.mean...Y       numeric
tBodyAccJerk.mean...Z       numeric
tBodyAccJerk.std...X        numeric
tBodyAccJerk.std...Y        numeric
tBodyAccJerk.std...Z        numeric
tBodyGyro.mean...X          numeric
tBodyGyro.mean...Y          numeric
tBodyGyro.mean...Z          numeric
tBodyGyro.std...X           numeric
tBodyGyro.std...Y           numeric
tBodyGyro.std...Z           numeric
tBodyGyroJerk.mean...X      numeric
tBodyGyroJerk.mean...Y      numeric
tBodyGyroJerk.mean...Z      numeric
tBodyGyroJerk.std...X       numeric
tBodyGyroJerk.std...Y       numeric
tBodyGyroJerk.std...Z       numeric
tBodyAccMag.mean..          numeric
tBodyAccMag.std..           numeric
tGravityAccMag.mean..       numeric
tGravityAccMag.std..        numeric
tBodyAccJerkMag.mean..      numeric
tBodyAccJerkMag.std..       numeric
tBodyGyroMag.mean..         numeric
tBodyGyroMag.std..          numeric
tBodyGyroJerkMag.mean..     numeric
tBodyGyroJerkMag.std..      numeric
fBodyAcc.mean...X           numeric
fBodyAcc.mean...Y           numeric
fBodyAcc.mean...Z           numeric
fBodyAcc.std...X            numeric
fBodyAcc.std...Y            numeric
fBodyAcc.std...Z            numeric
fBodyAccJerk.mean...X       numeric
fBodyAccJerk.mean...Y       numeric
fBodyAccJerk.mean...Z       numeric
fBodyAccJerk.std...X        numeric
fBodyAccJerk.std...Y        numeric
fBodyAccJerk.std...Z        numeric
fBodyGyro.mean...X          numeric
fBodyGyro.mean...Y          numeric
fBodyGyro.mean...Z          numeric
fBodyGyro.std...X           numeric
fBodyGyro.std...Y           numeric
fBodyGyro.std...Z           numeric
fBodyAccMag.mean..          numeric
fBodyAccMag.std..           numeric
fBodyBodyAccJerkMag.mean..  numeric
fBodyBodyAccJerkMag.std..   numeric
fBodyBodyGyroMag.mean..     numeric
fBodyBodyGyroMag.std..      numeric
fBodyBodyGyroJerkMag.mean.. numeric
fBodyBodyGyroJerkMag.std..  numeric



