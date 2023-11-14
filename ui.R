library(shiny)

shinyUI(fluidPage(
  tags$style(type="text/css",
             ".shiny-output-error { visibility: hidden; }",
             ".shiny-output-error:before { visibility: hidden; }"
  ),
  
  titlePanel("BMI Calculator"),
  
  sidebarLayout(
    sidebarPanel(
      helpText("Enter your height and weight to know how fit you are!"),  
      selectInput("select_measure", label = h6("Select the measurement"), choices = list("Metric (kg vs. cm)" = 1, "Emperical (lb vs. inches)" = 703), selected = 1),
      numericInput("num_height", label = h6("Enter your height"),min = 1, value = NULL),
      numericInput("num_weight", label = h6("Enter your weight"),min = 1, value = NULL),
      actionButton("action_Calc", label = "CALCULATE")        
    ),
    mainPanel(
      tabsetPanel(
        tabPanel("Results",
                 p(h3("")), textOutput("text_height"),
                 p(h5("")),
                 textOutput("text_weight"),
                 p(h3("")),
                 textOutput("text_bmi"),
                 p(h3("")),
                 textOutput("text_category"),
                 p(h1("")),
                 p(h5("Refer to the chart for more details"))
        ),
        tabPanel("BMI Chart",
                 p(h4("Body Mass Index Chart")),
                 helpText("Statistical Categories of BMI as given by WHO"),
                 HTML("
  
                      <b> Less than 15 </b> = Very Severly Underweight <br>
                      <br> </br>
                      <b> Between 15 and 16 </b> = Severly Underweight <br>
                      <br> </br>
                     <b> Between 16 and 18.5 </b> = Underweight <br>
                      <br> </br>
                      <b> Between 18.5 and 25 = Healthy Weight  </b> <br>
                      <br> </br>
                      <b> Between 25 and 30 </b> = Overweight <br>
                      <br> </br>
                      <b> Between 30 and 35 </b> = Moderately Overweight <br>
                      <br> </br>
                      <b> Between 35 and 40 </b> = Severely Overweight <br>
                      <br> </br>
                      <b> Above 40 </b> = Very Severely Overweight <br>")                
        )
      )
    )
  )
))