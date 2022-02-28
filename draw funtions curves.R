##function curves
##plot()
##curve()
#Q1: y=x^3+2x-5
eq1=function(x){x^3+2*x-5}
x=1:100
y=eq1(x)
plot(y~x,type="l")
x=seq(-10,10,by=0.5)
y=eq1(x)
plot(y~x,type="l")

#Q2: y=x^3+2x-5
?curve
curve(x^3+2*x-5,from=-10,to=10,type="l")

#Q3: y=(x+3)/(sqrt(x)-x^2+1)
curve((x+3)/(sqrt(x)-x^2+1),from=0,to=100,type="l")
x=50
(x+3)/(sqrt(x)-x^2+1)
x=2
(x+3)/(sqrt(x)-x^2+1)
