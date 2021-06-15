##data visualization part 2
x=5
x>3
library(ggplot2) #before you use it
?ggplot
data(mpg)
names(mpg)
dim(mpg)

#scatterplot
ggplot(data=mpg,aes(x=displ,y=hwy))+
  geom_point()

#scatterplot with colors from class
ggplot(data=mpg,aes(x=displ,y=hwy,color=class))+
  geom_point()
##add a facet
ggplot(data=mpg,aes(x=displ, y=hwy))+
  geom_point()+
  facet_wrap(~class)
#change the display of small pictures
ggplot(data=mpg,aes(x=displ, y=hwy))+
  geom_point()+
  facet_wrap(~class,nrow=2)
#geoms

#smooth line to describe the relationship of displ and hwy
ggplot(data=mpg,aes(x=displ,y=hwy))+
  geom_smooth()

#scatterplot
ggplot(data=mpg,aes(x=displ,y=hwy))+
  geom_point()

#layer them
ggplot(data=mpg,aes(x=displ,y=hwy))+
  geom_point()+
  geom_smooth()
#look for variables 
?mpg
##different smooth line for different drive train
ggplot(data=mpg,aes(x=displ,y=hwy))+
  geom_smooth(aes(linetype=drv))

##change color according to drv
ggplot(data=mpg,aes(x=displ,y=hwy,color=drv))+
  geom_point()+
  geom_smooth(aes(linetype=drv))

##change color according to drv, smooth line without se
ggplot(data=mpg,aes(x=displ,y=hwy,color=drv))+
  geom_point()+
  geom_smooth(aes(linetype=drv),se=FALSE)

##change color according to drv, smooth line without se
##want solid smooth line
ggplot(data=mpg,aes(x=displ,y=hwy,color=drv))+
  geom_point()+
  geom_smooth(se=FALSE)
