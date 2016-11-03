# grepl - returns logical
# grep - returns index

text <- 'Hi there, do you know who you are voting for?'

grepl('voting', text)  # TRUE
grepl('dog', text)  # FALSE
grepl('do you', text)  # TRUE

v <- c('a','b','c','d','d')

grepl('b', v)  # F T F F F
grep('b', v)  # 2
grep('d', v)  # 4 5

