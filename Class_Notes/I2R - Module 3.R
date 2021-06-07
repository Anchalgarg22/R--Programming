###===================================================================================================###
###                                    INTRODUCTION TO R                                          ###
###                                        MODULE 3                                                  ###
###                                 [DESCRIPTIVE ANALYTICS]                                           ###                
###===================================================================================================###
#1. SUMMARIES AND STATISTICS
#=======================================================================================================

setwd("C:\\Praxis\\Dataset")
cars <- read.csv("cars.csv")

#A. The summary() function
summary(cars$MPG) #numerical variable gives 6 row summary
summary(cars$Origin) #categorical variable, gives frequency count
summary(cars)


#B. The by() / tapply() function
?by
by(cars$Weight, cars$Origin, FUN=mean)
by(cars$Weight, cars$Origin, FUN=median)
by(cars$Weight, cars$Origin, FUN=sd)
by(cars$Weight, cars$Origin, FUN=summary)

?tapply
tapply(cars$Weight, cars$Origin, FUN=mean)

xyz = tapply(cars$Weight, cars$Origin, FUN=mean)
class(xyz)
xyz[2]

#=======================================================================================================
#2. TABLES
#=======================================================================================================
table(cars$Origin)  #It gives us frequency distribution
table(cars$Cylinders)
table(cars$Origin, cars$Cylinders)

#Table of proportions
prop.table(table(cars$Origin))

#Table of percentage - rounded to 2 decimal places
round(prop.table(table(cars$Origin))*100, 2)

#Table of Joint probability
round(prop.table(table(cars$Origin, cars$Cylinders)), 4)

#Table of Conditional probability (conditioned on rows)
round(prop.table(table(cars$Origin, cars$Cylinders),1), 4)
#90.4% cars have 4 cylinders given that the origin was Europe(w.r.t to origin(rows))

#Table of conditional probability (conditioned in columns)
round(prop.table(table(cars$Origin, cars$Cylinders),2), 4)
#31% cars in Europe given that they have 4 cylinders (w.r.t to cylinders(cols))

#=======================================================================================================
#3. HISTOGRAMS
#=======================================================================================================
hist(cars$MPG)

hist(cars$MPG, xlab ='Miles per Gallon', ylab ='No. Of Cars', 
     main = 'Histogram of MPG')

hist(cars$MPG, xlab ='Miles per Gallon', ylab ='No. Of Cars', 
     main = 'Histogram of MPG', col = 'orange', border = F)

?hist
#=======================================================================================================
#4. BOXPLOTS
#=======================================================================================================
boxplot(cars$MPG)
boxplot(cars$MPG, horizontal = TRUE, col = 'Blue')
?boxplot

#=======================================================================================================
#5. BAR CHARTS
#=======================================================================================================

barplot(table(cars$Cylinders))

barplot(prop.table(table(cars$Cylinders))) #bar chart of table of proportions
?barplot

#=======================================================================================================
#6. SCATTERPLOTS AND PAIRWISE SCATTERPLOTS
#=======================================================================================================

plot(cars$Weight, cars$MPG, pch = 20)  #change pch-> for different shapes
plot(cars$Weight, cars$MPG, pch = 1)

plot(subset(cars, select = MPG:Horsepower)) #pairwise plot

?plot

