# Import the ggplot2 data.table libraries and use fread to load the csv file
# 'Economist_Assignment_Data.csv' into a dataframe called df (Hint: use drop=1
# to skip the first column)

df <- read.csv('Economist_assignment_Data.csv')
# print(df)

# Use ggplot() + geom_point() to create a scatter plot object called pl. You
# will need to specify x=CPI and y=HDI and color=Region as aesthetics

pl <- ggplot(df, aes(x=CPI, y=HDI)) + geom_point(aes(color=Region), shape=21,
                                                 size=3, stroke=1)

# Add geom_smooth(aes(group=1)) to add a trend line
# We want to further edit this trend line. Add the following arguments to
# geom_smooth (outside of aes):
# method = 'lm'
# formula = y ~ log(x)
# se = FALSE
# color = 'red'

pl2 <- pl + geom_smooth(aes(group=1), method ='lm', formula= y ~ log(x),
                        se=FALSE, color='red')

# It's really starting to look similar! But we still need to add labels, we can
# use geom_text! Add geom_text(aes(label=Country)) to pl2 and see what happens.
# (Hint: It should be way too many labels)

# Labeling a subset is actually pretty tricky! So we're just going to give you
# the answer since it would require manually selecting the subset of countries
# we want to label!

pointsToLabel <- c("Russia", "Venezuela", "Iraq", "Myanmar", "Sudan",
                   "Afghanistan", "Congo", "Greece", "Argentina", "Brazil",
                   "India", "Italy", "China", "South Africa", "Spane",
                   "Botswana", "Cape Verde", "Bhutan", "Rwanda", "France",
                   "United States", "Germany", "Britain", "Barbados", "Norway",
                   "Japan", "New Zealand", "Singapore")

pl3 <- pl2 + geom_text(aes(label = Country), color = "gray20", 
            data = subset(df, Country %in% pointsToLabel),check_overlap = TRUE)

# Almost there! Still not perfect, but good enough for this assignment. Later
# on we'll see why interactive plots are better for labeling. Now let's just
# add some labels and a theme, set the x and y scales and we're done!
# Add theme_bw() to your plot and save this to pl4

pl4 <- pl3 + theme_bw()

# Add scale_x_continuous() and set the following arguments:
# name = Same x axis as the Economist Plot
# limits = Pass a vector of appropriate x limits
# breaks = 1:10

pl4 <- pl4 + scale_x_continuous(name = 'Corruption Perceptions Index, 2011 
                            (10=least corrrupt)', limits= c(1,10), breaks=1:10)

# Now use scale_y_continuous to do similar operations to the y axis!

pl4 <- pl4 + scale_y_continuous(name ='Human Development Index, 2011 (1=best)',
                          limits=c(0.2,1.0), breaks=seq(from=0.2,to=1,by=0.1))


# Finally use ggtitle() to add a string as a title.

pl4 <- pl4 + ggtitle('Corruption and Human Development')

print(pl4)




