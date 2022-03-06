# tab_panel_chart1
library(shiny)
 library(lintr)
 library("tidyverse", warn.conflicts = FALSE)
 library("plotly", warn.conflicts = FALSE)
 library("leaflet", warn.conflicts = FALSE)
 library("ggplot2", warn.conflicts = FALSE)
  lint("tab_panel_chart1.R")
  wealth_race <- read_csv("../data/dfa-race.csv",show_col_types = FALSE)


chart_data <- wealth_race %>%
  mutate(Date = gsub(":Q1|:Q2|:Q3|:Q4","",Date)) %>%
  select(Date, Category, Assets, `Net worth`, Liabilities) %>%
  group_by(Date, Category) %>%
  rename(Net_worth = `Net worth`) %>%
  summarise(
    Assets = sum(Assets, na.rm = TRUE),
    Net_worth = sum(Net_worth, na.rm = TRUE),
    Liabilities = sum(Liabilities, na.rm = TRUE)
  )
  
  # chart_data <- wealth_race %>%
  #   mutate(Date = gsub(":Q1|:Q2|:Q3|:Q4","",Date)) %>%
  #   select(Date, Category, Assets, `Net worth`, Liabilities) %>%
  #   filter(Date == min(year)) %>%
  #   group_by(Date, Category) %>%
  #   rename(Net_worth = `Net worth`) %>%
  #   summarise(
  #     Assets = sum(Assets, na.rm = TRUE),
  #     Net_worth = sum(Net_worth, na.rm = TRUE),
  #     Liabilities = sum(Liabilities, na.rm = TRUE)
  #   )

select_values <- colnames(chart_data)

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

year <- sliderInput(
  inputId = "Date",
  label = "Year", min = 1989, max = 2021, value = c(1989, 2021)
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
                   color_input,
                   year),
      clustered_bar_chart_main_content
    )

)

