# logical operators

# & - AND
# | - OR
# ! - NOT
  
# syntax
  
x <- 10

# AND

x < 20 & x > 5  # TRUE
(x < 20) & (x > 5)  # TRUE
(x < 20) & (x > 5) & (x == 10)  # TRUE
(x < 20) & (x > 5) & (x == 9)  # FALSE
TRUE & TRUE  # TRUE
TRUE & FALSE  # FALSE

# OR

x == 100  # FALSE
(x == 10) | (x == 100)  # TRUE
x == 100 | x == 1000  # FALSE

# NOT

(10 == 1)  # FALSE
!(10 == 1)  #TRUE
!!(10 == 1)  # FALSE ( this is pointless but it works)

# comparisons

df <- mtcars
df[df$mpg > 20, ]
subset(df, mpg > 20)  # same as above line

# combined with logical operators

df[ df$mpg > 20 & df$hp > 100, ]
df[(df$mpg > 20) | (df$hp >100), ]

# if else and elsif statements

if (x == 10) {
  # code
  print('x is equal to 10')
} else if (x == 12) {
  print('x is equal to 12')
} else {
  print('x was not equal to 10 or 12')
}























