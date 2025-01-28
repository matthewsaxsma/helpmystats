# source packages --------------------------------------------------------------
source("PackagesStatsApp.R")

# user interface ---------------------------------------------------------------
source("uiStatsApp.R")

# server -----------------------------------------------------------------------
source("serverStatsApp.R")

# ShinyApp function ------------------------------------------------------------
shinyApp(ui = ui, server = server, options = list(height = "750px"))



