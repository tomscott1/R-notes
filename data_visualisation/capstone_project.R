library(ggplot2)

batting <- read.csv('Batting.csv')
salaries <- read.csv('Salaries.csv')

# calculate batting average

batting$BA <- batting$H / batting$AB

# calculate on base percentage

batting$OBP <- (batting$H + batting$BB + batting$HBP) / (batting$AB + batting$BB + batting$HBP + batting$SF)

# calculate slugging percentage

batting$X1B <- batting$H - (batting$X2B + batting$X3B + batting$HR)
batting$SLG <- (batting$X1B + (2 * batting$X2B) + (3 * batting$X3B) +
                  (4 * batting$HR)) / batting$AB

# subset batting data to start from 1985

batting <- subset(batting, batting$yearID > 1984)

# join data

combo <- merge(batting, salaries, by=c("playerID","yearID"))

# get lost players subset

lostPlayers <- subset(combo, combo$playerID %in% c("damonjo01", "giambja01", "saenzol01"))
lostPlayers <- subset(lostPlayers, lostPlayers$yearID == 2001)
keepColumns <- c('playerID','H','X2B','X3B','HR','OBP','SLG','BA','AB','salary')
lostPlayers <- lostPlayers[keepColumns]

# get combo subset of 2001

roster2001 <- subset(combo, combo$yearID == 2001)
roster2001 <- roster2001[keepColumns]

# targets mean OBP: 0.3639, total AB: 1469, combined salary: < $15,000,000

# create subset to reduce noise
roster2001 <- subset(roster2001, roster2001$AB > 350)
roster2001 <- subset(roster2001, roster2001$OBP > 0.3)
roster2001 <- subset(roster2001, roster2001$salary < 6000000)

# plots

pl1 <- ggplot(roster2001, aes(AB, OBP)) + geom_point(aes(colour=salary,label=playerID))

gpl <- ggplotly(pl1)

print(gpl)

# berkmla01, nevinph01, mientdo01


# get new players

newPlayers <- subset(roster2001, roster2001$playerID %in% c("berkmla01", "pujolal01", "mientdo01"))

print(c('Total salary: ', sum(newPlayers$salary), ', Total AB: ', sum(newPlayers$AB), ', Mean OBP: ', mean(newPlayers$OBP)))


