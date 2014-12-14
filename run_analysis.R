## download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", destfile="galaxyProject1.zip", method="curl");

## unzip("galaxyProject1.zip");

setwd("./UCI HAR Dataset");

## Has all the activity codes here

activity_labels_data <- read.table("activity_labels.txt");

setwd("./test");

## Has a file with all the activity codes (2947 obs.)

y_test_data <- read.table("y_test.txt")

# has a dataset with all the test data with the titles in the 
# ../features.txt file

x_test_data <- read.table("X_test.txt")

## has the actual subject numbers for the test set

subject_test_data <- read.table("subject_test.txt")

library("data.table")

test_table1 <- data.table(subject = subject_test_data[1:2947,1], activity_code = y_test_data[1:2947,1])

setwd("../")

# place the data titles in a table

x_test_data_titles <- read.table("features.txt")

# add the column names to the data

colnames(x_test_data) <- x_test_data_titles[,2]

test_table1 <- data.table(subject = subject_test_data[1:2947,1], activity_code = y_test_data[1:2947,1], x_test_data[1:2947,])

setwd("./train")

y_train_data <- read.table("y_train.txt")
x_train_data <- read.table("X_train.txt")
colnames(x_train_data) <- x_test_data_titles[,2]
subject_train_data <- read.table("subject_train.txt")

train_table1 <- data.table(subject = subject_train_data[1:7352,1], activity_code = y_train_data[1:7352,1], x_train_data[1:7352,])

complete_table <- rbind(test_table1, train_table1)

labeled_table <- complete_table[1:10299, c(1:2, 3:8, 43:48, 83:88, 123:128, 163:168, 203:204, 216:217, 229:230, 242:243, 255:256, 268:273, 347:352, 426:431, 505:506, 531:532, 544:545), with=FALSE]

labeled_table[, activity_code:=activity_labels_data[activity_code,2]]

labeled_table2 <- complete_table[1:10299, c(1:2, 3:8, 43:48, 83:88, 123:128, 163:168, 203:204, 216:217, 229:230, 242:243, 255:256, 268:273, 347:352, 426:431, 505:506, 531:532, 544:545), with=FALSE]

labeled_table2[, activity_code:=activity_labels_data[activity_code,2]]

columnNames <- c("subject","activity_code","timeBodyAccelerationMeanX", "timeBodyAccelerationMeanY","timeBodyAccelerationMeanZ", "timeBodyAccelerationSTDX","timeBodyAccelerationSTDY", "timeBodyAccelerationSTDZ","timeGravityAccelerationMeanX", "timeGravityAccelerationMeanY","timeGravityAccelerationMeanZ", "timeGravityAccelerationSTDX","timeGravityAccelerationSTDY", "timeGravityAccelerationSTDZ","timeBodyAccelerationJerkMeanX", "timeBodyAccelerationJerkMeanY","timeBodyAccelerationJerkMeanZ", "timeBodyAccelerationJerkSTDX", "timeBodyAccelerationJerkSTDY", "timeBodyAccelerationJerkSTDZ","timeBodyGyroscopicMeanX", "timeBodyGyroscopicMeanY","timeBodyGyroscopicMeanZ", "timeBodyGyroscopicSTDX", "timeBodyGyroscopicSTDY", "timeBodyGyroscopicSTDZ","timeBodyGyroscopicJerkMeanX", "timeBodyGyroscopicJerkMeanY","timeBodyGyroscopicJerkMeanZ", "timeBodyGyroscopicJerkSTDX","timeBodyGyroscopicJerkSTDY", "timeBodyGyroscopicJerkSTDZ","timeBodyAccelerationMagMean", "timeBodyAccelerationMagSTD","timeGravityAccelerationMagMean", "timeGravityAccelerationMagSTD","timeBodyAccelerationJerkMagMean", "timeBodyAccelerationJerkMagSTD","timeBodyGyroscopicMagMean", "timeBodyGyroscopicMagSTD","timeBodyGyroscopicJerkMagMean", "timeBodyGyroscopicJerkMagSTD","frequencyBodyAccelerationMeanX", "frequencyBodyAccelerationMeanY","frequencyBodyAccelerationMeanZ", "frequencyBodyAccelerationSTDX","frequencyBodyAccelerationSTDY", "frequencyBodyAccelerationSTDZ","frequencyBodyAccelerationJerkMeanX", "frequencyBodyAccelerationJerkMeanY","frequencyBodyAccelerationJerkMeanZ", "frequencyBodyAccelerationJerkSTDX","frequencyBodyAccelerationJerkSTDY", "frequencyBodyAccelerationJerkSTDZ","frequencyBodyGyroscopicMeanX", "frequencyBodyGyroscopicMeanY","frequencyBodyGyroscopicMeanZ", "frequencyBodyGyroscopicSTDX","frequencyBodyGyroscopicSTDY", "frequencyBodyGyroscopicSTDZ","frequencyBodyAccelerationMagMean", "frequencyBodyAccelerationMagSTD","frequencyBodyBodyGyroscopicMagMean", "frequencyBodyBodyGyroscopicMagSTD","frequencyBodyBodyGyroscopicJerkMagMean", "frequencyBodyBodyGyroscopicJerkMagSTD" )

