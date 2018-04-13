#Creating a data frame
rollno= paste('S',size=1:30,sep='-')
?paste
rollno
name= paste0('student',size=1:30,sep='-xyz')
name
y=c('Male','Female')
Gender= sample(y,30,replace = T, prob = c(0.7,0.3))
Gender
table(Gender)
age=floor(runif(30,20,40))
age
x= c('Btech', 'Mtech', 'Phd')
course= sample(x,30,replace = T, prob = c(0.4,0.3,0.3))
course
marks= floor(rnorm(30,60,20))
marks
?rnorm
mar=c('FALSE', 'TRUE')
married= sample(mar, 30,replace = 2, prob=c(0.8,0.2))
married
data= data.frame(rollno,name,Gender,age,course,marks, married)
data

#Creating a subset

mysample= data[sample(1:nrow(data),10,replace=F),]
mysample
(df2= subset(data,age>=20 &age<27, select=c(rollno,name)))
(df2b= subset(data, marks>=55 &marks<70,select= c(name,marks)))


#dplyr
library(dplyr)
(df3= sample_n(data,10))
(df4= sample_frac(data, .5))

df5= data[ which(Gender=='Female' & age>25),]
df5 

#save this data for export
write.csv(data,'./data/studenrs3.csv')
install.packages('xlsx')   #needs to be installed
install.packages('rJava')  #needs to be installed
library(xlsx)
