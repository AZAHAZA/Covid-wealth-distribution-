# tab_panel_summary

library(shiny)

tab_panel_summary <-tabPanel(
    "Summary",
    p("Our report chose to focus on the distribution of wealth within various groups the United States and the effects 
      COVID-19 had on this distribution.  Following our analysis, there were a number of key take aways.  The first comes from
      our clustered bar chart.  It is clear from the chart that at the beginning of the Pandemic, White Americans 
      controlled the majority of the wealth holding almost 5 times more wealth than other minority groups in America. 
      Following the pandemic that disparity jumped to 6 times.  The next key take away came from our pie chart.  
      The pie chart showed the distribution of wealth in America by level of education.  You can see that the majority of 
      wealth lies in the hands of the most educated.  Following the pandemic, this trend was only further promoted while the least
      educated people lost the most.  Finally, the last key take away comes from our line graph.  This graph shows the amount of
      wealth over time based on class.  From the graph it is clear that both the 80th to 99th percentile and the top 1 percent
      have a positive slope as the pandemic moves own while the 0 to 60th percentile have an almost flat slope.  This graph shows 
      the difference in rate of change of wealth between groups and it is clear that the wealthy are growing their wealth at a much
      greater rate than the poor.")
)

