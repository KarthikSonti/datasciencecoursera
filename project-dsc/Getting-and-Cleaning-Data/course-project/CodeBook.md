## Course Project for Getting and Cleaning Data

### The Following activities are performed in run_analysis
#### Reading the dataset

1.	Read training readings
2.	read training subjects
3.	read training activities
4.	combine readings, activities and subjects for training
5.	read test readings
6.	read test subjects
7.	read test activities
8.	combine readings, activities and subjects for test
#### Transformations
1.	Merges the training and the test sets to create one data set.
2.	Read features.txt to get the indexes of "mean" and "stddev"
3.	Extracts only the measurements on the mean and standard deviation for each measurement. cleanse the measurements from features.txt
4.	map the activities numbers to the desciptions provided in the activity_labels.txt
5.	Appropriately labels the data set with descriptive activity names. 
6.	the standard deviations and means from both train and test dataset are now combined with cleansed activity names and meaningful measurements as the headers
7.	The cleansed subset of train and test data with meaningful columnnames 
8.	and meaningful activity labels is now written to a external file for reference
9.	Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
10.	the  mean group by Subject and Activity are available in the file mean_groupby_activity_subject.txt
