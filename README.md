The first part reads in all data files in the train and test directory and also the lists with the names of features and activities that the programme later uses to label them in the data set.

Part 1 merges the training and test data sets. The x_train and x_test data sets contain the data and are appended using rbind to one data set "x" with 10299 data entries. The features list is transposed that it can later be used to label the columns of the final data set. In the vector y we append the coded list of activities in the y_train and y_test data sets.
The vector subjects contains the list of subjects that performs each activity.

Part 2 extracts those measurements from the list of features that contain the word Std or mean and makes a list of those columns that contains these. Then we select only those columns from the x data set containing the data that we want, i.e. means and standard deviations of each meausrement.

Parts 3 and 4 first translates the activity codes in the y list into text by merging it with the list of activities using the activity code. Then it appends the list of subjects, activities and  the data of the means and standard deviations of each measurement into one data set called "data". 

In Part 5 the means are calculated of each measurement in the data for each subject and each activity. An output data set is created that is finally exported into a Txt-file for inspection.
