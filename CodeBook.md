The run_analysis.R code does the following based on instruction:

1. Reads in the UCI HAR Dataset.

2. Prepares the data to be tidy. <br/>
<br/>
	features <- features.txt 561 observations of 2 variables<br/>
	activity_labels <- activity_labels.txt 6 observations of 2 variables<br/>
	x_test <- X_test.txt 2947 observations of 561 variable<br/>
	y_test <- y_test.txt 2947 observations of 1 variable<br/>
	subject_test <- subject_test.txt 2947 observations of 1 variable<br/>
	x_train <- X_train.txt 7352 observations of 561 variables<br/>
	y_train <- y_train.txt 7352 observations of 1 variable<br/>
	subject_train <- subject_train.txt 7352 observations of 1 variable<br/>
<br/>
3. Merges the training and test data into one data table. <br/>
<br/>
	x <- merges x_test and x_train — 10299 observations of 561 variables<br/>
	y <- merges y_test and y_train — 10299 observations of 1 variable<br/>
	subject <- merges subject_test and subject_train — 10299 observations of 1 variable<br/>
	merge <-  merges x, y, and subject — 10299 observations of 563 variables<br/>
<br/>
4. Extracts only the measurements on the mean and standard deviation for each measurement. <br/>
<br/>
	extract <- selects subject, code, and mean and std from the merge data — 10299 obs. Of 88 vars. <br/>
<br/>
5. Uses descriptive activity names to name the activities. <br/>
<br/>
	changes numbers in ‘code’ to be the description of the activity found in activity_lables.<br/>
<br/>
6. Appropriately labels the data set with descriptive variable names. <br/>
<br/>
	the code column -> activity<br/>
	Acc -> Accelerometer<br/>
	Gyro -> Gyroscope<br/>
	BodyBody -> Body<br/>
	Mag -> Magnitude<br/>
	columns beginning with t -> Time<br/>
	columns beginning with f -> frequency<br/>
	tBody -> TimeBody<br/>
	-mean() -> Mean<br/>
	-std() -> STD<br/>
	-freq() -> Frequency <br/>
	angle -> Angle<br/>
	gravity -> Gravity<br/>
<br/>
7. From the data set in step 6, creates a section, independent tidy data set with the average of each variable for each activity and each subject. <br/>
	<br/>
	tidydataset -> summarized by taking the average of each variable for each activity. Grouped by subject and activity	— 180 observations and 88 variables<br/>
<br/>
<br/>
(Variables may also be referred to as columns.)
