#http://shiny.rstudio.com/reference/shiny/latest/renderDataTable.html
#https://yihui.shinyapps.io/DT-selection/
#https://rstudio.github.io/DT/shiny.html
if (interactive()) {
  # # table example
  # shinyApp(
  #   ui = fluidPage(
  #     fluidRow(
  #       column(12,
  #              tableOutput('table')
  #       )
  #     )
  #   ),
  #   server = function(input, output) {
  #     output$table <- renderTable(iris)
  #   }
  # )
  
  
  # DataTables example
  shinyApp(
    ui = fluidPage(
      fluidRow(
        column(12,
               dataTableOutput('table')
        )
      )
    ),
    server = function(input, output) {
      output$table <- renderDataTable(iris)
    }
  )
}
