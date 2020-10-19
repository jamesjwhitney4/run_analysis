# a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md

The items included in the "features.txt" are utilized to provide variable names for the test (X_test.txt) and train (X_train.txt) datasets.

The activity data (WALKING, SITTING, etc) contained in the y_test.txt and y_train.txt files is translated to descriptive names contained the "activity_labels.txt" file.

The subject (subject_test.txt and subject_train.txt) and activity datasets are then combined with the test and train datasets (with variable names "subject" and "activity" respectively). 

The mean and standard deviation data is extracted from the test and train datasets and then these datasets are (row )  combined into one dataset.

Finally, the merged dataset is aggregated by subject and activity to provide the mean of the data per each subject and activty group. 
