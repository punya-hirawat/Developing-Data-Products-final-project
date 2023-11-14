library(shiny)
library(htmlwidgets)
shinyServer(function(input, output) {
  values = reactiveValues()
  # Calculating the bmi    
  observe({
    input$action_Calc
    if(input$select_measure==1)
    {
      values$bmi = isolate({
        input$num_weight / ((input$num_height/100) *(input$num_height/100))
      })
    }
    else
    {
      values$bmi = isolate({
        input$num_weight / (input$num_height *input$num_height)*703
      })
    }
  })
  
  # Display values entered
  output$text_weight = renderText({
    input$action_Calc
    paste("Weight: ", isolate(input$num_weight))
  })
  
  output$text_height = renderText({
    input$action_Calc
    paste("Height: ", isolate(input$num_height))
  })
  
  
  output$text_bmi = renderText({
    if(input$action_Calc == 0) ""
    else 
      paste("Your BMI is: ", values$bmi)
  })
  
  output$text_category = renderText({
    if(values$bmi <= 15) paste("You are Very Severely Underweight")
    else if(values$bmi > 15 & values$bmi <= 16) paste("You are Severely Underweight")
    else if(values$bmi > 16 & values$bmi <= 18.5) paste("You are Underweight")
    else if(values$bmi > 18.5 & values$bmi <= 25) paste("You are at a Healthy weight")
    else if(values$bmi > 25 & values$bmi <= 30) paste("You are Overweight")
    else if(values$bmi > 30 & values$bmi <= 35) paste("You are Moderately Overweight")
    else if(values$bmi > 35 & values$bmi <= 40) paste("You are Severely Overweight")
    else paste("You are Obese")
  })
  
})
