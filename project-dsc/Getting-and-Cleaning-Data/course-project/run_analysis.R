run_analysis <- function(){
  library(data.table)
  library(plyr)
  
  # read training readings
  train.readings <- read.table("train/X_train.txt",sep="", header=FALSE,stringsAsFactors=FALSE);
  
  # read training subjects
  train.subject <- read.table("train/subject_train.txt",sep="", header=FALSE);
  
  colnames(train.subject) <- c("Subject");
  
  # read training activities
  train.activities <- read.table("train/y_train.txt",sep="", header=FALSE);
  colnames(train.activities) <- c("Activity");
  
  #combine readings, activities and subjects for training
  train.dataset <- cbind(train.readings,train.subject,train.activities);
  
  
  # read test readings
  test.readings <- read.table("test/X_test.txt",sep="", header=FALSE,stringsAsFactors=FALSE);
  
  # read test subjects
  test.subject <- read.table("test/subject_test.txt",sep="", header=FALSE);
  colnames(test.subject) <- c("Subject");
  
  # read test activities
  test.activities <- read.table("test/y_test.txt",sep="", header=FALSE);
  
  colnames(test.activities) <- c("Activity");
  
  #combine readings, activities and subjects for test
  test.dataset <- cbind(test.readings,test.subject,test.activities);
  
  
  
  #1.Merges the training and the test sets to create one data set.
  
  complete.readings <- rbind (train.readings,test.readings);
  complete.activities <- rbind (train.activities,test.activities);
  complete.subject <- rbind (train.subject,test.subject);
  
  ##read features.txt to get the indexes of "mean" and "stddev"
  
  features <- read.table("features.txt",sep="");
  colnames(features) <- c("Feature.ID","Feature.Name");
  valid.feature.ids <- grep("-mean\\(\\)|-std\\(\\)", features[, 2])
  

  #2. Extracts only the measurements on the mean and standard deviation for each measurement. 
    mean.std.readings <- complete.readings[,valid.feature.ids];
  
  
  #3. Uses descriptive activity names to name the activities in the data set
  
  valid.feature.names <- features[valid.feature.ids,2]
  ## cleanse the measurements from features.txt
  valid.feature.names <- sapply(valid.feature.names,make.name.meaningful);
  
  colnames(mean.std.readings) <- valid.feature.names;
  
  ## map the activities numbers to the desciptions provided in the activity_labels.txt
  activities.metadata <- read.table("activity_labels.txt",sep="");
  complete.activities[,1] <- activities.metadata[complete.activities[,1],2]
  
  
  
  #4. Appropriately labels the data set with descriptive activity names. 
  ## the standard deviations and means from both train and test dataset are now combined with cleansed activity names and meaningful measurements as the headers
  
  merged_cleansed_dataset <- cbind(complete.subject,complete.activities,mean.std.readings);
  
  #############################
  #  The cleansed subset of train and test data with meaningful columnnames 
  #   and meaningful activity labels is now written to a external file for reference
  #############################
  write.table(merged_cleansed_dataset,"merged_cleansed_dataset.txt")
  
  # 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
    merged_cleansed_datatable <- data.table(merged_cleansed_dataset);
    mean_groupby_Subject_Activity <- merged_cleansed_datatable[,lapply(.SD,mean), by=list(Subject,Activity)]
  ###############
  ## the  mean group by Subject and Activity are available in the file 
  ## mean_groupby_activity_subject.txt
  ###############
    write.table(mean_groupby_Subject_Activity, "mean_groupby_activity_subject.txt");
  
  
}

## Function to remove the untidy portion in the feature and just return the measurment specific string in single case

make.name.meaningful<- function(X){
  substr.content <- substring(X,1,regexpr("\\(\\)", X)[1]-1);
  return(tolower(substr.content))
  
}

#setwd(paste(getwd(),"/my-git/project-dsc/Getting-and-Cleaning-Data/week-2/data/UCI HAR Dataset/",sep=""));  
run_analysis();
