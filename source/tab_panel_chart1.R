# tab_panel_chart1
library(shiny)
 library(lintr)
 library("tidyverse", warn.conflicts = FALSE)
 library("plotly", warn.conflicts = FALSE)
 library("leaflet", warn.conflicts = FALSE)
 library("ggplot2", warn.conflicts = FALSE)
  lint("tab_panel_chart1.R")
  wealth_race <- read_csv("../data/dfa-race.csv",show_col_types = FALSE)


  proportion <- wealth_race %>%
    select(Category, Assets, `Net worth`) %>%
    group_by(Category) %>%
    rename(Net_worth = `Net worth`) %>%
    summarize(
      Assets = sum(Assets, na.rm = TRUE),
      Net_worth = sum(Net_worth, na.rm = TRUE)) %>%
    mutate(
      proportion_wealth = Assets / total_assets,
      proportion_Net_worth = Net_worth / total_Net_worth
    ) 
  
  total_assets <- wealth_race %>%
    select(Assets) %>%
    summarize(
      Assets = sum(Assets, na.rm = TRUE)
    ) %>%
    pull(Assets)
  
  total_Net_worth <- wealth_race %>%
    rename(Net_worth = `Net worth`) %>%
    select(Net_worth) %>%
    summarize(
      Net_worth = sum(Net_worth, na.rm = TRUE)
    ) %>%
    pull(Net_worth)
    
select_values <- colnames(proportion)

clustered_bar_chart_main_content <- mainPanel(
  plotlyOutput("barchart")
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

tab_panel_chart1 <-tabPanel(
    "Chart 1",
    p("This is chart 1."),
    sidebarLayout(
      sidebarPanel(x_input,
                   y_input,
                   color_input),
      clustered_bar_chart_main_content
    )
)

