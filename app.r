library(shiny)
library(timevis)
source("data.R")
ui <- source("ui.R")
server <- source("server.R")

ui <- fluidPage(
  timevisOutput("mytime"),
  actionButton("btn", "Add item and center")
)

server <- function(input, output, session) {
  output$mytime <- renderTimevis(timevis(data))
  observeEvent(input$btn, {
    addItem("mytime", list(id = "admission", content = "one", start = "2022-08-01"))
    centerItem("mytime", "admission")
  })
}

shinyApp(ui = ui$value, server = server$value)

shinyApp(ui = ui, server = server)

