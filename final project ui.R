# Install and load the Shiny package if not already installed
if (!require("shiny")) 
install.packages("shiny")
library(shiny)

# Define the UI
ui <- fluidPage(
  titlePanel("Today's Date"),
  sidebarLayout(
    sidebarPanel(
      dateInput("today_date", "Select Today's Date:", value = Sys.Date())
    ),
    mainPanel(
      textOutput("selected_date")
    )
  )
)

# Define the server
server <- function(input, output) {
  output$selected_date <- renderText({
    paste("Selected Date: ", as.character(input$today_date))
  })
}

# Run the Shiny app
shinyApp(ui = ui, server = server)
