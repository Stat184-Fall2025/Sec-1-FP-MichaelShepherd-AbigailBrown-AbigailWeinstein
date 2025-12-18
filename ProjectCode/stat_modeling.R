library(knitr)
library(kableExtra)
library(modelsummary)

#file - identify relationship and impact of factors on team success

#import data
allNBA <- read.csv("Data/allNBA.csv")
allNBA <- allNBA[complete.cases(allNBA[, c("W","Age","Pace","X3PAr")]), ]

#generate correlaation coefficients
#identify correlation coefficients
age <- cor.test(allNBA$W, allNBA$Age)
tpar <- cor.test(allNBA$W, allNBA$X3PAr)
pace <- cor.test(allNBA$W, allNBA$Pace)

#combine into a df
factor <- c("age", "tpar", "pace")
coef <- c(age$estimate, tpar$estimate, pace$estimate)
t <- c(age$statistic, tpar$statistic, pace$statistic)
p <- c(age$p.value, tpar$p.value, pace$p.value)
factor <- c("Player Age", "Three-Point Attempts", "Pace Factor")
factorcoef <- data.frame(factor, coef, t, p)


#linear model creation
#select and rename columns 
modelNBA <- allNBA %>% select(W, Age, X3PAr, Pace)
colnames(modelNBA) <- c("Wins", "Age", "ThreePointAtt.", "Pace")

#create model 
winmodel1 <- lm(Wins ~ Age + ThreePointAtt. + Pace, data = modelNBA)
summary(winmodel1)
model <- list("Model 1" = winmodel1)

#clear workspace
rm(pace, tpar, coef, factor, p, t, age, modelNBA)
