# Getting_and_cleaning_data
run-analysis.R does the following:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive activity names.
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

##Action
1. Extracting the data from the given dataset
2. Extracting the measurements
    1. extracting the features from the features.txt 
    2. Creating a features column
    3. finding mean and standard deviation values from the features
3. Descriptive activity
    Extracting the 6 six activities
4. Giving descriptive names to the columns
5. Joining the columns to form a tidy set
    1. average of each variable for each activity and subject
    2. column name for the tidy dataset
Writing to a csv file
Converting to a .txt file