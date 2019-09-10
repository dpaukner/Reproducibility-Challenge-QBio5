library(tidyverse)
#set your own directory here
setwd("~/BSD-QBio5/tutorials/reproducibility/data")

arth <- read.csv("cole_arthropod_data_1946.csv", stringsAsFactors = FALSE)
k <- arth[,1]
sowbug_counts <- arth[,3]
mean_sowbug <- k*sowbug_counts/sum(sowbug_counts)

pois_sowbug <- dpois(k, mean_sowbug, log = FALSE)

norm_sow <- sowbug_counts/sum(sowbug_counts)

plot(k,norm_sow, col = "red")
lines(k, pois_sowbug, col = "green")

