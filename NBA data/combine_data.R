library(readr)
library(dplyr)

#file - synthesize and clean data to one data frame

#import data
data2015 <- read.csv("NBA data/2015.csv")
data2016 <- read.csv("NBA data/2016.csv")
data2017 <- read.csv("NBA data/2017.csv")
data2018 <- read.csv("NBA data/2018.csv")
data2019 <- read.csv("NBA data/2019.csv")
data2020 <- read.csv("NBA data/2020.csv")
data2021 <- read.csv("NBA data/2021.csv")
data2022 <- read.csv("NBA data/2022.csv")
data2023 <- read.csv("NBA data/2023.csv")
data2024 <- read.csv("NBA data/2024.csv")
data2025 <- read.csv("NBA data/2025.csv")


#add necessary id columns (year)
data2015$Year <- 2015
data2016$Year <- 2016
data2017$Year <- 2017
data2018$Year <- 2018
data2019$Year <- 2019
data2020$Year <- 2020
data2021$Year <- 2021
data2022$Year <- 2022
data2023$Year <- 2023
data2024$Year <- 2024
data2025$Year <- 2025

#merge dataframes 
allNBA <- rbind(
  data2015, data2016, data2017, data2018, data2019,
  data2020, data2021, data2022, data2023, data2024, data2025
)

#clean data
allNBA <- allNBA %>% select(-c(X, X.1, X.2)) %>%  filter(Team != "League Average")
allNBA$Team <- gsub("\\*", "", allNBA$Team)

#check data
View(allNBA)

#save data frame 
write.csv(allNBA, file = "NBA data/allNBA.csv")