setnames(labeled_table2, names(labeled_table2), columnNames)

finalColumnNames <- c("finalAvgTimeBodyAccelerationMeanX", "finalAvgTimeBodyAccelerationMeanY","finalAvgTimeBodyAccelerationMeanZ", "finalAvgTimeBodyAccelerationSTDX","finalAvgTimeBodyAccelerationSTDY", "finalAvgTimeBodyAccelerationSTDZ","finalAvgTimeGravityAccelerationMeanX", "finalAvgTimeGravityAccelerationMeanY","finalAvgTimeGravityAccelerationMeanZ", "finalAvgTimeGravityAccelerationSTDX","finalAvgTimeGravityAccelerationSTDY", "finalAvgTimeGravityAccelerationSTDZ","finalAvgTimeBodyAccelerationJerkMeanX", "finalAvgTimeBodyAccelerationJerkMeanY","finalAvgTimeBodyAccelerationJerkMeanZ", "finalAvgTimeBodyAccelerationJerkSTDX", "finalAvgTimeBodyAccelerationJerkSTDY", "finalAvgTimeBodyAccelerationJerkSTDZ","finalAvgTimeBodyGyroscopicMeanX", "finalAvgTimeBodyGyroscopicMeanY","finalAvgTimeBodyGyroscopicMeanZ", "finalAvgTimeBodyGyroscopicSTDX", "finalAvgTimeBodyGyroscopicSTDY", "finalAvgTimeBodyGyroscopicSTDZ","finalAvgTimeBodyGyroscopicJerkMeanX", "finalAvgTimeBodyGyroscopicJerkMeanY","finalAvgTimeBodyGyroscopicJerkMeanZ", "finalAvgTimeBodyGyroscopicJerkSTDX","finalAvgTimeBodyGyroscopicJerkSTDY", "finalAvgTimeBodyGyroscopicJerkSTDZ","finalAvgTimeBodyAccelerationMagMean", "finalAvgTimeBodyAccelerationMagSTD","finalAvgTimeGravityAccelerationMagMean", "finalAvgTimeGravityAccelerationMagSTD","finalAvgTimeBodyAccelerationJerkMagMean", "finalAvgTimeBodyAccelerationJerkMagSTD","finalAvgTimeBodyGyroscopicMagMean", "finalAvgTimeBodyGyroscopicMagSTD","finalAvgTimeBodyGyroscopicJerkMagMean", "finalAvgTimeBodyGyroscopicJerkMagSTD","finalAvgFrequencyBodyAccelerationMeanX", "finalAvgFrequencyBodyAccelerationMeanY","finalAvgFrequencyBodyAccelerationMeanZ", "finalAvgFrequencyBodyAccelerationSTDX","finalAvgFrequencyBodyAccelerationSTDY", "finalAvgFrequencyBodyAccelerationSTDZ","finalAvgFrequencyBodyAccelerationJerkMeanX", "finalAvgFrequencyBodyAccelerationJerkMeanY","finalAvgFrequencyBodyAccelerationJerkMeanZ", "finalAvgFrequencyBodyAccelerationJerkSTDX","finalAvgFrequencyBodyAccelerationJerkSTDY", "finalAvgFrequencyBodyAccelerationJerkSTDZ","finalAvgFrequencyBodyGyroscopicMeanX", "finalAvgFrequencyBodyGyroscopicMeanY","finalAvgFrequencyBodyGyroscopicMeanZ", "finalAvgFrequencyBodyGyroscopicSTDX","finalAvgFrequencyBodyGyroscopicSTDY", "finalAvgFrequencyBodyGyroscopicSTDZ","finalAvgFrequencyBodyAccelerationMagMean", "finalAvgFrequencyBodyAccelerationMagSTD","finalAvgFrequencyBodyBodyGyroscopicMagMean", "finalAvgFrequencyBodyBodyGyroscopicMagSTD","finalAvgFrequencyBodyBodyGyroscopicJerkMagMean", "finalAvgFrequencyBodyBodyGyroscopicJerkMagSTD" )

