#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
 
  modelLM <- lm(iris$Petal.Width ~ iris$Petal.Length, data = iris)
  coef1 <- "" 
  
  output$distPlot <- renderPlot({
  irisInput <- input$inRadioButton
        if (irisInput != "ALL")
      {
        # according to user choise, regression model is recreated
             irisData <- subset(iris, Species == irisInput)
           modelLM <- lm(irisData$Petal.Width ~ irisData$Petal.Length, data = irisData)
            plot(irisData$Petal.Length, irisData$Petal.Width , xlab = "Petal Length in cm",
                  ylab = "Petal Width in cm", bty = "n", pch=21, 
             xlim = c(min(irisData$Petal.Length), max(irisData$Petal.Length)),
             ylim = c(min(irisData$Petal.Width), max(irisData$Petal.Width)),
             main = paste("Iris Species - linear regression model for", irisInput, sep=" ")) 
            
        abline(modelLM, col = "red" ,lty= 2  , lwd=3)
        #print(irisInput)
        a <- modelLM$coefficient
       # print(a)
        
      }
      
      else{
        plot(iris$Petal.Length, iris$Petal.Width , xlab = "Petal Length in cm",
             ylab = "Petal Width in cm", bty = "n", pch=21, 
             xlim = c(min(iris$Petal.Length), max(iris$Petal.Length)),
             ylim = c(min(iris$Petal.Width), max(iris$Petal.Width)),
             bg=c("red","green","yellow")[unclass(iris$Species)], main="Iris Species - linear regression model")
        abline(modelLM, col = "blue" ,lty= 2  , lwd=5 )
        
        a <- modelLM$coefficient
        
      }
      
  })
    
  
  output$coef1 <- renderText({
        coef1 <- a
  })
    output$pred1 <- renderText({
     pred1 <- input$inRadioButton
    })
    
  
})