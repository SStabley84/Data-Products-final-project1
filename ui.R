library(shiny)
library(plotly)

shinyUI(fluidPage(
  titlePanel("BMI"),
  sidebarLayout(
    sidebarPanel(
      h1("Calculate Your BMI"),
      sliderInput("ht", "Height in Inches", 36, 96, 36),
      sliderInput("wt", "Weight in Lbs", 50,400,50),
      h3("YOUR BMI"),
      textOutput("text"),
      h4("What does this mean?"),
      h5("BMI 0-18.5 means you are underweight"),
      h5("BMI 18.51-25 means you are at a healthy weight"),
      h5("BMI 25.01-30 means you are overweight"),
      h5("BMI 30.01 or more means you are considered obese")
    ),
    mainPanel(
      plotlyOutput("plot")
    )
  )
))