setwd("/Users/nicholeyang/Desktop/UChicago/Bootcamp/BSD-QBio5-master/tutorials/reproducibility/data")
dt = read.csv("cole_arthropod_data_1946.csv")


# emprical prob
prob = dt$C_count_of_boards_with_k_spiders/sum(dt$C_count_of_boards_with_k_spiders)
spider_mean = sum(dt$k_number_of_arthropods * dt$C_count_of_boards_with_k_spiders)/sum(dt$C_count_of_boards_with_k_spiders)

## theoretical probability 
x = c(0:17)
y = dpois(dt$k_number_of_arthropods, lambda = spider_mean)

plot(dt$k_number_of_arthropods, prob, xlab = "number of arthropods", ylab = "probability", main = 'Theoretical vs. Emprical')
lines(x,y)

