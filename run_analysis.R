library(dplyr)
library(tidyr)

features <- readLines("/Data/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/features.txt")

#features_df <- as.data.frame(features)

activity_labels <- readLines("/Data/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/activity_labels.txt")

activity_labels <- as.data.frame(activity_labels)

activity_labels <- separate(activity_labels, 1, c("num","label"), sep="\\s+")

### test

x_test <- readLines("/Data/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/X_test.txt")

x_test_df <- as.data.frame(x_test)

x_test_df[,1] <- trimws(x_test_df[,1])

x_test_df2 <- separate(x_test_df, 1, features, sep="\\s+", convert = TRUE)


y_test <- readLines("/Data/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/y_test.txt")

y_test_df <- as.data.frame(y_test)

y_test_df2 <- as.data.frame(inner_join(y_test_df, activity_labels,by = c("y_test" = "num"))[,2])

colnames(y_test_df2) <- "activity"


subject_test <- readLines("/Data/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/subject_test.txt")

subject_test_df <- as.data.frame(subject_test)

colnames(subject_test_df) <- "subject"


x_test_df3 <- select(x_test_df2, contains("mean()")|contains("std()"))

x_test_df4 <- cbind(subject_test_df, y_test_df2, x_test_df3)

### train

x_train <- readLines("/Data/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/X_train.txt")

x_train_df <- as.data.frame(x_train)

x_train_df[,1] <- trimws(x_train_df[,1])

x_train_df2 <- separate(x_train_df, 1, features, sep="\\s+", convert = TRUE)


y_train <- readLines("/Data/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/y_train.txt")

y_train_df <- as.data.frame(y_train)

y_train_df2 <- as.data.frame(inner_join(y_train_df, activity_labels,by = c("y_train" = "num"))[,2])

colnames(y_train_df2) <- "activity"


subject_train <- readLines("/Data/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/subject_train.txt")

subject_train_df <- as.data.frame(subject_train)

colnames(subject_train_df) <- "subject"


x_train_df3 <- select(x_train_df2, contains("mean()")|contains("std()"))

x_train_df4 <- cbind(subject_train_df, y_train_df2, x_train_df3)

### combine

x_total <- rbind.data.frame(x_test_df4, x_train_df4)

### mean

aggregate(.~subject+activity, x_total, mean)


