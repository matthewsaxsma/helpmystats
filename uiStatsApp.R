ui <- fluidPage(
  
  # Correlation
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
    min = 100,
    max = 1000,
    step = 100
  ),
  div(style="display: flex; justify-content: center;",plotOutput(
    outputId = "correlationplot",
    width = "500px",
    height = "500px"
  )),
  
  
  
  
  # Probablity, Odds, Log Odds
  selectInput(
    inputId = "xaxis",
    label = "X-axis:",
    choices = list("Probability", "Odds", "Log Odds")
  ),
  
  selectInput(
    inputId = "yaxis",
    label = "Y-axis:",
    choices = list("Probability", "Odds", "Log Odds")
  ),
  
  div(style="display: flex; justify-content: center",plotOutput(
    outputId = "oddsplot",
    width = "500px",
    height = "500px"
  )),
  
  
  
  
  # Logistic equation plot
  numericInput(
    inputId = "initialvalue",
    label = "Initial Value:",
    value = .5,
    min = 0,
    max = 1,
    step = 0.05
  ),
  
  numericInput(
    inputId = "controlparameter",
    value = 0.5,
    step = 0.05,
    label = "Control Parameter:",
    min = 0,
    max = 4
  ),
  
  numericInput(
    inputId = "time",
    label = "Length of Time",
    value = 100,
    step = 10,
    min = 10,
    max = 1000
  ),
  
  div(style="display:flex; justify-content: center",plotOutput(
    outputId = "logisticequationplot",
    height = "500px",
    hover = "plot_hover"
  )),
  verbatimTextOutput("info")
)
