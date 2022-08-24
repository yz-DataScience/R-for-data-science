install.packages("ISLR2")
library(ISLR2)
data("Auto")
?Auto
##training and test data
n=length(Auto$mpg)
n
set.seed(1)
Z=sample(n,n/2)
Z
training=Auto[Z,]
testing=Auto[-Z,]
#build the model
model1=lm(mpg~weight+horsepower+acceleration,data=training)
##predict on the test data
pred.test=predict(model1,testing)
##the mean squared error of the test data
mean((pred.test-testing$mpg)^2)
##leave one out cross validation
install.packages("boot")
library(boot)
#cv.glm()
glm.m1=glm(mpg~weight+horsepower+acceleration,data=Auto) ##no family=""
cv.err=cv.glm(Auto,glm.m1)
names(cv.err)
cv.err$K
cv.err$delta
##K-fold cross validation
set.seed(1)
cv.err.10=cv.glm(Auto,glm.m1,K=10)
cv.err.10$K
cv.err.10$delta
