# Define server logic required to draw a histogram ----
server <- function(input, output) {

  # Download a dataset
  download.file(
    'https://raw.githubusercontent.com/crumplab/webr-chord-similarity/raw-data/main/first_order.csv',
    'first_order.csv'
  )

  # Read the data
  df_first_order = read.csv("first_order.csv")

  # Histogram of the Old Faithful Geyser Data ----
  # with requested number of bins
  # This expression that generates a histogram is wrapped in a call
  # to renderPlot to indicate that:
  #
  # 1. It is "reactive" and therefore should be automatically
  #    re-executed when inputs (input$bins) change
  # 2. Its output type is a plot
  output$distPlot <- renderPlot({

    x    <- df_first_order$C
    bins <- seq(min(x), max(x), length.out = input$bins + 1)

    hist(x, breaks = bins, col = "#75AADB", border = "white",
         xlab = "Waiting time to next eruption (in mins)",
         main = "Histogram of waiting times")

    })

}
