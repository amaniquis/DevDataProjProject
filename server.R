library(datasets)
data(mtcars)

getSummary <- function(vec) {
    if (length(vec) > 0) {
        preds <- paste(vec, collapse='+')
        iFormula <- paste('mpg ~ ', preds, sep='')
        summary(lm(as.formula(iFormula), data=mtcars))
    } else {
        l = list("", "")
        names(l) = c("r.squared", "adj.r.squared")
        l
    }
}
shinyServer(
    function(input, output) {
        s <- reactive(getSummary(input$predictorsChkGrp))
        output$r2 <- renderPrint({s()$r.squared})
        output$ar2 <- renderPrint({s()$adj.r.squared})
    }
)
