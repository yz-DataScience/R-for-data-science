awards <- read.csv("~/Downloads/awards.csv")
names(awards)
#Q1: predict the number of awards (using prog and math)?

#mean and sd of num of awards for different programs
aggregate(num_awards~prog,"mean",data=awards)
aggregate(num_awards~prog,"sd",data=awards)
library(ggplot2)
#boxplot of num_awards vs programs
ggplot(data=awards,aes(x=prog,y=num_awards))+
  geom_boxplot()
#scatterplot of num_awards vs math scores
ggplot(data=awards,aes(x=math,y=num_awards))+
  geom_point()
#scatterplot of num_awards vs math scores showing programs differences
ggplot(data=awards,aes(x=math,y=num_awards,colour=prog))+
  geom_point()
###build a poisson glm(y~x,data=dataset_name,family=poisson)
m1=glm(num_awards~prog+math,data=awards,family=poisson)
##check the detailed output of poisson regression
summary(m1)

