#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

#    http://shiny.rstudio.com/
#

library(shiny)
shinyUI(fluidPage(
  titlePanel("Predict petal width from petal length for Iris flowers"),
  sidebarLayout(
    sidebarPanel(
      
      p("Linear regression based on data of :", h3(textOutput("pred1") , " species")),
     
      p(
      radioButtons("inRadioButton", h3("Choose Species you prefere investigate:"), 
                   choiceNames = c("ALL Species","Setosa","Versicolor","Virginica"), choiceValues = c("ALL","setosa","versicolor","virginica"))
      
      ),
      submitButton("Submit")
            ),
    
    
    # Show a plot of the generated distribution
    mainPanel(
  
       plotOutput("distPlot"),
       h3("Calculated slope is :", textOutput("coef1"))
    )
  )
))
