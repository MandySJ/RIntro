#here we are plotting with ggplot, still Day 1 of tutorial April 10 2019
#loading the libraries
library(tidyverse) #blanket package, have ggplot2 within Tidyverse
OR
library (ggplot2) #more specific to plotting
#loading in the data
#R has built in datasets
#create basic figure
ChickWeight <- datasets::ChickWeight #dbl colon for using R's in-built datsets
#Explore the data
summary (ChickWeight)
names (ChickWeight)
dim(ChickWeight)
glimpse (ChickWeight)
?ChickWeight
#create a scatter and line graph


ggplot(data = ChickWeight, aes(x = Time, y = weight)) +
  geom_point() + #scatter or point plot
  geom_line(aes(group = Chick)) #ALL 1s grouped as a chick; 2s as another (see data)
#group function when plotting same as "group_by" function 
#use + not %>%  when plotting

ggplot(data = ChickWeight, aes(x = Time, y = weight, colour = Diet)) + #colour coding for diet.
  geom_point() +
  geom_line(aes(group = Chick))
#hypothesis: test most effective diet in causing chicks to gain weight
#Aes is aesthetics

ggplot(data = ChickWeight, aes(x = Time, y = weight, colour = Diet)) +
  geom_point() + #plotting points
  geom_smooth(method = "lm") #lm is a linear model; here we want one line of best fit

ggplot(data = ChickWeight, aes(x = Time, y = weight)) +
  geom_point(colour = "blue") +
  geom_line(aes(group = Chick, colour = "blue")) 
ggplot(data = ChickWeight, aes(x = Time, y = weight, colour = Diet)) +
  geom_point(aes(size = weight)) +
  geom_smooth(method = "lm", size = 1.2) #point size represent chick weight

ggplot(data = ChickWeight, aes(x = Time, y = weight, colour = Diet)) +
  geom_point() +
  geom_smooth(method = "lm") +
  labs(x = "Days", y = "Mass (g)", colour = "diet type") + # Change the labels
  theme(legend.position = "bottom") # Change the legend position









