# DPLYR

# install.packages('dplyr')
# install.packages('nycflights13')

library(dplyr)
library(nycflights13)

# filter (for dplyr)

print(head(filter(flights, month==11, day==3, carrier=='AA')))  # easier than
# using subset or bracket notation

# slice

print(slice(flights, 1:10))

# arrange

print(head(arrange(flights, year, month, day, desc(arr_time))))

# select

print(head(select(flights, carrier)))
print(head(select(flights, carrier, arr_time)))  # add columns as needed

# rename

print(head(rename(flights, airline_carrier = carrier)))  # changes column name

# distinct

print(distinct(flights, carrier))  # select unique list from a column

# mutate

print(head(mutate(flights, new_col = arr_delay - dep_delay))) # create new column
# as a function of 2 existing columns

# transmute

print(head(transmute(flights, new_col = arr_delay - dep_delay)))  # just returns
# newly created column

# summarise (group by)

print(summarise(flights, avg_air_time = mean(air_time, na.rm = TRUE)))
# na.rm is a part of the mean function not summarise

print(summarise(flights, total_time = sum(air_time, na.rm = TRUE)))

# sample_n & sample_frac

print(sample_n(flights, 5))  # returns 5 random rows
print(sample_frac(flights, 0.1))  # returns 10% of rows






