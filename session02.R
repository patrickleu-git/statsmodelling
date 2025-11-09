
library(car)

data("Anscombe")
data("Leinhardt")

summary(Anscombe)
summary(Leinhardt)

# examine income variable
incomeA = Anscombe$income

hist(incomeA)

boxplot(incomeA)

plot(
  density(incomeA, na.rm = T), 
  main = "Density estimate for income variable"
  )

qqnorm(incomeA)
qqline(incomeA) # distribution looks close to normal

# examine infant mortality 
boxplot(
  Leinhardt$infant ~ Leinhardt$region,
  main = "Infant-mortality per 1000 live births.",
  ylab = "",
  xlab = ""
  )

# Europe hast lowest level and hardly any spread, Asia's median lower 
# than the Americas' but shows huge spread and two massive outliers.

# Which countries have a mortality rate larger than 20%
Leinhardt[which(Leinhardt$infant > 200),]


# inspect Angell
data("Angell")
?Angell

iv = as.integer(Angell$region)
plot(Angell[,-4], col = iv, pch = iv)
