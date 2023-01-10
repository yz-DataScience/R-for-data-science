#non-linear regression
#polynomial regression: bluebell
#log regression: growth

##polynomial regression
#y~x+x^2
names(Bluebell)
plot(Abundance~Light,data=Bluebell)
attach(Bluebell)
spline2=smooth.spline(Light,Abundance,df=2)
lines(spline2)
spline3=smooth.spline(Light,Abundance,df=3) ##polynomial
lines(spline3,col="blue")

##build the model
poly.model=lm(Abundance~Light+I(Light^2))
summary(poly.model)
##tidyverse
library(tidyverse)
Bluebell %>% 
  ggplot(aes(x=Light,y=Abundance))+
  geom_point()+
  stat_smooth(method="lm",
              formula=y~poly(x,2),se=FALSE)

#non-linear regression
#log regression
#growth rate vs nutrient
growthdata <- read.csv("~/Downloads/Growth.csv")
names(growthdata)
plot(Growth~Nutrient,data=growthdata)
log.model=lm(Growth~log(Nutrient),data = growthdata)
summary(log.model)
install.packages("tidyverse")
library(tidyverse)
growthdata %>% 
  ggplot(aes(x=Nutrient,y=Growth))+
  geom_point()+
  stat_smooth(method="lm",
              formula=y~log(x),se=FALSE)

##equation: Growth=0.69+5.10*log(Nutrient)