# #a = 1
# #a *2
# 
# m <- matrix(nrow = 2, ncol = 2)
# m
# 
# 
# speed_vector <- c("medium", "slow", "slow", "medium", "fast")
# 
# # Convert speed_vector to ordered factor vector
# factor_speed_vector <- factor(speed_vector, ordered = TRUE, levels = c("slow", "medium", "fast"))
# 
# # Print factor_speed_vector
# factor_speed_vector
# summary(factor_speed_vector)


# rv <- 1:20
# mtrx <- matrix(rv, nrow = 5, ncol = 4)
# mtrx
# cat("Using head() function to get first 3 rows", "\n")
# head(mtrx,3)


data <- data.frame(x1 = c(7,2,1, NA, 9),
                   x2 = c(1,3,1, 9, NA),
                   x3 = c(NA, 8, 8, NA, 5))
data

complete.cases(data)

data_complete <- data[complete.cases(data),]
data_complete


set.seed(10101)
vec <- round(runif(20, 0, 10))
vec
vec[rbinom(20,1,0.2) == 1]<- NA
