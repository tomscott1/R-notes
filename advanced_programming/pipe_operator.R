library(dplyr)

df <- mtcars

# nesting

result <- arrange(sample_n(filter(df, mpg > 20), 5),desc(mpg))
print(result)

# code is hard to read when nested

# multiple assignments

a <- filter(df, mpg>20)
b <- sample_n(a, size=5)
result <- arrange(b, desc(mpg))
print(result)

# inneficient and disgusting looking code

# pipe operator

result <- df %>% filter(mpg > 20) %>% sample_n(size=5) %>% arrange(desc(mpg))
print(result)

