library(shiny)
library(shinymaterial)
library(tidyverse)
library(stringr)
library(shinycssloaders)
library(nnet)
library(raster)
library(sp)
library(car)
library(leaflet)
library(rgdal)
require(colorRamps)


#Datos <- read.csv2("Datosfinales.csv")

git_refs <- function(){
  shiny::tagList(
    tags$a(target = "_blank",
           href = "https://github.com/ericrayanderson/shinymaterial_dashboard/blob/master/ui.R#L1", h3("ui.R")),
    "Includes shinymaterial functions: ",
    tags$ul(style = "font-family:monospace; display:block",
            tags$li("material_side_nav()",
                    "material_side_nav_tabs()",
                    "material_side_nav_tab_content()")
    ),
    tags$a(target = "_blank",
           href = "https://github.com/ericrayanderson/shinymaterial_dashboard/blob/master/server.R#L1", h3("server.R")),
    "Includes shinymaterial functions: ",
    tags$ul(style = "font-family:monospace; display:block",
            tags$li("material_spinner_show()",
                    "material_spinner_hide()")
    ),
    br(),
    br(),
    tags$a(
      target = "_blank",
      href = "https://ericrayanderson.github.io/shinymaterial/",
      "shinymaterial website"
    ) 
  )
}
