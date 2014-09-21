library(shiny)
shinyUI(pageWithSidebar(
        headerPanel("Child Height Prediction"),
        
        sidebarPanel(
                h4("Input the height of each parent:"),  
                p("Heights are recorded in inches."),
                sliderInput(inputId ="mheight", label = "Mother's Height",
                            min=48,max=90, value=60, step=.25),
                sliderInput(inputId ="fheight", label ="Father's Height",
                            min=48,max=90, value=65, step=.25),
                h5("Documentation"),
                p("This app takes the heights of parents given and outputs the estimated height of the
                 child. The heights are all in inches. To input a height, drag the respective (one for father
                  and one for mother) to the desired height in inches and the output will automatically update."),
                br(),
                p("The app then outputs the predicted adult height of their in inches and gives a 95% confidence interval
                  of the child's height. The outputs are calculated using a linear model created from
                  the Galton dataset in the UsingR Package.")
                ),
        mainPanel(
                h4("Results"),
                p("Based on the height inputs given, the child of these two parents
                  will be:"),  
                textOutput("text1"),  
                br(),
                p("There is 95% confidence that the child will be between"),  
                textOutput("text2") 
                )
)
)