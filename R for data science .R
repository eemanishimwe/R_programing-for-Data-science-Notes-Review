#looking summary statistics of cars dataset. 

data("cars")
summary(cars)

# plot graoh that how they relate
plot(cars$speed, cars$dist,
     main = "Car Speed vs. Stopping Distance",
     xlab = "Speed",
     ylab = "Stopping distance")

#Important definitions in data science
#Statistics: Learning from data.
#Modelling: Using data to describe or predict something.
#Computation: Using a computer to work with data.
#Calculus: Studying how things change.

#Data structure (Vectors, Factors, Lists, Data frame, matrix and arrays)
# Vector:is a one-dimensional collection of values of the same basic type. 
#numeric

x<- c (0.3, 0.5)
age<- c(20,30,40)

#Logical

x<- c(TRUE,FALSE)

# Character

x<- c('Emmanuel', 'Jams')

# Integer
x <- c(2L, 4L, 10L)

# Complex

x<- c(1 + 10i, 3 + 5i)
# matrix and it's operation
(x <- matrix(1:6, nrow = 2,ncol = 3))
(y<- matrix(1:6, nrow = 3, ncol = 2))

x%*%y

#List
(x<-list(1,"b",TRUE, 1+4i))

# Factor
x<-factor(c("yes","yes","no","yes","no"))

# Create a vector with NAs in it
x <- c(1, 2, NA, 10, 3)
is.na(x)

# What if there are multiple R objects and you want to take the subset with no missing values in any of those objects?
x <- c(1, 2, NA, 4, NA, 5) 
y <- c("a", "b", NA, "d", NA, "f")  
good <- complete.cases(x, y)  
good

# Coercion in R means automatically changing values from one data type to another
#If a vector only contains logical and numbers, R will convert the logical to numbers, Every true becomes a 1, and every FALSE becomes 0

sum(c(TRUE,TRUE,FALSE,FALSE,FALSE))

#Create data
# Synthax for dataframe:my_data <- data.frame(column1 = values,column2 = values)
# but in the below exaple we are combining the different vectors into dataframe 

studentID<-c(1,2,3,4,5)
math_score<-c(12,17,10,9,NA)
gender<-c("M","F","M","M","F")
it_score<-c(13,18,11,10,19)
scoredata<-data.frame(studentID,gender,math_score,it_score)
scoredata
View(scoredata)
#Create data from keyboard ( Create data frame (or matrix) with variable names 2. Invoke the text editor in the data objected created at first step)
data_class2 <- data.frame(
  height = numeric(0),
  weight = numeric(0),
  bmi = numeric(0)
)
data_class2 <- edit(data_class2)
# Importing Data into R
#
# R can read data from many sources, so you can analyze it
# without typing everything in by hand.
#
# 1. Spreadsheets
#    For example, Excel files.
#
# 2. Statistical software
#    For example, files created in SAS, SPSS, or Stata.
#
# 3. Text and web sources
#    For example, CSV or other plain-text files, XML files,
#    and data collected from webpages.
#
# 4. Databases
#    For example, databases managed with SQL, MySQL, Oracle,
#    or Microsoft Access.

#Exploration data analysis
#Examine numerical variable using common summary

#Variation and covariation using both numerical and graphs
#Relationship between a categorical and a continuous variable

# Load the built-in iris dataset
data("iris")

# Display the first six rows of the dataset
head(iris)

# Calculate the average petal length for all iris flowers
mean(iris$Petal.Length)

# Calculate the average petal length for setosa flowers
mean(iris$Petal.Length[iris$Species == "setosa"])

# Calculate the average petal length for versicolor flowers
mean(iris$Petal.Length[iris$Species == "versicolor"])

# Calculate the average petal length for virginica flowers
mean(iris$Petal.Length[iris$Species == "virginica"])

# Calculate the average petal length separately for each species
by(iris$Petal.Length, iris$Species, mean)

