#load libraries
library(ez)

# sanity check with correct answers (corresponds to Table 2 in the original paper)
correct <- read.table("correct.txt", head = T)
correct_long <- data.frame(position = c(1:36),
                           prior_n = rep(1:4, each = 9),
                           proportion = unlist(correct[, 2:5]))
correct_long$prior_n <- factor(correct_long$prior_n)
ezANOVA(data = correct_long, wid = position, dv = proportion, between = prior_n, type = 3)



# results for effect of prior occurance for errors
error <- read.table("error.txt", head = T, sep = "\t")
error_long <- data.frame(transposition = c(1:64),
                         prior_n = rep(1:4, each = 16),
                         proportion = unlist(error[, 2:5]))
error_long <- error_long[c(1:48, 50:64), ]
error_long$prior_n <- factor(error_long$prior_n)
ezANOVA(data = error_long, wid = transposition, dv = proportion, between = prior_n, type = 3)