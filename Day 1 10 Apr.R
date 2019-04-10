# Day 1 of RIntro, at UWC 10 Apr 2019 Mandy
apples <- c(5.3,4, 1, 3)
mean(apples)
dim(apples) #dim null bc not data frame (no columns and rows)
sd(apples)
length(apples)
#libraries
library(tidyverse)
#reading a dataset into R
laminaria <- read.csv("data/laminaria.csv") #using data found in laminaria folder in data folder
dim(laminaria) #140 rows 12 columns
mean (laminaria) #does not work bc working with a dataframe
#calc mean of blade weight and blade length
lam_sum <- laminaria %>% 
  #%>% pipe function, create by control shift m
  summarise(mean_wt = mean (blade_weight), #calc mean of blade weight
          mean_bl = mean (blade_length)) #"" length
lam_sum

#Explore data - laminaria dataset
head (laminaria)#gives first 6 rows of dataset
tail (laminaria) #"" last ""
head (laminaria, n = 2) #show first 2 rows of dataset
names (laminaria) #variable
colnames(laminaria)
nrow(laminaria) #number of rows in dataset
ncol(laminaria) #"" columns ""
lam2 <- laminaria %>% #lam2 new dataset, specify laminaria (where data is)
  select (blade_weight, blade_length, site) #selecting specific columns
lam2

lam3 <- laminaria %>% #specify dataset
  filter(site== "Sea Point") %>% #specify one particular site
  summarise (mean_wt= mean(blade_weight), #mean of the one site
             mean_bl= mean (blade_length), #""
             sd_bl= sd(blade_length)) #st dev of BL
lam3

#function within Tidyverse: Slice
lam_slice <- laminaria %>% 
  slice (6:13)
lam_miss <- laminaria %>% 
  summarise(mean_sm= mean (stipe_mass, na.rm= T)) #Mean of the stipe mass T measn true
lam_miss
lam_miss


