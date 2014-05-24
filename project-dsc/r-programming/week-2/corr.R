
#source("C:/Users/satyakarthik.sonti/Documents/my-git/project-dsc/r-programming/week-2/complete.R")
#require(plyr)
corr <- function(directory, threshold = 0) {
  require(plyr);
  observations.count <- complete(directory,1:332);
  nobs.logical <- laply(observations.count$nobs,filter.threshold,threshold.level=threshold);
  ids.valid <- observations.count$id[nobs.logical];
  if(length(ids.valid)==0){
    return(numeric());
  }
  file.names <- ldply(ids.valid,append.file.extension,directoryName=directory);
  cor.vector <- numeric();
  for(file.name in file.names[,1]){
    file.content <- readContent(file.name);
    file.content.logical <- complete.cases(file.content);
    file.content.valid <- file.content[file.content.logical,];
    cor.vector <- append(cor.vector,cor(file.content.valid$nitrate,file.content.valid$sulfate))
    
  }
  #fileContent <- ldply(file.names[,1],readContent)
  
  return(cor.vector);

}

filter.threshold <- function(nobs,threshold.level){
  return(nobs>threshold.level);
}
append.file.extension <- function(x,directoryName){
  
  y<- x;
  if(x<10){
    y <- paste("00",x,sep="");
  }else if(x<100){
    y<- paste("0",x,sep="");
  }
  return(file.path(directoryName,paste(y,".csv",sep="")));
  
}

readContent <- function(filePathName){
  read.csv(filePathName,header=TRUE)
}

co <- corr("C:/Users/satyakarthik.sonti/Documents/my-git/project-dsc/r-programming/week-2/specdata",50)
summary(co);
