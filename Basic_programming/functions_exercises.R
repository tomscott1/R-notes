# EXAMPLE 1: Create a function that takes in a name as a string argument,
# and prints out "Hello name"

greet <- function(name) {
  print(paste('Hello ', name))
}

greet('Bill')

# EXAMPLE 2: Create a function that takes in a name as a string argument and
# returns a string of the form - "Hello name"

greet2 <- function(name) {
  return(paste('Hello ', name))
}

greeting <- greet2('Bill')
print(greeting)

# Ex 1: Create a function that will return the product of two integers.

product <- function(a,b) {
  return(a*b)
}

print(product(3,4))

# Ex 2: Create a function that accepts two arguments, an integer and a vector
# of integers. It returns TRUE if the integer is present in the vector,
# otherwise it returns FALSE. Make sure you pay careful attention to your
# placement of the return(FALSE) line in your function!

isIntInVec <- function(int, vec) {
  for (x in vec) {
    if (x == int) {
      return(TRUE)
    } 
  }
  return(FALSE)
}

print(isIntInVec(2,c(1,2,3)))

# Ex 3: Create a function that accepts two arguments, an integer and a vector
# of integers. It returns the count of the number of occurences of the integer
# in the input vector.Ex 3: Create a function that accepts two arguments, an
# integer and a vector of integers. It returns the count of the number of
# occurences of the integer in the input vector.

num_count <- function(int, vec) {
  count = 0
  for (x in vec) {
    if (x == int) {
      count <- count + 1
    }
  }
  return(count)
}

print(num_count(2,c(1,1,2,2,3,3)))

# Ex 4: We want to ship bars of aluminum. We will create a function that
# accepts an integer representing the requested kilograms of aluminum for the
#package to be shipped. To fullfill these order, we have small bars (1 kilogram
# each) and big bars (5 kilograms each). Return the least number of bars needed.

# For example, a load of 6 kg requires a minimum of two bars (1 5kg bars and 1
# 1kg bars). A load of 17 kg requires a minimum of 5 bars (3 5kg bars and 2 1kg
# bars).

min_bags <- function (kgs) {
  bigBags = (kgs - (kgs %% 5)) / 5
  smallBags = kgs %% 5
  return(bigBags + smallBags)
}

print(min_bags(6))
print(min_bags(17))

# Ex 5: Create a function that accepts 3 integer values and returns their sum.
# However, if an integer value is evenly divisible by 3, then it does not count
# towards the sum. Return zero if all numbers are evenly divisible by 3. Hint:
# You may want to use the append() function.

summer <- function(a,b,c) {
  
  a1 <- 0
  b1 <- 0
  c1 <- 0
  
  if(!(a %% 3 == 0)) {
    a1 <- a
  } 
  if(!(b %% 3 == 0)) {
    b1 <- b
  } 
  if(!(c %% 3 == 0)) {
    c1 <- c
  } 
  return(a1+b1+c1)
}

print(summer(7,2,3))
print(summer(3,6,9))
print(summer(9,11,12))

# Ex 6: Create a function that will return TRUE if an input integer is prime.
# Otherwise, return FALSE. You may want to look into the any() function.

prime_check <- function (val) {
  divisible_nums <- vector('numeric')
  for (x in 2:val) {
    if (val %% x == 0) {
      divisible_nums <- append(x, divisible_nums)
    }
  }
  
  for (x in divisible_nums) {
    if (!(x == val)) {
      return(FALSE)
    }
  }
  return(TRUE)
  print(timerval)
}

print(prime_check(2))
print(prime_check(5))
print(prime_check(4))
print(prime_check(237))
print(prime_check(131))
