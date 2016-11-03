goog <- c(450,451,452,445,468)
msft <- c(230,231,232,233,220)
stocks <- c(goog,msft)
stockMatrix <- matrix(stocks, nrow=2, byrow=T)

days <- c('Mon','Tue','Wed','Thu','Fri')
stNames <- c('GOOG','MSFT')

colnames(stockMatrix) <- days
rownames(stockMatrix) <- stNames

print(stockMatrix)