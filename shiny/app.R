#  -----------------------------------------------------------------------------
#  COURSERA cAPSTONE - DATA SCIENCE sPECIALIZATION
#  Next Word Prediction App
#  File: app.R
#  (c) 2016 - Liyang Qin
#  12/Oct/2016
#  -----------------------------------------------------------------------------
library(shiny)
library(shinythemes)

# 1. SERVER ----------------------------------------------------------------
server <- function(input, output) {
  output$user_input <- renderText({input$user_input})
  # output$top5_table <- renderTalbe({}),
  # output$top5_prob_plot <- renderPlot({})
}

# 2. ui ---------------------------------------------------------------
ui <- fluidPage(
	theme = shinytheme("united"),
	navbarPage("Predict the next word!",
# 2.1 Prediction tab--------------------------------------------------	
  	tabPanel("Prediction",
  	
  	sidebarLayout(

    sidebarPanel(
      h4("What's next?"),
      textInput("user_input", label = h3("Your sentence"), value = "Have a nice"),
      h3("How to use"),
      p("Enter your sentence without the word you want to predict. The app will run automatically."),
      p("We wil give the first 3 predictions for your sentence and a word cloud for the first 20 probabilities.")
    ),

    mainPanel(
    	h4("You Entered:"),
    	textOutput("user_input"),
    	h4("Top 5 matches:"),
    	tableOutput("top5_table"),
    	plotOutput("top5_prob_plot")
    		)
  		)
	),
# 2.2 Introduction tab--------------------------------------------------
  	tabPanel("About this App")
	)  
) # End of fluid page
# 3. APP -----------------------------------------------------------------------

shinyApp(ui = ui, server = server)