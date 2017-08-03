Iris Data manipulation desk
========================================================
author: Niranjan Agnihotri
date: 3rd August, 2017
autosize: true

Purpose 
========================================================
This app is designed for the user to subset the iris data set and 
train and evaluate different models and check the results to evaluate
different models.

Select the train 
========================================================
In the numeric input box, enter the percentage of the data set to be
considered as training set.
Press ok.
The data sets will be split likewise showing the number of rows for the.
test and train sets in the main panel. As follows - 


Data sets
========================================================

```r
library(caret)
head(iris, 2)
```

```
  Sepal.Length Sepal.Width Petal.Length Petal.Width Species
1          5.1         3.5          1.4         0.2  setosa
2          4.9         3.0          1.4         0.2  setosa
```

Test and train sets
========================================================

```r
inTrain <- createDataPartition(iris$Species, p=.7, list=FALSE)
train <- iris[inTrain,]
test <- iris[-inTrain,]
print(dim(train))
```

```
[1] 105   5
```

```r
print(dim(test))
```

```
[1] 45  5
```

Select the model
========================================================
From the drop down list select the model for which you 
have to train the data set. Click on 'Train and Predict' button to train the model and check the evaluation of the model on the test set.


Thank you
========================================================
