run_analysis <- function()
{
xtest <- read.table("test/X_test.txt", header=FALSE, sep="")
ytest <- read.table("test/y_test.txt", header=FALSE, sep="")

xtrain <- read.table("train/X_train.txt", header=FALSE, sep="")
ytrain <- read.table("train/y_train.txt", header=FALSE, sep="")

subject_test <- read.table("test/subject_test.txt", header=FALSE, sep="")
subject_train <- read.table("train/subject_train.txt", header=FALSE, sep="")

features <- read.table("features.txt")
names(xtest) <- features$V2
names(xtrain) <- features$V2

dftest <- data.frame(subject_test, ytest, xtest)
dftrain <- data.frame(subject_train, ytrain, xtrain)

df = rbind(dftest, dftrain)
colnames(df)[1] <- "subject"
colnames(df)[2] <- "activity"

df4 <- df[,grepl("std", names(df)) | grepl("mean", names(df)) | grepl("subject", names(df)) | grepl("activity", names(df)) ]
df5 <- df4
df5$activity[df5$activity=="1"] <- "WALKING"
df5$activity[df5$activity=="2"] <- "WALKING_UPSTAIRS"
df5$activity[df5$activity=="3"] <- "WALKING_DOWNSTAIRS"
df5$activity[df5$activity=="4"] <- "SITTING"
df5$activity[df5$activity=="5"] <- "STANDING"
df5$activity[df5$activity=="6"] <- "LAYING"
df6 <- aggregate(df5[,3:81], list(df5$subject, df5$activity), mean)
names(df6)[1] <- "subject"
names(df6)[2] <- "activity"
write.table(df6, "project.txt", row.name=FALSE)
}