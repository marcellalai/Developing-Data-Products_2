"Iris flowers" shiny app
========================================================
author: Marcella Lai
date: 02 August 2019
autosize: true




"Iris flowers" : summary
========================================================
This presentation pitch the "Iris flowers"  application you could find  <a href="https://marcella.shinyapps.io/myShinyApp-DDPW4_2/">here</a>

The data used is "iris" data set (standard R packages)
It contains  features measured for 3 Iris  species, setosa, virginica, versicolor ;  it's an example of multivariate data set introduced by Ronald Fisher in 1936.
<p>
"Iris flowers" uses a linear regression model showing correlation between petal height and its width.

"Iris flowers" application allows users 
- to select what species investigate (one of three setosa, virginica, versicolor or ALL )
- to know the value of intersept , according to choise, of the regression line.

"Iris flowers" application draws plot of iris data set distributed by height (x axis) and weight (y axis).  The regression line is shown on the plot as well


"Iris flowers" : details on data
========================================================
The data used is "iris" data set, available with standard R packages.
Data set consists of four measurements (length and width of the petals and sepals) for different 3 species of iris : 50 observations for each species, 150 in total.


```r
summary(iris)
```

```
  Sepal.Length    Sepal.Width     Petal.Length    Petal.Width   
 Min.   :4.300   Min.   :2.000   Min.   :1.000   Min.   :0.100  
 1st Qu.:5.100   1st Qu.:2.800   1st Qu.:1.600   1st Qu.:0.300  
 Median :5.800   Median :3.000   Median :4.350   Median :1.300  
 Mean   :5.843   Mean   :3.057   Mean   :3.758   Mean   :1.199  
 3rd Qu.:6.400   3rd Qu.:3.300   3rd Qu.:5.100   3rd Qu.:1.800  
 Max.   :7.900   Max.   :4.400   Max.   :6.900   Max.   :2.500  
       Species  
 setosa    :50  
 versicolor:50  
 virginica :50  
                
                
                
```


"Iris flowers" : shiny files
========================================================
The application is build using Shiny package and the source code is in 2 files:
- ui.R
- server.R
<p>Both files can be found here: GitHub repo [RPub] (http://rpubs.com/XXX)
<p>Following some extract from code 

```r
      irisInput <- input$inRadioButton
      if (irisInput != "ALL")
      {
          irisData <- subset(iris, Species == irisInput)
           modelLM <- lm(irisData$Petal.Width ~ irisData$Petal.Length, data = irisData)
            plot(irisData$Petal.Length, irisData$Petal.Width , xlab = "Petal Length in cm",
                  ylab = "Petal Width in cm", bty = "n", pch=21, 
            main = paste("Iris Species - linear regression model for", irisInput, sep=" ")) 
          abline(modelLM, col = "red" ,lty= 2  , lwd=3)
        ...
```

"Iris flowers" : just some examples
========================================================
![plot of chunk unnamed-chunk-3](myShinyApp-DDPW4_2-figure/unnamed-chunk-3-1.png)![plot of chunk unnamed-chunk-3](myShinyApp-DDPW4_2-figure/unnamed-chunk-3-2.png)
