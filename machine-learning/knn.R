# install.packages("ISLR")
library(ISLR)

print(str(Caravan))

print(summary(Caravan$Purchase))

# check for NAs and remove
ifelse(any(is.na(Caravan)),Caravan[complete.cases(Caravan),],print("No NA values"))

# save purchase column
purchase <- Caravan[,86]
  
# standardise X variables (except for Purchase)
stdCaravan <- scale(Caravan[,-86])

print(var(stdCaravan[,1]))  # 1
print(var(stdCaravan[,2]))  # 1

# train test split (choose first 1000 rows)
testIndex <- 1:1000
testData <- stdCaravan[testIndex,]
testPurchase <- purchase[testIndex]
trainingData <- stdCaravan[-testIndex,]
trainingPurchase <- pruchase[-testIndex]

# KNN Model





