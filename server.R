library(shiny)
library(car)    

shinyServer(function(input, output) {
  values <- reactiveValues()
  observe({
    input$action_Calc
    values$int <- isolate({
      input$num_prin * input$slider_int *
        recode(input$select_time, "1 = '1'; 2 = '0.25'; 
               3 = '1/12'")/100 * input$slider_num  
    })
    values$amt <- isolate(input$num_prin) + values$int
    })
  output$text_principal <- renderText({
    input$action_Calc
    paste("Principal amount [$]:", isolate(input$num_prin))
  })
  output$text_intrate <- renderText({
    input$action_Calc
    paste("Interest rate: ", isolate(input$slider_int), 
          " % per year")
  })
  output$text_num <- renderText({
    input$action_Calc
    paste("Time period ", isolate(input$slider_num),
          recode(isolate(input$select_time),
                 "1 = 'Years'; 2 = 'Quarters';3 = 'Months'")
    )
  })
    
  output$text_int <- renderText({
    if(input$action_Calc == 0) ""
    else
      paste("Simple Interest [$]:", values$int)
  })
  output$text_amt <- renderText({
    if(input$action_Calc == 0) ""
    else 
      paste("Total Amount Owed [$]:", values$amt)
  })
})
