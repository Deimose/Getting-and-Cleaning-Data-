
######Download  files

url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url, file.path(getwd(), "Files.zip"))
unzip(zipfile = "Files.zip")


#Merges the training set to create data set


features <- read.table("UCI HAR Dataset/features.txt", col.names = c("n","functions"))
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("code", "activity"))
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
X_train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$functions)
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "code")


######Merges the training anda the test to create one data set call data


subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
X_test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$functions)
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "code")

###### Combine dat
X_data <- rbind(X_train, X_test)
y_data <- rbind(y_train, y_test)
subject_data <- rbind(subject_train, subject_test)
data <- cbind(subject_data, y_data, X_data)

######Extracts the measurements on the mean anda std

data_1<-data %>% select(subject,code,contains("mean"),contains("std"))

##### Uses descriptive activity names to name the activities in the data set

data_1$code<-activity_labels[data_1$code,2]


######Appropriately labels the data set with descriptive variable names.
names(data_1)[2]="activity"
names(data_1)<-gsub("Acc","Accelerometer",names(data_1))
names(data_1)<-gsub("Gyro","Gyroscope",names(data_1))
names(data_1)<-gsub("Mag","Magnitude",names(data_1))
names(data_1)<-gsub("^t","TimeDomain_",names(data_1))
names(data_1)<-gsub("^f","FrequencyDomain_",names(data_1))
names(data_1)<-gsub("BobyBoby","Body",names(data_1))
names(data_1)<-gsub("tBoby","TimeBody",names(data_1))
names(data_1)<-gsub("-mean()","_Mean_",names(data_1))
names(data_1)<-gsub("-std()","_Std_",names(data_1))
names(data_1)<-gsub("-freq()","Frequency",names(data_1))
names(data_1)<-gsub("angle","Angle",names(data_1))
names(data_1)<-gsub("gravity","Gravity",names(data_1))



######From the data set in step 4, creates a second, independent tidy data set with the average 
########   of each variable for each activity and each subject.

tidy<-data_1 %>% group_by(subject,activity) %>% summarise_all(funs(mean))
#Creating the text file
write.table(x=tidy,file="Tidy.txt",row.names=FALSE)
