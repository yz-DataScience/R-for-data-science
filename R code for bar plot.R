#import the dataset
gender_spouse <- read.csv("~/Dropbox/openIntro/Week 2/gender_spouse.csv")
names(gender_spouse)
#check the number of students for each gender
#ggplot from ggplot2
install.packages("ggplot2")
library(ggplot2)
ggplot(gender_spouse,aes(y=total,x=gender))+
  geom_bar(stat="identity")
##the yes/no in different gender
ggplot(gender_spouse,aes(y=total,x=gender,fill=spouse))+
  geom_bar(stat="identity")

##yes/no in different gender in percentage
ggplot(gender_spouse,aes(y=total,x=gender,fill=spouse))+
  geom_bar(stat="identity",position="fill")
##side-by-side bars
ggplot(gender_spouse,aes(y=total,x=gender,fill=spouse))+
  geom_bar(stat="identity",position="dodge")