# Calculate the standard deviation of petal length for each species
by(iris$Petal.Length, iris$Species, sd)

# Show summary statistics for petal length for each species
by(iris$Petal.Length, iris$Species, summary)

#Visualize the differences in continuous variables 
#between categories using Box-and-whisker plot

boxplot(Sepal.Length ~ Species,
        data = iris,
        main = "Sepal Length by Iris Species",
        xlab = "Species",
        ylab = "Sepal Length")

grid()

# Date

today<- Sys.Date()
format(today, format("%B,%D,%Y"))

# Time difference
startdate <- as.Date("2004-02-13")
enddate <- as.Date("2011-01-22")
days <- enddate - startdate
days

#Subsetting

# Leadership study:
# Explore whether men and women in management differ in how they lead.
#
# Response scale:
# 1 = Strongly disagree
# 2 = Disagree
# 3 = Neither agree nor disagree
# 4 = Agree
# 5 = Strongly agree

# Create a vector for each variable
manager <- c(1, 2, 3, 4, 5)
country <- c("US", "US", "UK", "UK", "UK")
gender  <- c("M", "F", "F", "M", "F")
age     <- c(32, 45, 25, 39, 99)

# Create vectors for the five question responses
q1 <- c(5, 3, 3, 3, 2)
q2 <- c(4, 5, 5, 3, 2)
q3 <- c(5, 2, 5, 4, 1)
q4 <- c(5, 5, 5, NA, 2)
q5 <- c(5, 5, 2, NA, 1)

# Combine all variables into a data frame
# NA means a response is missing
leadership <- data.frame(
  manager, country, gender, age, q1, q2, q3, q4, q5,
  stringsAsFactors = TRUE
)

# Show the structure of the data frame
str(leadership)

# Subsetting examples:
leadership$gender       # Select the gender column using $
leadership[1, ]          # Select the first row using [ ]
leadership[["gender"]]   # Select the gender column using [[ ]]
names(leadership)       #displays the column names in the leadership data frame

# HANDLE MISSING AGE VALUES
# Replace the code 99 with NA
leadership$age[is.na(leadership$age)] <- 99
View(leadership)

# CREATE AGE CATEGORIES
leadership$agecat[leadership$age >75]<-"Elder"
leadership$agecat[leadership$age>=35 & leadership$age<=75]<-"Middle Aged"
leadership$agecat[leadership$age <35]<- "Young"

View(leadership)
# CHECK FOR MISSING QUESTION RESPONSES
is.na(leadership[, 5:9])

# REMOVE INCOMPLETE ROWS
newdata <- na.omit(leadership)
newdata

# SORT DATA BY AGE
order(leadership$age)

# Select question columns q1 to q5 by column numbers
newdata3_numbers <- leadership[, 5:9]

# Select the same columns by their names
myvars <- c("q1", "q2", "q3", "q4", "q5")
newdata3_names <- leadership[, myvars]

# Exclude columns 1 and 2
newdata4_drop12 <- leadership[, -c(1, 2)]

# Exclude columns 1 through 5
newdata4_drop1to5 <- leadership[, -(1:5)]

# Exclude columns 1 and 7
newdata5 <- leadership[, -c(1, 7)]

# Select the fourth column, age, as a vector
age_values <- leadership[[4]]

# Exclude rows 1 and 3
newdata6_drop13 <- leadership[-c(1, 3), ]

# Select only rows 2, 4, and 5
newdata6_rows245 <- leadership[c(2, 4, 5), ]

# Select q1 to q5 for people aged 35 or older, or younger than 24
newdata7_agegroups <- subset(
  leadership,
  age >= 35 | age < 24,
  select = c(q1, q2, q3, q4, q5)
)

# Select rows for men older than 30
# $ identifies the columns; == checks whether gender is "M"
newdata8_men_over30 <- leadership[
  leadership$gender == "M" & leadership$age > 30,
]
                
