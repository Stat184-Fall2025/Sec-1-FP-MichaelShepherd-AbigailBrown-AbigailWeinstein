library(knitr)
library(kableExtra)
library(modelsummary)

#file - identify relationship and impact of factors on team success

#import data
allNBA <- read.csv("NBA data/allNBA.csv")

#identify correlation coefficients
age <- cor(allNBA$W, allNBA$Age)
tpar <- cor(allNBA$W, allNBA$X3PAr)
pace <- cor(allNBA$W, allNBA$Pace)

#combine into a df
factor <- c("age", "tpar", "pace")
coef <- c(age, tpar, pace)
factorcoef <- data.frame(factor, coef)

#select and rename columns 
modelNBA <- allNBA %>% select(W, Age, X3PAr, Pace)
colnames(modelNBA) <- c("Wins", "Age", "ThreePointAtt.", "Pace")

#model 
winmodel1 <- lm(Wins ~ Age + ThreePointAtt. + Pace, data = modelNBA)
summary(winmodel1)

model <- list("Model 1" = winmodel1)

table3 <- modelsummary(model, stars = TRUE, output = 'kableExtra', 
                       estimate = c("Coef." = "{estimate}"),
                       statistic = c("p-Value" = "{p.value}", "Std. Error" = "{std.error}"), 
                       shape = term ~ model + statistic, 
                       gof_omit = "R2 Adj.|AIC|BIC|Log.Lik.|F|RMSE",
                       align = "lccc")
table3

