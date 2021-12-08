##import the dataset
car <- read.delim("~/Dropbox/youtube videos r code/models/car.csv")
##build a model to predict the price of a used car
###price: Q, MLR 
###data visualization
library(ggplot2)
##histogram of car prices
ggplot(car,aes(x=Price))+
  geom_histogram(bins=30)
#histogram of car prices showing makes of the car
ggplot(car,aes(x=Price,fill=Make))+
  geom_histogram(bins=30)
##histograms of car prices of different makes
ggplot(car,aes(x=Price,fill=Make))+
  geom_histogram(bins=30)+
  facet_wrap(~Make)
##scatterplot of car price vs mileage with different makes
ggplot(car,aes(y=Price,x=Mileage,col=Make))+
  geom_point()+
  facet_wrap(~Make)

#pairwise graph
GGally::ggpairs(data=car,columns=c(1:2,7:12))

#change the variables types into the correct types
#change numeric variables into categoricals as they should be
for (i in c(7,9:12)){car[,i]=as.character(car[,i])}
View(car)

#pairwise graphs
GGally::ggpairs(data=car,columns=c(1:2,7:12))
###different types of MLR
#Y~X1+X2+X3
#Y~X1+X2+X3+X2*X3
#Y~X1^2+X2^2
#scaling
#change the unit of a variable
##model1: adding variables in
mlr1=lm(Price~Mileage+Cylinder+Doors+Cruise+Sound+Leather,data=car)
summary(mlr1)
##model2: add Make to the previous model 1
mlr2=lm(Price~Mileage+Cylinder+Doors+Cruise+Sound+Leather+Make,data=car)
summary(mlr2)
##interactions
mlr3=lm(Price~Mileage*Cylinder+Make,data=car)
summary(mlr3)
##scale Mileage
mlr4=lm(Price~scale(Mileage)*Cylinder+Make,data=car)
summary(mlr4)
##how the scale() works, center and scale (standardize)
summary(car$Mileage)
summary(scale(car$Mileage))
## change the unit of Price variable into 1000
mlr5=lm(I(Price/1000)~scale(Mileage)*Cylinder+Make,data=car)
summary(mlr5)

##visualize the models
install.packages("coefplot")
library(coefplot)
coefplot(mlr1)
multiplot(mlr1,mlr2,mlr3)
coefplot(mlr5)
