#Mapping with ggplot, April 11 2019
#Mapping for site locations, along SA coastline

# Load libraries
library(tidyverse)
library(ggpubr) #faceting, activates the function ggarrange
# Load data
load("data/south_africa_coast.RData") #load from data folder the SA coast R dataset
load("data/sa_provinces.RData")
load("data/rast_annual.RData")
load("data/MUR.RData")
load("data/MUR_low_res.RData")


# Choose which SST product you would like to use
sst <- MUR_low_res
# OR
sst <- MUR
# The colour pallette we will use for ocean temperature
cols11 <- c("#004dcd", "#0068db", "#007ddb", "#008dcf", "#009bbc",
            "#00a7a9", "#1bb298", "#6cba8f", "#9ac290", "#bec99a")
ggplot(data = ChickWeight, aes(x = Time, y = weight)) +
  geom_point()


ggplot(data = south_africa_coast, aes(x = lon, y = lat)) +
  geom_point()


plot1 <-  ggplot(data = south_africa_coast, aes(x = lon, y = lat)) +
  geom_polygon(colour = "black", fill = "grey70", aes(group = group)) + #polygon means it creates an area for me
  geom_path(data = sa_provinces, aes(group = group)) # The province borders

ggplot(data = south_africa_coast, aes(x = lon, y = lat)) +
  geom_polygon(colour = "black", fill = "grey70", aes(group = group)) +
  geom_path(data = sa_provinces, aes(group = group)) +
  coord_equal(xlim = c(15, 34), ylim = c(-36, -26), expand = 0) # Force lon/lat extent

sst <-  MUR_low_res #Assign Mur_Low_REs to a new name, plotting this with SST as it's the new name.

ggplot(data = south_africa_coast, aes(x = lon, y = lat)) +
  geom_raster(data = sst, aes(fill = bins)) + #geom_raster function that looks at temp, bin assgins colour to temp ranges (eg. between 20 and 22 degr C will be grouped in same colour)
  geom_polygon(colour = "black", fill = "grey70", aes(group = group)) + #polygo is area
  geom_path(data = sa_provinces, aes(group = group)) + #path is line, may be connected  by dots
  scale_fill_manual("Temp. (°C)", values = cols11) + # Set the colour palette
  coord_equal(xlim = c(15, 34), ylim = c(-36, -26), expand = 0)

#Plot1
ggsave(plot = plot1, "plot1.pdf", height = 6, width = 9) #want to save a plot called plot1, in pdf format...








