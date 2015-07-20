---
title: GETTING AND CLEANING DATA - COURSE PROHECT | CODE BOOK"
author: "Aish Varadhan"
date: "July 19, 2015"
---

A Code Book that describes the data transformation process and the tidy data set

I. Data Transformation Process
```{r}
1. Merges the ~\test and \~train data sets in the following manner
  a. Load the ~\test\y_test.txt containing the activity identifiers
  b. Load the ~\test\subject_test.txt containing the subject identifiers
  c. Load the ~\test\X_test.txt containing the 561 vectors of measurements
  d. Merge the columns in a, b, and c to arrive at the test data set
  e. Load the ~\train\y_train.txt containing the activity identifiers
  f. Load the ~\train\subject_train.txt containing the subject identifiers
  g. Load the ~\train\X_train.txt containing the 561 vectors of measurements
  h. Merge the columns in e, f, and g to arrive at the train data set
  i. Merge the test and train data sets using rbind to arrive at a combined data set
2. Replace the Activity identifiers with Activity labels as in ~\activity_labels.txt
3. Subset merged data from 1.i to only extract *mean() and *std() features as in ~\features.txt
4. Update the subset data set from 3 with columnnames for *mean() and *std() as in ~\features.txt
5. Group the subset data set from 4 by Activity and Subject
6. Summarize the grouped data set from 5 by calculating the mean of all other columns
7. Write the final result from 6 to a file called tidy_data.txt into the same folder as the data
```


II. Structure of Tidy Data Set

  A [180 X 81] data frame with the following variables (column names)

```{r}
Activity	character
Subject	character
tBodyAcc-mean()-X	double
tBodyAcc-mean()-Y	double
tBodyAcc-mean()-Z	double
tGravityAcc-mean()-X	double
tGravityAcc-mean()-Y	double
tGravityAcc-mean()-Z	double
tBodyAccJerk-mean()-X	double
tBodyAccJerk-mean()-Y	double
tBodyAccJerk-mean()-Z	double
tBodyGyro-mean()-X	double
tBodyGyro-mean()-Y	double
tBodyGyro-mean()-Z	double
tBodyGyroJerk-mean()-X	double
tBodyGyroJerk-mean()-Y	double
tBodyGyroJerk-mean()-Z	double
tBodyAccMag-mean()	double
tGravityAccMag-mean()	double
tBodyAccJerkMag-mean()	double
tBodyGyroMag-mean()	double
tBodyGyroJerkMag-mean()	double
fBodyAcc-mean()-X	double
fBodyAcc-mean()-Y	double
fBodyAcc-mean()-Z	double
fBodyAcc-meanFreq()-X	double
fBodyAcc-meanFreq()-Y	double
fBodyAcc-meanFreq()-Z	double
fBodyAccJerk-mean()-X	double
fBodyAccJerk-mean()-Y	double
fBodyAccJerk-mean()-Z	double
fBodyAccJerk-meanFreq()-X	double
fBodyAccJerk-meanFreq()-Y	double
fBodyAccJerk-meanFreq()-Z	double
fBodyGyro-mean()-X	double
fBodyGyro-mean()-Y	double
fBodyGyro-mean()-Z	double
fBodyGyro-meanFreq()-X	double
fBodyGyro-meanFreq()-Y	double
fBodyGyro-meanFreq()-Z	double
fBodyAccMag-mean()	double
fBodyAccMag-meanFreq()	double
fBodyBodyAccJerkMag-mean()	double
fBodyBodyAccJerkMag-meanFreq()	double
fBodyBodyGyroMag-mean()	double
fBodyBodyGyroMag-meanFreq()	double
fBodyBodyGyroJerkMag-mean()	double
fBodyBodyGyroJerkMag-meanFreq()	double
tBodyAcc-std()-X	double
tBodyAcc-std()-Y	double
tBodyAcc-std()-Z	double
tGravityAcc-std()-X	double
tGravityAcc-std()-Y	double
tGravityAcc-std()-Z	double
tBodyAccJerk-std()-X	double
tBodyAccJerk-std()-Y	double
tBodyAccJerk-std()-Z	double
tBodyGyro-std()-X	double
tBodyGyro-std()-Y	double
tBodyGyro-std()-Z	double
tBodyGyroJerk-std()-X	double
tBodyGyroJerk-std()-Y	double
tBodyGyroJerk-std()-Z	double
tBodyAccMag-std()	double
tGravityAccMag-std()	double
tBodyAccJerkMag-std()	double
tBodyGyroMag-std()	double
tBodyGyroJerkMag-std()	double
fBodyAcc-std()-X	double
fBodyAcc-std()-Y	double
fBodyAcc-std()-Z	double
fBodyAccJerk-std()-X	double
fBodyAccJerk-std()-Y	double
fBodyAccJerk-std()-Z	double
fBodyGyro-std()-X	double
fBodyGyro-std()-Y	double
fBodyGyro-std()-Z	double
fBodyAccMag-std()	double
fBodyBodyAccJerkMag-std()	double
fBodyBodyGyroMag-std()	double
fBodyBodyGyroJerkMag-std()	double
```
