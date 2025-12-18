# NBA Predictive Statistics

This project will explore how certain game play and team statistics are related to regular season success in the National Basketball Association (NBA). This will aid in identifying what strategies aid in winning games across the league.

## Overview

In this project, we aim to explore three primary factors in relation to team success, measured by the number of wins a team has in the regular season. The factors being used in this analysis are the following: player age, three-point attempt rate, and pace factor. Each factor was selected as a means of evaluating different areas that can influence success.

-   Player Age: age as a proxy for skill and athleticism

-   Three-Point Attempt Rate: evaluates game play strategy, how often did the team pursue high-scoring plays?

-   Pace Factor: evaluates the number of times a given team had the ball, addresses offensive/defensive strategies and play time.

Collectively, these factors address what often determine how well team plays. In our exploration of these factors in relation to net rating, we will identify how each individual metric is correlated with points scored. It should be noted that there are a total of 82 games per season when considering the outcomes of these models.

### Interesting Insight

Upon further inspection of our predictive variables, we have found that both age and three-point attempts have a significant impact on a team's win. However, pace factor has negligible effect on wins. This was surprising, as this measure is a direct reflection of possessions and game play - which would presumably increase scoring odds and overall chances of winning.

![Pace Factor and Team Wins](images/pacecorr-02)

## Data Sources and Acknowledgements

The data used was pulled from the [Basketball References](https://www.sports-reference.com/stathead/basketball/team-season-finder.cgi) website. This site has record of game play statistics for every NBA team going back to the leagues founding in 1948. For the purposes of this exploration, we only selected data from the 2014-2015 season to the 2024-2025 seasons. We did exclude data from the 2019-2020 and 2020-2021 seasons, due to the COVID-19 pandemic impacting games played.

### Data Sources:

1.  Stathead. (2025, December 11). *Team Season Finder - Pro Basketball*. Stathead. <https://www.sports-reference.com/stathead/basketball/team-season-finder.cgi>. Data sourced from Basketball-Reference (Sports Reference LLC), retrieved 2025.

## Current Plan

The full, detailed plan for this project can be found [here](https://github.com/Stat184-Fall2025/Sec-1-FP-MichaelShepherd-AbigailBrown-AbigailWeinstein/blob/main/ProjectPlan) in the planning document. At the present moment, the team is working on refining visualizations and updating documentation for our data. Future steps involve producing the final report on our findings and possible expanding exploration to other game play factors.

## Repo Structure

The following section contains hyperlinks to each section of the GitHub repository. The main page of the repository is linked {here}.

1.  [**Project Guidelines**](https://github.com/Stat184-Fall2025/Sec-1-FP-MichaelShepherd-AbigailBrown-AbigailWeinstein/blob/main/Project_Guidelines.md): Documentation detailing general project expectations, including key dates, check list of materials, and more.
2.  [**README.md**](https://github.com/Stat184-Fall2025/Sec-1-FP-MichaelShepherd-AbigailBrown-AbigailWeinstein/blob/main/README.md): Introduction to the team's specific project. Contains a project overview, data sources, and contact information of the project authors.
3.  [**Final Report Plan**](https://github.com/Stat184-Fall2025/Sec-1-FP-MichaelShepherd-AbigailBrown-AbigailWeinstein/blob/main/ProjectPlan)**:** A text file detailing the process the team went through to produce the final report.
4.  **{Final Report.qmd}**: .QMD file of the final report, which is in .pdf format
5.  {**Final Report.pdf}:** The final report of the project. Outlines findings and situates them within a broader context.
6.  [**Work in Progress Presentation**](https://github.com/Stat184-Fall2025/Sec-1-FP-MichaelShepherd-AbigailBrown-AbigailWeinstein/blob/main/Work%20In%20Progress%20Presentation.pdf): Work in progress presentation from 12/12/2025.
7.  [**Data Folder**](https://github.com/Stat184-Fall2025/Sec-1-FP-MichaelShepherd-AbigailBrown-AbigailWeinstein/tree/main/Data): This folder contains the .csv files for each individual season pulled from Basketball-Reference, as well as the final merged data file.
8.  [**Project Code Folder**](https://github.com/Stat184-Fall2025/Sec-1-FP-MichaelShepherd-AbigailBrown-AbigailWeinstein/tree/main/ProjectCode)**:** This folder contains all .R code used to merge and clean data, produce visualizations, and generate statistical models.
9.  [**Visualizations Folder**](https://github.com/Stat184-Fall2025/Sec-1-FP-MichaelShepherd-AbigailBrown-AbigailWeinstein/tree/main/Visualizations): This folder contains all versions of the visuals utilized in the final report, including tables, charts, and other figures.

## Authors

1.  Abigail Brown, Communication, alb7624\@psu.edu
2.  Michael Shepard, Data Wrangling, mrs7065\@psu.edu
3.  Abigail Weinstein, Documentation, amw7917\@psu.edu,
