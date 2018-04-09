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
#matrix----


#Arrays----


#List----


#Factors----


#Dataframes----
rollno= c(1,2,3)
name = c('Mohit', 'Kailash', 'gaurav')
dept = c('Maths','Science', 'Social Science')
Course= c('B.tech', 'MCA', 'BBA')
marks= floor(rnorm(3,50,10))             #marks of 3 students whose mean is 50 and standard deviation is 10
marks
students = data.frame(rollno, name, dept, Course, marks)
students
class(students)
str(students)
summary(students)
