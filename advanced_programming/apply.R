# APPLY

sample(x = 1:10, 1)  # sample from vector
sample(x =1:100, 3)

v <- 1:5

addrand <- function(x) {
  ran <- sample(1:100,1)
  return(x + ran)
}

print(addrand(10))

lapply(v,addrand)  # returns list

result <- sapply(v,addrand)  # returns vector
print(result)

v <- sample(1:100,5)

times2 <- function(n) {
  return(n*2)
}

result <- sapply(v,times2)
print(result)

# ANONYMOUS FUNCTION

v <- 1:5

result <- sapply(v,function(num) {num*5})
print(result)

# apply with multiple inputs

add_choice <- function(num,choice) {
  return(num+choice)
}

print(add_choice(2,10))

sapply(v,add_choice,50)  # entering additional arguments as required
