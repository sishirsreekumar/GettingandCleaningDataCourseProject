# Getting and CleaningDataCourseProject
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set.

The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

You should create one R script called run_analysis.R that does the following.

Merges the training and the test sets to create one data set.
Extracts only the measurements on the mean and standard deviation for each measurement.
Uses descriptive activity names to name the activities in the data set
Appropriately labels the data set with descriptive variable names.
From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

##Run_Analysis.R
To run the script, put the script in the current working directory and source the code by typing 
source("run_analysis.R") in the console.

###Getting the Data
The script firstly creates a directory/folder called data in the working directory. 
It then downloads the file from the link provided: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip into this data directory as a zip file. The script goes on to unzip the zip file into the data/WearableData folder.

If you navigate to the WearableData folder you will see a folder called UCI HAR Dataset. This contains all the data required for the analysis.
All the required files are read and stored in dataframes in R (Test and Training  datasets for Subject, Activity and Features).

After download and accessing/getting the data, the script performs the cleaning work
###Cleaning the Data
1.a It merges the training and test dataset to create one dataset each for Subject, Activity, and Features. Some cleaning is performed on the column names to make it more interpretable (egs V1 to activity_id in the activity dataset).
1.b After performing row-wise bind, column bind is performed to integrate the 3 datasets into 1 dataset with subject_id, activity_id and all the features).

2 Only the feature columns with mean() and std()  are required. Hence all the other feature columns are filtered out from the previously created combined dataset.

3 Activity names are specified in a text file called activity_labels.txt. This file is read and the value of activity_id in our final table is used to get the activity_name. This is done using the merge function.

4 The column names of the table are named appropriately using the gsub function and the patterns are specified using regular expressions within the gsub function.

5 A separate tidy dataset is created which shows the average of each subject and his activity measurements. This is acheived using the aggregate function.

6 The final tidy dataset is written to the working directory as tidydata.txt.
