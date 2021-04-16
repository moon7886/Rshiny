library(shiny)
# runExample("01_hello")
library(data.table)
library(tidyr)
library(tidyverse)
library(maps)
library(mapproj)
setwd('/Users/MoonSJung/Documents/code/R/shiny/cencus_app')
source("helpers.R")
counties <- readRDS("data/counties.rds")
# percent_map(counties$white, "darkgreen", "% White")

ui <- fluidPage(
  titlePanel("CensusVis"),
  
  sidebarLayout(
    # position = 'left',
    sidebarPanel(      
      helpText('Create demogrpahics'),
      
     selectInput('var','Choose a variable to display',
     choices = list('Percent White','Percent Black','Percent Asian','Percent Hispanic'),
     selected = "Percent White"),
     
     sliderInput('range','range of interest',
                 min = 0, max = 100, step = 10, value = c(0,100)
                 )
    ),
    mainPanel(
      textOutput("selected_var"),
      textOutput("min_max"),
      plotOutput("map_display")
      
    )
                       
  )
)

server <- function(input, output){
  output$selected_var <- renderText({
    paste0("you have selected this",input$var)
  })
  output$min_max <- renderText({
    paste0("max = ",input$range[1],", min = ", input$range[2])
  })
  output$map_display <- renderPlot({
    data <- switch(input$var, 
                   "Percent White" = counties$white,
                   "Percent Black" = counties$black,
                   "Percent Hispanic" = counties$hispanic,
                   "Percent Asian" = counties$asian)
    
    color <- switch(input$var, 
                    "Percent White" = "darkgreen",
                    "Percent Black" = "black",
                    "Percent Hispanic" = "darkorange",
                    "Percent Asian" = "darkviolet")
    
    legend <- switch(input$var, 
                     "Percent White" = "% White",
                     "Percent Black" = "% Black",
                     "Percent Hispanic" = "% Hispanic",
                     "Percent Asian" = "% Asian")
    
    percent_map(data, color, legend, input$range[1], input$range[2])
  })
}



shinyApp(ui = ui, server = server)