library(shiny)
library(UsingR)

shinyServer(function(input, output){
        newdata <- reactive(data.frame(parent=(((input$mheight*1.08)+input$fheight)/2)))
        dataset <- galton
        fit <- lm(child ~ parent, data=dataset)
        height1 <- reactive(paste(round(predict(fit, newdata(), interval = "confidence")[1],2),
                         " inches tall"))
        confint1 <- reactive(paste(round(predict(fit, newdata(), interval = "confidence")[2],2),
                                " and ",round(predict(fit, newdata(), interval = "confidence")[3],2),
                                " inches tall."))
        output$text1 <- renderText({height1()})
        output$text2 <- renderText({confint1()})
})
