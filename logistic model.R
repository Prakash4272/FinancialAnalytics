#logistic model

data1= read.csv(file.choose())
data1
summary(data1)
View(data1)
?View


#Split the dataset into the training set and test set

library(caTools)
set.seed(2000)
split= sample.split(data1$purchased, SplitRatio = 0.75)
trainingset= subset(data1, split==TRUE)
test_set = subset(data1, split==FALSE)

dim(data1)                    
nrow((trainingset))
dim(test_set)
length(data1)

length(data1$userid)
names(trainingset)
names(data1)


#Fitting Logistic Regression to the training set
logitmodel1 = glm(purchased~ gender+age+salary, family = binomial,data = trainingset)
summary(logitmodel1)

logitmodel2= glm(purchased~ age+salary, family = binomial, data = trainingset)
summary(logitmodel2)
test_set2= data.frame(age=c(40,65), salary= c(40000,50000))
test_set2
prob_pred2= predict(logitmodel2, type='response', newdata= test_set2)
prob_pred2
cbind(test_set2,prob_pred2)


#prediciting the test set result from testset
test_set
prob_pred = predict(logitmodel2, type='response', newdata= test_set)
df_prob_pred= as.data.frame(prob_pred)
?as.data.frame
summary(df_prob_pred)
head(df_prob_pred)

y_pred = ifelse(prob_pred> 0.5,1,0)
y_pred
cbind(test_set$purchased, y_pred)

#making the confusion matrix

cm=table(test_set[,5],y_pred)
cm
caret:: confusionMatrix(cm)
library(caret)
