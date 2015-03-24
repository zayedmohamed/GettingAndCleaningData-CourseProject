# Summary
`run_analysis.R` script performs getting data step and the 5 steps described in the course project's definition.

1. Getting data step consists to download file from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip and unzip file to the created data folder.
2. All similar data is merged using the `rbind()` function (similar data means those files having the same number of columns and referring to the same entities).
3. Only those columns with the mean and standard deviation measures are taken into consideration. After extracting these columns, they are given the correct names, taken from `features.txt`.
4. As activity data is addressed with values 1:6, we take the activity names and IDs from `activity_labels.txt` and they are substituted in the dataset.
5. On the whole dataset, those columns with vague column names are corrected.
6. Finally, we generate a new dataset with all the average measures for each subject and activity type (30 subjects * 6 activities = 180 rows). The output file is called `averages_data.txt`, and uploaded to this repository.

# Variables

* `x_train`, `y_train`, `x_test`, `y_test`, `subject_train` and `subject_test` contain the training and test data from the downloaded files.
* training ans test data are merged to `x_data`, `y_data` and `subject_data` for further analysis.
* `features` contains the correct names for the `x_data` dataset, which are applied to the column names stored in `mean_and_std_features`, a numeric vector used to extract the desired data.
* A similar approach is taken with activity names through the `activities` variable.
* `all_data` merges `x_data`, `y_data` and `subject_data` in a big dataset.
* `averages_data` contains the relevant averages which will be later stored in `averages_data.txt` file. `ddply()` from the plyr package is used to apply `colMeans()`.
