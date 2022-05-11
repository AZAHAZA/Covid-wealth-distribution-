# tab_panel_report

library(shiny)

tab_panel_report <-tabPanel(
  "Report",
  fluidRow(
    column(
      12,
      includeMarkdown("https://raw.githubusercontent.com/info-201a-wi22/final-project-starter-AZAHAZA/main/docs/report.md")
    )
  )
)
