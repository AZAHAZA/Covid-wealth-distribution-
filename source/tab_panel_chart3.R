# tab_panel_chart3

library(shiny)
library(lintr)
library("tidyverse", warn.conflicts = FALSE)
library("plotly", warn.conflicts = FALSE)
library("leaflet", warn.conflicts = FALSE)
library("ggplot2", warn.conflicts = FALSE)

wealth_education_dist <-read.csv("../data/dfa-education.csv")

total_assets <- wealth_education_dist %>%
  select(Assets) %>%
  summarize(
    Assets = sum(Assets, na.rm = TRUE)
  ) %>%
  pull(Assets)

total_Net_worth <- wealth_education_dist %>%
  rename(Net_worth = Net.worth) %>%
  select(Net_worth) %>%
  summarize(
    Net_worth = sum(Net_worth, na.rm = TRUE)
  ) %>%
  pull(Net_worth)

# pie_data <- wealth_education_dist %>%
#   select(Category, Net.worth, Assets) %>%
#   rename(Education_Level = Category,
#          Net_worth = Net.worth ) %>%
#   group_by(Education_Level) %>%
#   summarize(
#     Net_Worth = sum(Net_worth, na.rm = TRUE), 
#     Assets = sum(Assets, na.rm = TRUE),
#     Prop_Assets = Assets / total_assets , 
#     Prop_Net_Worth = Net_Worth / total_Net_worth
#   )

pie_data <- wealth_education_dist %>%
  select(Category, Net.worth, Assets) %>%
  rename(Education_Level = Category,
         Net_worth = Net.worth ) 
# %>%
#   group_by(Education_Level) %>%
#   summarize(
#     Net_Worth = sum(Net_worth, na.rm = TRUE),
#     Assets = sum(Assets, na.rm = TRUE),
#     Prop_Assets = Assets / total_assets ,
#     Prop_Net_Worth = Net_Worth / total_Net_worth
#   )

select_values <- colnames(pie_data)

pie_chart_main_content <- mainPanel(
  plotlyOutput("piechart")
)

x_input <- selectInput(
  "xvar",
  label = "Variable",
  choices = select_values,
  #selected = "Race"
)

y_input <- selectInput(
  "yvar",
  label = "Variable",
  choices = select_values,
  #selected = "Race"
)

color_input <- selectInput(
  "colour",
  label = "Color",
  choices = list("Red" = "red", "cyan", "Blue" = "blue", "Violet" = "purple3")
)

# y_input <- selectInput(
#   "y_var",
#   label = "Y Variable",
#   choices = select_values,
#  # selected = "Assets"
# )



tab_panel_chart3 <-tabPanel(
    "Chart 3",
    p("."),
    sidebarLayout(
      sidebarPanel(x_input,
                   y_input, 
                   color_input
                   ),
      pie_chart_main_content
    ),

  )

