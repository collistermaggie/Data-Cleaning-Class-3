# Data-Cleaning-Class-3

Overview
This script will allow you to open and tidy the datafile of the Samsung Data Set for the Getting and Cleaning Data Coursera course


Assignment description
Merges the training and the test sets to create one data set.
Extracts only the measurements on the mean and standard deviation for each measurement.
Uses descriptive activity names to name the activities in the data set
Appropriately labels the data set with descriptive variable names.
From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

NOTES and REQUIREMENTS
User needs to be able to access the internet to download the data files
Plyr package is used and must be installed first :  install.packages("plyr") 

Open RStudio or R, download the script and run it from the software once you have installed Plyr package. This script runs the download itself. Make sure you are connected to the Internet. In case you need more description about the steps - see comments inside the script.

Reading the result
run_analysis.R creates 1 file:

tidy_dataset.txt: a tab-delimited file containing tidy data set with the mean of each variable for each activity and each subject
To access the result type following in R: read.table("tidy_dataset.txt", header=TRUE)
