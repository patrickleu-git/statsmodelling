
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


# Exercise 1 --------------------------------------------------------------


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


# Exercise 5 --------------------------------------------------------------


# set path and load data
path = "http://stat.ethz.ch/Teaching/Datasets/NDK/vogel.dat"

d.vogel =  read.table(path, sep =";", header=TRUE)

table(d.vogel$Feld.Nr, d.vogel$Anzahl)

# on average, there were 22.11 birds per meadow
df = d.vogel[,3:4]
mean(df[,2])

# df with 1413 meadow
df1413 = d.vogel[which(d.vogel["Feld.Nr"] == 1413),]

# only observations from meadow 1413
d.vogel["Anzahl"][d.vogel["Feld.Nr"] == 1413]
df1413[,4]

# days of observation while feeding
d.vogel[which(d.vogel["Taetigkeit"] == "fr"),]

# number of birds observed while feeding
sum(d.vogel[which(d.vogel["Taetigkeit"] == "fr"),"Anzahl"]) 

# meadows where feeding was observed
unique(d.vogel[which(d.vogel["Taetigkeit"] == "fr"),"Feld.Nr"])

# change observations in row 6 to 8
d.vogel[8, "Anzahl"] = 8

# remove rows 3, 7
d.vogel[-c(3,7),]



# Exercise 6 --------------------------------------------------------------

# load data
fname <- "http://stat.ethz.ch/education/semesters/ss2014/regression/uebungen/meteo70.txt"
d.meteo <- read.table(fname, header=T)

# recode 32767 as NA (for all cols)
for (x in colnames(d.meteo)){
  id_replace = d.meteo[x] == 32767
  d.meteo[x] = replace(d.meteo[x], id_replace, NA)
}

# rename to temp
colnames(d.meteo)[which(names(d.meteo) == "X211")] = "temp"

# date column
d.meteo$date = paste(d.meteo$JAHR, d.meteo$MO, d.meteo$TG, sep = "-") |> as.Date()
d.meteo$weekday = weekdays(d.meteo$date)

# mean temp per day of week
aggregate(d.meteo$temp, list(Weekday = d.meteo$weekday), mean)

# mean temp per year
df_temp = aggregate(d.meteo$temp, list(Year = d.meteo$JAHR), mean)
plot(df_temp$Year, df_temp$x)






