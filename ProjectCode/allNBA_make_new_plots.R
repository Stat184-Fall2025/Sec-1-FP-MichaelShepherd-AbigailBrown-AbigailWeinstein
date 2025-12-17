library(ggplot2)

# Load data
allNBA <- read.csv("allNBA.csv")

# Keep only rows with complete values for the variables we use
allNBA <- allNBA[complete.cases(allNBA[, c("W","Age","Pace","ThreePAR")]), ]

# Ensure numeric
allNBA$W        <- as.numeric(allNBA$W)
allNBA$Age      <- as.numeric(allNBA$Age)
allNBA$Pace     <- as.numeric(allNBA$Pace)
allNBA$ThreePAR <- as.numeric(allNBA$ThreePAR)

# Correlations (for labeling plots)
cor_age  <- round(cor(allNBA$Age, allNBA$W, use = "complete.obs"), 2)
cor_pace <- round(cor(allNBA$Pace, allNBA$W, use = "complete.obs"), 2)
cor_3par <- round(cor(allNBA$ThreePAR, allNBA$W, use = "complete.obs"), 2)

# Common styling helpers
wins_ylim <- c(10, 75)
subtitle_txt <- "NBA Non-COVID Seasons (2015–2019, 2022–2025)"

# Plot 1: 3P Attempt Rate vs Wins
p1 <- ggplot(allNBA, aes(x = ThreePAR, y = W)) +
  geom_point(alpha = 0.45, size = 2, color = "#2C7BB6") +
  geom_smooth(method = "lm", se = FALSE, color = "#D7191C", linewidth = 1) +
  annotate("text", x = max(allNBA$ThreePAR, na.rm = TRUE), y = wins_ylim[2],
           label = paste("Correlation =", cor_3par),
           hjust = 1, vjust = 1, size = 4) +
  coord_cartesian(ylim = wins_ylim) +
  labs(
    title = "3-Point Attempt Rate vs Team Wins",
    subtitle = subtitle_txt,
    x = "3-Point Attempt Rate",
    y = "Wins"
  ) +
  theme_minimal(base_size = 14) +
  theme(plot.title = element_text(face = "bold"),
        plot.subtitle = element_text(size = 11))

# Plot 2: Average Age vs Wins
p2 <- ggplot(allNBA, aes(x = Age, y = W)) +
  geom_point(alpha = 0.45, size = 2, color = "#2C7BB6") +
  geom_smooth(method = "lm", se = FALSE, color = "#D7191C", linewidth = 1) +
  annotate("text", x = max(allNBA$Age, na.rm = TRUE), y = wins_ylim[2],
           label = paste("Correlation =", cor_age),
           hjust = 1, vjust = 1, size = 4) +
  coord_cartesian(ylim = wins_ylim) +
  labs(
    title = "Average Team Age vs Wins",
    subtitle = subtitle_txt,
    x = "Average Team Age",
    y = "Wins"
  ) +
  theme_minimal(base_size = 14) +
  theme(plot.title = element_text(face = "bold"),
        plot.subtitle = element_text(size = 11))

# Plot 3: Pace vs Wins
p3 <- ggplot(allNBA, aes(x = Pace, y = W)) +
  geom_point(alpha = 0.45, size = 2, color = "#2C7BB6") +
  geom_smooth(method = "lm", se = FALSE, color = "#D7191C", linewidth = 1) +
  annotate("text", x = max(allNBA$Pace, na.rm = TRUE), y = wins_ylim[2],
           label = paste("Correlation =", cor_pace),
           hjust = 1, vjust = 1, size = 4) +
  coord_cartesian(ylim = wins_ylim) +
  labs(
    title = "Pace vs Team Wins",
    subtitle = subtitle_txt,
    x = "Pace",
    y = "Wins"
  ) +
  theme_minimal(base_size = 14) +
  theme(plot.title = element_text(face = "bold"),
        plot.subtitle = element_text(size = 11))

# Plot 4: Average Wins by Age Group (binned comparison)
allNBA$AgeGroup <- cut(allNBA$Age,
                       breaks = c(22, 24, 26, 28, 30, 32),
                       include.lowest = TRUE)

p4 <- ggplot(allNBA, aes(x = AgeGroup, y = W)) +
  stat_summary(fun = mean, geom = "bar", fill = "#2C7BB6", alpha = 0.85) +
  labs(
    title = "Average Wins by Team Age Group",
    subtitle = subtitle_txt,
    x = "Average Team Age (Binned)",
    y = "Average Wins"
  ) +
  theme_minimal(base_size = 14) +
  theme(plot.title = element_text(face = "bold"),
        plot.subtitle = element_text(size = 11))

# Plot 5: Distribution of Wins
p5 <- ggplot(allNBA, aes(x = W)) +
  geom_histogram(bins = 15, fill = "#2C7BB6", color = "black", alpha = 0.85) +
  labs(
    title = "Distribution of NBA Team Wins",
    subtitle = subtitle_txt,
    x = "Wins",
    y = "Number of Teams"
  ) +
  theme_minimal(base_size = 14) +
  theme(plot.title = element_text(face = "bold"),
        plot.subtitle = element_text(size = 11))

# Print all plots
print(p1)
print(p2)
print(p3)
print(p4)
print(p5)
