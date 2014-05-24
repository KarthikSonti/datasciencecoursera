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
  
  xpathSApply(rootNode)
  
}


quiz1();


