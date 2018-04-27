# Data-Cleaning-Class-3

Data Sets:

This script address the data sample founds at : https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
A full description of the data can be found at : http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Script:
The script does the following:
Merges the training and the test sets to create one data set.
Extracts only the measurements on the mean and standard deviation for each measurement.
Uses descriptive activity names to name the activities in the data set
Appropriately labels the data set with descriptive variable names.
From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

** it should be noted that the script uses the plyr function

Data Naming:
All the column names are described in features_info.txt data source zip file, except for the following:

activity: the string representing an activity of the subject
LAYING
SITTING
STANDING
WALKING
WALKING_UPSTAIRS
WALKING_DOWNSTAIRS
subject_id: the number of the subject


Result: The end result is a file named : tidy_dataset.txt that is found in your working directory
