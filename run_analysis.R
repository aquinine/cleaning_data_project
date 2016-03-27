run_analysis <- function() {
        #load the needed libraries
        library(dplyr)
        library(reshape2)
        
        #read the test data
        #the function labels the column names while creating the data set
        #so that the columns are not left as V1-VN until step 4.
        test_data <- read_test_data()
        
        #read the std train data
        #the function labels the column names while creating the data set
        #so that the columns are not left as V1-VN until step 4.
        train_data <- read_train_data()
        
        #merge the test and train data using the rbind command
        all_data <- rbind(test_data, train_data)
        
        #grep off the names of the columns with mean or std, keep subject and label too
        sub_names <- names(all_data)[grepl("subject|activity|mean\\(|std\\(", names(all_data))]
        
        #now remove the unwanted columns
        #using subset, because it allows me to use the sub_names as is
        all_data <- subset(all_data, select=sub_names)
        
        #switch the numeric values in the activity column to the data in the activity
        #labels text file
        all_data <- change_activity_levels(all_data)
        
        #rename the variables to be descriptive, human readable
        all_data <- rename_variables(all_data)
        
        #create the small, tidy data set for step 5
        tidy_data <- aggregate(. ~ subject + activity, data = all_data, mean)
        
        write.table(tidy_data, "tidy_data.txt", sep = ",", 
                    row.names = TRUE, col.names=TRUE)
        
        tidy_data
        
}

read_test_data <- function() {
        #Read all of the test data sets
        subject_test_data <- read.table("UCI HAR Dataset/test/subject_test.txt", header=FALSE)
        X_test_data <- read.table("UCI HAR Dataset/test/X_test.txt", header=FALSE)
        y_test_data <- read.table("UCI HAR Dataset/test/y_test.txt", header=FALSE)
        
        #read the features to get the labels for the X_test_data
        features <- read.table("UCI HAR Dataset/features.txt", header=FALSE)
        
        #label the columns for the X_test_data
        colnames(X_test_data) <- features[,2]
        
        #label the subject data
        colnames(subject_test_data) <- "subject"
        
        #label the y label data -- keep it generic for the rbind
        colnames(y_test_data) <- "activity"
        
        #Now that the data are ready, bind the columns together to make the test data
        test_data <- cbind(subject_test_data, y_test_data, X_test_data)
        
        #return the test data
        test_data
}

read_train_data <- function() {
        #essentially the same as above but for the training data sets
        
        #Read all of the training data sets
        subject_train_data <- read.table("UCI HAR Dataset/train/subject_train.txt", header=FALSE)
        X_train_data <- read.table("UCI HAR Dataset/train/X_train.txt", header=FALSE)
        y_train_data <- read.table("UCI HAR Dataset/train/y_train.txt", header=FALSE)
        
        #read the features to get the labels for the X_train_data
        features <- read.table("UCI HAR Dataset/features.txt", header=FALSE)
        
        #label the columns for the X_train_data
        colnames(X_train_data) <- features[,2]
        
        #label the subject data
        colnames(subject_train_data) <- "subject"
        
        #label the y label data: keep it generic for the rbind
        colnames(y_train_data) <- "activity"
        
        #Now that the data are ready, bind the columns together to make the train data
        train_data <- cbind(subject_train_data, y_train_data, X_train_data)
        
        #return the train data
        train_data
}

change_activity_levels <- function(all_data) {
        #read the activity data from the file
        activity_data <- read.table("UCI HAR Dataset/activity_labels.txt", header=FALSE)
        
        #next factor the levels of the activity column that we previously created
        all_data$activity <- factor(all_data$activity)
        
        #assign the activity data values to the levels
        levels(all_data$activity) <- activity_data[,2]
        
        #return the updated all_data
        all_data
}

rename_variables <- function(all_data) {
        #change the first letter from "t"s and "f"s to time_domain and
        #frequency domain
        names(all_data) <- sub("^t", "time_domain.", names(all_data))
        names(all_data) <- sub("^f", "frequency_domain.", names(all_data))
        
        #classify the jerk signals
        names(all_data) <- sub("BodyAccJerk", "Body_Acclerometer_Jerk_Signal.", names(all_data))
        names(all_data) <- sub("BodyGyroJerk", "Body_Gyroscope_Jerk_Signal.", names(all_data))
        
        #classify the magnitude of the jerk signals
        names(all_data) <- sub("BodyGyroMag", "Magnitude_of_Body_Accelerated_Gyroscope.", names(all_data))
        names(all_data) <- sub(".Mag-", ".Magnitude.-", names(all_data))
        
        #classify the acceleration causes
        names(all_data) <- sub("BodyAcc", "Body_Accelerated.", names(all_data))
        names(all_data) <- sub("GravityAcc", "Gravity_Accelerated.", names(all_data))
        names(all_data) <- sub("BodyGyro", "Body_Accelerated_Gyroscope.", names(all_data))
        names(all_data) <- sub("BodyBody", "Body_Accelerated.Body", names(all_data))
        names(all_data) <- sub("BodyMagnitude", "Body_Accelerated.Magnitude", names(all_data))
        
        #return all data
        all_data
}