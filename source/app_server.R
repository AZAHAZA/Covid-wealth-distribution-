#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(lintr)
library("tidyverse", warn.conflicts = FALSE)
library("plotly", warn.conflicts = FALSE)
library("leaflet", warn.conflicts = FALSE)
library("ggplot2", warn.conflicts = FALSE)
lint("app_server.R")

wealth_race <- read_csv("../data/dfa-race.csv",show_col_types = FALSE)


chart_data <- wealth_race %>%
  mutate(Date = gsub(":Q1|:Q2|:Q3|:Q4","",Date)) %>%
  select(Date, Category, Assets, `Net worth`) %>%
  group_by(Date, Category) %>%
  rename(Net_worth = `Net worth`) %>%
  summarise(
    Assets = sum(Assets, na.rm = TRUE),
    Net_worth = sum(Net_worth, na.rm = TRUE)
  )
server <- function(input, output) {
  output$barchart <- renderPlotly({
    title <- paste0("Comparing ", input$x_var, " v.s. ", input$y_var)
    chart <- ggplot(proportion) +
      geom_col(mapping = aes_string(x = input$x_var, y = input$y_var),
               color = input$color
                 ) +
      labs(x = input$x_var, y = input$y_var, title = title)
    chart
    intergraph <-  ggplotly(chart)
    intergraph
  })
}




