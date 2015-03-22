library(shiny)
library(ggplot2)
shinyUI(fluidPage(
        theme = "bootstrap.css",
        tags$head(
                tags$style(HTML("
      @import url('//fonts.googleapis.com/css?family=Lobster|Cabin:400,700');
      
      h1 {
        font-family: 'Impact', Charcoal,sans-serif;
        font-weight: 500;
        line-height: 1.1;
        color: #48ca2b;
      }

    "))
        ),
        
        headerPanel("Childs Height Calculator"),
        h3('Introduction',style = "color:Red"),
        em("This application is created using R Shiny package.With the help of this Application a user can Predict 
          Childs height by entering Parents Heights and Childs Gender.The applicaton will display predicted child height 
          in" ,span("inches/Feets/Centimeters", style = "color:green"),"on the Prediction Panel along with an interactive graph which will generate 
          a historam showing Childs Height with respect to Parents Height.",style = "color:white"),
        em("The data used for prediction is taken from GaltonFamilies data which is 
          available in package UsingR.For prediction I have used caret package and glm(",span("generalized linear models", style = "color:green"),") method.",style = "color:white"),
        sidebarPanel(
                h4('Enter Values',style = "color:red"),
                numericInput('id1','Enter Height of Father in Inches',12,min = 12,max=200),
                numericInput('id2','Enter Height of Mother in Inches',12,min = 12,max=200),
                selectInput("var", label = "Choose a Gender of the child",
                     choices = c("male", "female"),
                            selected = "female"),
                submitButton('Submit')
        ),
        mainPanel(
                h4('Prediction',align = "center",style = "color:red"),
                h6('The childs Height in Inches',style = "color:grey"),
                verbatimTextOutput("oid1"),
                h6('The childs Height in Feets',style = "color:grey"),
                verbatimTextOutput("oid2"),
                h6('The childs Height in centimeters',style = "color:grey"),
                verbatimTextOutput("oid3"),
                plotOutput('newplot')
                
        )
))