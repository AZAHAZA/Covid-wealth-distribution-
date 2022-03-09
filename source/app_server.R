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



server <- function(input, output) {
  output$barchart <- renderPlotly({
    title <- paste0("Wealth Distribution by ", input$x_var, " and ", input$y_var)
    chart <- ggplot(proportion) +
      geom_col(mapping = aes_string(x = input$x_var, y = input$y_var),
               color = input$color
                 ) +
      labs(x = input$x_var, y = input$y_var, title = title)
    chart
    intergraph <-  ggplotly(chart)
    intergraph
  })
  
  output$piechart <- renderPlotly({
    pie_chart <- ggplot(data = pie_data) +
      geom_boxplot(mapping = aes_string(x = input$xvar, y = input$yvar),
               color = input$colour)
    intergraph1 <-  ggplotly(pie_chart)
    intergraph1
  })
}

# ggplot(data, aes(x="", y=value, fill=group)) +
#   geom_bar(stat="identity", width=1) +
#   coord_polar("y", start=0)
# 
# 
# 
# title <- paste0("Wealth Distribution by ", " and ", input$var)
# pie_chart <- ggplot(pie_data) +
#   geom_col(mapping = aes_string(x = "", y = input$var), 
#            fill = pie_data$Education_Level )+
#   coord_polar(theta = "y")
# 
