#data transformation
install.packages("nycflights13") #use a dataset from this package
install.packages("dplyr") #important functions from this package
library(nycflights13)
library(dplyr)
flights
dim(flights)
?flights
##filter() pick observation by their values
##arrange() reorder the rows
##select() pick variables by their names
##mutate() create new variables based on exising variables
##summarise() summary statistics 

#Q1 get the data on January 1st

filter(flights,month==1,day==1)

#pipes(shift+command+M)
flights %>% filter(month==1,day==1)->Jan_data
#Q2 get the data on Dec 25th
flights %>% filter(month==12,day==25)->Christmas_data

##>, >=,<, <=, !=, ==
#Q3 Data that is not from Dec.(month)
flights %>% filter(month!=12)->NoDec_data

#Q4: Data that is from Christmas and the departure delay is more than 5 mins
flights %>% filter(month==12,day==25,dep_delay>5)->Christmas_delay_data

#arrange()
flights %>% arrange(year,month,day)->arranged_data
#Q5: re-arrange the data according to dep_delay in a discending order
#arrange() with desc()
flights %>% arrange(desc(dep_delay))->desc_dep_data


