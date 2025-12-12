library(ggplot2)
library(readr)

#file - develop basic visualizations for factors of interest

#import data 
allNBA <- read.csv("NBA data/allNBA.csv")

#plot 1 - three-point attempt rate
ggplot(allNBA, aes(x = ThreePAR, y = W)) +
  geom_point(alpha = 0.6) +
  geom_smooth(method = "lm", se = FALSE, color = "blue") +
  labs(
    title = "3P Attempt Rate vs Wins (2015–2025)",
    x = "3-Point Attempt Rate",
    y = "Wins"
  ) +
  theme_minimal(base_size = 14)

#plot 2 - team age
ggplot(allNBA, aes(x = Age, y = W)) +
  geom_point(alpha = 0.6) +
  geom_smooth(method = "lm", se = FALSE, color = "blue") +
  labs(
    title = "Average Age vs Wins (2015–2025)",
    x = "Team Average Age",
    y = "Wins"
  ) +
  theme_minimal(base_size = 14)

#plot 3 - pace 
ggplot(allNBA, aes(x = Pace, y = W)) +
  geom_point(alpha = 0.6) +
  geom_smooth(method = "lm", se = FALSE, color = "blue") +
  labs(
    title = "Pace vs Wins (2015–2025)",
    x = "Pace",
    y = "Wins"
  ) +
  theme_minimal(base_size = 14)
