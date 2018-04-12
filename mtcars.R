?mtcars
data()
dim(mtcars)
names(mtcars)
mycarsfit1=lm(mpg~ ., data= mtcars)
summary(mycarsfit1)

library(MASS)
model1a= lm(mpg~., data= mtcars)
summary(model1a)
model1b=lm(mpg~ 1, data = mtcars)
summary(model1b)

stepboth= stepAIC(model1a, direction = 'both')
fit1= lm(mpg ~ wt + qsec + am,data= mtcars)
summary(fit1)
stepfwd= stepAIC(model1b, direction = 'forward', scope = list(upper=model1a,lower= model1b))

library(olsrr)
install.packages('olsrr')

model<- lm(mpg~ disp+hp+wt+qsec, data=mtcars)
k<- ols_step_all_possible(model)
plot(k)
k