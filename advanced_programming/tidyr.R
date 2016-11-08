# install.packages('tidyr')
# install.packages('data.table')

library(tidyr)
library(data.table)

# create example data

comp <- c(1,1,1,2,2,2,3,3,3)
yr <- c(1998,1999,2000,1998,1999,2000,1998,1999,2000)
q1 <- runif(9, min=0, max=100)
q2 <- runif(9, min=0, max=100)
q3 <- runif(9, min=0, max=100)
q4 <- runif(9, min=0, max=100)

df <- data.frame(comp=comp,year=yr,Qtr1 = q1,Qtr2 = q2,Qtr3 = q3,Qtr4 = q4)
print(df)

# gather

result <- gather(df, Quarter, Revenue, Qtr1:Qtr4)
print(result)

result <- df %>% gather(Quarter, Revenue, Qtr1:Qtr4)  # using pipe
print(result)

# spread

stocks <- data.frame(
  time = as.Date('2009-01-01') + 0:9,
  X = rnorm(10, 0, 1),
  Y = rnorm(10, 0, 2),
  Z = rnorm(10, 0, 4)
)

stocksGathered <- stocks %>% gather(stock, price, X:Z)
print(head(stocksGathered))

result <- stocksGathered %>% spread(stock, price)
print(head(result))

# separate

df <- data.frame(new_col=c(NA, "a.x", "b.y", "c.z"))
result <- separate(df, new_col, c('ABC', 'XYZ'))
print(result)

# unite

result <- unite(result, newJoinedCol, ABC, XYZ, sep='---')
print(result)






