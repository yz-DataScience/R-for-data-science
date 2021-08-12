#chapter 7. EDA part 2
##covariation
# the tendency for the values of two or more variables
#the best way to spot covariations is to visualize the relationship
#We need to do it differently based on different types of variables.
##a categorical and a continuous variable
#install.packages("ggplot2")
library(ggplot2)
data(diamonds)
#Q1: how does the distribution of price different for different types of cut?
#solution1: count
  ggplot(diamonds,aes(x=price,colour=cut))+
    geom_freqpoly(binwidth=500)
 # solution 2: standardized count
  ggplot(diamonds,aes(x=price,colour=cut,y=..density..))+
    geom_freqpoly(binwidth=500)
  
#solution 3: shortcut--- boxplot  y~type
  ggplot(diamonds,aes(x=cut,y=price))+
    geom_boxplot()
  ##improve solution 3
  ggplot(diamonds,aes(x=reorder(cut,price,FUN=median),y=price))+
    geom_boxplot()
  ##flip the boxplot
  ggplot(diamonds,aes(x=reorder(cut,price,FUN=median),y=price))+
    geom_boxplot()+
    coord_flip()
  # change the xlab
  ggplot(diamonds,aes(x=reorder(cut,price,FUN=median),y=price))+
    geom_boxplot()+
    coord_flip()+
    xlab("types of the cut")
##practice to use tools on hwy vs class
  data(mpg)
  names(mpg)
  #practice: distributions of hwy on different classes of the car
  #solution1: count
  ggplot(mpg,aes(x=hwy,colour=class))+
    geom_freqpoly(binwidth=5)
  # solution 2: standardized count
  ggplot(mpg,aes(x=hwy,colour=class,y=..density..))+
    geom_freqpoly(binwidth=5)
  #solution 3: shortcut--- boxplot  y~type
  ggplot(mpg,aes(x=reorder(class,hwy,FUN=median),y=hwy))+
    geom_boxplot()+
    coord_flip()+
    xlab("class")
##check on covariation of two categorical variables
  #count the number of observations for each combination
#Q2: cut and color of diamonds
  
  #solution1: just count
  #install.packages("dplyr")
library(dplyr)
  diamonds %>% 
    count(cut,color)
  #solution 2: draw a count graph
  ggplot(diamonds,aes(x=cut,y=color))+
    geom_count()
  #solution 3: combine the count + graph
  diamonds %>% 
    count(cut,color) %>% 
    ggplot(.,aes(x=color,y=cut,fill=n))+
    geom_tile()
    
#covariations of two continuous variables
  #scatterplot
#Q3: how does carat affect the price?
  ggplot(diamonds,aes(x=carat,y=price))+
    geom_point()
  #add transparency to the data
  ggplot(diamonds,aes(x=carat,y=price))+
    geom_point(alpha=1/100)
#use bins in two dimensions
  ggplot(diamonds,aes(x=carat,y=price))+
    geom_bin2d()
    