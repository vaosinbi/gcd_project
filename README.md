Getting and cleaning data course project
========================================

This repo contains run_analysis.R file, which downloads Samsung Galaxy S smartphone accelerometer data
from [Human Activity Recognition Using Smartphones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones),
merges the training and the test sets to create combined data set,
extracts the measurements on the mean and standard deviation for each measurement. 

Then the script adds descriptive activity names to name the activities in the data set (based on activity_labels.txt file) , 
labels the data set with descriptive variable names based on description provided in feature_info.txt file. 

Finally, the script creates a tidy data set with the average of each variable grouped by  activity and subject and saves it to a file result.txt in project folder. 

Detailed description of feature selection and transformations is included in CodeBook.md file in this repository.

How to create dataset
---------------------------

1. Clone this repository `git clone https://github.com/vaosinbi/gcd_project.git`
2. Open  R console and set the working directory to the repository root
3. Run `source('run_analysis.R')` command
4. In repository root folder you will find result.txt file with tidy dataset.
