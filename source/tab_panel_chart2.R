# tab_panel_chart1
library(shiny)
library(lintr)
library("tidyverse", warn.conflicts = FALSE)
library("plotly", warn.conflicts = FALSE)
library("leaflet", warn.conflicts = FALSE)
library("ggplot2", warn.conflicts = FALSE)
lint("tab_panel_chart2.R")

income_pcercentage <- read_csv("../data/dfa-income.csv")

total_assets <- income_pcercentage %>%
  select(Assets) %>%
  summarize(
    Assets = sum(Assets, na.rm = TRUE)
  ) %>%
  pull(Assets)

total_net_worth <- income_pcercentage %>%
  rename(Net_worth = `Net worth`) %>%
  select(Net_worth) %>%
  summarize(
    Net_worth = sum(Net_worth, na.rm = TRUE)
  ) %>%
  pull(Net_worth)

proportion <- income_pcercentage %>%
  select(Category, Assets, `Net worth`) %>%
  group_by(Category) %>%
  rename(Net_worth = `Net worth`,
         Percentage = Category
  ) %>%
  summarize(
    Assets = sum(Assets, na.rm = TRUE),
    Net_worth = sum(Net_worth, na.rm = TRUE)) %>%
  mutate(
    proportion_wealth = Assets / total_assets,
    proportion_Net_worth = Net_worth / total_net_worth
  )

select_values <- colnames(proportion)

bar_chart_main_content <- mainPanel(
  plotlyOutput("linechart")
)

x_input <- selectInput(
  "x_var",
  label = "X Variable",
  choices = select_values,
  selected = "Category"
)

y_input <- selectInput(
  "y_var",
  label = "Y Variable",
  choices = select_values,
  selected = "Assets"
)

color_input <- selectInput(
  "color",
  label = "Color",
  choices = list("Red" = "red", "cyan", "Blue" = "blue", "Violet" = "purple3")
)

tab_panel_chart2 <- tabPanel(
  "Chart 2",
  p("This is a line chart that illustrates the different wealth distribution from  
    percentages."),
  sidebarLayout(
    sidebarPanel(x_input,
                 y_input,
                 color_input),
    line_chart_main_content,
  ),
  tags$div(
    tags$br(),
    "We chose line chart to represent the different percentage and percentile categories.
    Since line charts are effective in explaining changes over time, which allows us to compare the 
    wealth distribution pre-pendamic and post pendamic.  We also include the interactive select input to allow
      the user to choose which variable to display. We've noticed from the graphs, the the asset of high
    percentage groups did not get negative impact on their income level and wealth, in fact, they increased
    through out the pandemic. However, people below the 80 th percentile were highly affected. Though there were growth in 
    their total assets, we should also consider inflation and other causes that affect overall price. The pandemic
    enlarged the income gap between the riches and the poor, and is something that we should keep
    in mind and be aware of. "
  )
)
