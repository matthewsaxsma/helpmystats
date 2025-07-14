server <- function(input, output) {
  set.seed(04172000)
  
  output$normal_distribution <- renderPlot({
    tmp <- rnorm(n = input$samplesize,
                 mean = input$mean,
                 sd = input$sd)
    hist(
      tmp,
      xlim = c(-15,
               15),
      bty = "n",
      main = paste("Normal Random Variable",
                   "\nMean:", input$mean,
                   "\nSD:", input$sd),
      col = "lightblue",
      breaks = input$samplesize / 10
      )
  })
  
  output$correlationplot <- renderPlot({
    tmp <- MASS::mvrnorm(n = input$samplesize,
                         mu = c(0,0),
                         Sigma = matrix(c(1,input$correlation,
                                          input$correlation, 1),
                                        nrow = 2),
                         empirical = TRUE)
    x <- tmp[,1]
    y <- tmp[,2]
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
}








