#outliers and influential points

#define x
x=1:9
x
#define y
y=2*x+1
y
#scatterplot of x,y
plot(x,y)
#linear model for y vs x
m1=lm(y~x)
m1
#add the model line to the scatterplot
abline(m1)

##add one obs for  x and y
#create xnew
xnew=x
xnew[10]=6
#create ynew
ynew=y
ynew[10]=20
#scatterplot
plot(xnew,ynew)
#model
m2=lm(ynew~xnew)
##add the model with 10 pairs of x,y
abline(m2)
##add the model line without the outlier
abline(m1,col="red")
##residuals
res=residuals(m2)
##to check outliers
boxplot(res)
m1
m2
##define xx and yy
xx=runif(10,0.5,0.6)
xx
xx[11]=20
yy=1:10
yy[11]=30
plot(xx,yy)
m3=lm(yy~xx)
abline(m3,col="blue")
xx=xx[1:10]
yy=yy[1:10]
m4=lm(yy~xx)
abline(m4,col="orange")
