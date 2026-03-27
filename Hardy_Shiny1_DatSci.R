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
               selected = "Histogram"
  radiotButtons(
  numericInput(
  plotOutput(
)