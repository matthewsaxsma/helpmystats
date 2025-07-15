curve(dnorm(x, mean = 0, sd = 1), from = -4, to = 4,
      ylab = "Density", main = "Standard Normal Distribution",
      col = "black", lwd = 2,bty = "n",
      ylim = c(0,0.6))

lines(
  x = c(0, 1),
  y = c(dnorm(1,0,1),dnorm(1,0,1)),
  lwd = 2,
  lty = 20
)

abline(
  v = c(0),
  lty = 21,
  )


text(
  x = 0.4,
  y = dnorm(1,0,1) + 0.025,
  labels = bquote(sigma),
  cex = 1.25
)


plot(
  NA,
  xlim = c(0, 10),
  ylim = c(0,0.3),
  main = "Chi-squared Distributions",
  bty = "n",
  xlab = "x",
  ylab = ""
)

x <- seq(1,15,by = 0.01)


lines(
  x,
  dchisq(x, df = 1),
  col = "red",
  lwd = 2
)


lines(
  x,
  dchisq(x,df = 3),
  col = "blue",
  lwd = 2
  )

lines(
  x,
  dchisq(x, df = 5),
  col = "green",
  lwd = 2
)

lines(
  x,
  dchisq(x, df = 10),
  col = "purple",
  lwd = 2
)

legend(
  x = 7,
  y = 0.30,
  legend = c(
    "df = 1",
    "df = 3",
    "df = 5",
    "df = 10"
  ),
  col = c(
    "red",
    "blue",
    "green",
    "purple"
  ),
  lwd = 2,
  bty = "n"
)