# source packages --------------------------------------------------------------
source("helpmystats_packages.R")

# user interface ---------------------------------------------------------------
source("helpmystats_ui.R")

# server -----------------------------------------------------------------------
source("helpmystats_server.R")

# ShinyApp function ------------------------------------------------------------
shinyApp(ui = ui, server = server, options = list(height = "750px"))

