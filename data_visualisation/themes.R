library(ggplot2)
library(ggthemes)

# theme_set(theme_minimal())

pl <- ggplot(mtcars, aes(x=wt, y=mpg))

pl1 <- pl + geom_point()

pl2 <- pl1 + theme_pander()

print(pl2)

# install.packages('ggthemes')