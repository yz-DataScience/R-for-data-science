#one-way ANOVA model
#ANOVA is analysis of variance
data("iris")
head(iris)
summary(iris)
#Q: Are there differences in the mean Sepal length for difference species?
##Null hypothesis: there are no differences in the mean Sepal length
##Alternative hypothesis: there are some differences in the mean Sepal length
#EDA:
#boxplot
boxplot(Sepal.Length~Species,data=iris)
#calculate mean and sd
aggregate(Sepal.Length~Species,"mean",data=iris)
aggregate(Sepal.Length~Species,"sd",data=iris)
##ANOVA: model
model=aov(Sepal.Length~Species,data=iris)
summary(model)
##The ANOVA model/test gives us a F-value 119.3, and p-value almost 0,
##less than 0.001. Thus, we reject the Null hypothesis,
#we conclude that there are some differences in the mean Sepal length 
#for different species.
