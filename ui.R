#
# This is an App designed as the final project subision for the Developing Data Products in
#
#
#
library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

  # Application title
  titlePanel("selected O&L - Midstream Industry Comps"),

  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
       sliderInput("sliderX",
                   "Select Date Range (YYYY-MM-DD)",
                   min=as.Date("01/01/2010","%m/%d/%Y"),
                   max=as.Date("06/01/2017","%m/%d/%Y"),
                   value=c(as.Date("01/01/2010","%m/%d/%Y"),as.Date("06/01/2017","%m/%d/%Y"))),
       checkboxInput("ticker1", "ETP - Energy Transfer Partners", TRUE),
       checkboxInput("ticker2", "PXD - Pioneer Natural Resources", FALSE),
       checkboxInput("ticker3", "PAA - Plains All American Pipeline", FALSE),
       checkboxInput("ticker4", "KMI - Kinder Morgan Inc.", FALSE),
       checkboxInput("ticker5", "ENB - Enbridge", FALSE),
       checkboxInput("ticker6", "TRP - TC Pipelines LP", FALSE),
       checkboxInput("ticker7", "SU Suncor Energy", FALSE),
       checkboxInput("ticker8", "COP - ConocoPhillips", FALSE),
       checkboxInput("ticker9", "WMB - Williams Companies", FALSE),
       checkboxInput("ticker10", "BPL - Buckeye Partners", FALSE),
       checkboxInput("ticker11", "MPC - Marathon Petroleum Co", FALSE),
       checkboxInput("ticker12", "VLO - Valero Energy Corporation", FALSE),
       checkboxInput("ticker13", "HES - Hess Corp", FALSE),
       checkboxInput("ticker14", "TSO - Tesoro Corporation", FALSE),
       checkboxInput("ticker15", "EPD - Enterprise Products Partners", FALSE),
       submitButton("Submit")),

    # Show a plot of the generated distribution
    mainPanel(
            h3("Application Instructions"),
            h5("*** Please wait until the graph below is loaded, this may take a few seconds ***"),
            h5("1.) Please select the desired timeframe by sliding the bars to desired date"),
            h5("2.) Check only de desired Securites"),
            h5("3.) Click the Submit button"),
            plotOutput("plot1"),
            h3("Graph Start Date:"),
            textOutput("out1"),
            h3("Graph End Date:"),
            textOutput("out2")
    )
  )
))
