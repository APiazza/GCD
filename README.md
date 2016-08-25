# Data Science Specialization - Getting and Cleaning Data Course Project

This is the course project for the Getting and Cleaning Data course.
Prior to running the code, please download/copy all the data files to the main working directory in R. Provided that all the data is unpacked into the main directory, without the use of subfolders, the `run_analysis.R` script performs the following operations:

1. Loads all the data, including the features and activity labels
2. Consolidates the data sets
3. Extracts means and SDs
4. Converts the *activity* variable integer values to self-explanatory string values
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. This data set will be stored in *Output.txt*