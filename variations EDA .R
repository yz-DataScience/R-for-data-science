#Variation
#tendency of the values of a variable to change 
#from measurement to measurement.

#each variable has its own pattern of variation
#the best way to understand that pattern is to visualize the
#distribution of the variable's values.

##two types of variable
##categorical: use a bar chart 
library(ggplot2)
data(diamonds)
#Q1:How does the cut of the variables distributed in the diamonds data?
ggplot(diamonds,aes(x=cut))+
  geom_bar()+theme_bw()


##numerical: use a histogram
#Q2: how does the price distribute in the dismonds data?
ggplot(diamonds,aes(x=price))+
  geom_histogram(bins=15)
#Q3:How does the price distribute differently for different cut?

ggplot(diamonds,aes(x=price,group=cut))+
  geom_histogram(bins=10)+
  facet_wrap(~cut,nrow=2)

#Q4: for the diamonds with less than 1 carat, how does price distribute?

library(dplyr)
diamonds %>% 
  filter(carat<1) %>% 
  ggplot(.,aes(x=price))+
  geom_histogram(bins=10)+
  theme_classic()

#Q5: for diamonds less than 1 carat, cut being good, how does price distribute?

diamonds %>% 
  filter(carat<1,cut=="Good") %>% 
  ggplot(.,aes(x=price))+
  geom_histogram(bins=10)+
  theme_classic()

###Q6: how many observations for each type of cut?

diamonds %>% 
  count(cut)



