library(tidyverse)
table1
table2
table3
table4a
table4b

#Q1: add a variable named as rate?

library(dplyr)
table1 %>% 
  mutate(rate=cases/population*10000)->table1_new
table1_new

#Q2: count the number of cases per year?
table1 %>% 
  count(year,wt=cases)
#Q3: count the number of cases per country?
table1 %>% 
  count(country,wt=cases)
#Q4: visualize the trend of cases for different countries?
library(ggplot2)
ggplot(data=table1,aes(x=as.factor(year),y=cases))+
  geom_line(aes(group=country))+
  geom_point(aes(colour=country))

ggplot(data=table1_new,aes(x=as.factor(year),y=rate))+
  geom_line(aes(group=country))+
  geom_point(aes(colour=country))

#One variable might be spread across multiple columns:pivot_longer
table4a %>% 
  pivot_longer(c('1999','2000'),names_to = "year",values_to = "cases")->table4a_tidy

table4b %>% 
  pivot_longer(c('1999','2000'),names_to="year",values_to = "population")->table4b_tidy

left_join(table4a_tidy,table4b_tidy)

#One observation might be scattered across multiple rows:pivot_wider
table2 %>% 
  pivot_wider(names_from = "type",values_from = count)
