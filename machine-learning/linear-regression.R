# linear regression = lm   (linear model)
# install.packages('corrgram')
# install.packages('corrplot')
# install.packages("caTools")

library(ggplot2)
library(ggthemes)
library(dplyr)
library(corrgram)
library(corrplot)
library(caTools)

# PART 1

df <- read.csv('student-mat.csv',sep=';')
any(is.na(df))  # FALSE

# select numeric only
numCols <- sapply(df, is.numeric)

# create correlation matrix
corData <- cor(df[,numCols])

# plot
# print(corrplot(corData), method='color')

# re-order
corrgram(df,order=TRUE, lower.panel=panel.shade,
         upper.panel=panel.pie, text.panel=panel.txt)

pl1 <- ggplot(df,aes(x=G3)) + geom_histogram(bins=20, alpha=0.5, fill='blue')

print(pl1)

# PART 2

# the following lines of code are used for sampling data for test/training using caTools

set.seed(101)  # ensures same random variables as tutorial

# split up data to split into training and test data
sample <- sample.split(df$G3, SplitRatio = 0.7)

# 70% of data split for training
train <- subset(df, sample == TRUE)

# 30% of data split for testing
test <- subset(df, sample == FALSE)

# train and build model
model <- lm(G3 ~ ., train)

# interpred the model
print(summary(model))

res <- residuals(model)
class(res)  # numeric
res <- as.data.frame(res)
print(head(res))

pl2 <- ggplot(res,aes(res)) + geom_histogram(fill='blue', alpha=0.5)
print(pl2)

# PART 3

# predictions
G3predictions <- predict(model,test)

results <- cbind(G3predictions, test$G3)
colnames(results) <- c('predicted','actual')
results <- as.data.frame(results)
print(head(results))

# remove negative predictions (function)
to_zero <- function(x) {
  if (x < 0) {
    return(0)
  } else {
    return(x)
  }
}

# apply zero function
results$predicted <- sapply(results$predicted, to_zero)

# mean squared error
mse <- mean((results$actual - results$predicted)^2)
print('mse')
print(mse)

# root mean squared error
print('rmse')
print(mse^0.5)

# sum of squared error / sum of square total
SSE <- sum((results$predicted - results$actual)^2)
SST <- sum((mean(df$G3) - results$actual)^2)

R2 <- 1 - SSE/SST
print('R2')
print(R2)


