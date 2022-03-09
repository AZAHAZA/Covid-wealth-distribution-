# tab_panel_chart1
library(shiny)
library(lintr)
library("tidyverse", warn.conflicts = FALSE)
library("plotly", warn.conflicts = FALSE)
library("leaflet", warn.conflicts = FALSE)
library("ggplot2", warn.conflicts = FALSE)
lint("tab_panel_chart2.R")

income_pcercentage <- read_csv("../data/dfa-income.csv")

line_data <- income_pcercentage %>%
  mutate(Date = gsub(":Q1|:Q2|:Q3|:Q4", "", Date),
         Date = as.integer(Date)
         ) %>%
  rename(Net_worth = `Net worth`,
         Percentage = Category) %>%
  select(Date, Percentage, Assets, Net_worth) %>%
  group_by(Date, Percentage) %>%
  summarize(
    Assets = sum(Assets, na.rm = TRUE),
    Net_worth = sum(Net_worth, na.rm = TRUE))
  
  

line_chart_main_content <- mainPanel(
  plotlyOutput("linechart")
)

slider <- sliderInput(
  inputId = "date",
  label = "Year Range",
  min = min(line_data$Date),
  max = max(line_data$Date),
  value = c(min(line_data$Date),
            max(line_data$Date))
)

tab_panel_chart2 <- tabPanel(
  "Chart 2",
  tags$div(class = "chart_type", "Line Graph"),
  p("This is a line chart that illustrates the different
  wealth distribution from percentages."),
  sidebarLayout(
    sidebarPanel(slider),
    line_chart_main_content,
  ),
  tags$div(
    tags$br(),
    "We chose line chart to represent the different percentage
    and percentile categories.Since line charts are effective
    in explaining changes over time, which allows us to compare the
    wealth distribution pre-pendamic and post pendamic.  We also
    include the interactive select input to allow
      the user to choose which variable to display.
      We've noticed from the graphs, the the asset of high
    percentage groups did not get negative
    impact on their income level and wealth, in fact, they increased
    through out the pandemic. However, people below
    the 80 th percentile were highly affected. Though
    there were growth in
    their total assets, we should also consider
    inflation and other causes that affect overall price.
    The pandemic enlarged the income gap between the riches and the poor,
    and is something that we should keep in mind and be aware of. "
  )
)
