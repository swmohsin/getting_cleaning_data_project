# getting_cleaning_data_project
Repository to submit project for the Getting and Cleaning Data course from Coursera

This repository contains a script file called run_analysis.R, this README.md, and a code book.

The script contains a function called run_analysis(). This function does not take any arguments and does not return any data. To run this script and get the results, the following steps should be followed:

    1. Download datat from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

    2. Extract the zip file to any folder of your choice. Make sure that you set that folder as the current working folder of your R environment. Eg. if you extracted the zip file into a folder in ~/Desktop/downloaded_data , you should issue the following command in the R application/console:
        
        setwd("~/Desktop/downloaded_data")

    The script/function assumes that test and train folders are inside your current working folder:

    test/
            subject_test.txt
            X_test.txt
            y_test.txt
    train/
            subject_train.txt
            X_train.txt
            y_train.txt

    3. Load the script into your R envirnoment, like this:
        source("FOLDER/run_analysis.R")

        Replace FOLDER above with the name of the folder path where you have placed the run_analysis.R file

    4. Run the function by issuing the following command in the R app/console.

        run_analysis()

        It should take a while before the command prompt returns, because the script/function has to load data, process it, and then output the result into a file.

        After running this function successfully, you should have a file called 'project3.txt' in your working folder.

        You can find the details of the structure of the file and the data processing in the code book.