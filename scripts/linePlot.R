# required packages ggplot ,dplyr, babynames (for sample data), 
library(babynames)
library(dplyr)
anna <- filter(babynames, name == "Anna")
anna

anna <- filter(babynames, name == "Anna", sex=='F')
anna

theme_set(theme_minimal())

linegraph = ggplot(anna, aes(x=year, y=n)) + geom_line()
linegraph

stepgraph = ggplot(anna, aes(x=year,y=n)) +geom_step()
stepgraph

geom_area_plot = ggplot(anna,aes(x=year, y=n)) +geom_area()
geom_area_plot


