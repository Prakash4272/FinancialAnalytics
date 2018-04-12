#MissingValue

v1= c(1,2,3,NA,NA,9,NA,4,5)
is.na(v1)
sum(is.na(v1))
mean(v1)
mean(v1,na.rm=T)
v1a= na.omit(v1)
mean(v1a)
sum(v1a)
anyNA(v1a)
v1[is.na(v1)] = mean(v1, na.rm=T)
v1

install.packages('VIM')
library(VIM)
data(sleep, package = 'VIM')

head(sleep)
dim(sleep)
complete.cases(sleep)             #all complete rows without any missing values
sum(complete.cases(sleep))
sleep[complete.cases(sleep),]
sleep[!complete.cases(sleep),]
is.na(sleep$Dream)
sum(is.na(sleep$Dream))
12/62
sum(complete.cases(sleep))
mean(complete.cases(sleep))
42/62
sum(is.na(sleep))
colSums(is.na(sleep))
rowsum(is.na(sleep))
is.na(sleep[1:3,])
head(sleep)

#Tabulate

library(mice)
mice::md.pattern(sleep)

#42 rows without any missing value #2 rows with 1 NA NonD

#visualization
VIM::aggr(sleep,prop=F,numbers=T)
#NonD max NA values
VIM::aggr(sleep,prop=T)
VIM::matrixplot(sleep)
VIM::marginmatrix(sleep)
VIM::marginplot(sl)