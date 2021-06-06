# [Shiny Dashboard]


# Bibliotecas
library(shiny)
library(shinydashboard)
library(dplyr)
library(ggplot2)
library(tidyr)
library(scales)
library(readr)
library(plotly)

IDHMnames = list(Principal = c("IDHM" = 1,"Renda" = 2, "Longevidade" = 3, "Educação" = 4))
NORTEnames = list(Principal1 = c("IDHM" = 1,"Renda" = 2, "Longevidade" = 3, "Educação" = 4))
NORDESTEnames = list(Principal2 = c("IDHM" = 1,"Renda" = 2, "Longevidade" = 3, "Educação" = 4))
CTLESTEnames = list(Principal3 = c("IDHM" = 1,"Renda" = 2, "Longevidade" = 3, "Educação" = 4))
CTNORTEnames = list(Principal4 = c("IDHM" = 1,"Renda" = 2, "Longevidade" = 3, "Educação" = 4))
SUDOESTEnames = list(Principal5 = c("IDHM" = 1,"Renda" = 2, "Longevidade" = 3, "Educação" = 4))
SULnames = list(Principal6 = c("IDHM" = 1,"Renda" = 2, "Longevidade" = 3, "Educação" = 4))
EXTSULnames = list(Principal7 = c("IDHM" = 1,"Renda" = 2, "Longevidade" = 3, "Educação" = 4))
LSTEnames = list(Principal8 = c("IDHM" = 1,"Renda" = 2, "Longevidade" = 3, "Educação" = 4))
OSTEnames = list(Principal9 = c("IDHM" = 1,"Renda" = 2, "Longevidade" = 3, "Educação" = 4))


dataset_avfinal <- read_delim("dataset_avfinal.csv", 
                              ";", escape_double = FALSE, locale = locale(encoding = "ISO-8859-1"), 
                              trim_ws = TRUE)
dados <- dataset_avfinal

