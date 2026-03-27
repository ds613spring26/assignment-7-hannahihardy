#Hannah Hardy
#Dr Semiyari 
#Data Science
#29 March 2026

#Load packages

pacman::p_load(shiny, tidyverse)

#define observations

observations <- 200

#define UI

ui <- bootstrap(
  radioButtons(inputID = "Type",
               label = "Type of Plot",
               choices = c("Histogram, Boxplot"),
               selected = "Histogram"),
  
  radiotButtons(inputID = "color",
                label = "Color of Plot",
                choices = c("Black" = "black",
                            "Pink" = "pink",
                            "Brown" = "brown",
                            "Purple" = "purple"),
                selected = "black"),
  
  numericInput('n',
               'Observations',
               n),
  
  plotOutput("plot")
)

#define server code

server <- function(input, output) {
  output$plot <- renderPlot({
    if (input$Type == "Histogram") {
      hist(runif(input$n),
           col = input$color,
           main = "Histogram: Random Distribution",
           xlab = "Value")
    } else {
      boxplot(runif(input$n),
              col = input$color,
              main = "Boxplot: Random Distribution",
              ylab = "Value"))
    }
}}