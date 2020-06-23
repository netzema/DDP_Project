library(shiny)
shinyServer(function(input, output) {
    model <- reactive({
        brushed_data <- brushedPoints(mtcars, input$brush1,
                                      xvar = "hp", yvar = "mpg")
        if(nrow(brushed_data) < 2){
            return (NULL)
        }
        lm(mpg ~ hp, data = brushed_data)
    })
    output$slopeOut <- renderText({
        if(is.null(model())){
            "No Model Found"
        } else {
            model()[[1]][2]
        }
    })
    output$intOut <- renderText({
        if(is.null(model())){
            "No Model Found"
        } else {
            model()[[1]][1]
        }
    })
    output$plot1 <- renderPlot({
        plot(mtcars$hp, mtcars$mpg, xlab = "Horsepower",
             ylab = "Mile per Gallon", main = "Miles per Gallon ~ Horsepower",
             cex = 1.5, pch = 16, bty = "n")
        if(!is.null(model())){
            abline(model(), col = "red", lwd = 2)
        }
    })
})