#Data Structures in R

#vectors----
v1= c('A','B','C')               #create a Vector
v1                               #print the vector
class(v1)                        #print the class of vector
(v2= c(1,2,3))                   #Assigning and printing the vector by using round bracket
class(v2)
(v3= c(TRUE, FALSE, TRUE))
class(v3)
(v3a= c(T,F,T))
v4=100:200
v4
v5 = seq(1,10,2)
?seq
v5
v4;v5
v4[c(1,3,4)]                      #to print value at position 1,3,4
v4[-c(1,3,4)]                     #to print value excluding 1,3,4 
v4[v4>189]                        #to print value greater than 189
(v7= c('A','C'))
v1[v1 %in% v7]                    #to print value in v1 which is there in v7
v1[!v1 %in% v7]                   #to print value in v1 which is not there in v7
v1 %in% v7                        #to check which value of v1 are there in v7
length(v4)                        #tells the length(size) of the vector
#matrix----                       #all value should be of same data type
m1= matrix(1:24, nrow = 4, byrow= TRUE) #default is byrow=false
m1
m2= matrix(24:95, ncol= 8, byrow= TRUE)                         
rn=(paste("R",1:9,sep=""))
rn
cn=(paste("C",1:8,sep=""))
cn
dimnames(m2) = list(rn,cn)
?dimnames
m2
m2[3:4,7:8]
(colSums(m2))
(rowSums(m2))
#Arrays----
(myarray = array(101:124,dim = c(4,3,2), dimnames = list(c('S1','S2','S3','S4'),c('sub1','sub2','sub3'),c('Dept1','Dept2'))))  #4 is for row, 3 is for column, 2 is for number of matrix
apply(myarray,1,sum)        #
apply(myarray,c(1,2),mean)
apply(myarray,3,sd)

#List----                #hold different datatype
listl1 = list(v1, students, matrix(1:24, nrow=4, byrow= TRUE), myarray)
listl1

#Factors----


#Dataframes----         #every column can have different datatype
rollno= c(1,2,3)
name = c('Mohit', 'Kailash', 'gaurav')
dept = c('Maths','Science', 'Social Science')
Course= c('B.tech', 'MCA', 'BBA')
marks= floor(rnorm(3,50,5))             #marks of 3 students whose mean is 50 and standard deviation is 10
?rnorm
marks
students = data.frame(rollno, name, dept, Course, marks)
students
class(students)
str(students)
summary(students)
names = c('s1','s2','s3','s4','s5')
course= c('PHD','MTECH','BTECH', 'PHD','MTECH')
gender= c('M','F','M','M','F')
grades= c('A','A','B','C','A')
marks= c(runif(5,50,100))
(details= data.frame(names, course, gender, grades, marks,stringsAsFactors = T))
str(details)
details[1:2,]
details[,1:3]
details$names = as.character(details$names)     #to convert names from factor to character
details$grades = factor(details$grades, ordered = T, levels = c('A','B','C','D','E','F'))
details$gender = factor(details$gender, ordered =T, levels = c('M','F'))   #by default it is done alphabatecially
details$gender
str(details)
(L1= letters[1:26])
(L2= LETTERS[1:26])
(M1= month.abb[1:12])
(M2= month.name[1:12])

set.seed(10)
x1=sample(M1, 40, replace=T)
table(x1)
set.seed(10)
x2=sample(M1,40,replace = T)
table(x2)
x1==x2
(grades=LETTERS[1:5])
sgrades= sample(grades,20, replace = T, prob = c(0.4,0.2,0.2,0.1,0.1))
sgrades
table(sgrades)
