#Bar chart for the PO2

#tidyverse
library("tidyverse",warn.conflicts = FALSE)
library("plotly",warn.conflicts = FALSE)
# setwd("~/Desktop/Info201Project/final-project-starter-AZAHAZA/source")

wealth_race <- read_csv("../data/dfa-race.csv",show_col_types = FALSE)

wealth_race_dist <- wealth_race %>%
  filter(Date =='2018:Q1'| Date=='2018:Q2'| Date=='2018:Q4'| Date=='2019:Q1'| Date=='2019:Q2'| Date=='2019:Q3'| Date=='2019:Q4'| Date=='2020:Q1'| Date=='2020:Q2'| Date=='2020:Q3'| Date=='2020:Q4'| Date=='2021:Q1'| Date=='2021:Q2'| Date=='2021:Q3')


clustered_bar_chart <- plot_ly(
  data = wealth_race_dist,     
  x = ~Date, 
  y = ~Assets, 
  color = ~Category, 
  type = "bar", 
  mode = "markers" 
) %>%
  layout(
    title = "Wealth Distribution During Pre-panedmic and Pandemic",
    xaxis = list(title = "Date"), 
    yaxis = list(title = "Assets") 
  )

