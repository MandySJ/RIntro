#Mapping with ggplot, April 11 2019
#Mapping for site locations, along SA coastline

# Load libraries
library(tidyverse)
library(ggpubr) #faceting, activates the function ggarrange
# Load data
load("data/south_africa_coast.RData")
load("data/sa_provinces.RData")
load("data/rast_annual.RData")
load("data/MUR.RData")
load("data/MUR_low_res.RData")

