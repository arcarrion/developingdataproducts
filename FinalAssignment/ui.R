#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("The Central Limit Theorem Show"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
       sliderInput("bins",
                   "Number of added distributions:",
                   min = 1,
                   max = 100,
                   value = 1),
       
       radioButtons("dist", "Distribution type:",
                    c("Normal" = "norm",
                      "Uniform" = "unif",
                      "Exponential" = "exp"))
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      p("Welcome to the Central Limit Theorem Show!"),
      p("The Central Limit Theorem establishes that, for the most commonly 
        studied scenarios, the arithmetic mean of a sufficiently large number of 
        independent random variables, will be approximately normally distributed, 
        regardless of the underlying distribution"),
      p("Let's try it out using three well-known distributions: the normal distribution 
        itself, the uniform distribution and the exponential distribution."),
      p("Choose one from the side panel, and observe how, when the number of distributions being added 
        increases, the resulting curve resembles a normal distribution (red line)."),
       plotOutput("distPlot")
    )
  )
))
