library(shiny)
library(timevis)
source("data.r")
source("utils.r")

ui <- source("ui.R")
server <- source("server.r")

shinyApp(ui = ui$value, server = server$value)
