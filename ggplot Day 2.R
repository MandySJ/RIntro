#plotting with boot
#using 3rd variable as a colour variation (colour scale)
#loading the libraries
library(tidyverse)
library(boot)
library(boot)
#load built in dataset
urine <- boot::urine #assign name "urine" so it appears in the Environment.
#Explore data
head(urine)
tail(urine)
dim(urine) #1st value amount of rows, second amount of columnns
names(urine)
colnames(urine)
rownames(urine)

#ggplot for plotting function in R
ggplot (urine, aes (x= osmo, y = ph)) + #plot and specify axes
  geom_point(aes(colour=cond)) #cond - conductivity, variable in dataset
?urine #dataset info
#loading the libraries
library(tidyverse)
library(boot)
library(boot)
#load built in dataset
urine <- boot::urine 
ggplot (urine, aes (x= osmo, y= ph))+
  geom_point(aes(colour= as.factor(r)))
#to create own colour pallete
# http://tristen.ca/hcl-picker/#/hlc/6/0.95/48B4B6/345363
# http://tools.medialab.sciences-po.fr/iwanthue/index.php
# http://jsfiddle.net/d6wXV/6/embedded/result/