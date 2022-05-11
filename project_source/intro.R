# tab_panel_intro

library(shiny)
intro <-tabPanel(
    "Introduction",
    includeCSS("Project_CSS_styles.css"),
    tags$div(class = "header", "The Health Impact of Using Tear Gas as Crowd-Control Weapon"),
    HTML('<center><img src="https://github.com/mattschcs/project-teargas-/blob/main/project_source/pic.jpeg?raw=true"></center>'),
    tags$div(
      tags$br(),
      "Freedom of assembly, the right to hold protests or meetings in public where people advocate and defend their collective idea, is often recognized as a human right. 
      As the number of worldwide protests keeps rising, 
      the use of crowd control weapons by law enforcement has become a concern whether it has a significant health impact on the individual. 
      According to ", a("The New York Times", href = "https://www.nytimes.com/interactive/2020/06/16/us/george-floyd-protests-police-tear-gas.html"),", ", 
      a("at least 100 law enforcement fired tear gas on protestors during the BLM movement", href = "https://www.pewtrusts.org/en/research-and-analysis/blogs/stateline/2020/08/04/tear-gas-bans-a-policing-change-not-gaining-traction")," 
      and ", a("the law enforcement in Hong Kong has fired over 10,000 tear gas since the Hong Kong protests.", href = "https://time.com/5743663/tear-gas-hong-kong/")," This project intends to analyze the health impact of law enforcement overusing crowd control weapons and advocate 
      for banning tear gas as crowd control weapons. "
    )
)


