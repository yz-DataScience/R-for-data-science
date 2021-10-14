install.packages("tidyverse")
library(tidyverse) #dplyr #ggplot2 ##tibble
install.packages("nycflights13")
library(nycflights13)
flights
airlines
planes
weather
airports

###join
##left_join
##right_join
#full_join
#inner_join

#Q1:add the airline information to flights
flights %>% 
  left_join(airlines,by="carrier")->flights_airline
View(flights)
View(flights_airline)

##Q2: add the weather info to flights
names(weather)
names(flights)
#by default is common variables
flights %>% 
  left_join(weather)->flights_weather
##Q3:add the airplane info to flights
names(planes)
names(flights)
flights %>% 
  left_join(planes,by="tailnum")

##some example

X=tibble(
  key=c(1,2,3),
  varX=c("AA","UA","DA")
)
Y=tibble(
  key=c(1,2,4),
  varY=c("American Airline","United Airline","JetBlue")
)

left_join(X,Y)
right_join(X,Y)
inner_join(X,Y)
full_join(X,Y)

