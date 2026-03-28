#Hannah Hardy
#Dr Semiyari 
#Data Science
#29 March 2026

#Load packages

pacman::p_load(shiny, tidyverse)

#define observations

observations <- 200

#define UI

ui <- fluidPage(
  radioButtons(inputId = "Type",
               label = "Type of Plot",
               choices = c("Histogram", "Boxplot"),
               selected = "Histogram"),
  
  radioButtons(inputId = "color_fill",
                label = "Color of Plot Fill",
                choices = c("Black" = "black",
                            "Pink" = "pink",
                            "Red" = "red",
                            "Brown" = "brown",
                            "Purple" = "purple"),
                selected = "black"),
  
  radioButtons(inputId = "color_border",
               label = "Color of Plot Borders/Lines",
               choices = c("White" = "white",
                           "Grey" = "darkgrey",
                           "Black" = "black"),
               selected = "white"),
  
  numericInput('n',
               'Observations',
               observations),
  
  plotOutput("plot")
)

#define server code

server <- function(input, output) {
  output$plot <- renderPlot({
    if (input$Type == "Histogram") {
      hist(runif(input$n),
           col = input$color_fill,
           border = input$color_border,
           main = "Histogram: Random Distribution",
           xlab = "Value")
    } else {
      boxplot(runif(input$n),
              col = input$color_fill,
              border = input$color_border,
              main = "Boxplot: Random Distribution",
              ylab = "Value")
    }
  })
}

#return shiny app

shinyApp(ui = ui, server = server)