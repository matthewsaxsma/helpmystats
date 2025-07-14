content_norm <- "<p>One of the most widely used and important distributions in statistics is the normal distribution.
The distribution of a normal random variable is defined with two parameters: the mean, and the standard deviation.<br><br>
The mean is the center of the distribution. It is the value the distribution is centered on.
It is typically represented with a \u03bc.<br><br>
The standard deviaton quantifies how wide the distribution is.
It is typically represented with a \u03c3. A normal distribution with \u03bc = 0 and \u03c3 = 1 is called a standard normal distribution.</p>"


content_sample_est <- "<p>Distributions like the normal distribution are theoretical entities. This means we cannot know the true parameter values given a finite set of data.<br><br>
However, we can estimate them using special methods. These methods include 'maximum likelihood' and 'method of moments'. We will come back to these terms in a later section.<br><br>
For now, just know that we can often estimate the expected value of a distribution (like the mean of a normal distribution) by adding up our observations and dividing by the number of observations we have.</p> 
"


content_sampling_dist <- ""

ui <- page_navbar(
  
  includeCSS("www/main.css"),
  title = tags$b("helpmystats."),
  id = "page",
  theme = bs_theme(bootswatch = "minty"), # bootswatch_themes() for list of themes
  nav_panel(
    title = "Random Variables",
    div(style = "width: 60%; margin: 0 auto; text-align: left;",
        HTML(content_norm)),
    div(class = "flex-row",
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
        )
      ),
  
  nav_panel(
    title = "Sampling Estimates",
    div(style = "width: 60%; margin: 0 auto;",
        HTML(content_sample_est)),
    div(
      style = "display: flex;
               justify-content: center;",
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
      widths = c(3,9),
      tabPanel(title = "Introduction", 
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
      tabPanel(title = "Chapter 1", 
               h3("Chapter 1"),
               p("This chapter covers the basics of Shiny applications.")
      ),
      tabPanel(title = "Chapter 2", 
               h3("Chapter 2"),
               p("This chapter discusses advanced techniques in Shiny.")
      )
    )
  )}
  
  
)
