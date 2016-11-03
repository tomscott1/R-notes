empty <- data.frame()
c1 <- 1:10
c2 <- letters[c1]
df <- data.frame(col.name.1 = c1, col.name.2 = c2)

# import / export .csv

write_csv(df, file = 'saved.csv')
df2 <- read_csv('saved.csv')

# get info on DF

nrow(df)  # number of rows in dataframe
ncol(df)  # number of cols in dataframe
colnames(df)
rownames(df)
str(df)
summary(df)

# referencing cells

df[[5,2]]  # absolute
df[[5,'col.name.2']]  # using col name
df[[2,'col.name.1']] <- 999  # assign value to cell

# referencing rows

df[1,]  # return df of row 1

# referencing columns

df[, 1]  # return vector of column 1
df$col.name.1  # return vector of column name
df[, 'col.name.1']  # return vector of column name
df[['col.name.1']]  # return vector of column name

df['col.name.1']  # return df of column name
df[1]  # return df of column 1

df[c('col.name.1','col.name.2')]  #return df of column names in order of vector

# adding rows and columns

df2 <- data.frame(col.name.1 = 2000, col.name.2 = 'new')  # new row values
dfnew <- rbind(df,df2)  # added to old df

df$newcol <- 2 * df$col.name.1  # add new column with assignment
df$newcol.copy <- df$newcol  # copy an existing column
df[, 'newcol.copy.2'] <- df$newcol

# setting column names

colnames(df)  # return column names
colnames(df) <- c(1,2,3,4,5)  # rename all columns using a vector
colnames(df)[1] <- 'new col name'  # assign a name to a single column

# selecting multiple rows

df[1:10, ]  # select first 10 rows
head(df)  # returns first 6 rows by default, head(df, 7) = first 7 rows
df[-2, ]  # select everything but row 2

mtcars[mtcars$mpg > 20, ]  # select rows conditionally
mtcars[mtcars$mpg > 20 & mtcars$cyl == 6, ]  # select rows on multiple conditions
mtcars[mtcars$mpg > 20 & mtcars$cyl == 6, c('mpg','cyl', 'hp')]  # select multiple rows on conditions and return only certain columns

subset(mtcars, mpg > 20 & cyl == 6)  # subset syntax of above multiple conditions

# selecting multiple columns

mtcars[, c(1,2,3)]  # returns first 3 columns
mtcars[, c('mpg','cyl')]  # returns columns based on vector names

# missing data

is.na(mtcars)  # returns dframe of boolean values, T if na
any(is.na(df))  # returns T if any na
any(is.na(mtcars$mpg))  # check a single column(vector)
df[is.na(df)] <- 0  # replace all na wih '0' (fillna in python)
mtcars$mpg[is.na(mtcars$mpg)] <- mean(mtcars$mpg)  # fill na with mean of column






















