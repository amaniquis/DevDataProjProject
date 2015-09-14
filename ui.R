shinyUI(pageWithSidebar(
    headerPanel("Best MPG Predictors"),
    sidebarPanel(
        checkboxGroupInput("predictorsChkGrp",
                           label = h4("Predictors"),
                           choices = list("Number of Cylinders" = "cyl", 
                                          "Displacement (cu. in.)" = "disp",
                                          "Gross Horsepower" = "hp",
                                          "Rear Axle Ratio" = "drat",
                                          "Weight (lb/1000)" = "wt",
                                          "1/4 Mile Time" = "qsec",
                                          "V/S" = "vs",
                                          "Transmission" = "am",
                                          "Number of Forward Gears" = "gear",
                                          "Number of Carburetors" = "carb")
        )
    ),
    mainPanel(
        h4("Instructions"),
        p("Click on a set of predictors on the left to view their effect on 
          R-squared and adjusted R-squared when fitting a linear model with MPG
          as the response against your chosen predictors using the mtcars
          dataset. Typically, the higher the adjusted R-squared, the better the
          predictors." ),
        h4('R-squared'),
        verbatimTextOutput("r2"),
        h4('Adjusted R-squared'),
        verbatimTextOutput("ar2")
    )
))

