
library(shiny)
library(shinythemes) 

# 1. SERVER ----------------------------------------------------------------
server <- function(input, output) {

}

# 2. ui ---------------------------------------------------------------
ngrams_names <- c("1-gram","2-gram","3-gram")
ui <- fluidPage(
  theme = shinytheme("united"),
  tags$hr(),
  titlePanel("WHAT'S NEXT?"),
  tags$hr(),
  
  mainPanel(tabsetPanel(
    #---------------------------------------------------------------------------
    tabPanel("Prediction",
             sidebarLayout(
               sidebarPanel(
               	 tags$h4("You entered:"),
                 wellPanel(h1(textOutput("user_input"), align = "center")),
                 tags$h4("Prediction:"),
                 wellPanel(h1(textOutput("text_out_id_1"), align = "center")),
                 fluidRow(
                   column(width = 3,  offset = 0,
                          actionButton("button_1",
                                       label = "Clear",
                                       icon = icon("refresh"))
                          )
            )
      ),
      mainPanel(
      tags$p(""),
      tags$h3("Please, enter your text:"),
      h4(tags$textarea(id = "text_in_id_1", rows = 10, cols = 40, "")))
      )),
    
    
    #---------------------------------------------------------------------------
    tabPanel("N-grams tables",
             sidebarLayout(
               sidebarPanel(
                 
                 ),
             mainPanel(dataTableOutput("ngrams_table"))
             )
    ), 
    
    #---------------------------------------------------------------------------
    tabPanel("Word Cloud",
             sidebarLayout(
               sidebarPanel(
                 
               ),
               mainPanel(plotOutput("display_wordcloud"))
               )
    ),
    
    #---------------------------------------------------------------------------
    tabPanel("N-grams Plot",
             sidebarLayout(
               sidebarPanel(
                 
               ),
               mainPanel(plotOutput("ggplot_ngram"))
               )
    )
    )
)
)

# 3. APP -----------------------------------------------------------------------

shinyApp(ui = ui, server = server)