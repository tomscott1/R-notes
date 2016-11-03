library(dplyr)

# We will use the mtcars dataframe for this exercise!

df <- mtcars

# Return rows of cars that have an mpg value greater than 20 and 6 cylinders.

result <- filter(df, mpg >20, cyl==6)
print(result)


# Reorder the Data Frame by cyl first, then by descending wt.

result <- arrange(df, cyl, desc(wt))
print(result)

# Select the columns mpg and hp

result <- select(df, mpg, hp)
print(result)

# Select the distinct values of the gear column.

result <- distinct(df, gear)
print(result)

# Create a new column called "Performance" which is calculated by hp divided
# by wt.

result <- mutate(df, performance = hp/wt)
print(result)

# Find the mean mpg value using dplyr.

result <- summarise(df, avg_mpg = mean(mpg, na.rm=TRUE))
print(result)

# Use pipe operators to get the mean hp value for cars with 6 cylinders.

result <- df %>% filter(cyl == 6) %>% summarise(avg_hp = mean(hp))
print(result)





