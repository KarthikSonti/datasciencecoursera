complete <- function(directory,id=1:332){
  require(plyr);  
 
 fileVec <- ldply(id,append.file.extension,directoryName=directory);
 
 fileContent <- ldply(fileVec[,1],readContent)  
 completeCase <- complete.cases(fileContent)
 validContent <- fileContent[completeCase,]
 nobsData <- aggregate(validContent$Date ~ validContent$ID,validContent,length)
 nobsdata.return <- data.frame();
 colnames(nobsData) <- c("id","nobs");
 #colnames(nobsdata.return) <- c("id","nobs");
 nobs.vec <- numeric();
 for(id.val in id){
   nobs.vec <- append(nobs.vec,nobsData[nobsData$id==id.val,]$nobs)
   
 }
 nobsdata.return<-as.data.frame(cbind(id,nobs.vec));
 colnames(nobsdata.return) <- colnames(nobsData);
 nobsdata.return
 
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

#complete("C:/Users/satyakarthik.sonti/Documents/my-git/project-dsc/r-programming/week-2/specdata", 30:25)

