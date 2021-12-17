##import the dataset
car <- read.delim("~/Dropbox/youtube videos r code/models/car.csv")
##build a model to predict the price of a used car
###price: Q, MLR 

##model1: adding variables in
mlr1=lm(Price~Mileage+Cylinder+Doors+Cruise+Sound+Leather,data=car)
summary(mlr1)
##model2: add Make to the previous model 1
mlr2=lm(Price~Mileage+Cylinder+Doors+Cruise+Sound+Leather+Make,data=car)
summary(mlr2)
#partial F-test
anova(mlr2,mlr1)
##interactions
mlr3=lm(Price~Mileage*Cylinder+Make,data=car)
summary(mlr3)

mlr4=lm(Price~Mileage*Cylinder+Make+I(Mileage^2),data=car)

anova(mlr4,mlr3)

