library(tidyverse)
#set your own directory here
setwd("~/BSD-QBio5/tutorials/reproducibility/data")

arth <- read.csv("cole_arthropod_data_1946.csv", stringsAsFactors = FALSE)

sowbug_counts <- arth[,3]
mean_sowbug <- mean(sowbug_counts)


