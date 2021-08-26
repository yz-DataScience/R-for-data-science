#create a data frame
df=data.frame(abc=1,xyz="a")
df
#check specific variables
df$abc
df$x
df$xyz
df[,"xyz"]
install.packages("tidyverse")
library(tidyverse)
#create a new tibble
df2=tibble(abc=1,xyz="a")
df2
#subset the tibbles
df2$abc
df2$xyz
df2$x

## check on the data frame
iris
##change a data frame to tibble
as_tibble(iris)

#another example of creating tibble
df3=tibble(
  x=1:5,
  y=1,
  z=x^2+y
)
df3
##subsetting the tibble
df3$x
df3[[1]]
df3[1]
df3[]

##change the printout of a tibble
nycflights13::flights %>% 
  print(n=10,width=Inf)
#open a new window for the tibble
nycflights13::flights %>% 
  View()
