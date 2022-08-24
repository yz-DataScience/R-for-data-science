#smoothing splines
##the data
install.packages("ISLR2")
library(ISLR2)
data(Auto)
?Auto
attach(Auto)
reg=lm(mpg~weight)
plot(weight,mpg)
abline(reg,col="red")
##fit a spline with 2 degrees of freedom
spline2=smooth.spline(weight,mpg,df=2)
lines(spline2,col="blue")

spline3=smooth.spline(weight,mpg,df=3)
lines(spline3,col="green")

spline20=smooth.spline(weight,mpg,df=20)
lines(spline20,col="brown")


spline100=smooth.spline(weight,mpg,df=100)
lines(spline100,col="orange")

