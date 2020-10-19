The run_analysis.R script utilizes the readLines funtion to import these data files:

features.txt
activity_labels.txt
subject_test.txt
y_test.txt
X_test.txt
subject_train.txt
y_train.txt
X_train.txt

All dataset are converted to dataframes. 

The "inner_join" function from the dplyr library is used to translate activity data into descriptive names.

The script uses the cbind function to combine subject, activity, and measured data into one dataframe (for test and train data). And then executes rbind function to combine test and train data.

The aggregate function is used to group subjects and activities and then provide the mean of the grouped measured data.