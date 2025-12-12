library(knitr)
library(kableExtra)
library(tidyr)
library(dplyr)
library(psych)

#file - create summary tables of variables of interest

#import data 
allNBA <- read.csv("NBA data/allNBA.csv")

#select table information
tableNBA <- allNBA %>% select(Team, Rk, Year, W, L, X3PAr, Pace, Age)
table1NBA <- describe(tableNBA)

#select statistics and add details
table1NBA <- table1NBA %>% select(n, min, median, mean, max, sd, range)
rownames(table1NBA) <- c("Team", "Team Rank", "Year", "Wins", "Losses", "3-Point Att.", "Pace", "Avg. Age")
table1NBA$datatype <- c("String", "Ordered Num.", "Ordered Num.", "Numeric", "Numeric", "Numeric", "Numeric", "Numeric")
table1NBA$datadescription <- c("Team Name", "Rank in NBA", "Season Year", "# of wins", "# of losses", "% of Total Attempted Shots as Freethrows", "Avg. Possessions per Game", "Avg. Team Age")
table1NBA <- table1NBA %>% select(datatype, datadescription, n, min, median, mean, max, sd, range)
colnames(table1NBA) <- c("Data Type", "Description", "Count", "Min. Val.", "Median Val.", "Mean Val.", "Max. Val.", "Std. Dev.", "Range")
table1NBA <- table1NBA %>% mutate(
  `Mean Val.` = signif(`Mean Val.`, digits = 3),
  `Min Val.` =signif(`Min. Val.`, digits = 3), 
  `Max. Val.` = signif(`Max. Val.`, digits = 3), 
  `Median Val.` = signif(`Median Val.`, digits = 3), 
  `Std. Dev.` = signif(`Std. Dev.`, digits = 3), 
)

table1NBA[1,] <- c("String", "Team Name", 330, "-", "-", "-", "-", "-", 30,"-")
table1NBA[2,9] <- 30
table1NBA <- drop(table1NBA[,1:9])

table1 <- table1NBA %>% kable(
  caption = c("Summary Table, NBA Overall"), 
  align ="lcccccccc"
) %>% kable_styling(bootstrap_options = c("striped", "hover")) %>% kable_classic()
table1


#summary table 2 - team stats
table2NBA <- tableNBA %>% group_by(Team) %>% mutate(
  W = mean(W), 
  L = mean(L), 
  Pace = mean(Pace), 
  Age = mean(Age), 
  X3PAr = mean(X3PAr), 
  Rk = mean(Rk)
) %>% select(-c(Year))

table2NBA <- table2NBA[!duplicated(table2NBA), ]
rownames(table2NBA) <- table2NBA$Team
colnames(table2NBA) <- c("Team", "Avg. Rank", "Avg. Wins", "Avg. Losses", "Avg. 3-Point Attempt %", "Avg. Pace", "Avg. Age")

table2 <- table2NBA %>% kable(
  caption = c("Summary Table, 10-Season Avg. Stats"),
  digits = 2
) %>% kable_styling(bootstrap_options = c("striped", "hover"))%>%
  kable_classic()
table2
