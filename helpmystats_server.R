server <- function(input, output) {
  set.seed(417)
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


# Correlation -------------------------------------------------------------

  
  output$correlationplot <- renderPlot({
    set.seed(04172000)
    tmp <- MASS::mvrnorm(n = input$samplesize,
                         mu = c(0, 0),
                         Sigma = matrix(c(1, input$correlation,
                                          input$correlation, 1),
                                        nrow = 2),
                         empirical = TRUE)
    x <- tmp[, 1]
    y <- tmp[, 2]
    plot(
      x,
      y,
      xlim = c(-3, 3),
      ylim = c(-3, 3),
      main = paste("Correlation =", round(cor(x, y), 3)),
      pch = 20,
      bty = "n"
    )
    abline(
      lm(y ~ x),
      lty = 2,
      lwd = 2,
      col = "darkgray"
    )
  })
  
  

# Mediation ---------------------------------------------------------------

  
  # Generate data according to a simple mediation data generating model in which X is related to M, which is related to Y, and part of X is related to Y independent of it's effect through M.
  
  # Allow for changing the effects in the model
  #   - Track color of different points
  # Display the three scatterplots simultaneously
  output$mediation_eigenvalues <- renderText({
      a <- input$a
      b <- input$b
      c <- input$c
      
      # rx.m <- rm.x <- a
      # rm.y <- ry.m <- b + c*a
      # rx.y <- ry.x <- b*a + c
      
      rx.m <- rm.x <- a
      rm.y <- ry.m <- b
      rx.y <- ry.x <- c
      
      desired_cov <- matrix(c(1   , rx.m, rx.y,
                              rm.x, 1   , rm.y,
                              ry.x, ry.m,   1),
                            nrow = 3,
                            ncol = 3)
      eigen(desired_cov)$values
  })
  
  
  output$mediation_scatterplots <- renderPlot({
    set.seed(417)
    tryCatch(
      expr = {
        ind_normal <- MASS::mvrnorm(
          n = 10,
          mu = c(0, 0, 0),
          Sigma = matrix(c(1, 0, 0,
                           0, 1, 0,
                           0, 0, 1),
                         nrow = 3,
                         ncol = 3),
          empirical = TRUE
        )
        
        
        a <- input$a
        b <- input$b
        c <- input$c
        
        # rx.m <- rm.x <- a
        # rm.y <- ry.m <- b + c*a
        # rx.y <- ry.x <- b*a + c
        
        rx.m <- rm.x <- a
        rm.y <- ry.m <- b
        rx.y <- ry.x <- c
        
        desired_cov <- matrix(c(1   , rx.m, rx.y,
                                rm.x, 1   , rm.y,
                                ry.x, ry.m,   1),
                              nrow = 3,
                              ncol = 3)
        
        # Use the Cholesky decomposition to impose the desired covariance structure on the data
        tmp <- ind_normal %*% chol(desired_cov)
      },
      error = function(e){
        error_message <- paste("An error occurred: ", e$message,".","\nMake sure your path estimates are mathematically possible.", sep = "")
        showNotification(error_message,type = "error")
        },
      warning = function(w){
        showNotification(w$message)
        },
      silent = TRUE
    )
    X <- tmp[ ,1]
    M <- tmp[ ,2]
    Y <- tmp[ ,3]
    
    par(mfrow = c(2,2))
    plot(X,
         M,
         main = "X -> M",
         xlab = "X",
         ylab = "M",
         pch = 20,
         cex = 2)
    # Need to suppress the warnings from abline()
    abline(lm(M ~ X),lwd = 1, col = "red")
    
    plot(Y,
         M,
         main = "M -> Y",
         xlab = "M",
         ylab = "Y",
         pch = 20,
         cex = 2)
    abline(lm(Y ~ M + X), lwd = 1, col = "green")
    
    plot(X,
         Y,
         main = "X -> Y",
         xlab = "X",
         ylab = "Y",
         pch = 20,
         cex = 2)
    abline(lm(Y ~ X + M),lwd = 1, col = "blue")
    
  })
  
  
}