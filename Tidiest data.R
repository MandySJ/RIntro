#Tidiest data, Day 2 April 11 2019

# Load libraries
library(tidyverse)
library(lubridate)
# load the data from a .RData file
load("data/SACTNmonthly_v4.0.RData")
# Copy the data as a dataframe with a shorter name
SACTN <- SACTNmonthly_v4.0
# Remove the original
rm(SACTNmonthly_v4.0) #removes from Environment.

#Note: in Environment, obs= rows, varialbes= columns
# Group by depth
SACTN_depth <- SACTN %>%
  group_by(depth)
# Calculate mean temperature by depth
SACTN_depth_mean <- SACTN_depth %>%
  summarise(mean_temp = mean(temp, na.rm = TRUE),
            count = n())


SACTN_depth_mean_2 <- SACTN %>% # Choose a base dataframe
  group_by(depth) %>% # Group by thedepth column
  summarise(mean_temp = mean(temp, na.rm = TRUE), # Calculate means
            count = n() # Count observations
  ) # Safety measure

#everything at depth of 0 grouped together, then get mean (see SACTN_depth_mean_2 in Environment)


#exploring all Tidyverse function in one chunk of code

SACTN_Tidy <- SACTN %>%
  filter(site == "Paternoster" | site == "Oudekraal") %>%
  group_by(site, src) %>%
  summarise(mean_temp = mean(temp, na.rm = TRUE),
            sd_temp = sd(temp, na.rm = TRUE)) #extract certain info from large dataset

#working with multiple sites within dataset (but not all)
# First create a character vector containing the desired sites
selected_sites <- c("Paternoster", "Oudekraal", "Muizenberg", "Humewood") #sequence of sites, will show up in Environment as a string of characters (not numbers)
# Then calculate the statistics
SACTN %>%
  filter(site %in% selected_sites) %>% #filter site column to only sites in "selected_sites"
  group_by(site, src) %>%
  summarise(mean_temp = mean(temp, na.rm = TRUE), #ignore na values
            sd_temp = sd(temp, na.rm = TRUE))













