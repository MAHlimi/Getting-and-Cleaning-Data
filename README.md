## Getting and Cleaning Data - Course Project
Project for **Getting and Cleaning Data** course on [Coursera](https://www.coursera.org).

More details about the course available [here](https://www.coursera.org/course/getdata).

## Project Context
One of the most exciting areas in all of data science right now is wearable computing - see for example [this article](http://www.insideactivitytracking.com/data-science-activity-tracking-and-the-battle-for-the-worlds-top-sports-brand/).
Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users.

The data linked to from the course website represent data collected from the Samsung Galaxy S smartphone's accelerometers.

A full description is available [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) 

## Project Description
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project.
You will be required to submit:
 1. a tidy data set as described below,
 2. a link to a Github repository with your script for performing the analysis, and
 3. a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md.

You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.

You should create one R script called `run_analysis.R` that does the following. 
 1. Merges the training and the test sets to create one data set.
 2. Extracts only the measurements on the mean and standard deviation for each measurement.
 3. Uses descriptive activity names to name the activities in the data set.
 4. Appropriately labels the data set with descriptive activity names.
 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

## Getting started
Please follow the next steps in order:
 1. Create a new folder, for consiceness, we will call it "WD" (Working Directory)
 2. Download the dataset [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) and place it in the "WD"
 3. Unzip the zip file, this step will produce a folder named "UCI HAR Dataset"
 4. Put the R script `run_analysis.R` in the "WD"
 5. Open `run_analysis.R` and replace the parameter of the `setwd` function by the full path to "WD"
 6. Run the script `run_analysis.R`.

## Outputs
 * Tidy dataset file in long form [UCI_HAR_TIDY_DATASET.csv](https://github.com/MAHlimi/Getting-and-Cleaning-Data/blob/master/HAR_TIDY_DATASET.csv)
 * Codebook file [CodeBook.md](https://github.com/MAHlimi/Getting-and-Cleaning-Data/blob/master/CodeBook.md)


## Licence
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
