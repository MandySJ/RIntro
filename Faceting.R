#Day 1 faceting using new library called ggpubr, faceting is using multiple graphs on one visua
#here we use function called ggarrange- found in ggpubr package.
#loading packages
library(tidyverse)
library(ggpubr)
library(ggpubr)
Load data
ChickWeight <- datasets::ChickWeight
# Create faceted figure
ggplot(data = ChickWeight, aes(x = Time, y = weight, colour = Diet)) +
  geom_point() +
  geom_smooth(method = "lm") + # Note the `+` sign here
  facet_wrap(~Diet, ncol = 2) + # This is the line that creates the facets, two columns on layout
  labs(x = "Days", y = "Mass (g)") + #labelling axis
  ggtitle("Facet wrap 1")
?Chickweight
?mean
??mean

line_1 <- ggplot(data = ChickWeight, aes(x = Time, y = weight, colour = Diet)) +
  geom_point() +
  geom_line(aes(group = Chick)) +
  labs(x = "Days", y = "Mass (g)")
line_1
line_1

# Note that we are using 'ChickLast', not 'ChickWeight'

ChickLast <- ChickWeight %>%
  filter(Time == 21) #filter time column to only show line 21, use ggplot function, which can find in ggplot2 package or in Tidyverse
histogram_1 <- ggplot(data = ChickLast, aes(x = weight)) +
  geom_histogram(aes(fill = Diet), position = "dodge", binwidth = 100) + #dodge columns next to each other (not stacked, for eg.), binwidth is width of column.
  labs(x = "Final Mass (g)", y = "Count")
histogram_1

# Note that we are using 'ChickLast', not 'ChickWeight'
box_1 <- ggplot(data = ChickLast, aes(x = Diet, y = weight)) +
  geom_boxplot(aes(fill = Diet)) + #line grasph say colour = diet bc nothing to fill; here it's fill = diet bc have something to fill
  labs(x = "Diet", y = "Final Mass (g)")
box_1

ggarrange(line_1, histogram_1, box_1,
          ncol = 2, nrow = 2, # Set number of rows and columns
          labels = c("A", "B", "C", "D"), # Label each figure
          common.legend = TRUE) # Create common legend

