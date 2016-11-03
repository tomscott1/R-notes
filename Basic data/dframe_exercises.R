# Ex 1: Recreate the following dataframe by creating vectors and using the
# data.frame function:
# Age	Weight	Sex
# Sam	22	150	M
# Frank	25	165	M
# Amy	26	120	F

Age <- c(22, 25, 26)
Weight <- c(150, 165, 120)
Sex <- c('M', 'M', 'F')
names <- c('Sam', 'Frank', 'Amy')

df <- data.frame(Age, Weight, Sex)
row.names(df) <- names
print(df)

# Ex 2: Check if mtcars is a dataframe using is.data.frame()

print(is.data.frame(mtcars))

# Ex 3: Use as.data.frame() to convert a matrix into a dataframe:

mat <- matrix(1:25, nrow=5)
df <- as.data.frame(mat)
print(df)

# Ex 4: Set the built-in data frame mtcars as a variable df. We'll use this df
# variable for the rest of the exercises.

df <- mtcars

# Ex 5: Display the first 6 rows of df

print(head(df))

# Ex 6: What is the average mpg value for all the cars?

print(mean(mtcars$mpg))

# Ex 7: Select the rows where all cars have 6 cylinders (cyl column)

print(df[df$cyl == 6, ])

# Ex 8: Select the columns am,gear, and carb.

print(df[, c('am', 'gear', 'carb')])

# Ex 9: Create a new column called performance, which is calculated by hp/wt.

df$performance <- df$hp / df$wt
print(head(df))

# Ex 10: Your performance column will have several decimal place precision.
# Figure out how to use round() (check help(round)) to reduce this accuracy to
# only 2 decimal places.

df$performance <- round(df$hp / df$wt, digits=2)
print(head(df))

# Ex 10: What is the average mpg for cars that have more than 100 hp AND a wt
# value of more than 2.5

df2 <- df[df$hp > 100 & df$wt > 2.5, ]
print(mean(df2$mpg))

# better way using subset

print(mean(subset(df,hp > 100 & wt > 2.5)$mpg))

# Ex 11: What is the mpg of the Hornet Sportabout?

print(df['Hornet Sportabout', 'mpg'])

