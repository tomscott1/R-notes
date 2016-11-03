# while loops

while (condition) {
  # code
  if (another condition) {
    break
  }
}

# for loops

v <- c(1,2,3)

for (x in v) {
  print(x)
}

for (row in 1:nrow(mat)) {
  # do something for each matrix row
}

# functions

nameOfFunction <- function(input1, input2 = 'default') {
  # code execute
  return(TRUE)
}

