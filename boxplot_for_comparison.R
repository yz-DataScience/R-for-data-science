##install the package first for the first time use
install.packages("ggplot2")
#load the package
library(ggplot2)
##import the data set from excel
library(readxl)
crab_data <- read_excel("Desktop/crab_data.xlsx")
View(crab_data)  
##define the factor levels so the graph will put "before" first and then "after"
crab_data$stage=factor(crab_data$stage,levels=c('before','after'),ordered=TRUE)
#draw the first boxplot
ggplot(crab_data,aes(x=species,y=weight,fill=stage))+
  geom_boxplot()

##draw the boxplot by changing the color of the boxes

ggplot(crab_data,aes(x=species,y=weight,fill=stage))+
  geom_boxplot()+
  scale_fill_manual(breaks=stage,
                    values=c("blue","orange"))
##draw the boxplot by changing the color of the boxes to less colorful
##and add a theme to the graph
ggplot(crab_data,aes(x=species,y=weight,fill=stage))+
  geom_boxplot()+
  scale_fill_manual(breaks=stage,
                    values=c("grey","black"))+
  theme_classic()



