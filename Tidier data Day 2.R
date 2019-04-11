#Tidier data, day 2 April 11 2019, Chapter 11, Amieroh
library(tidyverse)
library(lubridate)

# Load the data from a .RData file
load("data/SACTNmonthly_v4.0.RData")
# Copy the data as a dataframe with a shorter name
SACTN <- SACTNmonthly_v4.0 #new name SACTN
# Remove the original
rm(SACTNmonthly_v4.0) #rn is a remove function: removing the SACTNmonthly_V4.0
#Tidy data #filter, mutate, group_by, select, arrange; found in Tidyverse package
SACTN1 <- SACTN  %>% 
filter (site == "Port Nolloth") #only extract P. Nolloth data from "site" column (== means only)
SACTN %>%
  filter(site == "Pollock Beach", month(date) == 12 | month(date) == 1) #here we specify month as the lubricate package allows for R to only detect the month within the date column
SACTN_ARRANGE <- SACTN %>%
  arrange(depth, temp) #tell R look at the SACTN dataset and then arrange depth and temp, with lowest at top (ascending order)
SACTN_ARR_DESCENDING <- SACTN %>%
  arrange(desc(temp)) #desc means arrange from highest to lowes value (descending order); note do not specify asc for ascending, just arrange

#filter but for specific dates/years

SACTN_Hume <- SACTN %>%
  filter(site == "Humewood", year(date) == 1990) #take Only year from date, specifically year 1990
#only Humewood, only year 1990; possible bc of lubridate function in Tidyverse.

humewood_90s <- SACTN %>% #assign name, relfects that filter multiple names from the 1990s
  filter(site == "Humewood", year(date) %in% seq(1990, 1999, 1))

PNolloth_SACTN <- SACTN %>%
  filter(site == "Port Nolloth", # First give the site to filter
         src == "DEA", # Then specify the source
         temp <= 11 | # Temperatures at or below 11°C OR
           is.na(temp)) # Include missing values 

#function called "Select" from Tidyverse package

#Select columns individually by name
SACTN %>%
  select(site, src, date, temp)
# Select all columns between site and temp like a sequence
SACTN %>%
  select(site:temp)
# Select all columns except those stated individually
SACTN %>%
  select(-date, -depth)
# Select all columns except those within a given sequence
# Note that the '-' goes outside of a new set of brackets
# that are wrapped around the sequence of columns to remove
SACTN %>%
  select(-(date:depth))

SACTN %>%
  select(type, src, everything()) #first select type and source, then add everything else
#All Select stuff only on console, not assigned names and therefore not saved in Environment (memory); therefore will not commit, push to git.

SACTN_Mutated <- SACTN %>%
  mutate(kelvin = temp + 273.15) #mutate creates new column
#mutate works in such a way you must first specify what the name of the new column will be




SACTN_Summary <- SACTN %>%
  summarise(mean_temp = mean(temp, na.rm = TRUE), #function within a function (mean is a function within the function Summarise)
            sd_temp = sd(temp, na.rm = TRUE),
            min_temp = min(temp, na.rm = TRUE),
            max_temp = max(temp, na.rm = TRUE))