## This last line works correctly ...

finalDataSet <- labeled_table2[, list (finalTimeBodyAccelerationMeanX = mean(timeBodyAccelerationMeanX), finalTimeBodyAccelerationMeanY = mean(timeBodyAccelerationMeanY), finalTimeBodyAccelerationMeanZ = mean(timeBodyAccelerationMeanZ), finalTimeBodyAccelerationSTDX = mean(timeBodyAccelerationSTDX), finaltimeBodyAccelerationSTDY = mean(timeBodyAccelerationSTDY), 
                       finalTimeBodyAccelerationSTDZ = mean(timeBodyAccelerationSTDZ), 
                       finalTimeGravityAccelerationMeanX = mean(timeGravityAccelerationMeanX), finalTimeGravityAccelerationMeanY = mean(timeGravityAccelerationMeanY), finalTimeGravityAccelerationMeanZ = mean(timeGravityAccelerationMeanZ), finalTimeGravityAccelerationSTDX = mean(timeGravityAccelerationSTDX), finalTimeGravityAccelerationSTDY = mean(timeGravityAccelerationSTDY), 
                       finalTimeGravityAccelerationSTDZ = mean(timeGravityAccelerationSTDZ), 
                       finalTimeBodyAccelerationJerkMeanX = mean(timeBodyAccelerationJerkMeanX), 
                       finalTimeBodyAccelerationJerkMeanY = mean(timeBodyAccelerationJerkMeanY), finalTimeBodyAccelerationJerkMeanZ = mean(timeBodyAccelerationJerkMeanZ), 
                       finalTimeBodyAccelerationJerkSTDX = mean(timeBodyAccelerationJerkSTDX), 
                       finalTimeBodyAccelerationJerkSTDY = mean(timeBodyAccelerationJerkSTDY), 
                       finalTimeBodyAccelerationJerkSTDZ = mean(timeBodyAccelerationJerkSTDZ), 
                       finalTimeBodyGyroscopicMeanX = mean(timeBodyGyroscopicMeanX), 
                       finalTimeBodyGyroscopicMeanY = mean(timeBodyGyroscopicMeanY), 
                       finalTimeBodyGyroscopicMeanZ = mean(timeBodyGyroscopicMeanZ), finalTimeBodyGyroscopicSTDX = mean(timeBodyGyroscopicSTDX), finalTimeBodyGyroscopicSTDY = mean(timeBodyGyroscopicSTDY), finalTimeBodyGyroscopicSTDZ = mean(timeBodyGyroscopicSTDZ), 
                       finalTimeBodyGyroscopicJerkMeanX = mean(timeBodyGyroscopicJerkMeanX), 
                       finalTimeBodyGyroscopicJerkMeanY = mean(timeBodyGyroscopicJerkMeanY), finalTimeBodyGyroscopicJerkMeanZ = mean(timeBodyGyroscopicJerkMeanZ), 
                       finalTimeBodyGyroscopicJerkSTDX = mean(timeBodyGyroscopicJerkSTDX), 
                       finalTimeBodyGyroscopicJerkSTDY = mean(timeBodyGyroscopicJerkSTDY), 
                       finalTimeBodyGyroscopicJerkSTDZ = mean(timeBodyGyroscopicJerkSTDZ), 
                       finalTimeBodyAccelerationMagMean = mean(timeBodyAccelerationMagMean), 
                       finalTimeBodyAccelerationMagSTD = mean(timeBodyAccelerationMagSTD), 
                       finalTimeGravityAccelerationMagMean = mean(timeGravityAccelerationMagMean), 
                       finalTimeGravityAccelerationMagSTD = mean(timeGravityAccelerationMagSTD), 
                       finalTimeBodyAccelerationJerkMagMean = mean(timeBodyAccelerationJerkMagMean), 
                       finalTimeBodyAccelerationJerkMagSTD = mean(timeBodyAccelerationJerkMagSTD), 
                       finalTimeBodyGyroscopicMagMean = mean(timeBodyGyroscopicMagMean),finalTimeBodyGyroscopicMagSTD = mean(timeBodyGyroscopicMagSTD), 
                       finalTimeBodyGyroscopicJerkMagMean = mean(timeBodyGyroscopicJerkMagMean), 
                       finalTimeBodyGyroscopicJerkMagSTD = mean(timeBodyGyroscopicJerkMagSTD), 
                       finalFrequencyBodyAccelerationMeanX = mean(frequencyBodyAccelerationMeanX), 
                       finalFrequencyBodyAccelerationMeanY = mean(frequencyBodyAccelerationMeanY), 
                       finalFrequencyBodyAccelerationMeanZ = mean(frequencyBodyAccelerationMeanZ), 
                       finalFrequencyBodyAccelerationSTDX = mean(frequencyBodyAccelerationSTDX), 
                       finalFrequencyBodyAccelerationSTDY = mean(frequencyBodyAccelerationSTDY), 
                       finalFrequencyBodyAccelerationSTDZ = mean(frequencyBodyAccelerationSTDZ), 
                       finalFrequencyBodyAccelerationJerkMeanX = mean(frequencyBodyAccelerationJerkMeanX), 
                       finalFrequencyBodyAccelerationJerkMeanY = mean(frequencyBodyAccelerationJerkMeanY),finalFrequencyBodyAccelerationJerkMeanZ = mean(frequencyBodyAccelerationJerkMeanZ), 
                       finalFrequencyBodyAccelerationJerkSTDX = mean(frequencyBodyAccelerationJerkSTDX), 
                       finalFrequencyBodyAccelerationJerkSTDY = mean(frequencyBodyAccelerationJerkSTDY), 
                       finalFrequencyBodyAccelerationJerkSTDZ = mean(frequencyBodyAccelerationJerkSTDZ), 
                       finalFrequencyBodyGyroscopicMeanX = mean(frequencyBodyGyroscopicMeanX), 
                       finalFrequencyBodyGyroscopicMeanY = mean(frequencyBodyGyroscopicMeanY), 
                       finalFrequencyBodyGyroscopicMeanZ = mean(frequencyBodyGyroscopicMeanZ), 
                       finalFrequencyBodyGyroscopicSTDX = mean(frequencyBodyGyroscopicSTDX), 
                       finalFrequencyBodyGyroscopicSTDY = mean(frequencyBodyGyroscopicSTDY), 
                       finalFrequencyBodyGyroscopicSTDZ = mean(frequencyBodyGyroscopicSTDZ), 
                       finalFrequencyBodyAccelerationMagMean = mean(frequencyBodyAccelerationMagMean),finalFrequencyBodyAccelerationMagSTD = mean(frequencyBodyAccelerationMagSTD), 
                       finalFrequencyBodyBodyGyroscopicMagMean = mean(frequencyBodyBodyGyroscopicMagMean), 
                       finalFrequencyBodyBodyGyroscopicMagSTD = mean(frequencyBodyBodyGyroscopicMagSTD), 
                       finalFrequencyBodyBodyGyroscopicJerkMagMean = mean(frequencyBodyBodyGyroscopicJerkMagMean), finalFrequencyBodyBodyGyroscopicJerkMagSTD =  mean(frequencyBodyBodyGyroscopicJerkMagSTD)
), by = list(activity_code, subject)]
