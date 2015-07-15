library(shiny)

shinyUI(fluidPage(
  titlePanel("Basic Interest Calculator"),
  sidebarLayout(
    sidebarPanel(
      helpText("This program determines the amount of simple (non-compounding) interest 
               based on user's selected input."),            
      br(),            
      numericInput("num_prin",
                   label = h6("Enter the principal amount ($)"),
                   value = 1000),
      br(),            
      sliderInput("slider_int",
                  label = h6("Yearly interest rate (%)"),
                  min = 0, max = 15, value = 3),
      
      br(),            
      sliderInput("slider_num",
                  label = h6("Number of time periods"),
                  min = 0, max = 50, value = 10),
      selectInput("select_time",
                  label = h6(""),
                  choices = list("Years" = 1,
                                 "Quarters" = 2,
                                 "Months" =3),
                  selected = 1 
      ), 
      br(),
      br(),            
      actionButton("action_Calc", label = "Recalculate")        
      ),
    mainPanel(
      tabsetPanel(
        tabPanel("Output",
                 p(h5("User entered values:")),
                 textOutput("text_principal"),
                 textOutput("text_intrate"),
                 textOutput("text_num"),
                 textOutput("text_time"),
                 br(),
                 p(h5("Calculated values:")),
                 textOutput("text_int"),
                 textOutput("text_amt")
        ),
        tabPanel("App Documentation",
                 p(h4("Basic Interest Calculator")),
                 br(),
                 helpText("This program calculates the simple interest
                          and total amount owed, which is the sum of the principal plus the accrued interest."),
                 HTML("<u><b>Simple Interest Equation: </b></u>
                      <br> <br>
                      <b> A = P + I = P*(1 + rt) ; R = r * 100 </b>
                      <br>
                      where: <br>
                      A = Total amount owed (Principal + Interest) <br>
                      P = Principal amount ($) <br>
                      I = Interest amount ($) <br>
                      r = Rate of interest per year (decimal); r=R/100 <br>
                      t = Time period
                      ")                
                 )
                 )
                 )
                 )
                 ))