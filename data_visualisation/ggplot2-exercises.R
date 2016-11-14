# For the first few plots, use the mpg dataset

library(ggplot2)
library(ggthemes)
print(head(mpg))

# Histogram of hwy mpg values:

hist <- ggplot(mpg, aes(x=hwy)) + geom_histogram(binwidth=1.5, colour='pink',
                                                 fill='pink')
# print(hist)

# Barplot of car counts per manufacturer with color fill defined by cyl count

bar <- ggplot(mpg, aes(x=manufacturer)) + geom_bar(aes(fill=factor(cyl)))
# print(bar)

# Switch now to use the txhousing dataset that comes with ggplot2
# Create a scatterplot of volume versus sales. Afterwards play around with
# alpha and color arguments to clarify information.

scatter <- ggplot(txhousing, aes(x=sales,y=volume)) +
  geom_point(aes(colour=volume), alpha=0.6) +
  scale_color_gradient(low='dark red', high='dark grey')

# Add a smooth fit line to the scatterplot from above. Hint: You may need to
# look up geom_smooth()

scatter <- scatter + geom_smooth()
print(scatter)

