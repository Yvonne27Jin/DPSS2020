
# DPSS hw5



# 5. 
# create a new column called ‘idealcut’. 
# Using ifelse, set ‘idealcut’ equal to TRUE when the ‘cut’ column equals “Ideal”. Set ‘idealcut’ equal to FALSE for all other values of ‘cut’ column. Assign this new data frame to the (original) diamonds dataset. 

library(tidyverse)
data("diamonds")
diamonds <- diamonds

# method 1:
diamonds$idealcut <- ifelse(diamonds$cut == "Ideal", "TRUE", "FALSE")

# method 2:
diamonds <- diamonds %>%
  mutate(idealcut = ifelse(cut == "Ideal", "TRUE", "FALSE"))





# 6. 
# Using t.test(), test whether the difference in means of price across two groups (ideal cut vs. non-ideal cut) is statistically significant

t.test(diamonds$price[diamonds$idealcut == T],diamonds$price[diamonds$idealcut == F])




# 7. 
## Design and run a regression using ‘lm()’ with price as your dependent variable and ‘idealcut’ and ‘carat’ as independent variables, with their interaction term. 
## provide only the adjusted R-squared of the model

#install.packages("broom")
library(broom)

interact_lm <- lm(price ~ idealcut*carat, data = diamonds)

glance(interact_lm)$adj.r.squared




# 8. 
# Write a function named ‘crime’ that uses the ‘read_json()’ function from ‘jsonlite’ to download crime data in any given year. 
# The function should have a single input ‘year” and should output a dataframe of crime for that year. 
# Drop column 22 (include only column 1-21) from each year’s data to avoid errors. 

library(jsonlite)
?drop

# method 1:
crime <- function(year) {
  df <- str_c("https://data.cityofchicago.org/resource/ijzp-q8t2.json?year=", year,sep = "") %>%
        read_json(simplifyVector = TRUE) %>% 
        select(-22)
  
  return(df)
}



# method 2:

crime <- function(year) {
  df <- str_c("https://data.cityofchicago.org/resource/ijzp-q8t2.json?year=", year,sep = "") %>%
        read_json(simplifyVector = TRUE)
  
  return(df[,1:21])
}



# 9.

# The ‘map’ functions are useful for iterating over something and applying a function to each item. ‘map_dfr()’ function, specifically, makes a data frame by combining all elements rowwise. 
# Using ‘map_dfr()’ and the function you created for Q8, download the crime data from 2018 to 2020.


library(dplyr)

crime_18_20 <- map_dfr(2018:2020, crime)

crime_18_20

save.image("JIN_YVONNE_hw5.RData")
getwd()
