library("tidyverse",warn.conflicts = FALSE)
library("plotly",warn.conflicts = FALSE)

wealth_category <- read_csv("https://raw.githubusercontent.com/info-201a-wi22/final-project-starter-AZAHAZA/main/data/dfa-income.csv%22" ,show_col_types = FALSE)

wealth_dist <- wealth_category %>%
  filter(Date == '2017:Q1' | Date=='2017:Q2'| Date == '2017:Q3' |Date=='2017:Q4' | Date =='2018:Q1'| Date=='2018:Q2'| Date == '2018:Q3' |Date=='2018:Q4'| Date=='2019:Q1'| Date=='2019:Q2'| Date=='2019:Q3'| Date=='2019:Q4'| Date=='2020:Q1'| Date=='2020:Q2'| Date=='2020:Q3'| Date=='2020:Q4'| Date=='2021:Q1'| Date=='2021:Q2'| Date=='2021:Q3')


fig <- plot_ly(
  data = wealth_dist,     
  x = ~Date, 
  y = ~Assets, 
  color = ~Category, 
  type = "scatter", 
  mode = "lines" 
) %>% layout(
    title = "Wealth Distribution Before and During the Pandemic by Income Percentile Groups",
    xaxis = list(title = 'Date'), 
    yaxis = list(title = 'Assets') 
  )

fig
