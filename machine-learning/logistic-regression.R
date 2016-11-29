# install.packages('Amelia')

library(Amelia)
library(ggplot2)
library(dplyr)
library(caTools)

trainingSet <- read.csv('titanic_train.csv')
print(head(trainingSet))
print('')
print(str(trainingSet))

# visualisations

missmap(trainingSet, main = 'Missing Map', col = c('yellow', 'black'), legend = FALSE)

pl1 <- ggplot(trainingSet, aes(Survived)) + geom_bar()
print(pl1)

pl2 <- ggplot(trainingSet, aes(Pclass)) + geom_bar(aes(fill=factor(Pclass)))
print(pl2)

pl3 <- ggplot(trainingSet, aes(Sex)) + geom_bar(aes(fill=factor(Sex)))
print(pl3)

pl4 <- ggplot(trainingSet, aes(Age)) + geom_histogram(bins=20, alpha=0.7, fill='blue')
print(pl4)

pl5 <- ggplot(trainingSet, aes(SibSp)) + geom_bar()
print(pl5)

pl6 <- ggplot(trainingSet, aes(Fare)) + geom_histogram(fill='green', colour='black', alpha=0.5)
print(pl6)

# fill in data

pl <- ggplot(trainingSet, aes(Pclass,Age)) + geom_boxplot(aes(group=Pclass,fill=factor(Pclass),alpha=0.5))
pl + scale_y_continuous(breaks=seq(min(0),max(80),by=2))
print(pl)


impute_age <- function(age,class){
  out <- age
  for (i in 1:length(age)){
    
    if (is.na(age[i])){
      
      if (class[i] == 1){
        out[i] <- 37
        
      }else if (class[i] == 2){
        out[i] <- 29
        
      }else{
        out[i] <- 24
      }
    }else{
      out[i]<-age[i]
    }
  }
  return(out)
}

fixedAges <- impute_age(trainingSet$Age, trainingSet$Pclass)

trainingSet$Age <- fixedAges

missmap(trainingSet, main = 'Imputation check', col = c('yellow','black'), legend = FALSE)

# remove features

trainingSet <- select(trainingSet, -Name, -PassengerId, -Ticket, -Cabin)
trainingSet$Survived <- factor(trainingSet$Survived)
trainingSet$Pclass <- factor(trainingSet$Pclass)
trainingSet$Parch <- factor(trainingSet$Parch)
trainingSet$SibSp <- factor(trainingSet$SibSp)

# train the model
# generalised linear model
logModel <- glm(Survived ~ ., family=binomial(link='logit'), data=trainingSet)
print(summary(logModel))

# set seed
set.seed(101)

split <- sample.split(trainingSet$Survived, SplitRatio = 0.7)
finalTrain <- subset(trainingSet, split == TRUE)
finalTest <- subset(trainingSet, split == FALSE)
finalLogModel <- glm(Survived ~ ., family = binomial(link='logit'), data = finalTrain)
print(summary(finalLogModel))

# predict

fittedProbabilities <- predict(finalLogModel, finalTest, type = 'response')
fittedResults <- ifelse(fittedProbabilities>0.5,1,0)
misClassError <- mean(fittedResults != finalTest$Survived)
print(1 - misClassError)

# confusion matrix
print(table(finalTest$Survived, fittedProbabilities>0.5))









