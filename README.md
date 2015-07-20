---
title: "GETTING AND CLEANING DATA - COURSE PROHECT | README FILE"
author: "Aish Varadhan"
date: "July 19, 2015"
---

This is a README file for the data cleaning and collation script 'run_analysis.R' that performs the following functions on the wearables data set that has been downloaded to the local disk based off the data from <https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>

```{r}
1. Merges the ~\test and \~train data sets in the following manner
  a. Load the ~\test\y_test.txt containing the activity identifiers
  b. Load the ~\test\subject_test.txt containing the subject identifiers
  c. Load the ~\test\X_test.txt containing the 561 vectors of measurements
  d. Merge the columns in a, b, and c to arrive at the test data set
  e. Load the ~\train\y_train.txt containing the activity identifiers
  f. Load the ~\train\subject_train.txt containing the subject identifiers
  g. Load the ~\train\X_train.txt containing the 561 vectors of measurements
  h. Merge the columns in e, f, and g to arrive at the train data set
  i. Merge the test and train data sets using rbind to arrive at a combined data set
2. Replace the Activity identifiers 
```

<http://rmarkdown.rstudio.com>.

When you click the **Knit** button a document will be generated that includes both content as well as the output of any embedded R code chunks within the document. You can embed an R code chunk like this:

```{r}
summary(cars)
```

You can also embed plots, for example:

```{r, echo=FALSE}
plot(cars)
```

Note that the `echo = FALSE` parameter was added to the code chunk to prevent printing of the R code that generated the plot.
