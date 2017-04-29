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
   
  normref<-dnorm(seq(-4,4,length=100))
  
  expMean <- reactive({
    set.seed(12345)
    nDist <- input$bins
    dist <- switch(input$dist,
                   norm = rnorm,
                   unif = runif,
                   exp = rexp,
                   rnorm)
    expsamples <- matrix(dist(n=nDist*1000), 1000, nDist)
    apply(expsamples, 1, mean)
  })
  
  normExpMean <- reactive({
    nDist <- input$bins
    mu<-switch(input$dist,
               norm = 0,
               unif = 0.5,
               exp = 1,
               0)
    sigma <- switch(input$dist,
                    norm = 1,
                    unif = 0.25,
                    exp = 1,
                    0)
    (expMean()-mu)/(sigma/(1*sqrt(nDist)))
  })
  
  output$distPlot <- renderPlot({
    
    # generate bins based on input$bins from ui.R
    x    <- faithful[, 2] 
    bins <- seq(min(x), max(x), length.out = input$bins + 1)
    
    # draw the histogram with the specified number of bins
    hist(x, breaks = bins, col = 'darkgray', border = 'white')
    
    par(mfrow=c(1,2))
    expmean<-expMean()
    hist(expmean,
         main = "Sample Mean\nDistribution", freq = FALSE,
         xlab = "x", ylab = "density(x)")
    lines(density(expmean),lwd=2)
    
    normalized_expmean <- normExpMean()
    hist(normalized_expmean, freq = FALSE,
         main = "Normalized Sample Mean\nDistribution", 
         xlab = "x", ylab = "density(x)")
    lines(density(normalized_expmean),lwd=2)
    lines(seq(-4,4,length=100),normref,lwd=2,col='red')
    
  })
  
})
