library(shiny)
library(plotly)

shinyServer(function(input, output) {
  output$text <- renderText((input$wt*0.45)/((input$ht*0.025)^2))
  output$plot <- renderPlotly({
    Inches<-seq(36,84,6)
    Lbs<-c(39.15,53.2875, 69.6,88.0875, 108.75, 131.5875, 156.6, 183.7875, 213.15 )
    BmiUnd<-c(33.3, 45.325, 59.2, 74.925, 92.5, 111.925, 133.2, 156.325, 181.3)
    BmiHeal<- c(45, 61.25, 80, 101.25, 125, 151.25, 180, 211.25, 245)
    BmiOver<- c(54, 73.5, 96, 121.5, 150, 181.5, 216, 253.5, 294)
    BmiObese<- c(400, 400, 400, 400, 400, 400, 400, 400, 400)
    BmiData<-data.frame(Inches,Lbs,BmiUnd,BmiHeal,BmiOver,BmiObese)
    w<-input$wt
    w1<-w-10
    w2<-w+10
    h<-input$ht
    h1<-h-0.5
    h2<-h+0.5
    plot_ly(BmiData, x = ~Inches, y = ~Lbs, name = 'Your BMI', type = 'scatter', mode = 'none', fill = 'tozeroy', fillcolor = '#F5FF8D') %>%
      add_trace(y = ~BmiObese, name = 'Obese', fillcolor = '#50CB86') %>%
      add_trace(y = ~BmiOver, name = 'Overweight', fillcolor = '#4C74C9') %>%
      add_trace(y = ~BmiHeal, name = 'Healthy', fillcolor = '#700961') %>%
      add_trace(y = ~BmiUnd, name = 'Underweight', fillcolor = '#312F44') %>%
      layout(title = 'BMI Chart',
             xaxis = list(title = "Height in Inches",
                          showgrid = FALSE),
             yaxis = list(title = "Weight in lbs",
                          showgrid = FALSE, range = c(0,400)),
             shapes=list(type = 'circle', xref = 'x', x0=h1, x1=h2,
                         yref = 'y', y0=w1, y1=w2,
                         fillcolor = '#F5FF8D')
      )
  })
})