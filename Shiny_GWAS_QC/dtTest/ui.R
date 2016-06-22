library(shiny)

shinyApp(
  
  # title = 'DT Selection',
  # 
  # tabPanel(
  #   'Row',
    fluidRow(
      # column(
      #   6, h1('Client-side / Single selection'), hr(),
      #   DT::dataTableOutput('x11'),
      #   verbatimTextOutput('y11')
      # ),
      column(
        6, h1('Client-side / Multiple selection'), hr(),
        DT::dataTableOutput('x12'),
        verbatimTextOutput('y12')
      )
    )
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
)
    # ),
    # fluidRow(
    #   column(
    #     6, h1('Server-side / Single selection'), hr(),
    #     DT::dataTableOutput('x13'),
    #     verbatimTextOutput('y13')
    #   ),
    #   column(
    #     6, h1('Server-side / Multiple selection'), hr(),
    #     DT::dataTableOutput('x14'),
    #     verbatimTextOutput('y14')
    #   )
    # ),
    # fluidRow(
    #   column(
    #     6, h1('Client-side / Pre-selection'), hr(),
    #     DT::dataTableOutput('x15'),
    #     verbatimTextOutput('y15')
    #   ),
    #   column(
    #     6, h1('Server-side / Pre-selection'), hr(),
    #     DT::dataTableOutput('x16'),
    #     verbatimTextOutput('y16')
    #   )
    # )
  )
  
  # tabPanel(
  #   'Column',
  #   fluidRow(
  #     column(
  #       6, h1('Client-side / Single selection'), hr(),
  #       DT::dataTableOutput('x21'),
  #       verbatimTextOutput('y21')
  #     ),
  #     column(
  #       6, h1('Client-side / Multiple selection'), hr(),
  #       DT::dataTableOutput('x22'),
  #       verbatimTextOutput('y22')
  #     )
  #   ),
  #   fluidRow(
  #     column(
  #       6, h1('Server-side / Single selection'), hr(),
  #       DT::dataTableOutput('x23'),
  #       verbatimTextOutput('y23')
  #     ),
  #     column(
  #       6, h1('Server-side / Multiple selection'), hr(),
  #       DT::dataTableOutput('x24'),
  #       verbatimTextOutput('y24')
  #     )
  #   ),
  #   fluidRow(
  #     column(
  #       6, h1('Client-side / Pre-selection'), hr(),
  #       DT::dataTableOutput('x25'),
  #       verbatimTextOutput('y25')
  #     ),
  #     column(
  #       6, h1('Server-side / Pre-selection'), hr(),
  #       DT::dataTableOutput('x26'),
  #       verbatimTextOutput('y26')
  #     )
  #   )
  # ),
  # 
  # tabPanel(
  #   'Cell',
  #   fluidRow(
  #     column(
  #       6, h1('Client-side / Single selection'), hr(),
  #       DT::dataTableOutput('x31'),
  #       verbatimTextOutput('y31')
  #     ),
  #     column(
  #       6, h1('Client-side / Multiple selection'), hr(),
  #       DT::dataTableOutput('x32'),
  #       verbatimTextOutput('y32')
  #     )
  #   ),
  #   fluidRow(
  #     column(
  #       6, h1('Server-side / Single selection'), hr(),
  #       DT::dataTableOutput('x33'),
  #       verbatimTextOutput('y33')
  #     ),
  #     column(
  #       6, h1('Server-side / Multiple selection'), hr(),
  #       DT::dataTableOutput('x34'),
  #       verbatimTextOutput('y34')
  #     )
  #   ),
  #   fluidRow(
  #     column(
  #       6, h1('Client-side / Pre-selection'), hr(),
  #       DT::dataTableOutput('x35'),
  #       verbatimTextOutput('y35')
  #     ),
  #     column(
  #       6, h1('Server-side / Pre-selection'), hr(),
  #       DT::dataTableOutput('x36'),
  #       verbatimTextOutput('y36')
  #     )
  #   )
  # ),
  # 
  # tabPanel(
  #   'Row+Column',
  #   fluidRow(
  #     column(
  #       6, h1('Client-side / Single selection'), hr(),
  #       DT::dataTableOutput('x41'),
  #       verbatimTextOutput('y41')
  #     ),
  #     column(
  #       6, h1('Client-side / Multiple selection'), hr(),
  #       DT::dataTableOutput('x42'),
  #       verbatimTextOutput('y42')
  #     )
  #   ),
  #   fluidRow(
  #     column(
  #       6, h1('Server-side / Single selection'), hr(),
  #       DT::dataTableOutput('x43'),
  #       verbatimTextOutput('y43')
  #     ),
  #     column(
  #       6, h1('Server-side / Multiple selection'), hr(),
  #       DT::dataTableOutput('x44'),
  #       verbatimTextOutput('y44')
  #     )
  #   ),
  #   fluidRow(
  #     column(
  #       6, h1('Client-side / Pre-selection'), hr(),
  #       DT::dataTableOutput('x45'),
  #       verbatimTextOutput('y45')
  #     ),
  #     column(
  #       6, h1('Server-side / Pre-selection'), hr(),
  #       DT::dataTableOutput('x46'),
  #       verbatimTextOutput('y46')
  #     )
  #   ),
  #   fluidRow(
  #     column(
  #       6, h1('Client-side / Custom Table Container'), hr(),
  #       DT::dataTableOutput('x47'),
  #       verbatimTextOutput('y47')
  #     ),
  #     column(
  #       6, h1('Server-side / Custom Table Container'), hr(),
  #       DT::dataTableOutput('x48'),
  #       verbatimTextOutput('y48')
  #     )
  #   )
  # ),
  # 
#   tabPanel(
#     'None',
#     fluidRow(
#       column(6, h1('Client-side'), hr(), DT::dataTableOutput('x51')),
#       column(6, h1('Server-side'), hr(), DT::dataTableOutput('x52'))
#     )
#   )
# 
# )