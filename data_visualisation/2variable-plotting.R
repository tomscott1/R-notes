library(ggplot2)
library(ggplot2movies)

pl <- ggplot(movies, aes(x=year, y=rating))

# pl <- pl + geom_bin2d(binwidth=c(2,0.5)) + scale_fill_gradient(high = 'pink', low='black')


# hexplot

pl2 <- pl + geom_hex()



# density plot

pl3 <- pl + geom_density2d()

print(pl3)