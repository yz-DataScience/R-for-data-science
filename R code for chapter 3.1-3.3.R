##chapter 3 data visualization
##3.1-3.3
#to install the package
install.packages("ggplot2")
#load the package
library(ggplot2)
##dataset:mpg
#get help: more information on the data
?mpg
?library
View(mpg) #to view the dataset like in excel
dim(mpg) ##dimensions: number of rows, number of columns
#are there missing values?
is.na(mpg) #TRUE-1 means missing; False-0 means not missing
sum(is.na(mpg)) #0 means no missing value

##data visualization
#Q1: Do cars with large engines use more fuel than 
#cars with small engines?
##displ
##hwy
##what is the relationship between displ and hwy?
#scatterplot

#basic scatterplot
ggplot(data=mpg)+
  geom_point(aes(x=displ,y=hwy))


ggplot(data=mpg) ##prepare a drawing paper

ggplot(data=mpg,aes(x=displ,y=hwy))+
  geom_point()+
  geom_smooth() ##smoothed trend 

#adding a color information to the dots
ggplot(data=mpg,aes(x=displ,y=hwy,color=class))+
  geom_point()

