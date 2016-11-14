library(ggplot2)

df <- mtcars

pl <- ggplot(df, aes(x=factor(cyl),y=mpg))

pl <- pl + geom_boxplot(aes(fill=factor(cyl))) + coord_flip() + theme_dark()

print(pl)