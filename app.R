library(shiny)
library(dplyr)
library(tidyverse)
library(shinythemes)
library(plotly)
##Data
OpenData <-read.csv("data/Intl Students 1980-2019.csv", header = TRUE)
df <-data.frame(OpenData)
plot1<-df%>%
  gather(key, value, Enrolled, Total.US.Enroll)%>%
  ggplot(aes(x=Year, y=value, color=key))+
  geom_line()+
  geom_point()+
  labs(title="International Student Enrollment 1980-2019",
       subtitle="Total Enrollment in US Universities compared to International Student Enrollment",
       caption="Source: US Open Doors",
       x="Year",
       y="Number of Students Enrolled",
       color="Legend")+
  scale_y_log10()+
  scale_x_continuous(limits=c(1980, 2018), breaks=c(1980, 1985, 1990, 1995, 2000, 2005, 2010, 2015))+
  scale_color_discrete(labels=c("Total Intl Students Enrolled", "Total Univ. Enrollment in US"))
plot1+theme(legend.position = "none")

##ui interface
ui <- fluidPage(
  theme=shinytheme("superhero"),
  titlePanel("International Student Enrollment Statistics"),
  
  sidebarLayout(
    sidebarPanel(
      h3("Total International Students Enrolled in US Universities vs Total US University Enrollment"),
      p("The US has seen steady growth in the number of International Students enrolled in its universities until
        2016. The data show that the number has begun to decline in the last few years."),
      p("The graph represents the total enrollment numbers of international students in US universities compared 
        to the total enrollment of all students in US universities of each academic year beginning with the year 
        listed (e.g. 1980 encompasses Fall 1980-Spring/Summer 1981)."),
      h4(a("Source: US Open Doors", href="https://opendoorsdata.org/", target="_blank")),
      img(src="OpenDoors_image.jpg", height=200, width=300),
      h3("How to use this graph"),
      p("-Hover over the points in the graph to see its values"),
      p("-In the top right corner, there are options to view the data, such as viewing both sets of values at the same time, 
        and zooming"),
      p("-The red line represents the Total Enrollment of International Students"),
      p("-The blue line represents the Total Enrollment of all students")
    ),
      
    
    
    mainPanel(
                plotlyOutput("Graph1"))
    
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