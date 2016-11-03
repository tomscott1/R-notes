# Example: Write a script that prints "Hello" if the variable x is equal to 1:

x <- 1

if (x == 1) {
  print('Hello')
}

# Ex 1: Write a script that will print "Even Number" if the variable x is an
# even number, otherwise print "Not Even":

if (x %% 2 == 0) {
  print('Even')
} else {  
    print('Odd')
}

# Ex 2: Write a script that will print 'Is a Matrix' if the variable x is a
# matrix, otherwise print "Not a Matrix". Hint: You may want to check out
# help(is.matrix)

if (is.matrix(x)) {
  print('Is a matrix')
} else {
  print('Not a matrix')
}

# Ex 3: Create a script that given a numeric vector x with a length 3, will
# print out the elements in order from high to low. You must use if,else if,
# and else statements for your logic. (This code will be relatively long)

x <- c(3,7,1)

if (x[1] < x[2] & x[2]< x[3]) {
  print(x)
} else if (x[1] > x[2] & x[1]< x[3]) {
  print(x[2] + x[1] + x[3])
} else {
  print(x)
}

# not really bothered to finish this code since it is for learning how to do something the wrong way

# Ex 4: Write a script that uses if,else if, and else statements to print the
# max element in a numeric vector with 3 elements.

x <- c(20,10,1)

if (max(x) == x[1]) {
  print(x[1])
} else if (max(x) == x[2]) {
  print(x[2])
} else {
  print(x[3])
}





