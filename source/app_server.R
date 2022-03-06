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
    title <- paste0("Comparing ", input$x_var, " v.s. ", input$y_var)
    chart <- ggplot(chart_data) +
      geom_col(mapping = aes_string(x = input$x_var, y = input$y_var), 
               color = input$color
                 ) +
      labs(x = input$x_var, y = input$y_var, title = title) 
    chart
    intergraph <-  ggplotly(chart)
    intergraph
  })
  
  output$linechart <- renderPlotly({
    # title <- paste0("Comparing ", input$x_var, " v.s. ", input$y_var)
    # line_chart <- ggplot(chart_data) +
    #   geom_line(mapping = aes_string(x = input$x_var, y = input$y_var), 
    #            color = input$color
    #   ) + #scale_x_continuous(limits = year)
    #   labs(x = input$x_var, y = input$y_var, title = title) 
    # line_chart
    # intergraph2 <-  ggplotly(line_chart)
    # intergraph2
    
    fig <- plot_ly(
      data = chart_data,     
      x = ~input$x_var, 
      y = ~input$y_var, 
      color = ~Category, 
      type = "scatter", 
      mode = "lines" 
    ) %>% layout(
      title = "Wealth Distribution prior & during the Pandemic by Income Percentile Groups",
      xaxis = list(title = 'Date'), 
      yaxis = list(title = 'Assets') 
    )
    fig
  })

}




