install.packages("dplyr")
library("dplyr")
1+6
10-3
3**4
3^4
View(orangeec)

x<-86
x
office <- 7
study <- 4
transport <- 2
t_day <- office + study + transport
t_day


a <- .3
b <- .3
c <- .4

aa <- 10
bb <- 3
cc <- 8

aaa <- a * aa
bbb <- b * bb
ccc <- c * cc
aaa
bbb
ccc

d <- aaa+bbb+ccc
d

mtcars$vs <- as.logical(mtcars$vs)
mtcars$am <- as.logical(mtcars$am)
str(mtcars)

summary(mtcars)
mtcars.new <- transform(mtcars, wt = wt*1000/2)
mtcars.new

#Vectors
study_time <- c(25,5,10,15,10)
reading_time <- c(30,10,5,10,5)
learning_time <- study_time + reading_time

learning_days <- c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday")

days_20min <- c(TRUE, FALSE, FALSE, FALSE, TRUE)
total_study_time <- sum(study_time)
total_reading_time <- sum(reading_time)
total_learning_time <- total_reading_time + total_study_time

#Matrix
matrix_time <- matrix(c(study_time, reading_time), nrow = 2, byrow = TRUE)
time_ <- c("Studying time", "Reading Time")
colnames(matrix_time) <- learning_days
rownames(matrix_time) <- time_
matrix_time

colSums(matrix_time)

#Matrices Exercises 
final_matrix <- rbind(matrix_time, c(10,15,30,5,0))
final_matrix
colSums(final_matrix)

final_matrix <- cbind(final_matrix, c(10,20,30))
final_matrix[1,5]

#Operators
mtcars[mtcars$cyl < 6,]
orangeec[orangeec$GDP.PC >= 15000,]
orangeec[orangeec$Creat.Ind...GDP <= 2, ]
orangeec.new <- subset(orangeec, Internet.penetration...population > 80 & Education.invest...GDP >= 4.5)
orangeec.new

orangeec.new<- subset(orangeec, Internet.penetration...population > 80 & Education.invest...GDP >= 4.5, select = Creat.Ind...GDP)
orangeec.new

#Factors and Lists
course_label <- c("Basic", "Intermediate", "Advanced")
head(mtcars)
tail(mtcars)  
glimpse(mtcars)
str(mtcars)

my_vector <- 1:8
my_matrix <- matrix(1:9, ncol=3, nrow=3)
my_df <- mtcars[1:4,]
my_list <- list(my_vector, my_matrix, my_df)
my_list

