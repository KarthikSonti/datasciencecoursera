main <- function(){
  
  # read training readings
  train.readings <- read.table("week-2/UCI HAR Dataset/train/X_train.txt",sep="", header=FALSE,stringsAsFactors=FALSE);
  
  # read training subjects
  train.subject <- read.table("week-2/UCI HAR Dataset/train/subject_train.txt",sep="", header=FALSE);
  
  colnames(train.subject) <- c("Subject");
  
  # read training activities
  train.activities <- read.table("week-2/UCI HAR Dataset/train/y_train.txt",sep="", header=FALSE);
  colnames(train.activities) <- c("Activity");
  
  #combine readings, activities and subjects for training
  train.dataset <- cbind(train.readings,train.subject,train.activities);
  print(head(train.dataset,2));
  
  # read test readings
  test.readings <- read.table("week-2/UCI HAR Dataset/test/X_test.txt",sep="", header=FALSE,stringsAsFactors=FALSE);
  
  # read test subjects
  test.subject <- read.table("week-2/UCI HAR Dataset/test/subject_test.txt",sep="", header=FALSE);
  colnames(test.subject) <- c("Subject");
  
  # read test activities
  test.activities <- read.table("week-2/UCI HAR Dataset/test/y_test.txt",sep="", header=FALSE);
  
  colnames(test.activities) <- c("Activity");
  
  #combine readings, activities and subjects for test
  test.dataset <- cbind(test.readings,test.subject,test.activities);
  print(head(test.dataset));
  
  
  
  
  
}

setwd(paste(getwd(),"/my-git/project-dsc/Getting-and-Cleaning-Data",sep=""));  
main();
