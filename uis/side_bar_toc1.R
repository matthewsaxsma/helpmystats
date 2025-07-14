ui <- fluidPage(
  navlistPanel(
    "Table of Contents",  # Sidebar title
    tabPanel("Introduction", 
             h3("Introduction"),
             p("This is the introduction text for the textbook.")
    ),
    tabPanel("Chapter 1", 
             h3("Chapter 1"),
             p("This chapter covers the basics of Shiny applications.")
    ),
    tabPanel("Chapter 2", 
             h3("Chapter 2"),
             p("This chapter discusses advanced techniques in Shiny.")
    )
  )
)

server <- function(input, output, session) {}

shinyApp(ui, server)