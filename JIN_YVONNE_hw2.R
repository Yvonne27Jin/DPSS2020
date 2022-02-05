# DPSS homework 2
# JIN Yvonne

--------------------

# 6.

library(tidyverse)
diamonds <- diamonds
carat <- diamonds$carat
price <- diamonds$price

my_vector <- c(length(price),sum(price), mean(price),median(price),var(price),sd(price),min(price),max(price))

my_vector


--------------------

# 7. 

#cumsum(c(0, 1, 2, 3, 4, 5))
#cumprod(c(1, 2, 3, 4, 5))
#cummin(c(3,2,6,8))
#cummax(c(2,3,6,5,8))

annual_r <- c(0.11, 0.06, 0.15, 0.09, -0.03, -0.02, 0.25)
# can R handle percentage? how to convert this automatically?
# annual_r <-c(11%, 6%, 15%, 9%, -3%, -2%, 25%)

annual_r <- as.numeric(annual_r) +1
cum_r <- cumprod(annual_r)
annural_return <- cum_r * 5000
print(annural_return)



--------------------

# 8.

library(tidyverse)
starwars <- starwars
#dim(starwars)
#colnames(starwars)



# a) remove all the characters with either blue eyes or pale skin. Save this new object as a new data frame and name it starwars2

# ![(blue eye) OR (pale skin)] == !(blue eye) AND !(pale skin)
starwars2 <- starwars %>% filter(eye_color != "blue"  & skin_color != "pale")



#double check results
#dim(starwars2) # [63,13]
#"pale" %in% starwars2$skin_color # return false
#"blue" %in% starwars2$eye_color # false




# b) Use filter to subset individuals with brown hair and fair skin, or black hair and dark skin. Save this new data set as starwars3.

starwars3 <- starwars %>% 
  filter(
    (hair_color == "brown" & skin_color == "fair") |
      (hair_color == "black" & skin_color == "dark")
)

#dim(starwars3) # [11,13]



--------------------

# 9.

# Use the group_by and summarize functions to find the average height and the minimum mass for each homeworld. 
# Hint: na.rm = TRUE in mean() and min()

#colnames(starwars)
#starwars$mass


starwars %>%
  group_by(homeworld) %>%
  summarize(
    ave_height = mean(height, na.rm= T),
    min_mass = min(mass,na.rm = T)  
    #getting inf warning for  Champala and Chandrila ?
    )



--------------------

# 10. 

# filter(), group_by(), summarise(), and arrange(). 
# only include individuals with no hair (hair = NA). 
# group by homeworld, and find the average height. 
# arrange the results in descending order by average height  
# Hint1: Use is.na(hair_color) instead of hair_color==NA in the filter function.  ### why? different types of NA?
# Hint2: Use the function desc() in the arrange function


ans_10 <- starwars %>% 
  filter(is.na(hair_color)) %>%
  group_by(homeworld) %>%
  summarise(ave_height = mean(height, na.rm = T)) %>%
  arrange(desc(ave_height))

ans_10



