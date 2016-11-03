# sequences

seq(0,10,by=2)  # 0-10 by 2: 0, 2, 4, 6, 8, 10
seq(0,100,by=10)

# sort

v <- c(1,4,7,8,3,5,9)
sort(v, decreasing = TRUE)

# reverse

rev(1:10)  # reverses the object

# str (structure) - show the structure of the object

str(mtcars)

# append

v <- 1:10
v2 <- 11:20

append(v,v2)

# check/convert data types

is.vector(c(1,2,3))  # check is.XXX

v <- c(1,2,3)

as.list(v)  # converts to list
as.matrix(v)  # converts to matrix













