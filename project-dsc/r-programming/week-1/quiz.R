q11 <- function(){
  
  df1 <- read.table("C:\\Users\\satyakarthik.sonti\\Documents\\my-git\\project-dsc\\r-programming\\week-1\\data\\hw1_data.csv",header=TRUE,sep=",")
  colnames(df1)
  return(df1)

}
q12 <- function(){
 df1 <- q11();
 head(df1,2);
  
}

q13 <- function(){
  
df1 <-q11();
nrow(df1);
  
}

q14 <- function(){
  df1 <- q11();
tail(df1,2);
  
}

q15 <- function(){
  
  df1 <- q11();
  ov <- df1$Ozone
  ov[47]
}


q16 <- function(){
  
  df1 <- q11();
  ov <- df1$Ozone
  ovna <- is.na(ov)
  table(ovna)
  return(ov);
}

q17 <- function(){
  
  ov <- q16();
  ovna <- is.na(ov);
  ov.valid <- ov[!ovna]
  mean(ov.valid);
  #mean (ov);
  
}
q18 <- function(){
  
  df1 <- q11();
  df1$Ozone>31
  df.subset <- subset(df1,Ozone>31&Temp>90)
  mean(df.subset$Solar.R)
  
}

q19 <- function(){
  
  df1 <- q11();

  df.subset <- subset(df1,Month==6)
  mean(df.subset$Temp)
  
}


q20 <- function(){
  
  df1 <- q11();
  
  df.subset <- subset(df1,Month==5)
  
  oz <- df.subset$Ozone
  oz.na <- is.na(oz)
  oz.valid <- oz[!oz.na]
  max(oz.valid)
}
