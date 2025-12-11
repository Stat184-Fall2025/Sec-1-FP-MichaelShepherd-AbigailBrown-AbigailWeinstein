library(dplyr)

AllNBA |> 
  summarise(
    AvgAge = mean(as.numeric(Age)),
    AvgPace = mean(as.numeric(Pace)),
    Avg3PAR = mean(as.numeric(ThreePAR)),
    AvgWins = mean(as.numeric(W))
  )

plot(AllNBA$ThreePAR, AllNBA$W,
     xlab="3P Attempt Rate", ylab="Wins",
     main="3PAr vs Wins (2015–2025)")

plot(AllNBA$Pace, AllNBA$W,
     xlab="Pace", ylab="Wins",
     main="Pace vs Wins (2015–2025)")

plot(AllNBA$Age, AllNBA$W,
     xlab="Average Age", ylab="Wins",
     main="Age vs Wins (2015–2025)")
