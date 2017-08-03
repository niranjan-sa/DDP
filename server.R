
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(caret)
library(kernlab)
library(e1071)
train <- NULL
test <- NULL


shinyServer(function(input, output, session) {
  data <- iris
  
  partion <- function(p) {
    inTrain <- createDataPartition(iris$Species, p=p, list=FALSE)
    train <<- iris[inTrain,]
    test <<- iris[-inTrain,]
    
    output$o2 <- renderText({paste("Train Set contains  ", dim(train)[1], " rows")})
    output$o3 <- renderText({paste("Test Set is ", dim(test)[1], " rows")})
  }
  
  
  output$o1 <- renderText({
    input$id2
    isolate({
      partion(input$id1/100)
      paste("Data sets is loaded successfully ")
    })
  })
  
  output$o4 <- renderTable({
    input$id4
    isolate(
      head(iris[,], 5)
    )
  })
  
  
  observeEvent(input$id4, {
    
    if(input$id3 == "1") {
      mod.fit <- train(Species~., data = train, method="svmLinear")
    } else if (input$id3 == "2") {
      library(rpart)
      mod.fit <- train(Species~., data = train, method="rpart")
    } else if (input$id3 == "3") {
      mod.fit <- train(Species~., data = train, method="knn")
    } else if (input$id3 == "4") {
      library(randomForest)
      mod.fit <- train(Species~., data = train, method="rf")
    }
    
    output$o5 <- renderTable({
      mod.fit$results
    })
    
    output$o6 <- renderText({"Prediction Success check the results"})
    output$o7 <- renderPrint({
      confusionMatrix(data = predict(mod.fit, test), reference = test$Species)
    })
    
  })

})
