library(shiny)
# runExample("01_hello")
library(data.table)
library(tidyr)
library(tidyverse)


ui <- fluidPage(
  titlePanel("My shiny App"),
  
  sidebarLayout(
    # position = 'left',
    sidebarPanel(
      h1('Installation'),
      p('Shiny is available on CRAN,
        so you can install it in the usual way from R consol:'),
      br(),
      
      code('install.pacakges("shiny")',align = 'center'),
      img(src = "Rstudio.png", height = 140, width = 400),
      br(),
      'shiny is product of ',
      span("RStudio", style = "color:blue")
    ),
    
    
    mainPanel(
      h1('Introducing Shiny'),
      p('shiny is a new package from Rstudio that makes it ',
        em('incredbily easy'),' to build interactive web application with R'),
      br(),
      br(),
      p('For an introduction and live examples, visit the ',a('shiny hompage'
                                                              ,href = "http://shiny.rstudio.com")),
      br(),
      br(),
      h2('Features'),
      p('-Build useful web applications with few lines of code'),
      br(),
      p("-Shiny applications are automatically 'live' in the same way that ", strong('spreadsheets'),
        'are live. Outputs change instantly as users modify inputs, without a reload of webpage')
    )
    
  )
)



server <- function(input, output){}



shinyApp(ui = ui, server = server)