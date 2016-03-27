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
 - NOTE: Many of the variable names have unique values for the (X, Y, Z) directions.  The variable names are grouped for those variables with the suffix "-XYZ".  For the variable names with those suffixes, there are three variables of that name: one with the suffix of "-X", one with the suffix of "-Y" and one with the suffix of "-Z".  

###subject
The subject number for the person in the study.  
*  Class: integer
*  Levels: 1-30
*  Unit of measure: none
*  Schema: none

###activity
The activy value in the study.  
*  Class: factor
*  Levels: "WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING"
*  Unit of measure: none
*  Schema: none

###time_domain.Body_Accelerated.-mean()-XYZ
The mean of the mean of the time domain measurement of the acceleration from the body in the (X, Y, and Z) directions.  
*  Class: numeric
*  Levels: none
*  Unit of measure: none
*  Schema: This is three separate variables corresponding to the X, Y, and Z directions.

###time_domain.Body_Accelerated.-std()-XYZ
The mean of the standard deviation of the time domain measurement of the acceleration from the body in the (X, Y, and Z) directions.
*  Class: numeric
*  Levels: none
*  Unit of measure: none
*  Schema: This is three separate variables corresponding to the X, Y, and Z directions.

###time_domain.Gravity_Accelerated.-mean()-XYZ
The mean of the mean of the time domain measurement of the acceleration from gravity in the (X, Y, and Z) directions.  
*  Class: numeric
*  Levels: none
*  Unit of measure: none
*  Schema: This is three separate variables corresponding to the X, Y, and Z directions.

###time_domain.Gravity_Accelerated.-std()-XYZ
The mean of the standard deviation of the time domain measurement of the acceleration from gravity in the (X, Y, and Z) directions.
*  Class: numeric
*  Levels: none
*  Unit of measure: none
*  Schema: This is three separate variables corresponding to the X, Y, and Z directions.

###time_domain.Body_Acclerometer_Jerk_Signal.-mean()-XYZ
The mean of the mean of the time domain measurement of the Jerk signal that comes from the body-activated accelerometer motion in the (X, Y, and Z) directions.  
*  Class: numeric
*  Levels: none
*  Unit of measure: none
*  Schema: This is three separate variables corresponding to the X, Y, and Z directions.

###time_domain.Body_Acclerometer_Jerk_Signal.-std()-XYZ
The mean of the standard deviation of the time domain measurement of the Jerk signal that comes from the body-activated accelerometer motion in the (X, Y, and Z) directions.
*  Class: numeric
*  Levels: none
*  Unit of measure: none
*  Schema: This is three separate variables corresponding to the X, Y, and Z directions.

###time_domain.Body_Accelerated_Gyroscope.-mean()-XYZ
The mean of the mean of the time domain measurement of the body-activated gyroscope motion in the (X, Y, and Z) directions.  
*  Class: numeric
*  Levels: none
*  Unit of measure: none
*  Schema: This is three separate variables corresponding to the X, Y, and Z directions.

###time_domain.Body_Accelerated_Gyroscope.-std()-XYZ
The mean of the standard deviation of the time domain measurement of the body-activated gyroscope motion in the (X, Y, and Z) directions.
*  Class: numeric
*  Levels: none
*  Unit of measure: none
*  Schema: This is three separate variables corresponding to the X, Y, and Z directions.

###time_domain.Body_Gyroscope_Jerk_Signal.-mean()-XYZ
The mean of the mean of the time domain measurement of the Jerk signal that comes from the body-activated gyroscope motion in the (X, Y, and Z) directions.  
*  Class: numeric
*  Levels: none
*  Unit of measure: none
*  Schema: This is three separate variables corresponding to the X, Y, and Z directions.

