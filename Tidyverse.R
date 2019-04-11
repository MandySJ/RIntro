#working with Tidy data, mainly focus on Tidyverse package, April 11 2019 Day 2 tutorial
#long data better than wide
library(tidyverse)


#loading dataset
load("data/SACTN_mangled.RData") #if csv file, Read_csv, but if RData just say load
#in the dataset have  five diff dataframes

#plotting the data
ggplot(data = SACTN1, aes(x = date, y = temp)) + #SACTN SA Coastal Temp Network #Aes aesthetic, means modifying whatver you are specifying
  geom_line(aes(colour = site, group = paste0(site, src)))+ #paste function bc grouping by two variables, in figure two lines of same colour show the sources (two lines for Port Noloth, collected by DEA and SAWS). One line means 1 source
  labs(x = "", y = "Temperature (°C)", colour = "Site") + #empty "" means leaving axis blank with no legend
  theme_bw()
#gather function in R
#part of Tidyverse

SACTN2_tidy <- SACTN2 %>% #loading dataset
  gather(DEA, KZNSB, SAWS, key = "src", value = "temp") %>%  #tidying SACTN2 data, src= source (see SACTN1 data)
#new column for values has temp, which was previously split into three columns with DEA, SAWS and KZNSB (SACTN2)

na.omit() #removes all na values. Another function is drop_na


SACTN3_tidy <- SACTN3 %>%
  spread(key = var, value = val) #splits the column "Depth" into two, becuae there is the word depth plus type of instrument on same column, then on next column there are actual values... want to change that. Will reduce the number of rows too (see SACTN3)
#In SACTN3 have 6 columns but one has depth and type of instrument, the other has values of depth plus names of instrument

#In SACTN3_tidy still has 6 columns but better organised and less rows...

SACTN4a_tidy <- SACTN4a %>%
  separate(col = index, into = c("site", "src"), sep = "/ ") #separate column title "Index" into two columns, "site" and "src(source)", wherever you see the forward slash

SACTN4b_tidy <- SACTN4b %>%
  unite(year, month, day, col = "date", sep = "-") #in new column, year month and day must be separated by - 

SACTN4_tidy <- left_join(SACTN4a_tidy, SACTN4b_tidy)



