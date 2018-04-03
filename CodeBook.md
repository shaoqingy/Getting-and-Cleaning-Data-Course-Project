# Code Book for the Project

In this file, the variables, the data, and any transformations or work that are performed to clean up the data will be described.

## variables
* subject: subject identifer
* activity: 6 activities
  * WALKING: the subject is walking
  * WALKING_UPSTAIRS: the subject is walking upstairs
  * WALKING_DOWNSTAIRS: the subject is walking downstairs
  * SITTING: the subject is sitting
  * STANDING: the subject is standing
  * LAYING: the subject is laying
  
* features of the signals
  * tBodyAcc-XYZ
  * tGravityAcc-XYZ
  * tBodyAccJerk-XYZ
  * tBodyGyro-XYZ
  * tBodyGyroJerk-XYZ
  * tBodyAccMag
  * tGravityAccMag
  * tBodyAccJerkMag
  * tBodyGyroMag
  * tBodyGyroJerkMag
  * fBodyAcc-XYZ
  * fBodyAccJerk-XYZ
  * fBodyGyro-XYZ
  * fBodyAccMag
  * fBodyAccJerkMag
  * fBodyGyroMag
  * fBodyGyroJerkMag
  
In the above features.
t: time, f: frequency, Acc: Accelerometer, Gyro: Gyroscope, Mag: Magnitude

* The variables estimated from these signals
  * mean(): Mean value
  * std(): Standard deviation
  * mad(): Median absolute deviation 
  * max(): Largest value in array
  * min(): Smallest value in array
  * sma(): Signal magnitude area
  * energy(): Energy measure. Sum of the squares divided by the number of values. 
  * iqr(): Interquartile range 
  * entropy(): Signal entropy
  * arCoeff(): Autorregresion coefficients with Burg order equal to 4
  * correlation(): correlation coefficient between two signals
  * maxInds(): index of the frequency component with largest magnitude
  * meanFreq(): Weighted average of the frequency components to obtain a mean frequency
  * skewness(): skewness of the frequency domain signal 
  * kurtosis(): kurtosis of the frequency domain signal 
  
  
## Transformations
The source data is located at the link of
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.

The following transformations were applied to the source data to get the output data tidy_data.txt:

* The training data and the test data were merged to be one data set.
* The measurements on the mean and standard deviation for each measurement were extracted.
* The activity identifiers were replaced by the descriptive activity names
* The varaible names were also replaced with discriptive names
* The tidy data set with the average of each variable for each activity and each subject was created.
