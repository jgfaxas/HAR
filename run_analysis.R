## loading all data


features<-read.table("UCI HAR Dataset/features.txt")
activity.labels<-read.table("UCI HAR Dataset/activity_labels.txt")


x_train<-read.table("UCI HAR Dataset/train/x_train.txt")
y_train<-read.table("UCI HAR Dataset/train/y_train.txt")
subject_train<-read.table("UCI HAR Dataset/train/subject_train.txt")

x_test<-read.table("UCI HAR Dataset/test/x_test.txt")
y_test<-read.table("UCI HAR Dataset/test/y_test.txt")
subject_test<-read.table("UCI HAR Dataset/test/subject_test.txt")

x_set<-rbind(x_train,x_test)
y_set<-rbind(y_train,y_test)
subject_set<-rbind(subject_train,subject_test)

a<-levels(y_set)
b<- as.character(activity.labels$V2)
y_set<-mapvalues(y_set,from=a,to=b)

colnames(x_set)<-features$V2
x_set$activity<-y_set

mean.std.meas<-grep("mean|std",names(x_set))
final_set<-x_set[,mean.std.meas]
final_set$activity<-y_set

tapply(final_set[,"tBodyAcc-mean()-X"],final_set$activity,mean)
head(final_set)
summary(final_set)
mean_set<-aggregate(final_set[,1:79],by=list(final_set$activity), mean)
str(mean_set)
