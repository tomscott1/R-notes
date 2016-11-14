# install.packages('ggplot2')
# install.packages('ggplot2movies')

library(ggplot2)
library(ggplot2movies)

# data layer & aesthetics layer
pl <- ggplot(movies, aes(x=rating))

# geometry

pl2 <- pl + geom_histogram(binwidth = 0.5, colour='navy', fill='light blue', alpha=1)

# labels

pl3 <- pl2 + xlab('Movie rating') + ylab ('Count')

# title

pl4 <- pl3 + ggtitle("Movie rating histogram")

pl5 <- pl4 + geom_histogram(binwidth=0.1, aes(fill=..count..))

print(pl5)