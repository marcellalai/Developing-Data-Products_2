#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#
library(shiny)
shinyUI(fluidPage(
  titlePanel("Predict Cherry Tree Volume from Girth"),
  sidebarLayout(
    sidebarPanel(
      selectInput("GirthChoise", "Choose a Height  value:", list(trees$Height),  choices = c(as.character(trees$Height))),
      submitButton("Submit")
    ),
    mainPanel(
      plotOutput("plot1"),
      h3("Predicted Timber Volume from Model 1:"),
      textOutput("pred1")    )
  )
))


