#lubridate: dealing with time and dates
#dplyr: data manipulation
#tidyr:data tidying
#tidyverse: a collection of packages
install.packages("tidyverse")
library(tidyverse)
date_string="2024-02-29 09:10:59"
date_string
day(date_string)
month(date_string)
year(date_string)
wday(date_string,label=T)
?wday
hour(date_string)

#Q1. create a smaller dataset only for upstate NY
#filter
ny_airports_nov2022 <- read.csv("~/Downloads/data/ny_airports_nov2022.csv")
names(ny_airports_nov2022)
ny_airports_nov2022 %>% 
  filter(ORIGIN_CITY_NAME %in% c("Albany, NY","Buffalo, NY","Rochester, NY","Syracuse, NY"))->selectedNY
table(selectedNY$ORIGIN_CITY_NAME)

head(selectedNY$FL_DATE)

selectedNY %>% 
  mutate(Flight_Date=mdy(FL_DATE))->selectedNY_time
View(selectedNY_time)

##1. average delay time for each airport

selectedNY_time %>% 
  group_by(ORIGIN_CITY_NAME) %>% 
  summarise(average.delay=mean(DEP_DELAY,na.rm = T))

##2. which day of the week has the most flights
selectedNY_time %>% 
  mutate(day_of_the_week=wday(Flight_Date,label=TRUE)) %>% 
  group_by(day_of_the_week) %>% 
  summarise(total.flights=n()) %>% 
  slice_max(total.flights,n=1)
  
##3. heatmap:days of the month on calendar to show average delay per airport
install.packages("ggTimeSeries")
library(ggTimeSeries)
selectedNY_time %>% 
  group_by(Flight_Date,ORIGIN_CITY_NAME) %>% 
  summarise(average.delay=mean(DEP_DELAY,na.rm=T)) %>% 
  ungroup() %>% 
  ggplot_calendar_heatmap("Flight_Date","average.delay")+
  facet_wrap(~ORIGIN_CITY_NAME)+
  scale_fill_continuous(low="green",high="red")+
  coord_flip()+theme_light()

