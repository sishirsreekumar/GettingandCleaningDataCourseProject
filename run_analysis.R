if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="./data/WearableData.zip")

unzip(zipfile="./data/WearableData.zip",exdir="./data/WearableData")

path_rf <- file.path("./data/WearableData/UCI HAR Dataset")

#Reading the Activity files
activityTest  <- read.table(file.path(path_rf, "test" , "Y_test.txt" ),header = FALSE)
activityTrain <- read.table(file.path(path_rf, "train", "Y_train.txt"),header = FALSE)

#Reading the Subject files
subjectTrain <- read.table(file.path(path_rf, "train", "subject_train.txt"),header = FALSE)
subjectTest  <- read.table(file.path(path_rf, "test" , "subject_test.txt"),header = FALSE)

#Reading the Features files
featuresTest  <- read.table(file.path(path_rf, "test" , "X_test.txt" ),header = FALSE)
featuresTrain <- read.table(file.path(path_rf, "train", "X_train.txt"),header = FALSE)

#1. Merges the training and the test sets to create one data set.
#Merges the training and the test sets to create one data set (Merging on Rows)
activity<- rbind(activityTrain, activityTest)
subject <- rbind(subjectTrain, subjectTest)
features<- rbind(featuresTrain, featuresTest)

#Setting the names of the variables
names(activity)<- c("activity_id")
names(subject)<-c("subject_id")
featuresNames <- read.table(file.path(path_rf, "features.txt"),head=FALSE)
names(features)<- featuresNames$V2

#Merging on columns to create the final dataset
final <- cbind(features, subject, activity)


#2.Extracts only the measurements on the mean and standard deviation for each measurement.
#Getting only columns with mean and std in their column names and then subsetting the final data based on the required columns
requiredFeaturesNames<-featuresNames$V2[grep("mean\\(\\)|std\\(\\)", featuresNames$V2)]

#Including the subject and activity column to the final dataset
finalNames<-c(as.character(requiredFeaturesNames), "subject_id", "activity_id" )
final <- final[ , which(names(final) %in% finalNames)]


#3. Uses descriptive activity names to name the activities in the data set
#Getting the descriptive labels from activity_labels.txt
activityLabels <- read.table(file.path(path_rf, "activity_labels.txt"),header = FALSE)
final <- merge(final, activityLabels, by.x="activity_id", by.y= "V1")


#4. Appropriately labels the data set with descriptive variable names.
#Making column names more readable and dropping activity_id since we need just the name of the activity
names(final)<-gsub("^t", "time", names(final))
names(final)<-gsub("^f", "frequency", names(final))
names(final)<-gsub("Acc", "accelerometer", names(final))
names(final)<-gsub("Gyro", "gyroscope", names(final))
names(final)<-gsub("Mag", "magnitude", names(final))
names(final)<-gsub("BodyBody", "body", names(final))
names(final) <- gsub("-mean\\(\\)","mean", names(final))
names(final) <- gsub("-std\\(\\)","stdDeviation", names(final))
names(final)[names(final) == 'V2'] <- 'activityName'
final <- subset(final, select=-activity_id)

#5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
#Creating the aggregate data
tidyData<-aggregate(. ~subject_id + activityName, final, mean)
tidyData<-tidyData[order(tidyData$subject_id, tidyData$activityName),]

write.table(tidyData, file = "tidydata.txt", row.name=FALSE)

