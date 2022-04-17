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

server <- function(input, output) {
  
  output$linechart <- renderPlotly({
    chart_title <- paste0("The Number of Worldwide Protests from 1990 to 2020")
    linechart <- trend_data %>%
      ggplot(aes(x = year, y = Protest)) +
      geom_line() +
      labs(x = "Year", y = "Number of Protest", title = chart_title) +
      scale_x_continuous(limits = input$date)
    intergraph1 <-  ggplotly(linechart)
    intergraph1
  })
  
  output$linechart1 <- renderPlotly({
    chart_title1 <- paste0("Police Brutality Data in the U.S. From 2015 to 2022")
    linechart1 <- multilinedata %>%
      ggplot(aes(x = date, y = population, group = Type, color = Type)) +
      geom_line() +
      labs(x = "Year", y = "Number of People Killed", title = chart_title1) 
    intergraph2 <-  ggplotly(linechart1)
    intergraph2
  })

  output$barchart <- renderPlotly({
    bar_title <- paste0("Health Impact of Using Chemical Irritants")
    barchart <- teargas %>%
      ggplot(aes(x = `Health issues categories`, y = population)) +
      geom_col() + coord_flip()+
      labs(x = "Health Issues Categories", y = "Population", title = bar_title)
    intergraph2 <-  ggplotly(barchart)
    intergraph2 
  })
  
  output$table <- renderTable(teargas_problem)
  output$table1 <- renderTable(teargas)
}




