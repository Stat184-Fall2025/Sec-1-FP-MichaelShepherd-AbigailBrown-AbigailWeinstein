library(knitr)
library(kableExtra)
library(modelsummary)

#file - identify relationship and impact of factors on team success

#import data
allNBA <- read.csv("Data/allNBA.csv")

#generate correlaation coefficients
#identify correlation coefficients
age <- cor.test(allNBA$WinR, allNBA$Age)
tpar <- cor.test(allNBA$WinR, allNBA$X3PAr)
pace <- cor.test(allNBA$WinR, allNBA$Pace)

#combine into a df
factor <- c("age", "tpar", "pace")
coef <- c(age$estimate, tpar$estimate, pace$estimate)
t <- c(age$statistic, tpar$statistic, pace$statistic)
p <- c(age$p.value, tpar$p.value, pace$p.value)
factor <- c("Player Age", "Three-Point Attempts", "Pace Factor")
factorcoef <- data.frame(factor, coef, t, p)


#linear model creation
#select and rename columns 
modelNBA <- allNBA %>% select(WinR, Age, X3PAr, Pace)
colnames(modelNBA) <- c("Win Rate", "Age", "ThreePointAtt.", "Pace")

#create model 
winmodel1 <- lm(`Win Rate` ~ Age + ThreePointAtt. + Pace, data = modelNBA)
summary(winmodel1)
model <- list("Model 1" = winmodel1)

#clear workspace
rm(pace, tpar, coef, factor, p, t, age, modelNBA)
