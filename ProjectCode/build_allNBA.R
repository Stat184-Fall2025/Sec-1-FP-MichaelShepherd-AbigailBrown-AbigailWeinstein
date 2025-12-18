years <- 2015:2025

clean_one <- function(df, y) {
  df <- df[, c("V1","V2","V3","V4","V5","V14","V16")]
  names(df) <- c("Rank","Team","Age","W","L","Pace","X3PAr")
  df <- df[df$Team != "Team", ]
  df$Rank <- as.numeric(df$Rank)
  df$Age  <- as.numeric(df$Age)
  df$W  <- as.numeric(df$W)
  df$L  <- as.numeric(df$L)
  df$Pace <- as.numeric(df$Pace)
  df$X3PAr <- as.numeric(df$X3Ar)
  df$Year <- y
  df
}

allNBA <- bind_rows(lapply(years, function(y) clean_one(get(as.character(y)), y)))

write.csv(allNBA, "allNBA.csv", row.names = FALSE)