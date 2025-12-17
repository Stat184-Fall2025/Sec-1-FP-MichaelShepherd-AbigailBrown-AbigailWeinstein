library(dplyr)
library(readr)
library(modelsummary)
library(knitr)
library(kableExtra)

#create correlation coef. table
corrtab <- factorcoef %>% kable(
  col.names = c("", "Correlation Coef. (p)", "t-Statistic", "p-Value"),
  digits = 3, 
  align = "lccc", 
  caption = c("Factor Correlation with Season Win Total")
  ) %>% kable_classic()
corrtab
save_kable(corrtab, "Visualizations/tables/correlation.png")


#create linear regression table
linregtable <- modelsummary(model, stars = TRUE, output = 'kableExtra', 
                       estimate = c("Coef." = "{estimate}"),
                       statistic = c("p-Value" = "{p.value}", "Std. Error" = "{std.error}"),                        
                       shape = term ~ model + statistic, 
                       gof_omit = "R2 Adj.|AIC|BIC|Log.Lik.|F|RMSE", 
                       align = "lccc")
linregtable
save_kable(linregtab, "Visualizations/tables/regression.png")

rm(factorcoef, model)
