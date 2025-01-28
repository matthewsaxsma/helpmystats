server <- function(input, output) {

  output$correlationplot <- renderPlot({
    xdat = function() {
      # data generation function
      dat <- mvrnorm(
        input$samplesize,
        mu = c(0, 0),
        Sigma = matrix(c(
          1, input$correlation, input$correlation, 1
        ), nrow = 2),
        empirical = TRUE
      )
      x = dat[, 1]
      y = dat[, 2]
      plot(
        x,
        y,
        xlim = c(-3, 3),
        ylim = c(-3, 3),
        main = paste("Correlation = ", input$correlation),
        pch = 20,
      )
      abline(lm(y ~ x),
             lty = 2,
             lwd = 2,
             col = "red")
    }
    xdat() # generate the data and plot
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
      col = "red"
    )
    
    
    
    
    #   N = 250
    #   prob = runif(N,min = 0, max = 1)
    #   odds = prob / (1 - prob)
    #   logodds = log(odds)
    #
    #   pp <- function(){
    #             if(input$xaxis == "Probability"){x = prob}
    #             if(input$xaxis == "Odds"){x = odds}
    #             if(input$xaxis == "Log Odds"){x = logodds}
    #
    #             if(input$yaxis == "Probability"){y = prob}
    #             if(input$yaxis == "Odds"){y = odds}
    #             if(input$yaxis == "Log Odds"){y = logodds}
    #
    #             plot(x,y,
    #                  main = c(input$yaxis, "vs", input$xaxis),
    #                  xlab = input$xaxis,
    #                  ylab = input$yaxis)
    #             lines(x=x,y=y)
    #           }
    #   pp()
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
    
    # lines(c(0,10), c(init,init), lty = 2,lwd = 2)
    
    
  })
  
  output$info <- renderText({
    xy_str <- function(e) {
      if (is.null(e))
        return("NULL\n")
      paste0("time = ", round(e$x, 0), " X_t = ", round(e$y, 1), "\n")
    }
    xy_range_str <- function(e) {
      if (is.null(e))
        return("NULL\n")
      paste0(
        "x min = ",
        round(e$xmin, 1),
        "x max = ",
        round(e$xmax, 1),
        "y min = ",
        round(e$ymin, 1),
        "y = max ",
        round(e$ymax, 1)
      )
    }
    
    paste0("hover: ", xy_str(input$plot_hover))
    
    
  })
  
}








