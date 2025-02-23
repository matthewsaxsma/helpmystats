server <- function(input, output) {

  output$correlationplot <- renderPlot({
    set.seed(04172000)
    x <- rnorm(input$samplesize,0,1)
    x <- scale(x,center = TRUE,scale = TRUE)
    noise <- scale(rnorm(input$samplesize,0,1),center = TRUE, scale = TRUE)
    y <- input$correlation*x + sqrt(1 - (input$correlation)^2)*noise
    y <- scale(y,center = TRUE, scale = TRUE)
    plot(
      x,
      y,
      xlim=c(-3,3),
      ylim=c(-3,3),
      main = paste("Correlation =", round(cor(x,y),3)),
      pch=20,
      bty = "n"
      )
    abline(
      lm(y ~ x),
      lty=2,
      lwd=2,
      col="darkgray"
      )
  })
  
  prob = runif(250, min = 0, max = 1)
  odds = prob / (1 - prob)
  logodds = log(odds)
  
  output$oddsplot <- renderPlot({
    if (input$xaxis == "Probability") {
      x = prob
    }
    if (input$yaxis == "Probability") {
      y = prob
    }
    if (input$xaxis == "Odds") {
      x = odds
    }
    if (input$yaxis == "Odds") {
      y = odds
    }
    if (input$xaxis == "Log Odds") {
      x = logodds
    }
    if (input$yaxis == "Log Odds") {
      y = logodds
    }
    plot(
      x = sort(x),
      y = sort(y),
      main = c(input$yaxis, "vs", input$xaxis),
      xlab = input$xaxis,
      ylab = input$yaxis,
      type = "l",
      lwd = 2,
      col = "darkgray"
    )
  })
  
  output$logisticequationplot <- renderPlot({
    init = input$initialvalue
    time = seq(0, input$time, 1)
    x = c(init, numeric(length(time) - 2))
    R = input$controlparameter
    
    plot(
      NA,
      lwd = 2,
      cex = 0.4,
      xlim = c(0, input$time + 10),
      ylim = c(0, 1),
      yaxt = "n",
      ylab = "X_t",
      xlab = "time",
      bty = "l"
    )
    axis(2, at = seq(0, 1, .1), las = 1)
    
    for (t in (time + 1)) {
      if (t + 1 <= length(time)) {
        x[t + 1] = R * x[t] * (1 - x[t])
      }
    }
    points(time,
           x,
           pch = 21,
           col = "red",
           cex = 0.5)
    lines(time, x, lty = 2, col = "red")
    text(
      x = input$time + 5,
      y = x[input$time],
      paste("R =", R),
      col = "red",
      cex = 1.5
    )
  })
}








