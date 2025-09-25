
### Statistical Modelling

## Exerice Session 1

# load library
library(MASS)

# get info about the survey dataset
help(survey)

# load the dataset
data(survey)

# first overview
str(survey)
summary(survey)
table(survey$Smoke, survey$Sex)

# visual inspection
hist(survey$Height)
boxplot(split(survey$Height, survey$Sex))
plot(survey$Wr.Hnd, survey$NW.Hnd)

## Exercise 1 

# 1.a
survey[,c(2,3)] |> summary()
par(mfrow = c(1,2))
boxplot(survey$Wr.Hnd)
boxplot(survey$NW.Hnd)

# no observable difference from the boxplots and summary stats

# 1.b

survey[rev(order(survey$Age)),][1:2, ]

# no, they are non-smokers

# 1.c

pairs(survey)

model = lm(survey$Pulse ~ ., survey)
summary(model)

# 1.d

#plotting the pulse of people below age 30 against their age
Agejung = survey$Age[survey$Age<30]
Pulsejung = survey$Pulse[survey$Age<30]
plot(Agejung,Pulsejung)

lmobj = lm(Pulsejung ~ Agejung)
plot(Agejung,Pulsejung) 
abline(lmobj, col = "red")


## Exercise 2
x <- c(5,2,1,4) 
xx <- c(1,10,15,18)
y <- rep(1,5)
z <- c(TRUE,FALSE,TRUE,TRUE)
w <- c("Marie","Betty","Peter")


## Exercise 3 
seq(1,9,1)
rep(c("m", "w"), 4)
rep(1:4, 3)
rep(4:1, each = 3)
rep(1:5, 1:5)


## Exercise 4
matrix(data = c(1:5, 100+1:5, 200+1:5, 300+1:5), nrow = 5, ncol = 4)
diag(x = 5, ncol = 10, nrow = 10)


## Exercise 5

 