###time_domain.Body_Gyroscope_Jerk_Signal.-std()-XYZ
The mean of the standard deviation of the time domain measurement of the Jerk signal that comes from the body-activated gyroscope motion in the (X, Y, and Z) directions.
*  Class: numeric
*  Levels: none
*  Unit of measure: none
*  Schema: This is three separate variables corresponding to the X, Y, and Z directions.

###time_domain.BodyAc.Magnitude.-mean()
The mean of the mean of the time domain measurement of the magnitude of the body acceleration.  
*  Class: numeric
*  Levels: none
*  Unit of measure: none
*  Schema: none

###time_domain.BodyAc.Magnitude.-std()
The mean of the standard deviation of the time domain measurement of the magnitude of the body acceleration.
*  Class: numeric
*  Levels: none
*  Unit of measure: none
*  Schema: none

###time_domain.GravityAc.Magnitude.-mean()
The mean of the mean of the time domain measurement of the magnitude of the gravity acceleration.  
*  Class: numeric
*  Levels: none
*  Unit of measure: none
*  Schema: none

###time_domain.GravityAc.Magnitude.-std()
The mean of the standard deviation of the time domain measurement of the magnitude of the gravity acceleration.
*  Class: numeric
*  Levels: none
*  Unit of measure: none
*  Schema: none

###time_domain.Body_Acclerometer_Jerk_Signal.Magnitude.-mean()
The mean of the mean of the time domain measurement of the magnitude of the Jerk signal that comes from the body-activated accelerometer motion.  
*  Class: numeric
*  Levels: none
*  Unit of measure: none
*  Schema: none

###time_domain.Body_Acclerometer_Jerk_Signal.Magnitude.-std()
The mean of the standard deviation of the time domain measurement of the magnitude of the Jerk signal that comes from the body-activated accelerometer motion.  
*  Class: numeric
*  Levels: none
*  Unit of measure: none
*  Schema: none

###time_domain.Magnitude_of_Body_Accelerated_Gyroscope.-mean()
The mean of the mean of the time domain measurement of the magnitude of the body-accelerated gyroscope.  
*  Class: numeric
*  Levels: none
*  Unit of measure: none
*  Schema: none

###time_domain.Magnitude_of_Body_Accelerated_Gyroscope.-std()
The mean of the standard deviation of the time domain measurement of the magnitude of the body-accelerated gyroscope.
*  Class: numeric
*  Levels: none
*  Unit of measure: none
*  Schema: none

###time_domain.Body_Gyroscope_Jerk_Signal.Magnitude.-mean()
The mean of the mean of the time domain measurement of the magnitude of the Jerk signal that comes from the body-activated gyroscope motion.  
*  Class: numeric
*  Levels: none
*  Unit of measure: none
*  Schema: none

###time_domain.Body_Gyroscope_Jerk_Signal.Magnitude.-std()
The mean of the standard deviation of the time domain measurement of the magnitude of the Jerk signal that comes from the body-activated gyroscope motion.  
*  Class: numeric
*  Levels: none
*  Unit of measure: none
*  Schema: none

###frequency_domain.Body_Accelerated.-mean()-XYZ
The mean of the mean of the frequency domain measurement of the acceleration from the body in the (X, Y, and Z) directions.  
*  Class: numeric
*  Levels: none
*  Unit of measure: none
*  Schema: This is three separate variables corresponding to the X, Y, and Z directions.

###frequency_domain.Body_Accelerated.-std()-XYZ
The mean of the standard deviation of the frequency domain measurement of the acceleration from the body in the (X, Y, and Z) directions.
*  Class: numeric
*  Levels: none
*  Unit of measure: none
*  Schema: This is three separate variables corresponding to the X, Y, and Z directions.

###frequency_domain.Body_Acclerometer_Jerk_Signal.-mean()-XYZ
The mean of the mean of the frequency domain measurement of the Jerk signal that comes from the body-activated accelerometer motion in the (X, Y, and Z) directions.  
*  Class: numeric
*  Levels: none
*  Unit of measure: none
*  Schema: This is three separate variables corresponding to the X, Y, and Z directions.

