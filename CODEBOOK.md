---
title: "Codebook for tidy_data"
author: "Heather Quinn"
date: "3/27/2016"
output:
  html_document:
    keep_md: yes
---

## Project Description
The project for this class involved getting and cleaning data.  The information for getting the data and running the script can be found in the README.md.  For more information about the raw data, information can be found in the readme and features_info files in the data set.

###Notes on the original (raw) data 
The original data set is a combination of files, including 
* UCI HAR Dataset/activity_labels.txt
* UCI HAR Dataset/features.txt
* UCI HAR Dataset/test/X_test.txt
* UCI HAR Dataset/test/y_test.txt
* UCI HAR Dataset/test/subject_test.txt
* UCI HAR Dataset/train/X_train.txt
* UCI HAR Dataset/train/y_train.txt
* UCI HAR Dataset/train/subject_train.txt

##Creating the tidy datafile
The run_analysis.R script will combine these files and transform them into the tidy_data data frame, which has the mean of all of the variables as based on subject and activity.

###Guide to create the tidy data file
1.  Download run_analysis.R
2.  Download [the data](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
3.  Unzip the data into the same folder as run_analysis.R
4.  Source run_analysis.R in R.
5.  Create the tidy_data data set using this command: tidy_data <- run_analysis()

###Cleaning of the data
The test and training data are merged to combine the data.  The unneeded columns are removed.  The actvity labels are added to the columns.  The variables names are transformed into human readable values.  The tidy data set is the mean of all of the variables as grouped by subject and activity. [More information is in the README.md](https://github.com/aquinine/cleaning_data_project/blob/master/README.md)

##Description of the variables in the tiny_data.txt file
Basics of the tidy_data.txt file:
 - The data set has 68 variables and 180 observations.
 - The data include the average of 66 of the variables from the original data set that were grouped by the remaining two variables (subject, activity)

(you can easily use Rcode for this, just load the dataset and provide the information directly form the tidy data file)

###Variable 1 (repeat this section for all variables in the dataset)
Short description of what the variable describes.

Some information on the variable including:
 - Class of the variable
 - Unique values/levels of the variable
 - Unit of measurement (if no unit of measurement list this as well)
 - In case names follow some schema, describe how entries were constructed (for example time-body-gyroscope-z has 4 levels of descriptors. Describe these 4 levels). 

(you can easily use Rcode for this, just load the dataset and provide the information directly form the tidy data file)

####Notes on variable 1:
If available, some additional notes on the variable not covered elsewehere. If no notes are present leave this section out.

##Sources
Sources you used if any, otherise leave out.

##Annex
If you used any code in the codebook that had the echo=FALSE attribute post this here (make sure you set the results parameter to 'hide' as you do not want the results to show again)
