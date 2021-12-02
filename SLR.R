#install the package
install.packages("UsingR")
#load the package
library(UsingR)
#father.son
data(father.son)
head(father.son)
sum(is.na(father.son)) #returns 0, no missing values
###modelling:
##step1:correlations of heights of fathers and sons.
###correlations or visualization
cor(father.son)
#cor(x,y)
cor(father.son$fheight,father.son$sheight)
##visualization
plot(father.son$fheight,father.son$sheight)
plot(sheight~fheight,data=father.son)

##a model
#lm(y~x,data=datasetname)
model1=lm(sheight~fheight,data=father.son)
abline(model1)

summary(model1)

##test on the assumptions
##linearity
###normality of residuals
###constant variance
plot(model1)
