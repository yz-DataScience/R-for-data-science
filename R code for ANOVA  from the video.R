###import the data from excel
library(readxl)
#import the initial
oysterdata_before <- read_excel("Dropbox/BIO-STAT/R for ecology course/Stats III ANOVA/oysterdata.xlsx",
                         sheet = "before")
View(oysterdata_before)
#import the final
oysterdata_after <- read_excel("Dropbox/BIO-STAT/R for ecology course/Stats III ANOVA/oysterdata.xlsx",
                                sheet = "after")
View(oysterdata_after)

#change of length
oyster_lengthchange=oysterdata_after[,-1]-oysterdata_before[,-1]
oyster_lengthchange$ID=oysterdata_after$ID
View(oyster_lengthchange)

###data manipulation: change data longer table
library(tidyverse)
names(oyster_lengthchange)
oyster_lengthchange %>% 
  pivot_longer(c(`Diet 1`,`Diet 2`,`Diet 3`,`Diet 4 (control)`),
               names_to = "diet",values_to = "length_change")->oyster_lengthchange_longer

View(oyster_lengthchange_longer)

##by now, the data is tidy.

##STEP 1: EDA- data visualization

ggplot(data=oyster_lengthchange_longer,aes(x=diet,y=length_change))+
  geom_boxplot()

ggplot(data=oyster_lengthchange_longer,aes(x=diet,y=length_change))+
  geom_boxplot()+
  theme_classic()+
  ggtitle("Length changes of oysters under different diets")+
  ylab("length changes")

##STEP 2: EDA - summary statistics

oyster_lengthchange_longer %>% 
  group_by(diet) %>% 
  summarise(mean_length_change=mean(length_change),
            sd_length_change=sd(length_change))

##Step 3: ANOVA

aov.model=aov(length_change~diet,data=oyster_lengthchange_longer)

summary(aov.model)

##Step 4: post-hoc
TukeyHSD(aov.model)
