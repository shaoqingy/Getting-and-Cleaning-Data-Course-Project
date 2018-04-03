# 1. Merges the training and the test sets to create one data set.
# Reading trainings tables into R:
x_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")

# Reading testing tables into R:
x_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")

# Reading feature vector into R:
features <- read.table('./UCI HAR Dataset/features.txt')

# Reading activity labels into R:
activity_labels = read.table('./UCI HAR Dataset/activity_labels.txt')


# Assigning column names of training tables
colnames(x_train) <- features[,2] 
colnames(y_train) <-"activity"
colnames(subject_train) <- "subject"

# Assigning column names of testing tables
colnames(x_test) <- features[,2] 
colnames(y_test) <- "activity"
colnames(subject_test) <- "subject"

# Assigning column names of activity_labels
colnames(activity_labels) <- c('activity','activity_name')


# Merging data in one data set
merge_train <- cbind(y_train, subject_train, x_train)
merge_test <- cbind(y_test, subject_test, x_test)
merge_all <- rbind(merge_train, merge_test)

# Defining the idx for the columns with mean and std
idx_mean_and_std <- grepl("activity|subject|mean|std" , colnames(merge_all))

# Extracting only the measurements on the mean and standard deviation for each measurement.
data_mean_and_std <- merge_all[ , idx_mean_and_std]

# Uses descriptive activity names to name the activities in the data set
data_mean_and_std$activity <- factor(data_mean_and_std$activity, levels = activity_labels[, 1], labels = activity_labels[, 2])



# Appropriately labels the data set with descriptive variable names
names(data_mean_and_std)<-gsub("^t", "time", names(data_mean_and_std))
names(data_mean_and_std)<-gsub("^f", "frequency", names(data_mean_and_std))
names(data_mean_and_std)<-gsub("Acc", "Accelerometer", names(data_mean_and_std))
names(data_mean_and_std)<-gsub("Gyro", "Gyroscope", names(data_mean_and_std))
names(data_mean_and_std)<-gsub("Mag", "Magnitude", names(data_mean_and_std))
names(data_mean_and_std)<-gsub("BodyBody", "Body", names(data_mean_and_std)) # correct typo

#  creates a second, independent tidy data set with the average of each variable for each activity and each subject.
library(reshape2)
data_mean_and_std.melted <- melt(data_mean_and_std, id = c("subject", "activity"))
tidy_data <- dcast(data_mean_and_std.melted, subject + activity ~ variable, mean)

# output tidy data
write.table(tidy_data, "tidy_data.txt", row.name=FALSE)
