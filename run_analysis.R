library (plyr)
## loading features and activity labels

features<-read.table("UCI HAR Dataset/features.txt")
activity.labels<-read.table("UCI HAR Dataset/activity_labels.txt")

## loading train sets
x_train<-read.table("UCI HAR Dataset/train/x_train.txt")
y_train<-read.table("UCI HAR Dataset/train/y_train.txt")
subject_train<-read.table("UCI HAR Dataset/train/subject_train.txt")
## loading test sets
x_test<-read.table("UCI HAR Dataset/test/x_test.txt")
y_test<-read.table("UCI HAR Dataset/test/y_test.txt")
subject_test<-read.table("UCI HAR Dataset/test/subject_test.txt")

## combining Train set and Test set
x_set<-rbind(x_train,x_test)#
y_set<-rbind(y_train,y_test)
subject_set<-rbind(subject_train,subject_test)

## Changing the numeric labels for the corresponding activity label
y_set<-factor(y_set$V1)
a<-levels(y_set)
b<- as.character(activity.labels$V2)
y_set<-mapvalues(y_set,from=a,to=b)

## labeling each variable with data from features.txt
colnames(x_set)<-features$V2

## Looking for the mean and standard deviation variables
mean.std.meas<-grep("mean|std",names(x_set))#this function is to get the variables with the words "mean" or "std" in the variable name. Returns the index
final_set<-x_set[,mean.std.meas]# create a dataframe with the selected variables
final_set$activity<-y_set# adding the activity variable

## labeling the subject variable, changing it to factors and putting it in the beginning of the data frame
colnames(subject_set)<-"subject" 
subject_set$subject<-factor(subject_set$subject)
final_set<-cbind(subject_set,final_set)

##  data set with the average of each variable for each activity and each subject.
mean_set<-aggregate(final_set[,2:79],by=final_set[c("subject","activity")], mean)

##Writing into a file
write.table(mean_set, file="final_table.txt",row.names=FALSE)
