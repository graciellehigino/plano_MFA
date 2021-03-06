function(input, output, session) {
  output$timelineBasic <- renderTimevis({
    timevis(data)
  })

  output$timelineWC <- renderTimevis({
    timevis(dataWC)
  })

  output$timelineGroups <- renderTimevis({
    timevis(data = timevisData, groups = timevisDataGroups, options = list(editable = TRUE))
  })

  output$timelineCustom <- renderTimevis({
    config <- list(
      editable = TRUE,
      align = "center",
      orientation = "top",
      snap = NULL,
      margin = list(item = 30, axis = 50)
    )
    timevis(data, zoomFactor = 1, options = config)
  })

  output$timelineInteractive <- renderTimevis({
    config <- list(
      editable = TRUE,
      multiselect = TRUE
    )
    timevis(data, options = config)
  })

  output$visible <- renderText(
    paste(input$timelineInteractive_visible, collapse = " ")
  )
  output$selected <- renderText(
    paste(input$timelineInteractive_selected, collapse = " ")
  )
  output$window <- renderText(
    paste(prettyDate(input$timelineInteractive_window[1]),
          "to",
          prettyDate(input$timelineInteractive_window[2]))
  )
  output$table <- renderTable({
    data <- input$timelineInteractive_data
    data$start <- prettyDate(data$start)
    if (!is.null(data$end)) {
      data$end <- prettyDate(data$end)
    }
    data
  })
  output$selectIdsOutput <- renderUI({
    selectInput("selectIds", tags$h4("Select items:"), input$timelineInteractive_ids,
                multiple = TRUE)
  })
  output$removeIdsOutput <- renderUI({
    selectInput("removeIds", tags$h4("Remove item"), input$timelineInteractive_ids)
  })

  observeEvent(input$fit, {
    fitWindow("timelineInteractive")
  })
  observeEvent(input$setWindowAnim, {
    setWindow("timelineInteractive", "2022-08-07", "2022-08-25")
  })
  observeEvent(input$setWindowNoAnim, {
    setWindow("timelineInteractive", "2022-08-07", "2022-08-25",
              options = list(animation = FALSE))
  })
  observeEvent(input$center, {
    centerTime("timelineInteractive", "2022-08-13")
  })
  observeEvent(input$focus2, {
    centerItem("timelineInteractive", 4)
  })
  observeEvent(input$focusSelection, {
    centerItem("timelineInteractive", input$timelineInteractive_selected)
  })
  observeEvent(input$selectItems, {
    setSelection("timelineInteractive", input$selectIds,
                 options = list(focus = input$selectFocus))
  })
  observeEvent(input$addBtn, {
    addItem("timelineInteractive",
            data = list(id = randomID(),
                        content = input$addText,
                        start = input$addDate))
  })
  observeEvent(input$removeItem, {
    removeItem("timelineInteractive", input$removeIds)
  })
  observeEvent(input$addTime, {
    addCustomTime("timelineInteractive", "2022-08-01", randomID())
  })
}