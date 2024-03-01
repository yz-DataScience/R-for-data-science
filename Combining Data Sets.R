data1 = tibble(x1 = runif(4),
               y1 = rnorm(4))
data2 = tibble(y1 = rpois(4,1),
               x1 = rgamma(4,shape = 2,scale = 3))
data1
data2
#Rhey represent a pair of datasets measuring the 
#same features at two different locations. 
#We would like to combine them into a single data frame.
#Notice that the order of the two variables is switched in the two tibbles. 
#This means we can’t simply stack them without 
#matching column headings.
data_all =
  bind_rows(
    "LocA" = data1, 
    "LocB" = data2,
    .id = "Location"
  )
data_all


df1 <- tibble(id_numb = c(1, 3, 2, 4),
              xvar = c(16, -1, 11, 13))
df2 <- tibble(id = c(1, 4, 2, 3),
              yvar = c(-1, -4, 0, -9))
left_join(df1,
          df2,
          by = c("id_numb" = "id")
)


left_join(
  df2,
  df1,
  by = c("id" = "id_numb")
)

right_join(df1,
           df2,
           by = c("id_numb" = "id")
)


df1 %>% # piped data goes into x
  inner_join(df2,
             by = c("id_numb" = "id")
  )



library(babynames)
life_df = babynames::lifetables
birth_df = babynames::births
babynames_df =babynames::babynames
head(babynames)
head(births)
head(lifetables)
#Merge/Join the births data into the babynames data.
left_join(x = babynames,
          y = births,
          by = c("year" = "year")
)
?babynames
?births
?lifetables
lifetables %>% 
  filter(x==0) %>% 
  left_join(births,by=c("year"="year"))



