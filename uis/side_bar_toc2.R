library(shiny)

ui <- fluidPage(
  layout_sidebar(
    sidebar = sidebar(
      actionLink("tab1", "Introduction"),
      actionLink("tab2", "Chapter 1"),
      actionLink("tab3", "Chapter 2")
    ),
    mainPanel(
      tabsetPanel(
        id = "tabs",  # Add an ID to control the active tab dynamically
        tabPanel("Introduction", 
                 h3("Introduction"),
                 p("This is the introduction text.")
        ),
        tabPanel("Chapter 1", 
                 h3("Chapter 1"),
                 p("Content for Chapter 1.")
        ),
        tabPanel("Chapter 2", 
                 h3("Chapter 2"),
                 p("Content for Chapter 2.")
        )
      )
    )
  )
)

server <- function(input, output, session) {
  observeEvent(input$tab1, {
    updateTabsetPanel(session, "tabs", selected = "Introduction")
  })
  observeEvent(input$tab2, {
    updateTabsetPanel(session, "tabs", selected = "Chapter 1")
  })
  observeEvent(input$tab3, {
    updateTabsetPanel(session, "tabs", selected = "Chapter 2")
  })
}

shinyApp(ui, server)