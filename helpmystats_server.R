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
  
# Moderation -------------------------------------------------------------------
  
  output$moderation_scatterplot <- renderPlot({
    set.seed(417)
    tryCatch(
      expr = {
        N <- 150
        Conscientiousness <- rnorm(n = N,mean = 0, sd = 1)
        Interest <- rnorm(n = N,mean = 0, sd = 1)
        # NOT standardizing interaction term
        Interaction_term <- Conscientiousness*Interest
        
        b1 <- input$b1
        b2 <- input$b2
        b3 <- input$b3
        
        # resid_variance <- 1 - (bx^2) - (bm^2) - (bxm^2)
        # 
        # if(resid_variance < 0) {stop("Residual variance must be positive.")}
        
        # Generate data according to model with input effect sizes.
        AcademicEffort <- 0 + b1*Conscientiousness + b2*Interest + b3*Interaction_term + rnorm(n = N,0,sd = 1)
        
        Interest_normed <- (Interest - min(Interest)) / diff(range(Interest))
        
        theseColors = sapply(
          Interest, 
          FUN = function(x) {
            
            t <- (x - min(Interest)) / diff(range(Interest))
            
            # Push values away from the midpoint
            t <- 0.5 + 0.5 * sign(t - 0.5) * abs(2 * (t - 0.5))^0.4
            
            rgb(
              t,
              .1,
              1 - t
            )
          }
        )
        # theseColors = ifelse(M == 0,"blue","red")

        plot(
          Conscientiousness,
          AcademicEffort,
          pch = 20,
          cex = 2,
          col = theseColors,
          main = "CONIC Model",
          xlab = "Conscietniousness",
          ylab = "Interest",
          bty = "n"
        )

        
        #################################################
        # Save plotting region
        par(
          mar = c(5, 4, 4, 2),
          oma = c(0, 0, 0, 8),
          xpd = NA
        )
        
        # Coordinates for legend placement
        xleft   <- 1.5
        xright  <- 1.8
        ybottom <- -2
        ytop    <- 2
        
        # Create vertical gradient
        gradient_vals <- seq(0, 1, length.out = 100)
        
        legend_colors <- sapply(
          gradient_vals,
          function(t) {
            
            t2 <- 0.5 + 0.5 * sign(t - 0.5) * abs(2 * (t - 0.5))^0.4
            
            rgb(
              t2,
              .1,
              1 - t2
            )
          }
        )
        
        image(
          x = c(xleft, xright),
          y = seq(ybottom, ytop, length.out = 100),
          z = matrix(seq_along(gradient_vals), nrow = 1),
          col = legend_colors,
          add = TRUE
        )
        
        # Border around legend
        rect(
          xleft,
          ybottom,
          xright,
          ytop
        )
        
        # Labels
        text(xright + 0.3, ybottom, "Low Interest", adj = 0)
        text(xright + 0.3, ytop, "High Interest", adj = 0)
        box("plot",   col = "red")
        box("figure", col = "blue")
        box("outer",  col = "green")
        #################################################
        # m0 <- lm(Y[M == 0] ~ X[M == 0])
        # m1 <- lm(Y[M == 1] ~ X[M == 1])
        # 
        # abline(m0, col = "blue", lwd = 1.5)
        # abline(m1, col = "red",  lwd = 1.5)
        # legend(
        #   x = 1,
        #   y = max(Y)*1.1,
        #   legend = c("Group 1", "Group 2"), # G1 blue, G2 red
        #   col = c("blue", "red"),
        #   pch = 21,
        #   cex = 1.5,
        #   bty = "n"
        # )
      },
      warning = function(w) {showNotification(w$message)},
      error = function(e) {showNotification(e$message, type = "error")}
    )
  })
}