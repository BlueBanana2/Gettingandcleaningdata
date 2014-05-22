The first part reads in all data files in the train and test directory and also the lists with the names of features and activities that the programme later uses to label them in the data set.

Part 1 merges the training and test set. The x_train and x_test data sets contain the data and are appended using rbind to one data set with 10299 data entries. The feutures list is transposed that it can later be used to label  the columns. In the vector y we append the coded list of activities in the y_train and y_test data sets.
The vector subjects contains the list of subjects that performs each ativity.

Part 2 extracts those measuremants from the list of features that contain the word Std or mean and makes a list of those columns that contains these. Then we select only those features from the x data set containing the raw data.

Parts 3 and 4 first translates the activity codes in the y list into text by merging it with the list of activities using the activity code. Then it appends the list of subjects, activities and  the data of the means and standard deviations of each measurement into one data set "data" 

In Part 5 the means are calculated of each measurement in the data for each subject and each activity. An output data set is created that is finally expoted into a Txt-file for inspection.