ui <- dashboardPage(
  title = "Vacinação",
  skin = "blue",
  header = dashboardHeader(
    title = "Vacinação",
    titleWidth = "200px"
  ),
  sidebar <- dashboardSidebar(
    sidebarMenu(id = 'sidebarmenu',
                
                menuItem('Geral',
                         tabName = 'resultado',
                         icon = icon('ambulance'),
                         menuSubItem('Total',
                                     tabName = 'graf',
                                     icon = icon('syringe')),
                         menuSubItem('IDHM',
                                     tabName = 'mapa',
                                     icon = icon('chart-bar'))),
                menuItem('Núcleos Regionais de Saúde',
                         tabName = 'regioes',
                         icon = icon('plus-square'),
                         menuSubItem('Norte',
                                     tabName = 'nrte',
                                     icon = icon('angle-right')),
                         menuSubItem('Nordeste',
                                     tabName = 'nrdste',
                                     icon = icon('angle-right')),
                         menuSubItem('Centro-Leste',
                                     tabName = 'ctleste',
                                     icon = icon('angle-right')),
                         menuSubItem('Centro-Norte',
                                     tabName = 'ctnorte',
                                     icon = icon('angle-right')),
                         menuSubItem('Sudoeste',
                                     tabName = 'sdoeste',
                                     icon = icon('angle-right')),
                         menuSubItem('Sul',
                                     tabName = 'sl',
                                     icon = icon('angle-right')),
                         menuSubItem('Extremo Sul',
                                     tabName = 'extsl',
                                     icon = icon('angle-right')),
                         menuSubItem('Leste',
                                     tabName = 'lste',
                                     icon = icon('angle-right')),
                         menuSubItem('Oeste',
                                     tabName = 'oste',
                                     icon = icon('angle-right')))
                
    )),
  
  
  body = dashboardBody(
    tags$head(tags$style(HTML('/* logo */
    .skin-blue .main-header .logo {
                          background-color: rgb(2, 130, 68); color:        rgb(255, 255, 255);
                          font-weight: bold;font-size: 20px;text-align: Right;
                          }
                               /* navbar (rest of the header) */
                          .skin-blue .main-header .navbar {
                          background-color: rgb(2, 130, 68);
                          }
                              /* main sidebar */
                          .skin-blue .main-sidebar {
                          background-color: rgb(2, 130, 68);;
                          }
                          
                          /* active selected tab in the sidebarmenu */
                                .skin-blue .main-sidebar .sidebar .sidebar-menu .active a{
                                background-color: rgb(2, 130, 68);
                                }
                              
                              /* other links in the sidebarmenu */
                          .skin-blue .main-sidebar .sidebar .sidebar-menu a{
                          background-color: rgb(2, 130, 68);
                          color: rgb(255, 255, 255);font-weight: bold;
                          }
                              /* other links in the sidebarmenu when hovered */
                          .skin-blue .main-sidebar .sidebar .sidebar-menu a:hover{
                          background-color: rgb(2, 130, 68);color: rgb(255, 255, 255);font-weight: bold;
                          }
                              /* body */
                                .content-wrapper, .right-side {
                                background-color:rgb(190, 217, 159) ;
                                }'))),
    tabItems(
      tabItem(tabName = "graf",
              h1("Vacinação contra o COVID-19 em Idosos no Estado da Bahia", align="center"),
              h2("População", align="center"),
              fluidRow(
                valueBoxOutput(outputId = "geral_v1", width = 3),
                valueBoxOutput(outputId = "geral_v7", width = 3),
                valueBoxOutput(outputId = "geral_v9", width = 3),
                valueBoxOutput(outputId = "geral_v10", width = 3)
                ),
              h2("Idosos - 1ª Doses aplicadas", align="center"),
              fluidRow(
                infoBoxOutput(outputId = "geral_tot_c1", width = 3),
                infoBoxOutput(outputId = "geral_tot_c2", width = 3),
                infoBoxOutput(outputId = "geral_tot_c3", width = 3),
                infoBoxOutput(outputId = "geral_tot_c4", width = 3)),
              fluidRow(
                infoBoxOutput(outputId = "geral_tot_c5", width = 3),
                infoBoxOutput(outputId = "geral_tot_c6", width = 3),
                infoBoxOutput(outputId = "geral_tot_c7", width = 3))
             
              
              
      ),
      tabItem(tabName = "mapa",
              h2("Indice de Desenvolvimento Humano Municipal", align="center"),
              fluidRow(box(width = 3, height = 200, status = "success", solidHeader = TRUE,
                           selectInput("sel1", "Selecione o tipo", choices = IDHMnames$Principal)),
                       box(width = 6, height = 500, title="Histograma do IDHM.",status = "success", solidHeader = TRUE, plotOutput("plot11")))
      ),
     
      tabItem(tabName = "nrte",
              h2("Norte"),
              fluidRow(
                valueBoxOutput(outputId = "norte_v1", width = 3),
                valueBoxOutput(outputId = "norte_v7", width = 3),
                valueBoxOutput(outputId = "norte_v9", width = 3)),
              fluidRow(box(width =3, height = 220, status = "success", solidHeader = TRUE,
                           selectInput("sel51", "Selecione o tipo", choices = NORTEnames$Principal1)),
                       box(width = 5, height = 500, title="Histograma do Indice de Desenvolvimento Humano Municipal (IDH).",status = "success", solidHeader = TRUE, plotOutput("plot1")),
                       h3("1ª Doses", align="center"),
                       fluidRow(
                         infoBoxOutput(outputId = "norte_tot_c8", width = 3),
                         infoBoxOutput(outputId = "norte_mean_c8", width = 3)))
      ),
      tabItem(tabName = "nrdste",
              h2("Nordeste"),
              fluidRow(
                valueBoxOutput(outputId = "nordeste_v1", width = 3),
                valueBoxOutput(outputId = "nordeste_v7", width = 3),
                valueBoxOutput(outputId = "nordeste_v9", width = 3)),
              fluidRow(box(width = 3, height = 220, status = "success", solidHeader = TRUE,
                           selectInput("sel52", "Selecione o tipo", choices = NORDESTEnames$Principal2)),
                       box(width = 6, height = 500, title="Histograma do Indice de Desenvolvimento Humano Municipal (IDH).",status = "success", solidHeader = TRUE, plotOutput("plot2")),
                       h3("1ª Doses", align="center"),
                       fluidRow(
                         infoBoxOutput(outputId = "nrdste_tot_c8", width = 3),
                         infoBoxOutput(outputId = "nrdste_mean_c8", width = 3)))
              
      ),
      tabItem(tabName = "ctleste",
              h2("Centro-Leste"),
              fluidRow(
                valueBoxOutput(outputId = "ctleste_v1", width = 3),
                valueBoxOutput(outputId = "ctleste_v7", width = 3),
                valueBoxOutput(outputId = "ctleste_v9", width = 3)),
              fluidRow(box(width =3, height = 220, status = "success", solidHeader = TRUE,
                           selectInput("sel53", "Selecione o tipo", choices = CTLESTEnames$Principal3)),
                       box(width = 6, height = 500, title="Histograma do Indice de Desenvolvimento Humano Municipal (IDHM).",status = "success", solidHeader = TRUE, plotOutput("plot3")),
                       h3("1ª Doses", align="center"),
                       fluidRow(
                         infoBoxOutput(outputId = "ctleste_tot_c8", width = 3),
                         infoBoxOutput(outputId = "ctleste_mean_c8", width = 3)))
              
      ),
      tabItem(tabName = "ctnorte",
              h2("Centro-Norte"),
              fluidRow(
                valueBoxOutput(outputId = "ctnorte_v1", width = 3),
                valueBoxOutput(outputId = "ctnorte_v7", width = 3),
                valueBoxOutput(outputId = "ctnorte_v9", width = 3)),
              fluidRow(box(width =3, height = 220, status = "success", solidHeader = TRUE,
                           selectInput("sel54", "Selecione o tipo", choices = CTNORTEnames$Principal4)),
                       box(width = 6, height = 500, title="Histograma do Indice de Desenvolvimento Humano Municipal (IDHM).",status = "success", solidHeader = TRUE, plotOutput("plot4")),
                       h3("1ª Doses", align="center"),
                       fluidRow(
                         infoBoxOutput(outputId = "ctnorte_tot_c8", width = 3),
                         infoBoxOutput(outputId = "ctnorte_mean_c8", width = 3)))
              
      ),
      tabItem(tabName = "sdoeste",
              h2("Sudoeste"),
              fluidRow(
                valueBoxOutput(outputId = "sudoeste_v1", width = 3),
                valueBoxOutput(outputId = "sudoeste_v7", width = 3),
                valueBoxOutput(outputId = "sudoeste_v9", width = 3)),
              fluidRow(box(width =3, height = 220, status = "success", solidHeader = TRUE,
                           selectInput("sel55", "Selecione o tipo", choices = SUDOESTEnames$Principal5)),
                       box(width = 6, height = 500, title="Histograma do Indice de Desenvolvimento Humano Municipal (IDHM).", status = "success", solidHeader = TRUE, plotOutput("plot5")),
                       h3("1ª Doses", align="center"),
                       fluidRow(
                         infoBoxOutput(outputId = "sudoeste_tot_c8", width = 3),
                         infoBoxOutput(outputId = "sudoeste_mean_c8", width = 3)))
              
      ),
      tabItem(tabName = "sl",
              h2("Sul"),
              fluidRow(
                valueBoxOutput(outputId = "sul_v1", width = 3),
                valueBoxOutput(outputId = "sul_v7", width = 3),
                valueBoxOutput(outputId = "sul_v9", width = 3)),
              fluidRow(box(width=3, height = 220, status = "success", solidHeader = TRUE,
                           selectInput("sel56", "Selecione o tipo", choices = SULnames$Principal6)),
                       box(width = 6, height = 500, title="Histograma do Indice de Desenvolvimento Humano Municipal (IDHM).",status = "success", solidHeader = TRUE, plotOutput("plot6")),
                       h3("1ª Doses", align="center"),
                       fluidRow(
                         infoBoxOutput(outputId = "sl_tot_c8", width = 3),
                         infoBoxOutput(outputId = "sl_mean_c8", width = 3)))
      ),
      tabItem(tabName = "extsl",
              h2("Extremo Sul"),
              fluidRow(
                valueBoxOutput(outputId = "extsul_v1", width = 3),
                valueBoxOutput(outputId = "extsul_v7", width = 3),
                valueBoxOutput(outputId = "extsul_v9", width = 3)),
              fluidRow(box(width =3, height = 220, status = "success", solidHeader = TRUE,
                           selectInput("sel57", "Selecione o IDH", choices = EXTSULnames$Principal7)),
                       box(width = 6, height = 500, title="Histograma do Indice de Desenvolvimento Humano Municipal (IDHM).", status = "success", solidHeader = TRUE, plotOutput("plot7")),
                       h3("1ª Doses", align="center"),
                       fluidRow(
                         infoBoxOutput(outputId = "extsl_tot_c8", width = 3),
                         infoBoxOutput(outputId = "extsl_mean_c8", width = 3)))
              
      ),
      tabItem(tabName = "lste",
              h2("Leste"),
              fluidRow(
                valueBoxOutput(outputId = "lste_v1", width = 3),
                valueBoxOutput(outputId = "lste_v7", width = 3),
                valueBoxOutput(outputId = "lste_v9", width = 3)),
              fluidRow(box(width =3, height = 220, status = "success", solidHeader = TRUE,
                           selectInput("sel58", "Selecione o tipo", choices = LSTEnames$Principal8)),
                       box(width = 6, height = 500, title="Histograma do Indice de Desenvolvimento Humano Municipal (IDHM).", status = "success", solidHeader = TRUE, plotOutput("plot8")),
                       h3("1ª Doses", align="center"),
                       fluidRow(
                         infoBoxOutput(outputId = "lste_tot_c8", width = 3),
                         infoBoxOutput(outputId = "lste_mean_c8", width = 3)))
              
      ),
      tabItem(tabName = "oste",
              h2("Oeste"),
              fluidRow(
                valueBoxOutput(outputId = "oste_v1", width = 3),
                valueBoxOutput(outputId = "oste_v7", width = 3),
                valueBoxOutput(outputId = "oste_v9", width = 3)),
              fluidRow(box(width =3, height = 220, status = "success", solidHeader = TRUE,
                           selectInput("sel59", "Selecione o tipo", choices = OSTEnames$Principal9)),
                       box(width = 6, height = 500, title="Histograma do Indice de Desenvolvimento Humano Municipal (IDHM).", status = "success", solidHeader = TRUE, plotOutput("plot9")),
                       h3("1ª Doses", align="center"),
                       fluidRow(
                         infoBoxOutput(outputId = "oste_tot_c8", width = 3),
                         infoBoxOutput(outputId = "oste_mean_c8", width = 3)))
              
      )
      
      
    )
  )
)

server <- function(input, output, session){
  
  
  
  output$geral_v1 <- renderValueBox({
    valueBox(
      value = "14.013.032",
      subtitle = "População Total",
      icon= icon("users"),
      color = "olive"
    )
  })
  
  output$geral_v7 <- renderValueBox({
    valueBox(
      value = "94.992",
      subtitle = "População 80+ anos",
      icon= icon("male"),
      color = "blue"
    )
  })
  
  output$geral_v9 <- renderValueBox({
    valueBox(
      value = "137.306",
      subtitle = "População 80+ anos",
      icon= icon("female"),
      color = "fuchsia"
    )
  })
  
  output$geral_v10 <- renderValueBox({
    valueBox(
      value = "947.753",
      subtitle = "Pop. em domicílios vulneráveis",
      icon= icon("users"),
      color = "teal"
    )
  })
  
  output$geral_tot_c1 <- renderInfoBox({
    infoBox(
      title="60 a 64 anos",
      value = "531.463",
      subtitle = "Total",
      icon= icon("syringe"),
      color = "green"
    )
  })
  
  output$geral_tot_c2 <- renderInfoBox({
    infoBox(
      title="65 a 69 anos",
      value = "450.651",
      subtitle = "Total",
      icon= icon("syringe"),
      color = "green"
    )
  })
  
  output$geral_tot_c3 <- renderInfoBox({
    infoBox(
      title="70 a 74 anos",
      value = "332.077",
      subtitle = "Total",
      icon= icon("syringe"),
      color = "green"
    )
  })
  
  output$geral_tot_c4 <- renderInfoBox({
    infoBox(
      title="75 a 79 anos",
      value = "258.984",
      subtitle = "Total",
      icon= icon("syringe"),
      color = "green"
    )
  })
  
  output$geral_tot_c5 <- renderInfoBox({
    infoBox(
      title="80 a 84 anos",
      value = "169.334",
      subtitle = "Total",
      icon= icon("syringe"),
      color = "green"
    )
  })
  
  output$geral_tot_c6 <- renderInfoBox({
    infoBox(
      title="85 a 89 anos",
      value = "105.788",
      subtitle = "Total",
      icon= icon("syringe"),
      color = "green"
    )
  })
  
  output$geral_tot_c7 <- renderInfoBox({
    infoBox(
      title="90 anos +",
      value = "105.788",
      subtitle = "Total",
      icon= icon("syringe"),
      color = "green"
    )
  })
  
  output$plot11 = renderPlot({
    if(input$sel1 == 1){
      dados %>%
        select(V3) %>%
        ggplot(aes(x=V3)) + geom_histogram(color = "white", fill = "lightblue", bins=30) + 
        theme_minimal(base_size = 18) + ggtitle("IDHM") + xlab("") + ylab("")
      
    }
    else{
      if(input$sel1 == 2){
        dados %>%
          select(V4) %>%
          ggplot(aes(x=V4)) + geom_histogram(color = "white", fill = "lightblue", bins=30) + 
          theme_minimal(base_size = 18) + ggtitle("Renda") + xlab("") + ylab("")
        
      }
      else{
        if(input$sel1 == 3){
          dados %>%
            select(V5) %>%
            ggplot(aes(x=V5)) + geom_histogram(color = "white", fill = "lightblue", bins=30) + 
            theme_minimal(base_size = 18) + ggtitle("Longevidade") + xlab("") + ylab("")
          
        }
        else{
          if(input$sel1 == 4){
            dados %>%
              select(V6) %>%
              ggplot(aes(x=V6)) + geom_histogram(color = "white", fill = "lightblue", bins=30) + 
              theme_minimal(base_size = 18) + ggtitle("Educação") + xlab("") + ylab("")
          }
        }
      }
    }
  })

  
  output$norte_v1 <- renderValueBox({
    valueBox(
      value = "1.016.807",
      subtitle = "População Total",
      icon= icon("users"),
      color = "olive"
    )
  })
  
  output$norte_v7 <- renderValueBox({
    valueBox(
      value = "7.342",
      subtitle = "População 80+ anos",
      icon= icon("male"),
      color = "blue"
    )
  })
  
  output$norte_v9 <- renderValueBox({
    valueBox(
      value = "9.787",
      subtitle = "População 80+ anos",
      icon= icon("female"),
      color = "fuchsia"
    )
  })
  
  output$norte_tot_c8 <- renderInfoBox({
    infoBox(
      title="Total",
      value = "131.593",
      subtitle = "1ª DOSES APLICADAS",
      icon= icon("syringe"),
      color = "green"
    )
  })
  
  
  output$norte_mean_c8 <- renderInfoBox({
    infoBox(
      title="Média",
      value = "4.700",
      subtitle = "1ª DOSES APLICADAS",
      icon= icon("syringe"),
      color = "green"
    )
  })
  
  output$plot1 = renderPlot({
    if(input$sel51 == 1){
      dados %>%
        select(NRS, V3) %>%
        filter(NRS == "Norte") %>%
        ggplot(aes(x=V3)) + geom_histogram(color = "white", fill = "lightblue", bins=10) + 
        theme_minimal(base_size = 18) + ggtitle("IDHM") + xlab("") + ylab("")
    }
    else{
      if(input$sel51 == 2){
        dados %>%
          select(NRS, V4) %>%
          filter(NRS == "Norte") %>%
          ggplot(aes(x=V4)) + geom_histogram(color = "white", fill = "lightblue", bins=10) + 
          theme_minimal(base_size = 18) + ggtitle("Renda") + xlab("") + ylab("")
      }
      else{
        if(input$sel51 == 3){
          dados %>%
            select(NRS, V5) %>%
            filter(NRS == "Norte") %>%
            ggplot(aes(x=V5)) + geom_histogram(color = "white", fill = "lightblue", bins=10) + 
            theme_minimal(base_size = 18) + ggtitle("Longevidade") + xlab("") + ylab("")
          
        }
        else{
          if(input$sel51 == 4){
            dados %>%
              select(NRS, V6) %>%
              filter(NRS == "Norte") %>%
              ggplot(aes(x=V6)) + geom_histogram(color = "white", fill = "lightblue", bins=10) + 
              theme_minimal(base_size = 18) + ggtitle("Educação") + xlab("") + ylab("")
          }
        }
        
              
            }
          }
    
  })

  
  output$nordeste_v1 <- renderValueBox({
    valueBox(
      value = "813.271",
      subtitle = "População Total",
      icon= icon("users"),
      color = "olive"
    )
  })
  
  output$nordeste_v7 <- renderValueBox({
    valueBox(
      value = "6.730",
      subtitle = "População 80+ anos",
      icon= icon("male"),
      color = "blue"
    )
  })
  
  output$nordeste_v9 <- renderValueBox({
    valueBox(
      value = "8.505",
      subtitle = "População 80+ anos",
      icon= icon("female"),
      color = "fuchsia"
    )
  })
  
  output$nrdste_tot_c8 <- renderInfoBox({
    infoBox(
      title="Total",
      value = "110.319",
      subtitle = "1ª DOSES APLICADAS",
      icon= icon("syringe"),
      color = "green"
    )
  })
  
  
  output$nrdste_mean_c8 <- renderInfoBox({
    infoBox(
      title="Média",
      value = "3.343",
      subtitle = "1ª DOSES APLICADAS",
      icon= icon("syringe"),
      color = "green"
    )
  })
  
  output$plot2 = renderPlot({
    if(input$sel52 == 1){
      dados %>%
        select(NRS, V3) %>%
        filter(NRS == "Nordeste") %>% 
        ggplot(aes(x=V3)) + geom_histogram(color= 'white',fill ='lightblue', bins=30) + 
        theme_minimal() + ggtitle("IDHM") + xlab("") + ylab("")
    }
    else{
      if(input$sel52 == 2){
        dados %>%
          select(NRS, V4) %>%
          filter(NRS == "Nordeste") %>% 
          ggplot(aes(x=V4)) + geom_histogram(color= 'white',fill ='lightblue', bins=30) + 
          theme_minimal() + ggtitle("Renda") + xlab("") + ylab("")
      }
      else{
        if(input$sel52 == 3){
          dados %>%
            select(NRS, V5) %>%
            filter(NRS == "Nordeste") %>% 
            ggplot(aes(x=V5)) + geom_histogram(color= 'white',fill ='lightblue', bins=30) + 
            theme_minimal() + ggtitle("Longevidade") + xlab("") + ylab("")
          
        }
        else{
          if(input$sel52 == 4){
            dados %>%
              select(NRS, V6) %>%
              filter(NRS == "Nordeste") %>% 
              ggplot(aes(x=V6)) + geom_histogram(color= 'white',fill ='lightblue', bins=30) + 
              theme_minimal() + ggtitle("Educação") + xlab("") + ylab("")
          }
        }
        
        
      }
    }
    
  })

  
  output$ctleste_v1 <- renderValueBox({
    valueBox(
      value = "2.066.474",
      subtitle = "População Total",
      icon= icon("users"),
      color = "olive"
    )
  })
  
  output$ctleste_v7 <- renderValueBox({
    valueBox(
      value = "16.426",
      subtitle = "População 80+ anos",
      icon= icon("male"),
      color = "blue"
    )
  })
  
  output$ctleste_v9 <- renderValueBox({
    valueBox(
      value = "23.493",
      subtitle = "População 80+ anos",
      icon= icon("female"),
      color = "fuchsia"
    )
  })
  
  output$ctleste_tot_c8 <- renderInfoBox({
    infoBox(
      title="Total",
      value = "302.118",
      subtitle = "1ª DOSES APLICADAS",
      icon= icon("syringe"),
      color = "green"
    )
  })
  
  
  output$ctleste_mean_c8 <- renderInfoBox({
    infoBox(
      title="Média",
      value = "4.196",
      subtitle = "1ª DOSES APLICADAS",
      icon= icon("syringe"),
      color = "green"
    )
  })
  
  output$plot3 = renderPlot({
    if(input$sel53 == 1){
      dados %>%
        select(NRS, V3) %>%
        filter(NRS == "Centro-Leste") %>% 
        ggplot(aes(x=V3)) + geom_histogram(color= 'white',fill ='lightblue', bins=30) + 
        theme_minimal() + ggtitle("IDHM") + xlab("") + ylab("")
    }
    else{
      if(input$sel53 == 2){
        dados %>%
          select(NRS, V4) %>%
          filter(NRS == "Centro-Leste") %>% 
          ggplot(aes(x=V4)) + geom_histogram(color= 'white',fill ='lightblue', bins=30) + 
          theme_minimal() + ggtitle("Renda") + xlab("") + ylab("")
      }
      else{
        if(input$sel53 == 3){
          dados %>%
            select(NRS, V5) %>%
            filter(NRS == "Centro-Leste") %>% 
            ggplot(aes(x=V5)) + geom_histogram(color= 'white',fill ='lightblue', bins=30) + 
            theme_minimal() + ggtitle("Longevidade") + xlab("") + ylab("")
          
        }
        else{
          if(input$sel53 == 4){
            dados %>%
              select(NRS, V6) %>%
              filter(NRS == "Centro-Leste") %>% 
              ggplot(aes(x=V6)) + geom_histogram(color= 'white',fill ='lightblue', bins=30) + 
              theme_minimal() + ggtitle("Educação") + xlab("") + ylab("")
          }
        }
      }
    }
    
  })
  
  output$ctnorte_v1 <- renderValueBox({
    valueBox(
      value = "771.253",
      subtitle = "População Total",
      icon= icon("users"),
      color = "olive"
    )
  })
  
  output$ctnorte_v7 <- renderValueBox({
    valueBox(
      value = "6.151",
      subtitle = "População 80+ anos",
      icon= icon("male"),
      color = "blue"
    )
  })
  
  output$ctnorte_v9 <- renderValueBox({
    valueBox(
      value = "7.682",
      subtitle = "População 80+ anos",
      icon= icon("female"),
      color = "fuchsia"
    )
  })
  
  output$ctnorte_tot_c8 <- renderInfoBox({
    infoBox(
      title="Total",
      value = "107.102",
      subtitle = "1ª DOSES APLICADAS",
      icon= icon("syringe"),
      color = "green"
    )
  })
  
  
  output$ctnorte_mean_c8 <- renderInfoBox({
    infoBox(
      title="Média",
      value = "2.818",
      subtitle = "1ª DOSES APLICADAS",
      icon= icon("syringe"),
      color = "green"
    )
  })
  
  output$plot4 = renderPlot({
    if(input$sel54 == 1){
      dados %>%
        select(NRS, V3) %>%
        filter(NRS == "Centro-norte") %>% 
        ggplot(aes(x=V3)) + geom_histogram(color= 'white',fill ='lightblue', bins=30) + 
        theme_minimal() + ggtitle("IDHM") + xlab("") + ylab("")
    }
    else{
      if(input$sel54 == 2){
        dados %>%
          select(NRS, V4) %>%
          filter(NRS == "Centro-norte") %>% 
          ggplot(aes(x=V4)) + geom_histogram(color= 'white',fill ='lightblue', bins=30) + 
          theme_minimal() + ggtitle("Renda") + xlab("") + ylab("")
      }
      else{
        if(input$sel54 == 3){
          dados %>%
            select(NRS, V5) %>%
            filter(NRS == "Centro-norte") %>% 
            ggplot(aes(x=V5)) + geom_histogram(color= 'white',fill ='lightblue', bins=30) + 
            theme_minimal() + ggtitle("Longevidade") + xlab("") + ylab("")
          
        }
        else{
          if(input$sel54 == 4){
            dados %>%
              select(NRS, V6) %>%
              filter(NRS == "Centro-norte") %>% 
              ggplot(aes(x=V6)) + geom_histogram(color= 'white',fill ='lightblue', bins=30) + 
              theme_minimal() + ggtitle("Educação") + xlab("") + ylab("")
          }
        }
        
      }
    }
    
  })
  
  
  
  output$sudoeste_v1 <- renderValueBox({
    valueBox(
      value = "1.704.534",
      subtitle = "População Total",
      icon= icon("users"),
      color = "olive"
    )
  })
  
  output$sudoeste_v7 <- renderValueBox({
    valueBox(
      value = "15.367",
      subtitle = "População 80+ anos",
      icon= icon("male"),
      color = "blue"
    )
  })
  
  output$sudoeste_v9 <- renderValueBox({
    valueBox(
      value = "19.596",
      subtitle = "População 80+ anos",
      icon= icon("female"),
      color = "fuchsia"
    )
  })
  
  output$sudoeste_tot_c8 <- renderInfoBox({
    infoBox(
      title="1ª Doses aplicadas",
      value = "273.155",
      subtitle = "Total",
      icon= icon("syringe"),
      color = "green"
    )
  })
  
  output$sudoeste_mean_c8 <- renderInfoBox({
    infoBox(
      title="1ª Doses aplicadas",
      value = "3.742",
      subtitle = "Média",
      icon= icon("syringe"),
      color = "green"
    )
  })
  
  
  
  output$plot5 = renderPlot({
    if(input$sel55 == 1){
      dados %>%
        select(NRS, V3) %>%
        filter(NRS == "Sudoeste") %>% 
        ggplot(aes(x=V3)) + geom_histogram(color= 'white',fill ='lightblue', bins=30) + 
        theme_minimal() + ggtitle("IDHM") + xlab("") + ylab("")
    }
    else{
      if(input$sel55 == 2){
        dados %>%
          select(NRS, V4) %>%
          filter(NRS == "Sudoeste") %>% 
          ggplot(aes(x=V4)) + geom_histogram(color= 'white',fill ='lightblue', bins=30) + 
          theme_minimal() + ggtitle("Renda") + xlab("") + ylab("")
      }
      else{
        if(input$sel55 == 3){
          dados %>%
            select(NRS, V5) %>%
            filter(NRS == "Sudoeste") %>% 
            ggplot(aes(x=V5)) + geom_histogram(color= 'white',fill ='lightblue', bins=30) + 
            theme_minimal() + ggtitle("Longevidade") + xlab("") + ylab("")
          
        }
        else{
          if(input$sel55 == 4){
            dados %>%
              select(NRS, V6) %>%
              filter(NRS == "Sudoeste") %>% 
              ggplot(aes(x=V6)) + geom_histogram(color= 'white',fill = "lightblue", bins=30) + 
              theme_minimal() + ggtitle("Educação") + xlab("") + ylab("")
          }
        }
      }
    }
  })

  
  output$sul_v1 <- renderValueBox({
    valueBox(
      value = "1.657.428",
      subtitle = "População Total",
      icon= icon("users"),
      color = "olive"
    )
  })
  
  output$sul_v7 <- renderValueBox({
    valueBox(
      value = "13.413",
      subtitle = "População 80+ anos",
      icon= icon("male"),
      color = "fuchsia"
    )
  })
  
  output$sul_v9 <- renderValueBox({
    valueBox(
      value = "16.830",
      subtitle = "População 80+ anos",
      icon= icon("female"),
      color = "fuchsia"
    )
  })
  
  output$sul_tot_c8 <- renderInfoBox({
    infoBox(
      title="1ª Doses aplicadas",
      value = "212.588",
      subtitle = "Total",
      icon= icon("syringe"),
      color = "green"
    )
  })
  
  output$sul_mean_c8 <- renderInfoBox({
    infoBox(
      title="1ª Doses aplicadas",
      value = "3.126",
      subtitle = "Média",
      icon= icon("syringe"),
      color = "green"
    )
  })
  
  output$plot6 = renderPlot({
    if(input$sel56 == 1){
      dados %>%
        select(NRS, V3) %>%
        filter(NRS == "Sul") %>% 
        ggplot(aes(x=V3)) + geom_histogram(color= 'white',fill ='lightblue', bins=30) + 
        theme_minimal() + ggtitle("IDHM") + xlab("") + ylab("")
    }
    else{
      if(input$sel56 == 2){
        dados %>%
          select(NRS, V4) %>%
          filter(NRS == "Sul") %>% 
          ggplot(aes(x=V4)) + geom_histogram(color= 'white',fill ='lightblue', bins=30) + 
          theme_minimal() + ggtitle("Renda") + xlab("") + ylab("")
      }
      else{
        if(input$sel56 == 3){
          dados %>%
            select(NRS, V5) %>%
            filter(NRS == "Sul") %>% 
            ggplot(aes(x=V5)) + geom_histogram(color= 'white',fill ='lightblue', bins=30) + 
            theme_minimal() + ggtitle("Longevidade") + xlab("") + ylab("")
          
        }
        else{
          if(input$sel56 == 4){
            dados %>%
              select(NRS, V6) %>%
              filter(NRS == "Sul") %>% 
              ggplot(aes(x=V6)) + geom_histogram(color= 'white',fill ='lightblue', bins=30) + 
              theme_minimal() + ggtitle("Educação") + xlab("") + ylab("") 
          }
        }
      }
    }
  })
  
  
  
  output$extsul_v1 <- renderValueBox({
    valueBox(
      value = "760.206",
      subtitle = "População Total",
      icon= icon("users"),
      color = "olive"
    )
  })
  
  output$extsul_v7 <- renderValueBox({
    valueBox(
      value = "19.072",
      subtitle = "População 80+ anos",
      icon= icon("male"),
      color = "blue"
    )
  })
  
  output$extsul_v9 <- renderValueBox({
    valueBox(
      value = "39.437",
      subtitle = "População 80+ anos",
      icon= icon("female"),
      color = "fuchsia"
    )
  })
  
  output$extsl_tot_c8 <- renderInfoBox({
    infoBox(
      title="1ª Doses aplicadas",
      value = "95.057",
      subtitle = "Total",
      icon= icon("syringe"),
      color = "green"
    )
  })
  
  output$extsl_mean_c8 <- renderInfoBox({
    infoBox(
      title="1ª Doses aplicadas",
      value = "4.527",
      subtitle = "Média",
      icon= icon("syringe"),
      color = "green"
    )
  })
  
  output$plot7 = renderPlot({
    if(input$sel57 == 1){
      dados %>%
        select(NRS, V3) %>%
        filter(NRS == "Extremo Sul") %>% 
        ggplot(aes(x=V3)) + geom_histogram(color= 'white',fill ='lightblue', bins=30) + 
        theme_minimal() + ggtitle("IDHM") + xlab("") + ylab("")
    }
    else{
      if(input$sel57 == 2){
        dados %>%
          select(NRS, V4) %>%
          filter(NRS == "Extremo Sul") %>% 
          ggplot(aes(x=V4)) + geom_histogram(color= 'white',fill ='lightblue', bins=30) + 
          theme_minimal() + ggtitle("Renda") + xlab("") + ylab("")
      }
      else{
        if(input$sel57 == 3){
          dados %>%
            select(NRS, V5) %>%
            filter(NRS == "Extremo Sul") %>% 
            ggplot(aes(x=V5)) + geom_histogram(color= 'white',fill ='lightblue', bins=30) + 
            theme_minimal() + ggtitle("Longevidade") + xlab("") + ylab("")
          
        }
        else{
          if(input$sel57 == 4){
            dados %>%
              select(NRS, V6) %>%
              filter(NRS == "Extremo Sul") %>% 
              ggplot(aes(x=V6)) + geom_histogram(color= 'white',fill ='lightblue', bins=30) + 
              theme_minimal() + ggtitle("Educação") + xlab("") + ylab("")
          }
        }
      }
    }
  })
  
  output$lste_v1 <- renderValueBox({
    valueBox(
      value = "435.722",
      subtitle = "População Total",
      icon= icon("users"),
      color = "olive"
    )
  })
  
  output$lste_v7 <- renderValueBox({
    valueBox(
      value = "19.072",
      subtitle = "População 80+ anos",
      icon= icon("male"),
      color = "blue"
    )
  })
  
  output$lste_v9 <- renderValueBox({
    valueBox(
      value = "39.437",
      subtitle = "População 80+ anos",
      icon= icon("female"),
      color = "fuchsia"
    )
  })
  
  output$lste_tot_c8 <- renderInfoBox({
    infoBox(
      title="1ª Doses aplicadas",
      value = "573.451",
      subtitle = "Total",
      icon= icon("syringe"),
      color = "green"
    )
  })
  
  output$lste_mean_c8 <- renderInfoBox({
    infoBox(
      title="1ª Doses aplicadas",
      value = "12.466",
      subtitle = "Média",
      icon= icon("syringe"),
      color = "green"
    )
  })
  
  output$plot8 = renderPlot({
    if(input$sel58 == 1){
      dados %>%
        select(NRS, V3) %>%
        filter(NRS == "Leste") %>% 
        ggplot(aes(x=V3)) + geom_histogram(color= 'white',fill ='lightblue', bins=30) + 
        theme_minimal() + ggtitle("IDHM") + xlab("") + ylab("")
    }
    else{
      if(input$sel58 == 2){
        dados %>%
          select(NRS, V4) %>%
          filter(NRS == "Leste") %>% 
          ggplot(aes(x=V4)) + geom_histogram(color= 'white',fill ='lightblue', bins=30) + 
          theme_minimal() + ggtitle("Renda") + xlab("") + ylab("")
      }
      else{
        if(input$sel58 == 3){
          dados %>%
            select(NRS, V5) %>%
            filter(NRS == "Leste") %>% 
            ggplot(aes(x=V5)) + geom_histogram(color= 'white',fill ='lightblue', bins=30) + 
            theme_minimal() + ggtitle("Longevidade") + xlab("") + ylab("")
          
        }
        else{
          if(input$sel58 == 4){
            dados %>%
              select(NRS, V6) %>%
              filter(NRS == "Leste") %>% 
              ggplot(aes(x=V6)) + geom_histogram(color= 'white',fill ='lightblue', bins=30) + 
              theme_minimal() + ggtitle("Educação") + xlab("") + ylab("") 
          }
        }
      }
    }
  })
  
  output$oste_v1 <- renderValueBox({
    valueBox(
      value = "865.437",
      subtitle = "População Total",
      icon= icon("users"),
      color = "olive"
    )
  })
  
  output$oste_v7 <- renderValueBox({
    valueBox(
      value = "5.864",
      subtitle = "População 80+ anos",
      icon= icon("male"),
      color = "blue"
    )
  })
  
  output$oste_v9 <- renderValueBox({
    valueBox(
      value = "6.817",
      subtitle = "População 80+ anos",
      icon= icon("female"),
      color = "fuchsia"
    )
  })
  
  output$oste_tot_c8 <- renderInfoBox({
    infoBox(
      title="1ª Doses aplicadas",
      value = "112.204",
      subtitle = "Total",
      icon= icon("syringe"),
      color = "green"
    )
  })
  
  output$oste_mean_c8 <- renderInfoBox({
    infoBox(
      title="1ª Doses aplicadas",
      value = "3.033",
      subtitle = "Média",
      icon= icon("syringe"),
      color = "green"
    )
  })
  
  output$plot9 = renderPlot({
    if(input$sel59 == 1){
      dados %>%
        select(NRS, V3) %>%
        filter(NRS == "Oeste") %>% 
        ggplot(aes(x=V3)) + geom_histogram(color= 'white',fill ='lightblue', bins=30) + 
        theme_minimal() + ggtitle("IDHM") + xlab("") + ylab("")
    }
    else{
      if(input$sel59 == 2){
        dados %>%
          select(NRS, V4) %>%
          filter(NRS == "Oeste") %>% 
          ggplot(aes(x=V4)) + geom_histogram(color= 'white',fill ='lightblue', bins=30) + 
          theme_minimal() + ggtitle("Renda") + xlab("") + ylab("")
      }
      else{
        if(input$sel59 == 3){
          dados %>%
            select(NRS, V5) %>%
            filter(NRS == "Oeste") %>% 
            ggplot(aes(x=V5)) + geom_histogram(color= 'white',fill ='lightblue', bins=30) + 
            theme_minimal() + ggtitle("Longevidade") + xlab("") + ylab("")
          
        }
        else{
          if(input$sel59 == 4){
            dados %>%
              select(NRS, V6) %>%
              filter(NRS == "Oeste") %>% 
              ggplot(aes(x=V6)) + geom_histogram(color= 'white',fill ='lightblue', bins=30) + 
              theme_minimal() + ggtitle("Longevidade") + xlab("") + ylab("")
          }
        }
      }
    }
  })
  
  
  

  
  
  
  
  
  
  
  
  
  
  
  
  
  
}

shinyApp(ui,server)