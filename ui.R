DatosUI <- read.csv2("Datosfinales.csv")

material_page(
  includeCSS("www/app.css"),
  
  title = "StatsVision",
  nav_bar_color = "blue",
  # nav_bar_fixed = TRUE,
  # include_fonts = TRUE,
  # Place side-nav in the beginning of the UI
  material_side_nav(
    fixed = TRUE, 
    image_source = "img/logo.jpg",
    # Place side-nav tabs within side-nav
    material_side_nav_tabs(
      side_nav_tabs = c(
        "Regiones Potenciales" = "Regiones",
        #"Clientes Potenciales" = "Clientes",
        "Video" = "Video",
        "Creadores" = "Creadores" 
      ),
      icons = c("insert_chart","table", "code")
    )
  ),
  # Define side-nav tab content
  material_side_nav_tab_content(
    side_nav_tab_id = "Regiones",
    tags$br(),
    material_row(
      material_column(
        width = 12,
        material_card(
                   tags$h5("Ingresando los siguientes datos de la vivienda actual de una familia colombiana, podrás ver en qué región es más probable encontrar este tipo de familias y ofrecer tus servicios de financiación para adquirir vivienda nueva.",
                           style = "font-family: 'Arial Narrow';
                           font-weight: 500;
                           text-align: center;
                           color: #616263;")
        )
      )
    ),
    material_row(
      material_column(
        width = 3,
        tags$label("Tipo de vivienda actual:",
                   style = "font-family: Arial Narrow;
                   font-size: 20px;
                   color: green;"),
        material_dropdown(
          input_id = "tipo_vivienda",
          label = "",
          #tags$h6("Tipo de vivienda actual:"),
          choices = c(
            "Casa" = "1",
            "Apartamento" = "2",
            "Cuarto" = "3",
            #"Vivienda Indígena" = "4",
            "Otro" = "5"
          ),
          selected = "1",
          color = "dodgerblue"
        )
      ),
      material_column(
        width = 3,
        tags$label("Las condiciones de vida del hogar son:",
                   style = "font-family: Arial Narrow;
                   font-size: 20px;
                   color: green;"),
        material_dropdown(
          input_id = "condiciones_hogar",
          label = "", 
          choices = c(
            "Muy buenas" = "1",
            "Buenas" = "2",
            "Regulares" = "3",
            "Malas" = "4"
          ),
          selected = "2",
          color = "dodgerblue"
        )
      ),
      material_column(
        width = 3,
        material_switch(
          input_id = "sentimiento_seguridad",
          #label = "En el barrio o vereda se siente:",
          tags$label("En el barrio o vereda se siente:",
                     style = "font-family: Arial Narrow;
                     font-size: 20px;
                     color: green;"),
          off_label = "Inseguro",
          on_label = "Seguro",
          color = "dodgerblue"
        )
      ),
      material_column(
        width = 3,
        material_slider(
          input_id = "satisfaccion_seguridad",
          #label = "Satisfacción con la seguridad (0: Insatisfecho, 10: Satisfecho)",
          tags$label("Satisfacción con la seguridad (0: Insatisfecho, 10: Satisfecho)",
                     style = "font-family: Arial Narrow;
                     font-size: 20px;
                     color: green;"),
          min_value = 0,
          max_value = 10,
          initial_value = 5,
          color = "dodgerblue"
        )
      )

    ),
    material_row(
      material_column(
        width = 3,
        tags$label("Estado civil:",
                   style = "font-family: Arial Narrow;
                   font-size: 20px;
                   color: green;"),
        material_dropdown(
          input_id = "estado_civil",
          label = "", 
          choices = c(
            "No está casado(a) y vive en pareja hace menos de dos años" = "1",
            "No está casado(a) y vive en pareja hace dos años o más" = "2",
            "Está viudo(a)" = "3",
            "Está separado(a) o divorciado(a)" = "4",
            "Está soltero(a)" = "5",
            "Está casado(a)" = "6"
          ),
          selected = "6",
          color = "dodgerblue"
        )
        ),
      material_column(
        width = 3,
        tags$label("Los ingresos del hogar:",
                   style = "font-family: Arial Narrow;
                     font-size: 20px;
                     color: green;"),
        material_dropdown(
          input_id = "suficiencia_ingresos",
          label = "", 
          choices = c(
            "No alcanzan para cubrir los gastos" = "1",
            "Alcanzan sólo para cubrir los gastos" = "2",
            "Alcanzan para cubrir más de los gastos" = "3"
          ),
          selected = "2",
          color = "dodgerblue"
        )
      ),
      material_column(
        width = 3,
        material_switch(
          input_id = "considera_pobre",
          #label = "Se considera pobre:",
          tags$label("Se considera pobre:",
                     style = "font-family: Arial Narrow;
                     font-size: 20px;
                     color: green;"),
          off_label = "No",
          on_label = "Si",
          color = "dodgerblue"
        )
      ),
      material_column(
        width = 3,
        material_slider(
          input_id = "satisfaccion_vida",
          #label = "Satisfacción con la vida actual (0: Insatisfecho, 10: Satisfecho)",
          tags$label("Satisfacción con la vida actual (0: Insatisfecho, 10: Satisfecho)",
                     style = "font-family: Arial Narrow;
                     font-size: 20px;
                     color: green;"),
          min_value = 0,
          max_value = 10,
          initial_value = 5,
          color = "dodgerblue"
        )
      )
    ),
    material_row(
      material_column(
        width = 3,
        tags$label("La madre vive en el hogar:",
                   style = "font-family: Arial Narrow;
                   font-size: 20px;
                   color: green;"),
        material_dropdown(
          input_id = "madre_hogar",
          label = "", 
          choices = c(
            "Sí" = "1",
            "No" = "2",
            "Falleció" = "3"
          ),
          selected = "1",
          color = "dodgerblue"
        )
      ),
      material_column(
        width = 3,
        tags$label("El padre vive en el hogar:",
                   style = "font-family: Arial Narrow;
                   font-size: 20px;
                   color: green;"),
        material_dropdown(
          input_id = "padre_hogar",
          label = "", 
          choices = c(
            "Sí" = "1",
            "No" = "2",
            "Falleció" = "3"
          ),
          selected = "1",
          color = "dodgerblue"
        )
      )
    ),
    material_row(
      material_column(
        width = 12,
        tags$label("Cantidad de personas en el hogar",
                   style = "font-family: Arial Narrow;
                   font-size: 20px;
                   color: green;"),
        material_slider(
          input_id = "cantidad_personas",
          label = "",
          min_value = min(DatosUI$CANT_PERSONAS_HOGAR),
          max_value = max(DatosUI$CANT_PERSONAS_HOGAR),
          initial_value = 3,
          color = "dodgerblue"
        )
      )
    ),
    material_row(
      material_column(
        width = 12,
        material_card(
          title = "Probabilidades por región"
        )
      )
    ),
    material_row(
      material_column(
        width = 3,
        material_card(
          title = "Amazonía",
          #withSpinner(textOutput("probabilidad_amazonia")),
          textOutput("probabilidad_amazonia"),
          tags$head(tags$style("#probabilidad_amazonia{
                                 font-size: 45px;
                               }"
                         )
          )
        )
      ),
      material_column(
        width = 3,
        material_card(
          title = "Andina-Oriental",
          #withSpinner(textOutput("probabilidad_andina")),
          textOutput("probabilidad_andina"),
          tags$head(tags$style("#probabilidad_andina{
                                 font-size: 45px;
                               }"
          )
          )
        )
      ),
      material_column(
        width = 3,
        material_card(
          title = "Caribe",
          #withSpinner(textOutput("probabilidad_caribe")),
          textOutput("probabilidad_caribe"),
          tags$head(tags$style("#probabilidad_caribe{
                                 font-size: 45px;
                               }"
                         )
          )
        )
      ),
      material_column(
        width = 3,
        material_card(
          title = "Centro",
          #withSpinner(textOutput("probabilidad_centro")),
          textOutput("probabilidad_centro"),
          tags$head(tags$style("#probabilidad_centro{
                                 font-size: 45px;
                               }"
          )
          )
        )
      )
    ),
    material_row(
      material_column(
        width = 3,
        material_card(
          title = "Noroccidente",
          #withSpinner(textOutput("probabilidad_noroccidente")),
          textOutput("probabilidad_noroccidente"),
          tags$head(tags$style("#probabilidad_noroccidente{
                                 font-size: 45px;
                               }"
                         )
          )
        )
      ),
      material_column(
        width = 3,
        material_card(
          title = "Orinoquía",
          #withSpinner(textOutput("probabilidad_orinoquia")),
          textOutput("probabilidad_orinoquia"),
          tags$head(tags$style("#probabilidad_orinoquia{
                                 font-size: 45px;
                               }"
                         )
          )
        )
      ),
      material_column(
        width = 3,
        material_card(
          title = "Pacífico",
          #withSpinner(textOutput("probabilidad_pacifico")),
          textOutput("probabilidad_pacifico"),
          tags$head(tags$style("#probabilidad_pacifico{
                                 font-size: 45px;
                               }"
                         )
          )
        )
      )     
    ),
    
    material_row(
      material_column(
        width = 12,
        material_card(
          withSpinner(leafletOutput("mapa"))
        )
      )
    )
  ),
  material_side_nav_tab_content(
    side_nav_tab_id = "Video",
    material_row(
      material_column(
        width = 4,
        offset = 1,
        br(),
        #iframe(width = "550", height = "550",url_link="www.youtube.com/embed/dQw4w9WgXcQ")
        #uiOutput("video")
        HTML(paste0('<iframe width="850" height="500" src="https://www.youtube.com/embed/Oiq-Al1ZdN8','" frameborder="0" allowfullscreen></iframe>'))
        #tags$video(src = "www/video2.mp4", type = "video/mp4", autoplay = NA, controls = NA)
        #git_refs()
      )
    )
  ),
  material_side_nav_tab_content(
    side_nav_tab_id = "Creadores",
    material_row(
      tags$h4("Este aplicativo ha sido desarrollado por: ",
              style = "font-family: 'Arial Narrow';
                      font-weight: 500;
                      text-align: center;
                      color: #616263;"
              ),
      br(),
      tags$style(HTML("
                      h6 {
                        font-family: 'Arial';
                        font-size: 20px;              
                        text-align: center;
                        color: dodgerblue;
                        }
      ")),
      tags$h6("Edwin Alexander Caicedo Chamorro - eacaicedoc@unal.edu.co"), br(),
      tags$h6("Eliana María López Vélez - emlopezv@unal.edu.co"), br(),
      tags$h6("Carlos Armando Oliva Paredes - caolivap@unal.edu.co"), br(),
      tags$h6("Juan Pablo Ramirez Echeverri - jupramirezec@unal.edu.co"), br(),
      tags$h6("Santiago Toro Zuluaga - satorozu@unal.edu.co"), br(),
      tags$p("Contáctanos para saber más o para que nos compartas tus necesidades y prepararte una solución a tu medida")
    )
  )
)
