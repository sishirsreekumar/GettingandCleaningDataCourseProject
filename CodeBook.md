# Codebook

This document contains all the data to indicate all the variables and summaries calculated, along with units, and any other relevant information.
## Description of the variables in the final tidy dataset
 1. subject_id : can take values from 1 - 30
 2. activityName : is a factor variable can take any of the 6 values (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)
 3. All the other columns contain the mean statistics for the combination of the subject and the activity performed.
timeBodyaccelerometermean-X<br />
timeBodyaccelerometermean-Y<br />
timeBodyaccelerometermean-Z<br />
timeBodyaccelerometerstdDeviation-X<br />
timeBodyaccelerometerstdDeviation-Y<br />
timeBodyaccelerometerstdDeviation-Z<br />
timeGravityaccelerometermean-X<br />
timeGravityaccelerometermean-Y<br />
timeGravityaccelerometermean-Z<br />
timeGravityaccelerometerstdDeviation-X<br />
timeGravityaccelerometerstdDeviation-Y<br />
timeGravityaccelerometerstdDeviation-Z<br />
timeBodyaccelerometerJerkmean-X<br />
timeBodyaccelerometerJerkmean-Y<br />
timeBodyaccelerometerJerkmean-Z<br />
timeBodyaccelerometerJerkstdDeviation-X<br />
timeBodyaccelerometerJerkstdDeviation-Y<br />
timeBodyaccelerometerJerkstdDeviation-Z<br />
timeBodygyroscopemean-X<br />
timeBodygyroscopemean-Y<br />
timeBodygyroscopemean-Z<br />
timeBodygyroscopestdDeviation-X<br />
timeBodygyroscopestdDeviation-Y<br />
timeBodygyroscopestdDeviation-Z<br />
timeBodygyroscopeJerkmean-X<br />
timeBodygyroscopeJerkmean-Y<br />
timeBodygyroscopeJerkmean-Z<br />
timeBodygyroscopeJerkstdDeviation-X<br />
timeBodygyroscopeJerkstdDeviation-Y<br />
timeBodygyroscopeJerkstdDeviation-Z<br />
timeBodyaccelerometermagnitudemean<br />
timeBodyaccelerometermagnitudestdDeviation<br />
timeGravityaccelerometermagnitudemean<br />
timeGravityaccelerometermagnitudestdDeviation<br />
timeBodyaccelerometerJerkmagnitudemean<br />
timeBodyaccelerometerJerkmagnitudestdDeviation<br />
timeBodygyroscopemagnitudemean<br />
timeBodygyroscopemagnitudestdDeviation<br />
timeBodygyroscopeJerkmagnitudemean<br />
timeBodygyroscopeJerkmagnitudestdDeviation<br />
frequencyBodyaccelerometermean-X<br />
frequencyBodyaccelerometermean-Y<br />
frequencyBodyaccelerometermean-Z<br />
frequencyBodyaccelerometerstdDeviation-X<br />
frequencyBodyaccelerometerstdDeviation-Y<br />
frequencyBodyaccelerometerstdDeviation-Z<br />
frequencyBodyaccelerometerJerkmean-X<br />
frequencyBodyaccelerometerJerkmean-Y<br />
frequencyBodyaccelerometerJerkmean-Z<br />
frequencyBodyaccelerometerJerkstdDeviation-X<br />
frequencyBodyaccelerometerJerkstdDeviation-Y<br />
frequencyBodyaccelerometerJerkstdDeviation-Z<br />
frequencyBodygyroscopemean-X<br />
frequencyBodygyroscopemean-Y<br />
frequencyBodygyroscopemean-Z<br />
frequencyBodygyroscopestdDeviation-X<br />
frequencyBodygyroscopestdDeviation-Y<br />
frequencyBodygyroscopestdDeviation-Z<br />
frequencyBodyaccelerometermagnitudemean<br />
frequencyBodyaccelerometermagnitudestdDeviation<br />
frequencybodyaccelerometerJerkmagnitudemean<br />
frequencybodyaccelerometerJerkmagnitudestdDeviation<br />
frequencybodygyroscopemagnitudemean<br />
frequencybodygyroscopemagnitudestdDeviation<br />
frequencybodygyroscopeJerkmagnitudemean<br />
frequencybodygyroscopeJerkmagnitudestdDeviation<br />


  
## Description of the Code

1.a It merges the training and test dataset to create one dataset each for Subject, Activity, and Features. Some cleaning is performed on the column names to make it more interpretable (egs V1 to activity_id in the activity dataset).
1.b After performing row-wise bind, column bind is performed to integrate the 3 datasets into 1 dataset with subject_id, activity_id and all the features).

2 Only the feature columns with mean() and std()  are required. Hence all the other feature columns are filtered out from the previously created combined dataset.

3 Activity names are specified in a text file called activity_labels.txt. This file is read and the value of activity_id in our final table is used to get the activity_name. This is done using the merge function.

4 The column names of the table are named appropriately using the gsub function and the patterns are specified using regular expressions within the gsub function.

5 A separate tidy dataset is created which shows the average of each subject and his activity measurements. This is acheived using the aggregate function.

6 The final tidy dataset is written to the working directory as tidydata.txt.

## Variables in the Code

activityTest, activityTrain contains the Test and Train data for activities i.e. Y_test.txt and Y_train.txt.
subjectTest, subjectTrain contains the Test and Train data for subjects i.e. subject_test.txt.txt and subject_train.txt.txt.
featuresTest, featuresTrain contains the Test and Train data for features i.e. X_test.txt and X_train.txt.

activity : contains the combined data of both test and train datasets for activity,
subject :  contains the combined data of both test and train datasets for subject.
features :  contains the combined data of both test and train datasets for features.

activityLabels : is read directly from activity_labels.txt. It contains the labels for the activity_id.

final : contains the final dataset with appropriate column names and activity names (instead of acticvity_ids) and the required measurements (only mean and sd)

tidyData : It is the independent tidy data set with the average of each variable for each activity - subject combination.
