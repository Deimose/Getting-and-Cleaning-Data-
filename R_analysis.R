#Reading data
features<-read.csv("./UCI HAR Dataset/features.txt",header=FALSE,sep="")
features<-as.character(features[,2])
activity_labels<-read.table("./UCI HAR Dataset/activity_labels.txt",header=FALSE)
activity_labels<-as.character(activity_labels[,2])
X_train<-read.table("UCI HAR Dataset/train/X_train.txt")
y_train<-read.csv("./UCI HAR Dataset/train/y_train.txt",header=FALSE,sep="")
X_test<-read.table("./UCI HAR Dataset/test/X_test.txt")
y_test<-read.csv("UCI HAR Dataset/test/y_test.txt",header=FALSE,sep="")
subject_train<-read.csv("UCI HAR Dataset/train/subject_train.txt",header=FALSE,sep="")
subject_test<-read.csv("./UCI HAR Dataset/test/subject_test.txt",header=FALSE,sep="")



#Assigning names & merging 

data_train<-data.frame(subject_train, y_train,X_train)
names(data_train)<-c(c("subject","activity"),features )
data_test<-data.frame(subject_test, y_test,X_test)
names(data_test)<-c(c("subject","activity"),features )
data<-rbind(data_train,data_test)
mean_std<-grep("mean|std",features)
data_1<-data[,c(1,2,mean_std+2)]
data_1$activity<-activity_labels[data_1$activity]
names(data_1)<-gsub("[(] [ ) ])","",names(data_1))
names(data_1)<-gsub("Acc","Accelerometer",names(data_1))
names(data_1)<-gsub("Gyro","Gyroscope",names(data_1))
names(data_1)<-gsub("Mag","Magnitude",names(data_1))
names(data_1)<-gsub("^t","TimeDomain_",names(data_1))
names(data_1)<-gsub("^f","FrequencyDomain_",names(data_1))
names(data_1)<-gsub("-mean-","_Mean_",names(data_1))
names(data_1)<-gsub("-std","_Std_",names(data_1))
names(data_1)<-gsub("-","_",names(data_1))

# Aggragate tidy
tidy<-aggregate(data_1[,3:81],by=list(activity=data_1$activity,subject=data_1$activity),FUN=mean)

#Creating the text file
write.table(x=tidy,file="tidy data.txt",row.names=FALSE)