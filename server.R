




#Lectura de Datos--------------------
Datos <- read.csv2("Datosfinales.csv")

Datos$P1070 <- as.factor(Datos$P1070)
Datos$P8520S1 <- as.factor(Datos$P8520S1)
Datos$P8520S3 <- as.factor(Datos$P8520S3)
Datos$P1891S1 <- as.factor(Datos$P1891S1)
Datos$P1891S3 <- as.factor(Datos$P1891S3)
Datos$P1891S4 <- as.factor(Datos$P1891S4)
Datos$P5502 <- as.factor(Datos$P5502)
Datos$P6076S1 <- as.factor(Datos$P6076S1)
Datos$P6081 <- as.factor(Datos$P6081)
Datos$P6083 <- as.factor(Datos$P6083)
Datos$P6080 <- as.factor(Datos$P6080)
Datos$P1898 <- as.factor(Datos$P1898)
Datos$P6160 <- as.factor(Datos$P6160)
Datos$P8587 <- as.factor(Datos$P8587)
Datos$P9010 <- as.factor(Datos$P9010)
Datos$P9030 <- as.factor(Datos$P9030)
Datos$P5230 <- as.factor(Datos$P5230)
Datos$P9090 <- as.factor(Datos$P9090)
Datos$P784S4 <- as.factor(Datos$P784S4)
Datos$P1075 <- as.factor(Datos$P1075)
Datos$P6090 <- as.factor(Datos$P6090)

#Lectura de base de datos para mapa------------------------------------
departamentos <- shapefile("deparegion.shp", encoding="UTF-8", use_iconv = TRUE, warnPRJ = FALSE)


#Modelo caracteristicas del hogar--------------------
modcf <- multinom(P6076S1~P1070+P5502+P6081+P6083+P1895+P1898+P9010
                  +P9030+P5230+P9090+CANT_PERSONAS_HOGAR, data=Datos, trace=FALSE)

#### FUNCION SERVER ####

server <- function(input, output, session) {
  
  probabilidades <- reactive({
      
    
    #Probabilidad de acuerdo a las caracteristicas de la familia--------
    c1 <- data.frame(P1070 = input$tipo_vivienda,
                     P5502 = input$estado_civil,
                     P6081 = input$padre_hogar,
                     P6083 = input$madre_hogar,
                     P1895 = input$satisfaccion_vida,
                     P1898 = as.factor(input$satisfaccion_seguridad),
                     P9010 = if (input$sentimiento_seguridad) "1" else "2",
                     P9030 = input$condiciones_hogar,
                     P5230 = if (input$considera_pobre) "1" else "2",
                     P9090 = input$suficiencia_ingresos,
                     CANT_PERSONAS_HOGAR = input$cantidad_personas)
                     
                     
    
    ProbList <- predict(modcf, c1, type="prob")
    })
  
  
  output$probabilidad_amazonia<- renderText({
      Prob <- probabilidades()
      paste(round(Prob["Amazonia"]*100, 1),"%")
  })
  
  output$probabilidad_andina<- renderText({ 
    Prob <- probabilidades()
    paste(round(Prob["Andina Oriental"]*100, 1),"%")
    
  })
  
  output$probabilidad_caribe<- renderText({ 
    Prob <- probabilidades()
    paste(round(Prob["Caribe"]*100, 1),"%")
    
  })
  
  output$probabilidad_centro<- renderText({ 
    Prob <- probabilidades()
    paste(round(Prob["Centro"]*100, 1),"%")
    
  })
  
  output$probabilidad_noroccidente<- renderText({ 
    Prob <- probabilidades()
    paste(round(Prob["Noroccidente"]*100, 1),"%")
    
  })
  
  output$probabilidad_orinoquia<- renderText({ 
    Prob <- probabilidades()
    paste(round(Prob["Orinoquia"]*100, 1),"%")
    
  })
  
  output$probabilidad_pacifico<- renderText({ 
    Prob <- probabilidades()
    paste(round(Prob["Pacífico"]*100, 1),"%")
    
  })
  
  #output$video <- renderUI({
  #  click <- input$plot_click
  #    HTML(paste0('<iframe width="850" height="500" src="https://www.youtube.com/embed/Oiq-Al1ZdN8','" frameborder="0" allowfullscreen></iframe>'))
  #})
  
  output$mapa<- renderLeaflet({ 
    Prob <- as.vector(probabilidades())
    departamentos@data[departamentos@data$region == "AMAZONIA",]$prob2 <- Prob[1]
    departamentos@data[departamentos@data$region == "ANDINA ORIENTAL",]$prob2 <- Prob[2]
    departamentos@data[departamentos@data$region == "CARIBE",]$prob2 <- Prob[3]
    departamentos@data[departamentos@data$region == "CENTRO",]$prob2 <- Prob[4]
    departamentos@data[departamentos@data$region == "NOROCCIDENTE",]$prob2 <- Prob[5]
    departamentos@data[departamentos@data$region == "ORINOQUIA",]$prob2 <- Prob[6]
    departamentos@data[departamentos@data$region == "PACIFICA",]$prob2 <- Prob[7]
    
    pal <-colorNumeric(palette=cyan2yellow(max(departamentos@data$prob2*100)),
                       domain=c(0,departamentos@data$prob2*100))
    popup<-paste(departamentos@data$region,paste("Probabilidad ",
                                                 round(departamentos@data$prob2*100,digits=2)," %"),sep="<br/>")
    
    mapaDepartamentos <- leaflet(departamentos)
    mapaDepartamentos <- addProviderTiles(mapaDepartamentos, provider="OpenStreetMap.Mapnik")
    mapaDepartamentos <- addPolygons(mapaDepartamentos,
                                     popup = popup,
                                     color=pal(as.integer(departamentos@data$prob2*100)),
                                     opacity = 0.8,
                                     fillOpacity = 0.8,
                                     weight = 1)
    mapaDepartamentos <-addLegend(mapaDepartamentos,"topright",
                                  pal=pal,values=departamentos@data$prob2*100, 
                                  title="Probabilidad",
                                  opacity = 1)
    mapaDepartamentos
    
    
  })

  
}