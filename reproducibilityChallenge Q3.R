library(tidyverse) # calls 

bugsdoc <- read.csv("~/Desktop/BSD-QBio5/tutorials/reproducibility/data/cole_arthropod_data_1946.csv")
weevilsdoc <- read.csv("~/Desktop/BSD-QBio5/tutorials/reproducibility/data/mitchell_weevil_egg_data_1975.csv")

lamb <- sum((weevilsdoc$k_number_of_eggs*weevilsdoc$C_count_of_beans_with_k_eggs)/sum(weevilsdoc$C_count_of_beans_with_k_eggs))


x <- weevilsdoc$k_number_of_eggs

plot(x,(weevilsdoc$C_count_of_beans_with_k_eggs)/sum(weevilsdoc$C_count_of_beans_with_k_eggs),xlab = 'Egg number (integer)',ylab = 'Proportion of beans with egg number x', col="red")
lines(x,dpois(x,lamb),col="blue")


