library(shiny)
library(DT)

shinyServer(function(input, output, session) {
  
  df = iris[, 1:3]
  options(DT.options = list(pageLength = 5))
  
  # row selection
  output$x11 = DT::renderDataTable(df, server = FALSE, selection = 'single')
  output$y11 = renderPrint(input$x11_rows_selected)
  
  output$x12 = DT::renderDataTable(df, server = FALSE)
  output$y12 = renderPrint(input$x12_rows_selected)
  
  output$x13 = DT::renderDataTable(df, selection = 'single')
  output$y13 = renderPrint(input$x13_rows_selected)
  
  output$x14 = DT::renderDataTable(df)
  output$y14 = renderPrint(input$x14_rows_selected)
  
  output$x15 = DT::renderDataTable(
    df, server = FALSE, selection = list(selected = c(1, 3, 4, 6, 9))
  )
  output$y15 = renderPrint(input$x15_rows_selected)
  
  output$x16 = DT::renderDataTable(
    df, selection = list(selected = c(1, 3, 4, 6, 9))
  )
  output$y16 = renderPrint(input$x16_rows_selected)
})