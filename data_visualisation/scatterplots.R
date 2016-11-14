library(ggplot2)
df <- mtcars

# data 

pl <- ggplot(df, aes(x=wt,y=mpg))

# geometry and aesthetics layer

pl2 <- pl + geom_point(aes(size=hp, shape=factor(cyl), colour=hp), alpha=0.7)

pl3 <- pl2 + scale_color_gradient(low='#90C3D4', high='red')

print(pl3)