DatosUI <- read.csv2("Datosfinales.csv")

material_page(
  title = "Inmobiliaria Springfield",
  nav_bar_color = "indigo",
  # nav_bar_fixed = TRUE,
  # include_fonts = TRUE,
  # Place side-nav in the beginning of the UI
  material_side_nav(
    fixed = TRUE, 
    image_source = "img/casa.jpg",
    # Place side-nav tabs within side-nav
    material_side_nav_tabs(
      side_nav_tabs = c(
        "Regiones Potenciales" = "housing_prices",
        "Clientes Potenciales" = "view_data",
        "Video" = "code"
      ),
      icons = c("insert_chart", "explore", "code")
    )
  ),
  # Define side-nav tab content
  material_side_nav_tab_content(
    side_nav_tab_id = "housing_prices",
    tags$br(),
    material_row(
      material_column(
        width = 12,
        material_card(
          title = "Ingresando los siguientes datos de la vivienda actual de una familia colombiana podrás ver en qué región es más probable encontrarla y ofrecer nuestros servicios de financiación para adquirir vivienda nueva."
        )
      )
    ),
    material_row(
      material_column(
        width = 3,
        material_dropdown(
          input_id = "cultura",
          label = "Cultura:", 
          choices = c(
            "Indigena" = "1",
            #"Gitano" = "2",
            "Raizal" = "3",
            "Palenquero" = "4",
            "Negro, Afro" = "5",
            "Ninguno" = "6"
          ),
          selected = "6",
          color = "blue"
        )
      ),
      material_column(
        width = 3,
        material_switch(
          input_id = "alcantarillado",
          label = "Posee alcantarillado:",
          off_label = "No",
          on_label = "Si",
          color = "blue"
        )
      ),
      material_column(
        width = 3,
        material_slider(
          input_id = "satisfaccion_seguridad",
          label = "Satisfacción con la seguridad (0: Insatisfecho, 10: Satisfecho)",
          min_value = 0,
          max_value = 10,
          initial_value = 5,
          color = "blue"
        )
      ),
      material_column(
        width = 3,
        material_switch(
          input_id = "humedales",
          label = "Humedales en el techo o paredes:",
          off_label = "No",
          on_label = "Si",
          color = "blue"
        )
      )
    ),
    material_row(
      material_column(
        width = 3,
        material_switch(
          input_id = "conexion_internet",
          label = "Conexión a internet:",
          off_label = "No",
          on_label = "Si",
          color = "blue"
        )
      ),
      material_column(
        width = 3,
        material_dropdown(
          input_id = "tipo_vivienda",
          label = "Tipo de vivienda:", 
          choices = c(
            "Casa" = "1",
            "Apartamento" = "2",
            "Cuarto" = "3",
            "Vivienda Indígena" = "4",
            "Otro" = "5"
          ),
          selected = "1",
          color = "blue"
        )
      ),
      material_column(
        width = 3,
        material_dropdown(
          input_id = "suficiencia_ingresos",
          label = "Los ingresos del hogar ...", 
          choices = c(
            "No alcanzan para cubrir los gastos" = "1",
            "Alcanzan sólo para cubrir los gastos" = "2",
            "Alcanzan para cubrir más de los gastos" = "3"
          ),
          selected = "2",
          color = "blue"
        )
      ),
      material_column(
        width = 3,
        material_switch(
          input_id = "sentimiento_seguridad",
          label = "En el barrio o vereda se siente ...",
          off_label = "Inseguro",
          on_label = "Seguro",
          color = "blue"
        )
      )
    ),
    material_row(
      material_column(
        width = 3,
        material_dropdown(
          input_id = "madre_hogar",
          label = "La madre vive en el hogar:", 
          choices = c(
            "Sí" = "1",
            "No" = "2",
            "Falleció" = "3"
          ),
          selected = "1",
          color = "blue"
        )
      ),
      material_column(
        width = 3,
        material_switch(
          input_id = "leer_escribir",
          label = "Sabe leer y escribir:",
          off_label = "No",
          on_label = "Si",
          color = "blue"
        )
      ),
      material_column(
        width = 3,
        material_switch(
          input_id = "considera_pobre",
          label = "Se considera pobre:",
          off_label = "No",
          on_label = "Si",
          color = "blue"
        )
      ),
      material_column(
        width = 3,
        material_dropdown(
          input_id = "condiciones_hogar",
          label = "Las condiciones de vida del hogar son:", 
          choices = c(
            "Muy buenas" = "1",
            "Buenas" = "2",
            "Regulares" = "3",
            "Malas" = "4"
          ),
          selected = "2",
          color = "blue"
        )
      )
    ),
    material_row(
      material_column(
        width = 12,
        material_slider(
          input_id = "cantidad_personas",
          label = "Cantidad de personas en el hogar:",
          min_value = min(DatosUI$CANT_PERSONAS_HOGAR),
          max_value = max(DatosUI$CANT_PERSONAS_HOGAR),
          initial_value = 3,
          color = "blue"
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
          withSpinner(textOutput("probabilidad_amazonia")),
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
          withSpinner(textOutput("probabilidad_andina")),
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
          withSpinner(textOutput("probabilidad_caribe")),
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
          withSpinner(textOutput("probabilidad_centro")),
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
          withSpinner(textOutput("probabilidad_noroccidente")),
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
          withSpinner(textOutput("probabilidad_orinoquia")),
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
          withSpinner(textOutput("probabilidad_pacifico")),
          tags$head(tags$style("#probabilidad_pacifico{
                                 font-size: 45px;
                               }"
                         )
          )
        )
      )     
    )
  ),
  material_side_nav_tab_content(
    side_nav_tab_id = "view_data",
    tags$br(),
    material_row(
      material_column(
        width = 10,
        material_card(
          title = "Source",
          tags$a(href = "https://www.fhfa.gov/DataTools/Downloads",
                 target = "_blank",
                 "Federal Housing Finance Agency (FHFA)")
        )
      )
    )
  ),
  material_side_nav_tab_content(
    side_nav_tab_id = "code",
    material_row(
      material_column(
        width = 4,
        offset = 1,
        br(),
        git_refs()
      )
    )
  )
)