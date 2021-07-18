# Step 0 - Download and unzip the data set for Windows.
# 0.1 - Create new directory for the data set to be placed into.
if(!file.exists("data")) {
  dir.create("data")
}

# 0.2 - Download data set file from URL.
fileURL <- ("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip")
download.file(fileURL, destfile = "data/Dataset.zip")


# 0.3 - Unzip the data set file.
unzip(zipfile = "data/Dataset.zip", exdir = "data")

# Step 1 - Merge the training and the test sets to create one data set.
# 1.1 - Read the files.
# 1.1.1 - Read train table files.
X_train <- read.table("data/UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("data/UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("data/UCI HAR Dataset/train/subject_train.txt")

# 1.1.2 - Read test table files.
X_test <- read.table("Data/UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("Data/UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("Data/UCI HAR Dataset/test/subject_test.txt")

# 1.1.3 - Read feature vector file.
features <- read.table("Data/UCI HAR Dataset/features.txt")

# 1.1.4 - Read activity labels file.
activity_labels <- read.table("Data/UCI HAR Dataset/activity_labels.txt")

# 1.2 - Assign column names to training and test sets.
colnames(X_train) <- features[, 2]
colnames(y_train) <- "activityID"
colnames(subject_train) <- "subjectID"
colnames(X_test) <- features[, 2]
colnames(y_test) <- "activityID"
colnames(subject_test) <- "subjectID"
colnames(activity_labels) <- c("activityID", "activityType")

#1.3 - Merge into one data set.
mergedTrain <- cbind(y_train, subject_train, X_train)
mergedTest <- cbind(y_test, subject_test, X_test)
mergedDataset <- rbind(mergedTrain, mergedTest)

# Step 2 - Extract only the measurements on the mean and standard deviation for each measurement
# 2.1 - Read column names
columnNames <- colnames(mergedDataset)

# 2.2 - Create vector consisting of the ID, mean, and standard deviation.
mean_and_std <- (grepl("activityID", columnNames) |
  grepl("subjectID", columnNames) |
  grepl("mean..", columnNames) |
  grepl("std..", columnNames)
)

# 2.3 - Make subset of mergedDataset.
mean_and_std_mergedDataset <- mergedDataset[, mean_and_std == TRUE]

# Step 3 - Use descriptive names to name the activities in the data set.
mergedDataset2 <- merge(mean_and_std_mergedDataset, activity_labels, by = "activityID", all.x = TRUE)

# Step 4 - Appropriately label the data set with descriptive variable names.
# Already done above

# Step 5 - Create a second, independent tidy data set with the average of each variable
# for each activity and each subject.
finalDataset <- aggregate(. ~subjectID + activityID, FUN = function(x) mean(as.numeric(as.character(x))), data = mergedDataset2)
finalDataset <- finalDataset[order(finalDataset$subjectID, finalDataset$activityID),]
write.table(mergedDataset2, "finalDataset.txt", row.name = FALSE)