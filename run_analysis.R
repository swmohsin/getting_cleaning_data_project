run_analysis <- function()
{
// read test observations
xtest <- read.table("test/X_test.txt", header=FALSE, sep="")
// read test activities
ytest <- read.table("test/y_test.txt", header=FALSE, sep="")
// read test subjects
subject_test <- read.table("test/subject_test.txt", header=FALSE, sep="")

// read training observations
xtrain <- read.table("train/X_train.txt", header=FALSE, sep="")
// read training activities
ytrain <- read.table("train/y_train.txt", header=FALSE, sep="")
// read training subjects
subject_train <- read.table("train/subject_train.txt", header=FALSE, sep="")

// read names of the collected data
features <- read.table("features.txt")

// modify the column name of the test and train data with the names of the sensor variables
names(xtest) <- features$V2
names(xtrain) <- features$V2

// append the subject, activity, and observations for both test and training data
dftest <- data.frame(subject_test, ytest, xtest)
dftrain <- data.frame(subject_train, ytrain, xtrain)

// append training data and the test data
df = rbind(dftest, dftrain)
// update the names of the first two columns for clarity
colnames(df)[1] <- "subject"
colnames(df)[2] <- "activity"

// create another data frame with only variables that are needed for this project.
df4 <- df[,grepl("std", names(df)) | grepl("mean", names(df)) | grepl("subject", names(df)) | grepl("activity", names(df)) ]

df5 <- df4
// convert the acitivity identifier with a descriptive name
df5$activity[df5$activity=="1"] <- "WALKING"
df5$activity[df5$activity=="2"] <- "WALKING_UPSTAIRS"
df5$activity[df5$activity=="3"] <- "WALKING_DOWNSTAIRS"
df5$activity[df5$activity=="4"] <- "SITTING"
df5$activity[df5$activity=="5"] <- "STANDING"
df5$activity[df5$activity=="6"] <- "LAYING"
// create another data frame with the aggregates, grouped by subject and activity
df6 <- aggregate(df5[,3:81], list(df5$subject, df5$activity), mean)
// fix the names of the first two columns
names(df6)[1] <- "subject"
names(df6)[2] <- "activity"
// output the resultant data frame to an external data file
write.table(df6, "project.txt", row.name=FALSE)
}