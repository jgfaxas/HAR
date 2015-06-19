# HAR
Getting and cleaning data course project.
Data from: "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
## OBJECTIVES:
-Create a R script called run_analysis.R that does the following. 
* Merges the training and the test sets to create one data set.\n
* Extracts only the measurements on the mean and standard deviation for each measurement.\n
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive variable names. 
* From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
## PROCESS DESCRIPTION:
* All relevant files were loaded in different R variables using read.table() function. 
* Test sets "x_test" and train set "x_train" were merges. The function used was rbind(). The resulting data set is called "x_set" .
* Training labels "y_test" and "y_train" were merges. The function used was rbind(). The resulting data set is called "y_set" 
* "subject_test" and "subject_train" were also merge in a variable called "subject_set" using rbin() function.
* "y_set" has a numeric level for each activity. The "activity.labels" match each number with the corresponding activity. Using function mapvalues(), "y_set" was transformed into a list of activities as a factors instead of numbers.
* All the variables in "x_set" were labeled using the data from "features".
* Using the function grep(), the measurements on the mean and standard deviation for each measurement from "x_set" were extracted. The new data set with the mean and std variables was called "final_set".
* "subject_set" variable was changed into factor type, and added to the "final_set" using cbind().
* Using aggregate() function, a second independent tidy data set was created with the average of each variable for each activity and each subject.
