
q <- ggplot(data=mpg, mapping = aes(x=displ, y=hwy))

#Scatter Plot
scatterPlot = ggplot(data=mpg, mapping = aes(x=displ, y=hwy)) + geom_point(shape = 8, size = 4)
scatterPlot

#Line plot
q + geom_line()

#connected scatterplot
q + geom_line() +geom_point()

#geom_line() plots all of the data points in the order of the variable of  x axis.
# while geom_path() follows order of data specified in data set
q + geom_path()
# geom_path + geom_polygon is combined to use to draw map
q + geom_polygon()


#geom_bar not of same family slightly differs; it uses stat count so can have only one aesthetic either X or Y only
bar <- ggplot(data=mpg, mapping = aes(x=displ)) + geom_bar()
bar      # Here Y variable is the count of the number of items in each category of axis



