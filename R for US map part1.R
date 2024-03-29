##US map
#install.packages("usmap")
library(usmap)
#install.packages("ggplot2")
library(ggplot2)
##a blank US map
plot_usmap(regions="states")+
  labs(title="States in the US",
       subtitle = "This is a blank map of the US.")
#plot the south region
plot_usmap(include = .south_region,labels=TRUE)+
  labs(title="US south region")
##plot the south region exclude VA
plot_usmap(include = .south_region,exclude="VA",labels=TRUE)+
  labs(title="US south region")
##plot the south region exclude VA. WV
plot_usmap(include = .south_region,exclude=c("VA","WV"),labels=TRUE)+
  labs(title="US south region")