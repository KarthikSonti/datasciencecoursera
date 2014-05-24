q2 <- function() {
    library("sqldf");
    #download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv", destfile="C:/Users/satyakarthik.sonti/Documents/my-git/project-dsc/Getting-and-Cleaning-Data/week-2/q2.csv");
    acs <- read.csv("C:/Users/satyakarthik.sonti/Documents/my-git/project-dsc/Getting-and-Cleaning-Data/week-2/q2.csv");
    colnames(acs);
    sqldf("select distinct AGEP  from acs")
}

q4 <- function(){
    htmlCon <- url("http://biostat.jhsph.edu/~jleek/contact.html")
    html.text <- readLines(htmlCon)
    close(htmlCon);
    print(class(html.text))
    
    print(nchar(html.text[10]))
    print(nchar(html.text[20]))
    print(nchar(html.text[30]))
    print(nchar(html.text[100]))
    
    
    
  
}

q5 <- function(){
  
  download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for", destfile="C:/Users/satyakarthik.sonti/Documents/my-git/project-dsc/Getting-and-Cleaning-Data/week-2/q5.fwf");
  fwf.content <- read.fwf("C:/Users/satyakarthik.sonti/Documents/my-git/project-dsc/Getting-and-Cleaning-Data/week-2/q5.fwf",widths=c(12, 7,4, 9,4, 9,4, 9,4),header=FALSE,skip=4)
  head(fwf.content)
  sum(fwf.content$V4)
  
  
}

q5()
