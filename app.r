library(shiny)
library(timevis)
source("data.R")
source("utils.R")

ui <- source("ui.R")
server <- source("server.R")

shinyApp(ui = ui$value, server = server$value)
