library(nnet)
library(dplyr)
require(MPV)
require(MASS)

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

#Seleccion de variables------------------------------------------
horizonte <- formula(P6076S1~P1070+P8520S1+P8520S3+P1891S1+P1891S3P1891S4+P5502P6081+
                       P6083+P6080+P1895+P1898+P6160+P8587+P9010+P9030+P5230+P9090+
                       P784S4+P1075+CANT_PERSONAS_HOGAR+P6090, data=datos)

mod1 <- multinom(P6076S1~1, data=Datos, trace=FALSE)

mods <- stepAIC(mod1, trace=F, direction="forward", scope=horizonte)

#### FUNCION SERVER ####

server <- function(input, output, session) {
  
  output$probabilidades_region <- renderText({ 
    
    #Probabilidad de acuerdo a las caracteristicas de la familia--------
    c3 <- data.frame(P6080 = input$cultura,
                     P8520S3 = if (input$alcantarillado) "1" else "2",
                     P1898 = as.factor(input$satisfaccion_seguridad),
                     P1891S1= if (input$humedales) "1" else "2",
                     P1075 = if (input$conexion_internet) "1" else "2",
                     P1070 = input$tipo_vivienda,
                     P9090 = input$suficiencia_ingresos,
                     P9010 = if (input$sentimiento_seguridad) "1" else "2",
                     P784S4 = "2",
                     P6083 = input$madre_hogar,
                     P6160 = if (input$leer_escribir) "1" else "2",
                     P5230 = if (input$considera_pobre) "1" else "2",
                     P9030 = input$condiciones_hogar,
                     CANT_PERSONAS_HOGAR = input$cantidad_personas)
    
    Prob <- predict(mods, c3, type="prob")
    paste("Amazonia:", round(Prob["Amazonia"]*100, 1),"%", "\n",
          "Andina Oriental:", round(Prob["Andina Oriental"]*100,1),"%", "\n",
          "Caribe:", round(Prob["Caribe"]*100,1),"%", "\n",
          "Centro:", round(Prob["Centro"]*100,1),"%", "\n",
          "Noroccidente:", round(Prob["Noroccidente"]*100,1),"%", "\n",
          "Orinoquia:", round(Prob["Amazonia"]*100,1),"%", "\n",
          "Pacífico:", round(Prob["Pacífico"]*100,1),"%", "\n")
  })
  
}