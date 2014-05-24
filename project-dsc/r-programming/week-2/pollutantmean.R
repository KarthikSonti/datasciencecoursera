pollutantmean <- function(directory,pollutant,id=1:332){
  require(plyr);
  
  fileVec <- ldply(id,append.file.extension,directoryName=directory);
  
  fileContent <- ldply(fileVec[,1],readContent)
  pollutantVec <- fileContent[,pollutant]
  #pollutantVec.isna <- is.na(pollutantVec);
  #pollutant.valid <- pollutantVec[!pollutantVec.isna]
  pollutant.mean <- mean(pollutantVec,na.rm=TRUE,);
  round(pollutant.mean,3)
  
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

#pollutantmean("C:/Users/satyakarthik.sonti/Documents/my-git/project-dsc/r-programming/week-2/specdata","sulfate", 1:10)