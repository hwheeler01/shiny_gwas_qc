

library(shiny)
library(DT)
#define UI logic
ui <- shinyUI(pageWithSidebar(
  headerPanel('Download Example'),
  sidebarPanel(
    fluidRow(
      p(class = 'text-center', downloadButton('x3', 'Download Filtered Data'))
    )
  ),
  mainPanel(
    fluidRow(
      column(
        6, h1('Client-side / Multiple selection'), hr(),
        DT::dataTableOutput('x12'),
        verbatimTextOutput('y12')
      ),
      column(6, plotOutput('x2', height = 500))
      
    )
  )
))

# Define server logic 
server <- shinyServer(function(input, output, session) {
  
  df = iris[, 1:2]
  #default number of results per page
  options(DT.options = list(pageLength = 25))
  #render table
  output$x12 = DT::renderDataTable(df, server = FALSE)
  #render # of selected row(S) (beneath table)
  output$y12 = renderPrint(input$x12_rows_selected)
  
  #a scatterplot with selected or searched points highlighted
  output$x2 = renderPlot({
    
    s1 = input$x12_rows_current  # rows on the current page
    s2 = input$x12_rows_all      # rows on all pages (after being filtered by search)
    s3 = input$x12_rows_selected # selected rows in data table (clicked)
    
    par(mar = c(4, 4, 1, .1))
    plot(df, pch = 21)
    
    # solid dots (pch = 19) for current page
    if (length(s1)) {
      points(df[s1, , drop = FALSE], pch = 19, cex = 2)
    }
    
    # show red circles when performing searching
    if (length(s2) > 0 && length(s2) < nrow(df)) {
      points(df[s2, , drop = FALSE], pch = 21, cex = 3, col = 'red')
    }
    if (length(s3) > 0 ){
      points(df[s3, , drop = FALSE], pch = 21, cex = 3, col = 'blue')
    }
    
    # dynamically change the legend text
    s = input$x12_search
    txt = if (is.null(s) || s == '') 'Filtered data' else {
      sprintf('Data matching "%s"', s)
    }

    
    legend(
      'topright', c('Original data', 'Data on current page', txt , 'Selected data'),
      pch = c(21, 19, 21 , 21), pt.cex = c(1, 2, 3, 4), col = c(1, 1, 2, 4),
      y.intersp = 2, bty = 'n'
    )
    
  })
  
  # download the filtered data (search results + clicked rows)
  output$x3 = downloadHandler('filtered_data.csv', content = function(file) {
    s = input$x12_rows_all
    write.csv(df[s, , drop = FALSE], file)
  })
  
})

# Run the application 
shinyApp(ui = ui, server = server)

