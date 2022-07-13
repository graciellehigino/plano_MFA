library(timevis)

data <- data.frame(
 read.csv("data.csv", header = TRUE)
)

# timevis(data)

# # timevisDataGroups <- data.frame( 
#   id = levels(as.factor(data$group)),
#   content = levels(as.factor(data$group))
# )