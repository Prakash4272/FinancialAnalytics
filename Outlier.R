#Outlier Analysis
#Outlier not predicted well in by fitted regression model

marks=c(1:80,100,1000)
marks2=c(1:80,100)
marks
par(mfrow=c(1,2))                             #to divide the frame to display 2 column in 1 row.

boxplot(marks2); boxplot(marks)
mean(marks2); mean(marks)
median(marks2); median(marks)
summary(marks)
summary(marks2)


#Identify

set.seed(482)
y=rnorm(100)
y
boxplot(y)
identify(rep(1,length(y)),y, labels = seq_along(y))
?rep
?seq_along
y[86]
