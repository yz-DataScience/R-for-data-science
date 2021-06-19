#data visualization part 3
#bar plot
install.packages("ggplot2")
library(ggplot2)
mpg
diamonds
?diamonds
#Q1: which cut quality has the most observations? which has the least?
ggplot(data=diamonds)+
  geom_bar(aes(x=cut))->p1

p1+coord_flip()

#generate a freq. table
table(diamonds$cut)

##Q2: a bar plot of percentages
ggplot(data=diamonds)+
  geom_bar(aes(x=cut,y=stat(prop),group=1))

##Q3:color the bars

ggplot(data=diamonds)+
  geom_bar(aes(x=cut,fill=cut))

ggplot(data=diamonds)+
  geom_bar(aes(x=cut,color=cut))

#variations of bar plot
#bar plot show the information of two variables
ggplot(data=diamonds)+
  geom_bar(aes(x=cut,fill=clarity))
##position: identity, dodge, fill

###position="fill"
ggplot(data=diamonds)+
  geom_bar(aes(x=cut,fill=clarity),position="fill")
###position="dodge"
ggplot(data=diamonds)+
  geom_bar(aes(x=cut,fill=clarity),position="dodge")
#boxplot
ggplot(data=mpg,aes(x=class,y=hwy))+
  geom_boxplot()

ggplot(data=mpg,aes(x=class,y=hwy))+
  geom_boxplot()+
  coord_flip()->p2

##themes
p2+theme_bw()
p2+theme_classic()
#grammar of ggplot2
#ggplot(data=dataname)+
  #geom objects using geom_function+
#facet_grid()+
 # coord_flip()+
  #theme





