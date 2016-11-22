# linear regression project

library(ggplot2)
library(ggthemes)
library(dplyr)
library(corrgram)
library(corrplot)
library(caTools)
library(lubridate)

bike <- read.csv('bikeshare.csv')

# scatter plot of count vs temp

# pl1 <- ggplot(bike, aes(temp, count)) + geom_point(alpha=0.5, aes(colour=temp))

# Plot count versus datetime as a scatterplot with a color gradient based on
# temperature.

# convert datetime to posixct
bike$date <- as.POSIXct(bike$datetime)
# pl2 <- ggplot(bike, aes(date, count)) + geom_point(aes(colour=temp)) + scale_color_gradient(low='light blue', high='red')

# get subset of temp and count
bikeSub <- bike[c('temp','count')]

# create correlation between temp and count
corData <- cor(bikeSub[,1:2])

print(corData)

# seasonal data exploration
pl3 <- ggplot(bike, aes(factor(season),count)) +
  geom_boxplot(aes(color=factor(season)))
              
# extract hour from timestamp
bike$hour <- hour(bike$datetime)
bike$hour <- sapply(bike$hour, as.numeric)

bikeWorkDay <- subset(bike, workingday == 1)
bikeNonWorkDay <- subset(bike, workingday == 0)

# scatterplot count v hour colour scale of temp

pl4 <- ggplot(bikeWorkDay, aes(hour,count)) + geom_point(aes(color=temp),
  position=position_jitter(w=0.3, h=0)) +
  scale_color_gradientn(colours=c('dark blue','#8cf442','yellow','red'))

print(pl4)

pl5 <- ggplot(bikeNonWorkDay, aes(hour,count)) + geom_point(aes(color=temp),
  position=position_jitter(w=0.3, h=0)) +
  scale_color_gradientn(colours=c('dark blue','#8cf442','yellow','red'))

print(pl5)

# create a model to predict count based on temp

tempModel <- lm(count ~ temp, bike)

print(summary(tempModel))

# predict count based on temp = 25

y = 6.0462 + (9.17 * 25)  # (Base intercept + temp std. * temp)
print(y)

tempTest <- data.frame(temp=c(25))
result <- predict(tempModel, tempTest)
print(result)

# model based on more variables (p)

model <- lm(count ~ . -casual -registered -datetime -date -atemp, bike)
print(summary(model))

