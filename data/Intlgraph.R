library(shiny)
library(tidyverse)
library(grid)
OData <-("Intl Students 1980-2019.csv")
OpenData <-read.csv("Intl Students 1980-2019.csv", header = TRUE)
df <-data.frame(OpenData)
str (df)
df
class(df$Enrolled)
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

##sample
plot1
  
##plot2 JIC
plot2<-ggplot()+
    geom_line(data=df, aes(x=Year, y=Enrolled), color = "blue", size=1.5)+
    geom_line(data=df, aes(x=Year, y=Total.US.Enroll), color="red", size=1.5)+
    labs(title="International Student Enrollment 1980-2019",
         subtitle="Total Enrollment in US Universities compared to International Student Enrollment",
         caption="Source: US Open Doors",
         x="Year",
         y="Number of Students Enrolled")+
    scale_y_log10()+
    scale_x_manual

  