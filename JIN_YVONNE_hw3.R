
# DPSS week 3 homework 

# 5. 
# For diamonds that are either fair or ideal in their cut, and that are above 3,000 dollars in price, what is the average price and count for each color category of diamond? Print this information in a table.

library(tidyverse)
diamonds <- diamonds

#colnames(diamonds)
#head(diamonds)

ans <- diamonds %>% 
  filter((cut == "Ideal"|cut == "Fair") & price > 3000) %>%
  group_by(color) %>%
  summarise(Average_price = mean(price, na.rm = T),
            count = n())

print(ans)          
  

# 6.
# Use the separate function and the unite function in order to turn table 5 into table 1.

table1
table5


table5_tidy <- table5 %>%
  unite(year, century, year, sep = "") %>%
  separate(rate, into = c("cases", "polulation"), sep = "/")

table5_tidy



# 7. 
# Use the pivot_wider command to turn table 2 into table 1.

table2
?pivot_wider

table2_tidy <- table2 %>%
  pivot_wider(names_from = type, values_from = count)

table2_tidy


# 8. 
# Use a join function of your choosing to turn these two tables into an output that matches table 1.
# Hint: You can join by more than one variable. 

table6 <- table4a %>%
  pivot_longer(cols = "1999":"2000",
               names_to = "year",
               values_to = "cases")
table6


table7 <- table4b %>%
  pivot_longer(cols = "1999":"2000",
               names_to = "year",
               values_to = "population")
table7

table_join <- table6 %>%
  left_join(table7,by = c("country", "year"))

table_join



# 9.
# a)	Print the levels of this variable in order, from lowest to highest.

levels(diamonds$cut)


# b)	change the level "Very Good" to "Superb". 
# Use the recode() function, without changing the order of the levels of the factor. 
# Print the new levels of cut to show you maintained the correct ordering for your factor.

diamonds$cut <- recode(diamonds$cut, "Very Good" = "Superb")

levels(diamonds$cut)

