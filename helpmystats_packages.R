pkgs <- c("shiny",
          "MASS",
          "bslib")
for(p in pkgs){
  if(!require(p, character.only = TRUE)){
    install.packages(p)
    require(p, character.only = TRUE)
  }
}