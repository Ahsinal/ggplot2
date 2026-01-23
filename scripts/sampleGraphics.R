# creating sample dataframe
A <- c(2,1,4,9,11,12,33,44)
B <- c(3,2,5,12,1,2,4,9)
C <- c(4,1,15,8,4,12,3,12)
D <- c("a","a","b","b","c","a","b","b")
mydata <- data.frame(A,B,C,D)
cat("The Data Frame is:")
print(mydata)

# Make sure that uou have installed and loaded the library ggplot
library(ggplot2)
# storing our plot in a variable ~ reusability
p <- ggplot(mydata, aes(x = A, y = C))

p
#An empty window opens ,because we haven't specified the geometry that we want yet!

p <- p + geom_point(mapping=aes(shape = D), 
                    stat = "identity", 
                    size= 4, 
                    position = "identity")
print(p)

# we can also customize shape using scale_shape_manual(),R has other shapes and its associated values like 16 = ● (filled circle)
# 17 = ▲ (filled triangle),15 = ■ (filled square),8 = ★ (star),1 = ○ (open circle)
p <- p + geom_point(mapping = aes(shape = D),
                    stat = "identity",
                    size = 4,
                    position = "identity") +
  scale_shape_manual(values = c("a" = 1,  
                                "b" = 16,
                                "c"= 15)) 
print(p)

#Adding scale to the plot ,By default scale is continuous
p<- p + scale_x_continuous() + scale_y_log10()
print(p)

#Adding coordinate system
#By default the coordinate system is cartesian
p <- p + coord_cartesian()
p

#Polar cooedinate
# p <- p + coord_polar()
# cat("Here is the polar coordinate")
# print(p)

# using Facet speciation
p <- p + facet_grid(cols= vars(D))
p

# combined code
p <- ggplot(mydata, aes(x=A, y=C)) + 
  geom_point(aes(shape = D),size=4) + 
  scale_y_log10() + 
  facet_grid(cols = vars(D))
p

#You can customize the color 
p <- ggplot(mydata, aes(x=A, y=C)) + 
  geom_point(aes(shape = D),size=4,color = "purple") + 
  scale_y_log10() + 
  # facet_grid(cols = vars(D)) +
  theme_gray() +  # Gray palette background (minimalist)
  theme(legend.position = "bottom")  # Clean legend
p



