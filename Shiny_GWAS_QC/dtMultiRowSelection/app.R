#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(DT)

ui <- shinyUI(pageWithSidebar(
  headerPanel('Download Example'),
  sidebarPanel(
    downloadButton('downloadData', 'Download')
  ),
  mainPanel(
    fluidRow(
      column(
        6, h1('Client-side / Multiple selection'), hr(),
        DT::dataTableOutput('x12'),
        verbatimTextOutput('y12')
      )
    )
  )
))

# Define server logic required to draw a histogram
server <- shinyServer(function(input, output, session) {
    
    df = iris[, 1:3]
    options(DT.options = list(pageLength = 5))
    output$x12 = DT::renderDataTable(df, server = FALSE)
    output$y12 = renderPrint(input$x12_rows_selected)
    
    datasetInput <- reactive({
      input$x12_rows_selected
    })
    
    output$downloadData <- downloadHandler(
      filename = function() { paste("test", '.csv', sep='') },
      content = function(file) {
        write.csv(datasetInput, file)
      }
    )
})

# Run the application 
shinyApp(ui = ui, server = server)

