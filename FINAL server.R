# Install and load the Shiny package if not already installed
if (!require("shiny")) install.packages("shiny")
library(shiny)

# Define the server
server <- function(input, output, session)
  
  output$log_output <- renderText({
    paste("Date: ", as.character(input$today_date), "<br>",
          "Blood Pressure Reading: ", input$bp_reading, "<br>",
          "Medications: ", paste(input$medications, collapse = ", "))
  })

# Run the Shiny app

ui <- fluidPage(
  titlePanel("Blood Pressure Log"),
  sidebarLayout(
    sidebarPanel(
      dateInput("today_date", "Select Today's Date:", value = Sys.Date()),
      textInput("bp_reading", "Blood Pressure Reading:"),
      checkboxGroupInput("medications", "Select Medications:",
                         choices = c("Hydrochlorothiazide", "Lisinopril", "Hydrochlorothiazide + Lisinopril"))
    ),
    mainPanel(
      textOutput("log_output")
    )
  )
)

server <- function(input, output) {
  output$log_output <- renderText({
    paste("Date: ", as.character(input$today_date), "<br>",
          "Blood Pressure Reading: ", input$bp_reading, "<br>",
          "Medications: ", paste(input$medications, collapse = ", "))
  })
}

shinyApp(ui = ui, server = server)
