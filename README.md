# GettingAndCleaningData-CourseProject
Course Project of Coursera Getting and Cleaning Data

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis

The dataset being used is: [Human Activity Recognition Using Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

## Files

The code takes for granted all the data is present in the same folder, un-compressed and without names altered.

`CodeBook.md` : a code book that describes the variables, the data, and any transformations or work performed to clean up the data.

`run_analysis.R`: script to perform analysis.

to get data, you can use the following code :
```
###############################################################################
# getting data
###############################################################################
mainDir <- getwd()
subDir <- "data"

dir.create(file.path(mainDir, subDir), showWarnings = FALSE)

url <- "http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
zipfile <- "./data/getdata-projectfiles-UCI-HAR-Dataset.zip"

download.file(url,zipfile)

unzip(zipfile, exdir="./data")

setwd("./data/UCI HAR Dataset/")
```
`averages_data.txt`: is the output of the 5th step which is uploaded in the course project's form.

