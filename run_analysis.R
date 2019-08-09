library(dplyr)

if(!file.exists('getdata_projectfiles_UCI HAR Dataset.zip')){
  Url <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'
  download.file(Url, 'getdata_projectfiles_UCI HAR Dataset.zip', method = 'curl')
}

if (!file.exists('UCI HAR Dataset')){
  unzip('getdata_projectfiles_UCI HAR Dataset.zip')
}

#Create data tables using the data from the zip file.
features <- read.table("UCI HAR Dataset/features.txt", col.names = c('n', 'functions'))
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c('code', 'activity'))
x_test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$functions)
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = 'code')
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
x_train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$functions)
y_train <-  read.table("UCI HAR Dataset/train/y_train.txt", col.names = 'code')
subject_train <-read.table("UCI HAR Dataset/train/subject_train.txt", col.names = 'subject')

#Combine all of the data tables into one table.
x <- rbind(x_train, x_test)
y <- rbind(y_train, y_test)
subject <- rbind(subject_train, subject_test)
merge <- cbind(x, y, subject)   


#Extract mean and standard deviation
extract <- merge %>% 
  select(subject, code, contains('mean'), contains('std'))

#Use descriptive activity names 
extract$code <- activity_labels[extract$code, 2]

#Label appropriately
names(extract)[2] = 'activity'
names(extract) <- gsub('Acc', 'Acclerometer', names(extract))
names(extract) <- gsub('Gyro', 'Gyroscope', names(extract))
names(extract) <- gsub('BodyBody', 'Body', names(extract))
names(extract) <- gsub('Mag', "Magnitude", names(extract))
names(extract) <- gsub('^t', 'Time', names(extract))
names(extract) <- gsub('^f', 'Frequency', names(extract))
names(extract) <- gsub('tBody', 'TimeBody', names(extract))  
names(extract) <- gsub('-mean()', 'Mean', names(extract), ignore.case = TRUE)  
names(extract) <- gsub('-std()', 'STD', names(extract), ignore.case = TRUE)  
names(extract) <- gsub('-freq()', "Frequency", names(extract), ignore.case = TRUE)  
names(extract) <- gsub('angle', 'Angle', names(extract))
names(extract) <- gsub('gravity', 'Gravity', names(extract))


#Create indepentant tidy data set for activity and subject
tidydataset <- extract %>%
  group_by(subject, activity) %>%
  summarise_all(funs(mean))
write.table(tidydataset, "tidydataset.txt", row.name = FALSE)


