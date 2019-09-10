library(tidyverse)
library(ggplot2)
library(RMKdiscrete)
setwd("~/Desktop/BSD-QBio5/tutorials/reproducibility/data")
arthData <-
  read.csv("cole_arthropod_data_1946.csv", stringsAsFactors = FALSE)
spiderData <-
  arthData[, c("k_number_of_arthropods",
               "C_count_of_boards_with_k_spiders")]
spiderSum <-
  spiderData$k_number_of_arthropods * spiderData$C_count_of_boards_with_k_spiders
spiderSum <- sum(spiderSum)
countSum <- sum(spiderData$C_count_of_boards_with_k_spiders)
spiderMean <- spiderSum / countSum

k <- 0:17
realData <-
  (
    spiderData$C_count_of_boards_with_k_spiders / sum(spiderData$C_count_of_boards_with_k_spiders)
  )
pDistriData <- dpois(k, spiderMean)
LGPData <- dLGP(k, spiderMean, 0)
df <- data.frame(k, pDistriData, realData, LGPData)

g <- ggplot(df, aes(k)) +
  geom_point(aes(y = realData), colour = "green") +  # first layer
  geom_line(aes(y = pDistriData), colour = "red") + # second layer
  geom_line(aes(y = LGPData), colour = "yellow") # third layer
g <- g + ylab("Probability") + xlab("Number of Arthropods") 
g