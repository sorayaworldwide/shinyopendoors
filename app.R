library(shiny)
library(dplyr)
library(tidyverse)
library(shinythemes)
library(plotly)

##ui interface
ui <- fluidPage(
  theme=shinytheme("superhero"),
  titlePanel("International Student Enrollment Statistics"),
  
  sidebarLayout(
    sidebarPanel(p("Hover over the graph to see its values")),
      mainPanel(plotlyOutput("Graph1"))
    )
  ) 

##server interface
server <- function(input, output) {
  output$Graph1<-renderPlotly({
    plot1
  })
  
  
  
}
##run app
shinyApp(ui, server)