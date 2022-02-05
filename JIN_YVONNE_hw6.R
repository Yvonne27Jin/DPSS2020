
# DPSS hw6

# spatial distribution of child poverty density rates in Chicago’s neighborhoods.
#install.packages("tmap")

library(sf)
library(tmap)
library(tidyverse)


# 5. 

# Load the Chicago neighborhoods data in the ComArea_ACS14_f.shp file and plot the basic geometry of the Chicago neighborhoods

chicago_comArea <- st_read("ComArea_ACS14_f.shp")
colnames(chicago_comArea)

# method 1:
plot(chicago_comArea["geometry"])

# method 2:
plot(st_geometry(chicago_comArea))



# 6. 

# create a new variable for the density of child poverty in each neighborhood 
chicago_comArea <- chicago_comArea %>%
  mutate(child.pov.density = ChldPov14/shape_area)



# 7. 

# plot the child poverty density variable using sf package and tmap package.

# sf package plot()
plot(chicago_comArea["child.pov.density"])

# tmap package 
?tm_fill
tm_shape(chicago_comArea) +
  tm_borders() +
  tm_fill(col = "child.pov.density",
          title = "Child Poverty Density")




# 8.

groceries <- st_read("groceries.shp")
# Get the CRS (coordinate reference system) of the groceries point data
groceries_crs <- st_crs(groceries)
colnames(groceries)



# a.
# ensure that the same CRS system is used by the Chicago neighborhood’s data

#chicago_comArea <- chicago_comArea %>%
  #mutate(geometry = as.character(geometry))
# nessecary?


chicago_comArea <- st_transform(chicago_comArea, groceries_crs)


# b. 
# plot the child poverty density and grocery store location on the same map

## have to merge?

?tm_dots

pov.map = tm_shape(chicago_comArea) +
  tm_fill(col = 'child.pov.density') +
  tm_borders()

pov.map + tm_shape(groceries) + tm_dots()





## some useful resources for tmap
# https://geocompr.robinlovelace.net/adv-map.html
# https://cran.r-project.org/web/packages/tmap/vignettes/tmap-getstarted.html

