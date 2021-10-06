library(readxl)
###import the dataset
treedata <- read_excel("Dropbox/BIO-STAT/R for ecology course/Stats II t-test/treedata.xlsx")
#To view the dataset
View(treedata)
###two-sample t-test
##step1: visualize
##histogram: normal
##boxplot:comparison,symmetric
library(ggplot2)
names(treedata)
##histogram
ggplot(data=treedata,aes(x=Black_Birch))+
  geom_histogram(bins=5)+
  facet_wrap(~Habitat,ncol=1)
ggplot(data=treedata,aes(x=Habitat,y=Black_Birch))+
  geom_boxplot()

##check on Habitat (is it categorical)?
is.factor(treedata$Habitat)
is.numeric(treedata$Habitat)
##fix it

treedata$Habitat=as.factor(treedata$Habitat)
table(treedata$Habitat)
is.factor(treedata$Habitat)

##rerun the boxplot R code
ggplot(data=treedata,aes(x=Habitat,y=Black_Birch))+
  geom_boxplot()

##step 2: numerical summaries:mean and sd
library(dplyr)

treedata %>% 
  group_by(Habitat) %>% 
  summarise(mean_density=mean(Black_Birch),sd_density=sd(Black_Birch))

###two-sample t-test
t.test(Black_Birch~Habitat,data=treedata)
#null: true difference in means is equal to 0
#alternative:true difference in means is not equal to 0

##p-value>0.05, we will not reject the NULL.
