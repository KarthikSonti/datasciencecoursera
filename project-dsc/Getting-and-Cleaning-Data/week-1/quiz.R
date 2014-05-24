q1 <- function(){
 download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv","C:\\Users\\satyakarthik.sonti\\Documents\\R\\housingdata.csv");

 housingDF <- read.csv("C:\\Users\\satyakarthik.sonti\\Documents\\R\\housingdata.csv",header=TRUE);

  table(housingDF[["VAL"]])

}

q3 <- function(){
  librarry(xlsx)
  download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx","C:\\Users\\satyakarthik.sonti\\Documents\\R\\NAGP.xlsx")
  
  
}

q4 <- function(){
  download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml","C:\\Users\\satyakarthik.sonti\\Documents\\R\\hotels.xml")
  
  hotelsDoc <- xmlTreeParse("C:\\Users\\satyakarthik.sonti\\Documents\\R\\hotels.xml")
  rootNode <- xmlRoot(hotelsDoc)
  xmlSApply(rootNode,xmlName)
  childNodes <- xmlChildren(rootNode)
  lapply(childNodes,xmlName)
  nodeSet <- xpathSApply(rootNode,"//zipcode[text()='21231']")
  nodeSetName <- names(nodeSet)
  table(nodeSetName)
  xpathSApply(rootNode)
  
}

q5 <- function(){
  
  download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv","C:\\Users\\satyakarthik.sonti\\Documents\\R\\q5.csv");
  require("data.table")
  DT <- fread("C:\\Users\\satyakarthik.sonti\\Documents\\R\\q5.csv")    
  class(DT)
  system.time(DT[,mean(pwgtp15),by=SEX])
  system.time(sapply(split(DT$pwgtp15,DT$SEX),mean))
  system.time(tapply(DT$pwgtp15,DT$SEX,mean)) 
  system.time(mean(DT$pwgtp15,by=DT$SEX))
}

function
quiz1();


