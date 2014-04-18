Getting and Cleaning Data Project
========================================================

This folder contains all the data downloaded from: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
as well as three other files:

- This readme
- the R script run_analysis.R
- the tidy.txt with the final tidy dataset

In order to obtain the same result, you have to be in the directory where this readme is:
```{r}
setwd("./")
```
Then run the script:
```{r}
source('./run_analysis.R')
```
This script does the following:
- Merges the training and the test sets to create one data set.
    
- Extracts only the measurements on the mean and standard deviation for each measurement. 
    
- Uses descriptive activity names to name the activities in the data set
    
- Appropriately labels the data set with descriptive activity names. 
    
- Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

