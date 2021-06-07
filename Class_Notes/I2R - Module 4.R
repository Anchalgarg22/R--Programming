###===================================================================================================###
###                                      INTRODUCTION TO R                                           ###
###                                          MODULE 4                                           ###
###                                    [DATA MANIPULATION]                                            ###                
###===================================================================================================###
#1. The class() function
#=======================================================================================================

x <- 5.6
class(x)

b <- c(1,2,3)
class(b)

mtcars
class(mtcars)



#=======================================================================================================
#2. Class conversion
#=======================================================================================================

setwd("C:\\Praxis\\Dataset")
cars <- read.csv('cars.csv')

str(cars)
?str

class(cars$Horsepower)

#convert integer to numeric
cars$Horsepower <- as.numeric(cars$Horsepower)
class(cars$Horsepower)

cars$Model <- as.factor(cars$Model)
class(cars$Model)



#=======================================================================================================
#3. Sort & Order
#=======================================================================================================

#A. Sort the variable Acceleration in ascending order

cars$Acceleration
sort(cars$Acceleration) #by default it will sort in ascending order.

sort(cars$Acceleration, decreasing = T)

#sort for Dataframe
sort(cars) #this wont work, u need to specify col

#order gives index position of the elements
x <- c(4,15,78,10)
order(x) 

x[order(x)] #this will give a sorted list, ascending

#now sort the data, based on ascending order of acceleration
cars_acc <- cars[order(cars$Acceleration),]
View(cars_acc)

#for descending order "Use '-' to reverse the process"
cars_acc2 <- cars[order(-cars$Acceleration),]
View(cars_acc2)


#B. Sort the variable Weight in Descending Order

sort(cars$Weight, decreasing = T)


#C. Sort the data by MPG in increasing order

cars_acc3 <- cars[order(cars$MPG),]
View(cars_acc3)


#D. Sort the data by Origin in increasing order and then sort by MPG.

View(cars[order(cars$Origin, -cars$MPG), ])


#E. Sort the data by Cylinders and then by MPG

View(cars[order(cars$Cylinders, cars$MPG), ])


#F. Sort the data by MPG in ascending order and by cylinder in descending order

View(cars[order(cars$MPG, -cars$Cylinders), ])


#=======================================================================================================
#4. Data Transformation
#=======================================================================================================

# Plot a scatter plot between MPG and weight. Comment of the linearity.

plot(cars$Weight, cars$MPG) #it is a non linear relationship

cor(cars$Weight, cars$MPG) #correlation between weight and MPG


# Re-plot the scatter plot by taking the log transformation of both the variables. Does the linearity 
# Improve?
plot(log(cars$Weight), log(cars$MPG)) #now, it is linear than above plot.
cor(log(cars$Weight), log(cars$MPG))

#log(MPG) = a + b*log(Weight)
#log(MPG) -> MPG(take antilog)

# But there is a problem! Check the summary of log(MPG). What do you observe?

summary(log(cars$MPG))

#min-> -Infinity, therefore-> mean also -Infinity
#MPG value is zero for some points, that is why we get -Infinity when we did log transformation.


# Can you identify where we got misleaded? Probably the answer lies in the summary of MPG.

summary(cars$MPG)
log(0)

# How can we correct this?
summary(log(cars$MPG+1))  #we are shifting the scale
cor(log(cars$Weight), log(cars$MPG+1))

#remove or impute those zero points
cor(cars$Weight[cars$MPG!=0], cars$MPG[cars$MPG!=0])
cor(log(cars$Weight[cars$MPG!=0]), log(cars$MPG[cars$MPG!=0]))

#correlations has increased after log transformation from -0.831 to - 0.874

# Study the association between MPG and Horsepower.

plot(cars$MPG, cars$Horsepower)
cor(cars$MPG, cars$Horsepower)

plot(log(cars$MPG), log(cars$Horsepower))
cor(log(cars$MPG[cars$MPG!=0 & cars$Horsepower!=0]), log(cars$Horsepower[cars$MPG!=0 & cars$Horsepower!=0]))
#they are negatively correlated


#=======================================================================================================
#5. The ifelse() function
#=======================================================================================================

# PROBLEM 1:
# Create a variable HP which will take only two values:
# IF Horsepower < 100 THEN "Low HP"
# IF Horsepower >= 100 THEN "High HP"

View(cars)
cars$HP = NA #initializing a variable with null values

cars$HP = ifelse(cars$Horsepower < 100, "Low HP", "High HP")
View(cars)

?ifelse

#PROBLEM 2:
# Create a Variable MPG_Rate which will take on the values as follows:
# IF MPG < 15 THEN "Normal"
# IF MPG >= 15 AND MPG <=25 THEN "GOOD"
# IF MPG >= 25 AND MPG <=35 THEN "GREAT"
# IF MPG >= 35 THEN "AWESOME"

cars$MPG_Rate = NA
cars$MPG_Rate = ifelse(cars$MPG < 15, "Normal",
                       ifelse(cars$MPG <=25,"Good",
                              ifelse(cars$MPG <=35,"Great","Awesome")))
View(cars)


#=======================================================================================================
#6. SQL in R
#=======================================================================================================

install.packages('sqldf')
require(sqldf)
View(mtcars)

sqldf('SELECT * from mtcars')
sqldf('select mpg from mtcars')
sqldf('select mpg, wt from mtcars')
sqldf('select mpg, wt from mtcars order by mpg')
sqldf('select mpg, wt from mtcars order by mpg')
sqldf('select am, avg(mpg) as avg_mpg from mtcars group by am')
sqldf('select am, avg(mpg) as avg_mpg from mtcars group by am')
sqldf('select am, avg(mpg), stdev(mpg) from mtcars group by am')

