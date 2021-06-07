###===================================================================================================###
###                                     INTRODUCTION TO R                                           ###
###                                         MODULE 2                                         ###
###                                    [DATA AND MATRIX]                                              ###                
###===================================================================================================###
#1. INTRODUCTION TO MATRIX
#=======================================================================================================

#Consider the following two vectors

x <- c(33,45,23,67,54,48)
y <- c(108,151,164,119,135,122)


#A. The cbind() function, c = column
cbind(x,y)

#B. The rbind() function, r = row
rbind(x,y)


#C. The matrix() function
?matrix(c(1,2,3,4,5,6,7,8,9), ncol=3, nrow=3)

matrix(c(1,2,3,4,5,6,7,8,9), ncol=3, nrow=3)

matrix(c(1,2,3,4,5,6,7,8,9), ncol=3, nrow=3,byrow = T) #matrix is filled by row, by default byrow is False.

matrix(x, nrow = 3,ncol = 3) #since x has only 6 values. So, col1 and col3 of matrix is same.


#=======================================================================================================
#2. MATRIX AND DATA FRAME
#=======================================================================================================

#A Limitation of Matrix and Vector is that it can store only one type of data

#Consider another vector
z <- c("P","T","M","K","H","R")
cbind(x,y)
cbind(x,y,z)


#PROBLEM
#Constructing the following data

### X1	X2	X3	Age	Gender
### 27	40	A	  23	Male
### 39	20	A	  22	Female
### 22	24	B	  50	Female
### 33	32	C	  38	Male
### 30	32	B	  22	Male
### 44	31	B	  43	Male
### 41	22	C	  37	Female
### 35	28	A	  45	Male
### 44	20	C	  20	Female
### 21	46	B	  36	Male

X1 <- c(27,39,22,33,30,44,41,35,44,21)
X2 <- c(40,20,24,32,32,31,22,28,20,46)
X3 <- c("A","A","B","C","B","B","C","A","C","B")
Age <- c(23,22,50,38,22,43,37,45,20,36)
Gender <- c("Male","Female","Female","Male","Male","Male","Female","Male","Female","Male")

data.frame(X1,X2,X3,Age,Gender)
data.frame(x,y,z)

#=======================================================================================================
#3. MATRIX SUBSETTING
#=======================================================================================================

#PROBLEM

#Consider the following matrix: 
### 38	33	47
### 29	48	35
### 21	34	47
### 38	44	21
### 28	26	43


#a)	Generate the above matrix in R and store it in an object.
mat <- matrix(c(38,33,47,
                29,48,35,
                21,34,47,
                38,44,21,
                28,26,43), nrow=5, ncol=3, byrow=T)

mat

#b) Check the dimenison of the matrix

dim(mat)

#c)	Print the first element of the matrix.

mat[1,1] #row first , column second

#d)	Print the last element of the matrix.

mat[5,3] 
mat[nrow(mat), ncol(mat)]

#e)	Print the values of the first row.

mat[1,]

#f)	Print the values of the fourth row.

mat[4,]

#g)	Print the values first column.

mat[,1]

#h)	Calculate the total of the third row.

sum(mat[3,])

#i)	Calculate the total of the fifth row.

sum(mat[5,])

#j)	Calculate the total of the second column.

sum(mat[,2])

#k)	Calculate the average of the values of the first row.

mean(mat[1,])

#l)	Replace the first value of the matrix by 50.
mat[1,1] = 50
mat

#m)	Replace the last value of the matrix by 30.

mat[nrow(mat), ncol(mat)] = 30
mat

#n)	Replace the first column of the matrix by the vector (20,30,20,30,20)

mat[,1] <- c(20,30,20,30,20)
mat

#o)	Replace the first row of the matrix by its average.

mat[1,] <- mean(mat[1,])
mat

#p)	Print all the values corresponding to 4th & 5th rows and 2nd & 3rd column.

mat[c(4,5),c(2,3)]


#q)	Replace the matrix obtained above by the matrix
### 38	31
### 20	20

mat_r <- matrix(c(38,31,
                  20,20), nrow=2, ncol=2, byrow = T)

#=======================================================================================================
#3. DATA SUBSETTING - INFORMATION RETRIEVAL
#=======================================================================================================

##A. Extracting an extract from the data

#PROBLEM (Reference: cars.csv data)

setwd("C:\\Praxis\\Dataset")
cars <- read.csv("cars.csv")
View(cars)


# a) Extract the information of the first 5 rows and first 5 columns of the data

cars[seq(1,5,1),seq(1,5,1)]

# b) Extract the information of 20th-29th rows

cars[seq(20,29,1),]

# c) Extract the information of only the columns MPG, Cylinders and Weight

cars[,c("MPG","Cylinders","Weight")]

# d) Extract a random sample from the data (SRSWOR)

cars[sample(nrow(cars),5),]


##B. Conditional Subsetting

#PROBLEM (Reference: cars.csv)

# a) Extract all the information of the cars which has MPG more than 40

cars[(cars$MPG >40),]

# b) Extract the information of the car/s which has only 3 cylinders

cars[(cars$Cylinders == 3),]

# c) Extract the information of all the cars originated in Europe and has 
# Acceleration more than 20

cars[(cars$Origin == 'Europe' & cars$Acceleration > 20),]

# d) Name the cars which has MPG more than 40 and Acceleration less than 20 or
# the car has three cylinders

cars[(cars$MPG>40 & (cars$Acceleration <20 | cars$Cylinders == 3)),]


#=======================================================================================================
#4. MORE ON INFORMATION RETRIEVAL
#=======================================================================================================

# Using the subset() function

#PROBLEM (Reference: cars.csv)

# a) Extract all the information of the cars which has MPG more than 40
?subset
subset(cars, MPG > 40)
cars[cars$MPG > 40,]

subset(cars, MPG > 40, select = c(Car, MPG, Horsepower))
subset(cars, MPG > 40, select = Car:Horsepower)
View(cars)
subset(cars, MPG > 40, select = -Car)
subset(cars, MPG > 40, select = -c(Car, Origin, Model))

  
# b) Extract the information of the car/s which has only 3 cylinders

subset(cars,Cylinders == 3)

# c) Extract the information of all the cars originated in Europe and has Acceleration more than 20

subset(cars,(Origin == "Europe" & Acceleration >20))

# d) Name the cars which has MPG more than 40 and Acceleration less than 20 or the car has three cylinders

subset(cars, (MPG >40 & (Acceleration <20 | Cylinders == 3)))




