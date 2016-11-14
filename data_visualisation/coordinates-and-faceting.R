library(ggplot2)

pl <- ggplot(mpg, aes(x=displ, y=hwy)) + geom_point()

pl2 <- pl + coord_cartesian(xlim=c(1,4), ylim=c(20,50))

pl3 <- pl + coord_fixed(ratio = 1/3)

pl4 <- pl + facet_grid(. ~ cyl)

print(pl4)
