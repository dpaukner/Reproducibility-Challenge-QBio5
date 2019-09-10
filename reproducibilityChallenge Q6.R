library(tidyverse) # used for read_csv
library(RMKdiscrete) # used for dLGP function

bugsdoc <- read_csv("~/Desktop/BSD-QBio5/tutorials/reproducibility/data/cole_arthropod_data_1946.csv")
weevilsdoc <- read_csv("~/Desktop/BSD-QBio5/tutorials/reproducibility/data/mitchell_weevil_egg_data_1975.csv")


#define mean, name it lambda for
lamb <- sum((weevilsdoc$k_number_of_eggs*weevilsdoc$C_count_of_beans_with_k_eggs)/sum(weevilsdoc$C_count_of_beans_with_k_eggs))


# variable: possible integer counts of weevil eggs
x <- weevilsdoc$k_number_of_eggs


# plots the proportion of eggs per bean versus x
# labels the axes accordingly
plot(x,(weevilsdoc$C_count_of_beans_with_k_eggs)/sum(weevilsdoc$C_count_of_beans_with_k_eggs),xlab = 'Egg number (integer)',ylab = 'Proportion of beans with egg number x', col="red")

# adds the Poisson distribution with the same mean on the same scale as the plot
lines(x,dpois(x,lamb),col="blue")

# plots the model of the Lagrangian Poisson distribution on the same scale as the prior plot
plot(x,dLGP(x,lamb,0))
