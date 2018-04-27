# this script requires plyr to run, before running add:
# install.packages("plyr")
library(plyr)

# brings in the URL file and unzips to directory 

fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileURL, destfile = "raw_data.zip"
              )
unzip("raw_data.zip")

# makes sure it's the right WD
setwd("./UCI HAR Dataset/")

## 1. Merges training and test to one data set 
# brings in files and names columns clearly
features        <- read.table("features.txt")
activity_labels <- read.table("activity_labels.txt",       col.names = c("id","name"))
xtrain          <- read.table("./train/X_train.txt",       col.names = features[,2])
xtest           <- read.table("./test/X_test.txt",         col.names = features[,2])
ytrain          <- read.table("./train/y_train.txt",       col.names = "activity_id")
ytest           <- read.table("./test/y_test.txt",         col.names = "activity_id")
subject_train   <- read.table("./train/subject_train.txt", col.names = "subject_id")
subject_test    <- read.table("./test/subject_test.txt",   col.names = "subject_id")

# Binds  training dataset
training <- cbind(ytrain, subject_train, xtrain)
# Binds test dataset
test <- cbind(ytest, subject_test, xtest)
# Merges together the data sets  
merged_data <- rbind(training, test)

# Takes the mean and standard deviation for each measurement. 
# Creates a vector that can be used to select mean() and std() columns plus activity_id
# and subject_id
col_labels <- names(merged_data)
# Creates a local vector via grepl function to idenfity desired columns
selected_columns <- (grepl("activity",col_labels) | grepl("subject",col_labels) | grepl("mean",col_labels) | grepl("std",col_labels)) & !grepl("meanFreq",col_labels)
# Creates subset of dataset with selected columns
tidy <- merged_data[selected_columns==TRUE]

#  describes activity names to name the activities in the data set

for (i in 1:length(activity_labels$name)) { 
  tidy$activity_id <- sub(i, activity_labels$name[i], tidy$activity_id) }

# Labels data set with descriptive names

names(tidy) <- sub("activity_id", "activity", names(tidy)) 
names(tidy) <- sub("std", "StdDev", names(tidy))          
names(tidy) <- sub("\\.\\.", "", names(tidy))          
names(tidy) <- sub("mean", "Mean", names(tidy))          
names(tidy) <- sub("BodyBody", "Body", names(tidy))    

## 5. Create final tidy data set
excluded <- which(names(tidy) %in% c("activity", "subject_id"))
# Summarizes the results using plyr functions
result <- ddply(tidy,.(activity, subject_id),.fun=function(x){colMeans(x[,-excluded])})
# Goes back to workdirectory 
setwd("../")
# Exports the tidy_dataset.txt to current workdirectory
write.table(result, "tidy_dataset.txt", row.names=FALSE, sep='\t')

# Cleans up workspace
rm(list=ls())