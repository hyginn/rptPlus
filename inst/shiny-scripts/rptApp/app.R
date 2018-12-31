# app.R
#
# Example script for a shiny script in the rptPlus package template.
# Parts of the code inspired by the RStudio shiny tutorial script 01_hello.
#

library(shiny)

# Define UI for sample app
myUi <- fluidPage(

  titlePanel("Exploring the Central Limit Theorem"),
  sidebarLayout( position = "right",
    sidebarPanel(
      sliderInput(inputId = "histBins",
                  label = "# histogram bins:",
                  min = 1,
                  max = 50,
                  value = 30)
      , sliderInput(inputId = "bound",
                  label = "left censor bound",
                  step = 0.1,
                  min = -4,
                  max = 4,
                  value = -4)
    ),

    mainPanel(
      textOutput(outputId = "number")
      ,
      plotOutput(outputId = "hist")
    )
  )
)

# Define server logic to subject samples to large numbers of small changes,
# subject to a left-hand bound
# normalize the data, and overlay with a normal distribution.
myServer <- function(input, output) {

  output$number <- renderText({
    sprintf("Bound: %f", input$bound)
    })

  output$hist <- renderPlot({

    N <- 5000  # number of samples
    n <- 100   # number of perturbations
    x <- numeric(N)

    nTrials <- 0
    for (i in 1:N) {
      p <- input$bound - 1
      while(p < input$bound) {
        p <- cumsum(runif(n, -0.1, 0.1))[n]
        nTrials <- nTrials + 1
      }
      x[i] <- p
    }
    x <- x[! is.na(x)]

    mx <- mean(x)
    sdx <- sd(x)
    x <- (x - mx) / sdx    # normalize

    bins <- seq(min(x), max(x), length.out = input$histBins + 1)
    lim <- c(-max(c(abs(min(x)), max(x))), max(c(abs(min(x)), max(x))))

    hist(x,
         breaks = bins,
         xlim = lim,
         freq = FALSE,
         col = "palegoldenrod",
         xlab = "x",
         ylab = "frequency",
        main = sprintf("%d trials, %d perturbations; Bounded at %4.3f",
                       nTrials,
                       n,
                       (input$bound - mx)/sdx))

    x2 <- seq(lim[1], lim[2], length.out = 100)

    lines(x2, dnorm(x2), lwd = 1.5, col="firebrick")

    abline(v = (input$bound - mx)/sdx, col = "seagreen")

  })

}

shinyApp(ui = myUi, server = myServer)

# [END]
