library(dplyr)
setwd("C:\\Users\\User\\Desktop\\Getting and Cleaning Data\\UCI HAR Dataset")

# 1. Merges the training and the test sets to create one data set.
X_train <- read.table("train\\X_train.txt")
y_train <- read.table("train\\y_train.txt")
subject_train <- read.table("train\\subject_train.txt")

X_test <- read.table("test\\X_test.txt")
y_test <- read.table("test\\y_test.txt")
subject_test <- read.table("test\\subject_test.txt")

X_combined <- rbind(X_train, X_test)

y_combined <- rbind(y_train, y_test)

subject_combined <- rbind(subject_train, subject_test)

final_data <- cbind(subject_combined, y_combined, X_combined)

colnames(final_data)[1:2] <- c("Subject", "Activity")

# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
features <- read.table("features.txt", stringsAsFactors = FALSE)
head(features)
mean_std_indices <- grep("mean\\(\\)|std\\(\\)", features[, 2])
final_data_mean_std <- final_data[, c(1, 2, mean_std_indices + 2)]

# 3. Uses descriptive activity names to name the activities in the data set
activity_labels <- read.table("activity_labels.txt", stringsAsFactors = FALSE)

final_data_mean_std$Activity <- factor(final_data_mean_std$Activity, levels = activity_labels[, 1], labels = activity_labels[, 2])

# 4. Appropriately labels the data set with descriptive variable names. 
names(final_data_mean_std) <- gsub("^t", "Time", names(final_data_mean_std))
names(final_data_mean_std) <- gsub("^f", "Frequency", names(final_data_mean_std))
names(final_data_mean_std) <- gsub("Acc", "Accelerometer", names(final_data_mean_std))
names(final_data_mean_std) <- gsub("Gyro", "Gyroscope", names(final_data_mean_std))
names(final_data_mean_std) <- gsub("Mag", "Magnitude", names(final_data_mean_std))
names(final_data_mean_std) <- gsub("BodyBody", "Body", names(final_data_mean_std))
names(final_data_mean_std) <- gsub("\\(\\)", "", names(final_data_mean_std))
names(final_data_mean_std) <- gsub("-", "_", names(final_data_mean_std))

# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

tidy_data <- group_by(final_data_mean_std, Subject, Activity)
tidy_data <- summarise(tidy_data, across(everything(), mean, na.rm = TRUE))
tidy_data <- ungroup(tidy_data)
write.csv(tidy_data, "tidy_data.csv", row.names = FALSE)
