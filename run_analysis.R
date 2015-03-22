library(plyr)

###############################################################################
# getting data
###############################################################################

# create data subdirectory if it doesn't exists
mainDir <- getwd()
subDir <- "data"
dir.create(file.path(mainDir, subDir), showWarnings = FALSE)

# download file from the indicated url
url <- "http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
zipfile <- "./data/getdata-projectfiles-UCI-HAR-Dataset.zip"
download.file(url,zipfile)

# unzip downloaded file to the created data folder
unzip(zipfile, exdir="./data")

# set working directory to "./data/UCI HAR Dataset/"
setwd("./data/UCI HAR Dataset/")

###############################################################################
# 1st step : Merges the training and the test sets to create one data set
###############################################################################

# get training data
x_train <- read.table("train/X_train.txt")
y_train <- read.table("train/y_train.txt")
subject_train <- read.table("train/subject_train.txt")

# get testing data
x_test <- read.table("test/X_test.txt")
y_test <- read.table("test/y_test.txt")
subject_test <- read.table("test/subject_test.txt")

# merging data
x_data <- rbind(x_train, x_test)
y_data <- rbind(y_train, y_test)
subject_data <- rbind(subject_train, subject_test)

###############################################################################
# 2nd step : Extracts only the measurements on the mean and standard deviation
#            for each measurement
###############################################################################

# read features.txt file
features <- read.table("features.txt")

# get only columns with mean() or std() in their names
mean_and_std_features <- grep("-(mean|std)\\(\\)", features[, 2])

# subset the desired columns
x_data <- x_data[, mean_and_std_features]

# correct the column names
names(x_data) <- features[mean_and_std_features, 2]

###############################################################################
# 3rd step : Uses descriptive activity names to name the activities 
#           in the data set
###############################################################################

# read activity_labels.txt file
activities <- read.table("activity_labels.txt")

# update values with correct activity names
y_data[, 1] <- activities[y_data[, 1], 2]

# correct column name
names(y_data) <- "activity"

###############################################################################
# 4th step : Appropriately labels the data set with descriptive 
#            variable names
###############################################################################

# correct column name
names(subject_data) <- "subject"

# bind all the data in a single data set
all_data <- cbind(x_data, y_data, subject_data)

###############################################################################
# 5th step : creates a second, independent tidy data set with the average 
#            of each variable for each activity and each subject 
###############################################################################

# 66 <- 68 columns but last two (activity & subject)
averages_data <- ddply(all_data, .(subject, activity), function(x) colMeans(x[, 1:66]))

# write averages_data to "averages_data.txt"
write.table(averages_data, "averages_data.txt", row.name=FALSE)