###frequency_domain.Body_Acclerometer_Jerk_Signal.-std()-XYZ
The mean of the standard deviation of the frequency domain measurement of the Jerk signal that comes from the body-activated accelerometer motion in the (X, Y, and Z) directions.
*  Class: numeric
*  Levels: none
*  Unit of measure: none
*  Schema: This is three separate variables corresponding to the X, Y, and Z directions.

###frequency_domain.Body_Accelerated_Gyroscope.-mean()-XYZ
The mean of the mean of the frequency domain measurement of the body-activated gyroscope motion in the (X, Y, and Z) directions.  
*  Class: numeric
*  Levels: none
*  Unit of measure: none
*  Schema: This is three separate variables corresponding to the X, Y, and Z directions.

###frequency_domain.Body_Accelerated_Gyroscope.-std()-XYZ
The mean of the standard deviation of the frequency domain measurement of the body-activated gyroscope motion in the (X, Y, and Z) directions.
*  Class: numeric
*  Levels: none
*  Unit of measure: none
*  Schema: This is three separate variables corresponding to the X, Y, and Z directions.

###frequency_domain.BodyAc.Magnitude.-mean()
The mean of the mean of the frequency domain measurement of the magnitude of the body acceleration.  
*  Class: numeric
*  Levels: none
*  Unit of measure: none
*  Schema: none

###frequency_domain.BodyAc.Magnitude.-std()
The mean of the standard deviation of the frequency domain measurement of the magnitude of the body acceleration.
*  Class: numeric
*  Levels: none
*  Unit of measure: none
*  Schema: none

###frequency_domain.Body_Accelerated.Body_Acclerometer_Jerk_Signal.Magnitude.-mean()
The mean of the mean of the frequency domain measurement of the magnitude of the Jerk signal of the body-accelerated accelerometer motion.  
*  Class: numeric
*  Levels: none
*  Unit of measure: none
*  Schema: none

###frequency_domain.Body_Accelerated.Body_Acclerometer_Jerk_Signal.Magnitude.-std()
The mean of the standard deviation of the frequency domain measurement of the magnitude of the Jerk signal of the body-accelerated accelerometer motion.  
*  Class: numeric
*  Levels: none
*  Unit of measure: none
*  Schema: none

###frequency_domain.Body_Accelerated.Magnitude_of_Body_Accelerated_Gyroscope.-mean()
The mean of the mean of the frequency domain measurement of the magnitude of the body-accelerated gyroscope motion.  
*  Class: numeric
*  Levels: none
*  Unit of measure: none
*  Schema: none

###frequency_domain.Body_Accelerated.Magnitude_of_Body_Accelerated_Gyroscope.-std()
The mean of the standard deviation of the frequency domain measurement of the magnitude of the body-accelerated gyroscope motion.
*  Class: numeric
*  Levels: none
*  Unit of measure: none
*  Schema: none

###frequency_domain.Body_Accelerated.Body_Gyroscope_Jerk_Signal.Magnitude.-mean()
The mean of the mean of the frequency domain measurement of the magnitude of the Jerk signal for body-acclerated gyroscope motion.  
*  Class: numeric
*  Levels: none
*  Unit of measure: none
*  Schema: none

###frequency_domain.Body_Accelerated.Body_Gyroscope_Jerk_Signal.Magnitude.-std()
The mean of the standard deviation of the frequency domain measurement of the magnitude of the Jerk signal for body-acclerated gyroscope motion.
*  Class: numeric
*  Levels: none
*  Unit of measure: none
*  Schema: none

##Sources
The source of the data is [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).  Information about the study can be found [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) and in this paper:

Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. A Public Domain Dataset for Human Activity Recognition Using Smartphones. 21th European Symposium on Artificial Neural Networks, Computational Intelligence and Machine Learning, ESANN 2013. Bruges, Belgium 24-26 April 2013. 
