library(shiny)
shinyServer(function(input, output) {
 #trees$Height <- ifelse(trees$Girth - 20 > 0, trees$Girth - 20, 0)
  
  
  
  model1 <- lm(Volume ~ Girth, data = trees)
  model2 <- lm(Volume ~ Girth + Height, data = trees)
  
 
  model1pred <- reactive({
    mpgInput <- as.numeric(input$GirthChoise)
    print(mpgInput)
    Height <- (subset(trees, Girth = mpgInput))$Height 
    print(Height)
    predict(model2, newdata = data.frame(Girth = mpgInput, Height = Height[1]))
  })

  output$plot1 <- renderPlot({
    mpgInput <- as.numeric(input$GirthChoise)
    
    plot(trees$Girth, trees$Vomume, xlab = "Girth (inches)", 
         ylab = "Timber Volume  (cubic ft)", bty = "n", pch = 16 , 
         xlim = c(min(trees$Girth), max(trees$Girth)), 
         ylim = c(min(trees$Volume), max(trees$Volume)))
    abline(model2, col = "red", lwd = 2)
    points(mpgInput, model1pred(), col = "red", pch = 16, cex = 2)
   
  })
  
  output$pred1 <- renderText({
    model1pred()
  })

})

