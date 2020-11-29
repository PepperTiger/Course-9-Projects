#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("Normal law distribution"),

    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            sliderInput("mean",
                        "Mean ?",
                        min = -10,
                        max = 10,
                        value = 0),
            sliderInput("sd",
                        "Standard deviation ?",
                        min = 0,
                        max = 20,
                        value = 1),
            sliderInput("xwind",
                        "X-window ?",
                        min = -50,
                        max = 50,
                        value = c(-5,5))
        ),

        # Show a plot of the generated distribution
        mainPanel(
           plotOutput("normPlot")
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {

    output$normPlot <- renderPlot({
        x = seq(input$xwind[1], input$xwind[2], by = 0.1)
        y = dnorm(x, mean=input$mean, sd=input$sd)
        plot(x, y, type="l")
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
