
# DPSS homework 4


library(tidyverse)
library(ggplot2)

# 4.
## generate a scatterplot of carat and price. 
## Use color as a third aesthetic to represent cut
##set the opacity of the dots to 50 percent.

diamonds <- diamonds

ggplot(diamonds) +
  geom_point(aes(x=carat, y=price, color=cut),alpha=0.5)


# 5.
## Use geom_hex to plot a heatmap of carat against price. 
## change the heat mapping to a logarithmic scale to get more color variation


# warning: need package "hexbin"
install.packages("hexbin")

ggplot(diamonds) +
  geom_hex(aes(x=carat, y=price)) +scale_fill_gradient(trans="log")


# 6. 
## plot the relationship between carat and price separately for each category in the cut variable. 


# a)	Use facet_wrap to plot scatterplots of carat against price for each level of cut in the diamonds dataset. 

# relationship -> scatterplot?
ggplot(diamonds, aes(x=carat,y=price)) +
  geom_point(alpha = 0.1) +
  facet_wrap(~factor(cut), ncol = 1) 
  
# warning: geom_density requires the following missing aesthetics: y


# b) use geom_smooth to add in a linear trend line. Make the trend line red. 
## (Hint: Use the method argument in geom_smooth to select a linear model)

?geom_smooth

ggplot(diamonds) +
  geom_point(aes(x=carat,y=price)) +
  facet_wrap(~factor(cut), ncol=1) +
  geom_smooth(aes(x=carat,y=price), color = "red", method = "lm")
             



# 7.

ggplot(diamonds)+
  geom_violin(aes(x=factor(cut),y=price,fill=factor(cut)))



# 8.


library(nycflights13)
flights <- flights[1:100,]
NYCflight <- ggplot(data = flights) +
             geom_bar(mapping = aes(x = dest)) 


# a)	Add an informative title to the plot.
NYCflight +  labs(
  title="Destinations of the first 100 flights out of New York in 2013",
  y="Numbers",
  x="Destination"
)


# b) Add a layer that rotates all of the x axis labels by 90 degrees.

NYCflight + theme(axis.text.x = element_text(angle = 90)) # or 270?
