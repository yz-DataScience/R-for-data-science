##creating dates/times###

#to get the package ready
install.packages("lubridate")
library(lubridate)
library(tidyverse)
library(nycflights13)

today()
now()
##strings
ymd("2021-11-24")
mdy("November 24,2021")
mdy("Nov 24,2021")
dmy("24-Nov-2021")

##unquoted numbers

ymd(20211124)
ymd_hms("2021-11-24 10:30:59",tz="EST")

###create from a dataset
View(flights)
##Q1: create date/time from the separated info
flights %>% 
  select(year,month,day,hour,minute) %>% 
  mutate(departure=make_datetime(year,month,day,hour,minute))->timedata

?flights
flights$dep_time

##dep_time: HHMM 2240 departure at 22:40
##scheduled_dep_time HHMM 2040 scheduled at 20:40
##delay of dep: 2240-2040=200 (wrong)
###Q2: dep_delay time calculated from dep_time and scheduled_dep_time?
100/10
100%%10
2240%%100
2240%/%100
#check variable names
names(flights)

flights %>% 
  mutate(dep_time_new=make_datetime(year,month,day,dep_time%/%100,dep_time%%100),
         scheduled_dep_time_new=make_datetime(year,month,day,sched_dep_time%/%100,sched_dep_time%%100)) %>% 
  select(origin,dest,ends_with("_new"))->flights_delay

flights_delay %>% 
  mutate(dep_delay_calc=dep_time_new-scheduled_dep_time_new)


