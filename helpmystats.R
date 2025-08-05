# source packages --------------------------------------------------------------
source("helpmystats_P.R")

# user interface ---------------------------------------------------------------
source("helpmystats_UI.R")

# server -----------------------------------------------------------------------
source("helpmystats_SERVER.R")

# ShinyApp function ------------------------------------------------------------
shinyApp(ui = ui, server = server, options = list(height = "750px"))

