---
title: "Codebook"
author: "jgfaxas"
date: "Friday, June 19, 2015"
output: html_document
---

## Codebook

### Variable description

* __activity.labels__: a data frame that contains the activity labels corresponding with a number
* __features__: a data frame with all the labels of each variable in the datasets
* __final_set__: the dataset resulting from the merge of the train sets and tests sets and after extracting the measurements on the mean and standard deviation for each measurement.It also include the subject variable and the activity variable
*__mean_set__: the dataset obtained from the __final_set__, with the average of each variable for each activity and each subject.
* __subject_set__: It is the merge of __subject_test__ and __subject_train__. Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
* __subject_test__: Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. This data is for the test set.
* __subject_train__: Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. This data is for the train set.
* __x_set__: The dataset resulting from the merge of __x_test__ and __x_train__.
* __x_test__: Test set.
* __x_train__: Train set.
* __y_set__: The labels resulting from the merge of __y_test__ and __y_train__.
* __y_test__: Test labels.
* __y_train__: Train labels.
* __a__: Temporary variable holding the ___y_set__ levels
* __b__: Temporary variable holding the activity.labels
* __mean.std.meas__: Temporary variable holding the mean and std variables index


