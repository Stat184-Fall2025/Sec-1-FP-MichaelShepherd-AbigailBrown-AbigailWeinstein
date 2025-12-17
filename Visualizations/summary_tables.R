library(knitr)
library(kableExtra)
library(tidyr)
library(dplyr)
library(psych)
#file - create summary tables of variables of interest

#import data 
allNBA <- read.csv("NBA data/allNBA.csv")

#select table information
tableNBA <- allNBA %>% select(Team, Rk, Year, Total, WinR, X3PAr, Pace, Age)
table1NBA <- describe(tableNBA)

#select statistics
table1NBA <- table1NBA %>% select(n, min, median, mean, max, sd, range)

#change rownames, add detail
table1NBA$variables <- c("Team", "Team Rank", "Year", "Games", "Win Rate", "3-Point Att.", "Pace", "Avg. Age")
table1NBA$datatype <- c("String", "Ordered Num.", "Ordered Num.", "Numeric", "Numeric", "Numeric", "Numeric", "Numeric")
table1NBA$datadescription <- c("Team Name", "Rank in NBA", "Season Year", "# of Games", "% of Games Won", "% of Total Attempted Shots as Freethrows", "Avg. Possessions per Game", "Avg. Team Age")

#organize and clean data
table1NBA <- table1NBA %>% select(variables, datatype, datadescription, n, min, median, mean, max, sd, range)
colnames(table1NBA) <- c(" ","Data Type", "Description", "Count", "Min. Val.", "Median Val.", "Mean Val.", "Max. Val.", "Std. Dev.", "Range")

#generate table
table1 <- table1NBA %>% rowwise() %>% kable(
  caption = c("Summary Table, NBA Overall"), 
  align ="lcccccccc", 
  digits = 2) %>% 
  kable_styling(bootstrap_options = c("striped", "hover")) %>% 
  kable_classic()
table1
save_kable(table1, "Visualizations/tables/datasum.png")


#summary table 2 - team stats
#calculate averages
table2NBA <- tableNBA %>% group_by(Team) %>% mutate(
  Total = mean(Total), 
  WinR = mean(WinR), 
  Pace = mean(Pace), 
  Age = mean(Age), 
  X3PAr = mean(X3PAr), 
  Rk = mean(Rk)
) %>% select(-c(Year))

#filter and rename
table2NBA <- table2NBA[!duplicated(table2NBA), ]
rownames(table2NBA) <- table2NBA$Team
colnames(table2NBA) <- c("Team", "Avg. Rank", "Games Played", "Avg. Win Rate (%)", "Avg. 3-Point Attempt %", "Avg. Pace", "Avg. Age")

#generate table
table2 <- table2NBA %>% kable(
  caption = c("Summary Table, 10-Season Avg. Stats"),
  digits = 2) %>% 
  kable_styling(bootstrap_options = c("striped", "hover")) %>%
  kable_classic()
table2
save_kable(table2, "Visualizations/tables/teamsum.png")

#clean workspace
rm(tableNBA, table1NBA, table2NBA)
