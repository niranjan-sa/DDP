
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(e1071)
shinyUI(fluidPage(

  # Application title
  titlePanel("Iris Data Set Manipulation Desk"),

  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
      p("Please wait for 3-4 seconds while the app loads itself completely."),
      h4("The iris data set has been loaded"),
      h5("Select train percent"),
      numericInput("id1", "Train set percentage", value = 70, min = 50, max = 85),
      actionButton("id2", "Ok"), p("Click on Ok button to partition the data set."),
      
    
      
      selectInput("id3", "Select Model: ",
                         choices = c("SVM" = "1",
                           "Decision Tree" = "2",
                           "KNN" = "3",
                           "Random Forest" = "4")),
      
      actionButton("id4", "Train and Predict"),
      
      p("This app facilitates the user to try different machine learning models on the iris data set and \
             find the results. Click on 'Train and Predict' for training your model on the data and predicting on
         the test data.")
    ),
    # Show a plot of the generated distribution
    mainPanel(
      textOutput("o1"),
      textOutput("o2"),
      textOutput("o3"),
      h4("Data Set"),
      tableOutput("o4"),
      h4("Train Status"),
      tableOutput("o5") ,
      h4("Prediction Status"),
      textOutput("o6"),
      verbatimTextOutput("o7")
    )
  )
))
