# basic exercises

# 1 - What is two to the power of five?

print(2^5)

# 2 - Create a vector called stock.prices with the following data points: 23,27,23,21,34

stockPrices <- c(23,27,23,21,34)

# 3 - Assign names to the price data points relating to the day of the week, starting with Mon, Tue, Wed, etc...

days <- c('Mon','Tue','Wed','Thu','Fri')
names(stockPrices) <- days
print(stockPrices)

# 4 - What was the average (mean) stock price for the week? (You may need to reference a built-in function)

print(mean(stockPrices))

# 5 - Create a vector called over.23 consisting of logicals that correspond to the days where the stock price was more than $23

over23 <- c(stockPrices > 23)

# 6 - Use the over.23 vector to filter out the stock.prices vector and only return the day and prices where the price was over $23

print(stockPrices[over23])

# 7 - Use a built-in function to find the day the price was the highest

print(stockPrices[stockPrices == max(stockPrices)])
