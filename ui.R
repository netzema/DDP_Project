library(shiny)

shinyUI(fluidPage(
    titlePanel("Visualizing mpq ~ hp"),
    sidebarLayout(
        sidebarPanel(
            h3("Slope"),
            textOutput("slopeOut"),
            h3("Intercept"),
            textOutput("intOut"),
            h3("Documentation:"),
            h4("Purpose of the Web App"),
            h5("This Web Application serves the purpose of seeing the relationship between Miles per Gallon (mpg) and Horsepower (hp)."),
            h4("Data"),
            h5("The data used for the interactive plot is from the mtcars dataset which comes preinstalled with RStudio."),
            h4("Guidance"),
            h5("You can highlight an area in the plot and you will get a linear regresson model showing the relationship between mpg and hp for the selected points. You will also get a regression line for only the selected points.")
        ),
        mainPanel(
            plotOutput("plot1", brush = brushOpts(
                id = "brush1"
            ))
        )
    )
))