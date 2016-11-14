library(ggplot2)

df <- mpg

pl <- ggplot(df, aes(x=class))

pl <- pl + geom_bar(aes(fill=drv), position="fill")

print(pl)