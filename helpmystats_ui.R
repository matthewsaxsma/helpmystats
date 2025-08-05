source("www/content.R", local = TRUE)
ui <- page_navbar(
  includeCSS("www/main.css"),
  title = tags$b("helpmystats."),
  id = "page",
  # bootswatch_themes() for list of themes
  theme = bs_theme(bootswatch = "minty"),

  nav_panel(
    title = "Random Variables, Statistics",
    div(
      class = "paragraph-text",
      HTML(content_random_variables1)
    ),
    div(
      class = "image-div",
      img(
        style = "width: 400px; height: auto; margin: 0 auto; display: block;",
        src = "images/sample_space.png"
      )
    ),
    div(
      class = "paragraph-text",
      HTML(content_random_variables2)
    ),
    div(
      class = "image-div",
      img(
        style = "width: 400px; height: auto; margin: 0 auto; display: block;",
        src = "images/sum_sample_space.png"
      )
    ),
    div(
      class = "paragraph-text",
      HTML(content_random_variables3)
    ),
    div(
      class = "image-div",
      img(
        style = "width: 400px; height: auto; margin: 0 auto; display: block;",
        src = "images/tdss_bp.png"
      )
    ),
    div(
      class = "paragraph-text",
      HTML(content_statistics1)
    ),
    div(
      class = "image-div",
      img(
        style = "width: 400px; height: auto; margin: 0 auto; display: block;",
        src = "images/ev.png"
      )
    )
  ),
  nav_panel(
    title = "Distributions",
    div(
      class = "paragraph-text",
      HTML(content_normal)
    ),
    div(
      class = "image-div",
      img(
        style = "width: 65%; height: auto; margin: 0 auto; display: block;",
        src = "images/std_normal.png"
      ),
    ),
    div(
      class = "paragraph-text",
      HTML(content_chisq)
    ),
    div(
      class = "image-div",
      img(
        style = "width: 65%; height: auto; margin: 0 auto; display: block;",
        src = "images/chisq.png"
      )
    )
  ),

  nav_panel(
    title = "Sampling Estimates",
    div(
      class = "paragraph-text",
      HTML(content_sample_est)
    ),
    div(
      class = "button-row",
      numericInput(
        inputId = "samplesize",
        label = "Sample Size",
        value = 25,
        min = 0,
        max = 10000,
        step = 25
      ),
      numericInput(
        inputId = "mean",
        label = "Mean",
        value = 0,
        min = -15,
        max = 15,
        step = 0.5
      ),
      numericInput(
        inputId = "sd",
        label = "Standard Deviation",
        value = 1,
        min = 0,
        max = 1000,
        step = 0.1
      )
    ),
    div(
      style = "display: flex;
               justify-content: center;
               border: none",
      plotOutput(
        outputId = "normal_distribution",
        width = "75%",
        height = "400px"
      )
    )
  ),

  # Correlation
  {nav_panel(
    title = "Correlation",
    navlistPanel(
      "Table of Contents",  # Sidebar title
      widths = c(3, 9),
      tabPanel(
        title = "Introduction",
        card(
          h3("Introduction"),
          p("This is the introduction text for the textbook."),
          numericInput(
            inputId = "correlation",
            label = "What correlation would you like to see?",
            value = 0,
            min = -1,
            max = 1,
            step = 0.1
          ),
          numericInput(
            inputId = "samplesize",
            label = "What sample size would you like to see?",
            value = 100,
            min = 25,
            max = 1000,
            step = 25
          ),
          plotOutput(
            outputId = "correlationplot",
            width = "500px",
            height = "500px"
          )
        )
      ),
      tabPanel(
        title = "Chapter 1", 
        h3("Chapter 1"),
        p("This chapter covers the basics of Shiny applications.")
      ),
      tabPanel(
        title = "Chapter 2", 
        h3("Chapter 2"),
        p("This chapter discusses advanced techniques in Shiny.")
      )
    )
  )}
)
