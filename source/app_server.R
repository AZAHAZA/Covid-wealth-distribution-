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
  output$barchart <- renderPlotly({
    title <- paste0("Wealth Distribution by ",
                    input$x_var, " and ", input$y_var)
    chart <- ggplot(proportion) +
      geom_col(mapping = aes_string(x = input$x_var, y = input$y_var),
               color = input$color
                 ) +
      labs(x = input$x_var, y = input$y_var, title = title)
    chart
    intergraph <-  ggplotly(chart)
    intergraph
  })

  output$boxplot <- renderPlotly({
    titlechart <- paste0("Data Distribution between ",
                            input$xvar, " and ",
                            input$yvar)
    boxplot <- ggplot(data = box_data) +
      geom_boxplot(mapping = aes_string(x = input$xvar, y = input$yvar),
               color = input$colour) +
      labs(x = input$xvar, y = input$yvar, title = titlechart)
    intergraph1 <-  ggplotly(boxplot)
    intergraph1
  })

  output$linechart <- renderPlotly({
    chart_title <- paste0("Wealth Distribution prior & during the Pandemic by Income Percentile Groups")
    linechart <- line_data %>%
      ggplot(aes(x = Date, y = Assets, group = Percentage, color = Percentage)) +
      geom_line() +
         labs(x = "Year", y = "Assets", title = chart_title) +
        scale_x_continuous(limits = input$date)
    intergraph2 <-  ggplotly(linechart)
    intergraph2
  })
}
