# Project for the Coursera Class on Cleaning Data

The project for this class involved getting and cleaning data.  The data were sourced from the [UCI Machine Learning Repository] (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) [1].  The raw data can be found [here] (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).  The data includes both test and train data, which make the full data set when combined.  

The run_analysis.R completes these processing steps to transfor the input data to a tidy data set:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Here is a basic breakdown of the run_analysis.R processing:
*  The test and train data are read during the read_test_data and read_train_data functions respectively.  The read_test_data function reads the X_test, y_test, subject_test and features data sets.  The features data sets is used to label the X_test data.  Then the subject_test, y_test and X_test data are merged together using a cbind.  The subject column is labelled "subject" and the y_test column is labelled "activity."  The read_train_data follows the exact same steps for the X_train, y_train, subject_train and features data sets to create an identically shaped and ordered set of columns for the train and test data.
*  The test and train data frames are merged to complete step 1 using an rbind.  The combined data set is called "all_data"
*  The measurements regarding mean and standard deviation measurements, the subject and activity columns are selected using a regular expression to subset the desired variable names.  The subset of names is used to subset all_data to remove the unwanted columns and the resulting data frame overwrites the all_data data frame for step 2.
*  The change_activity_levels method is used to complete step 3.  This function reads the activity levels from the activity_labels text files, factors the levels of the activity column for all data, then renames the levels with the values from the activity_labels.
*  The variable names are then renamed for human readability for step 4.  The new names were dervied from the features_info text file that comes with the data that explains the naming format.  The variables are changed in the function rename_variables that renames the variables using regular expressions and the sub command.  It should be noted that these commands are in a specific order to reduce issues with overlapping names.
*  The final step (5) creates a tidy data set that takes the mean based on the activity level for each subject.  [Thoughtful Bloke's blog post](https://thoughtfulbloke.wordpress.com/2015/09/09/getting-and-cleaning-the-assignment/) was incredibly helpful in this process.  While there are a number of different ways that are suggested to complete this process, the simplest is the aggregrate command.  It is possible to compute the mean of all of the variables using the "." parameter to select all of the rest of the columns.  The subject and activity level are used to group the data.  The aggregate command is used to create a new data frame, called tidy_data, which is returned from the script.  

The script takes no input data.  It is assumed to run in a base folder to the data.  The data is expected to be unzipped and unaltered into a folder titled "UCI HAR Dataset" with all of the test and train folders inside it.  The only output from the script is the tidy_data data frame created in the final step of processing.

#Codebook for tidy_data
Can be found in the repository.  It is named "CODEBOOK.md"

# References
[1]  Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. A Public Domain Dataset for Human Activity Recognition Using Smartphones. 21th European Symposium on Artificial Neural Networks, Computational Intelligence and Machine Learning, ESANN 2013. Bruges, Belgium 24-26 April 2013.
