run_analysis <- function(){
    
    library(plyr)
    
    #Read test and train data
    testData <- read.table("UCI HAR Dataset/test/X_test.txt")
    testActLabels <- read.table("UCI HAR Dataset/test/y_test.txt")
    testSubLabels <- read.table("UCI HAR Dataset/test/subject_test.txt")
    trainData <- read.table("UCI HAR Dataset/train/X_train.txt")
    trainActLabels <- read.table("UCI HAR Dataset/train/y_train.txt")
    trainSubLabels <- read.table("UCI HAR Dataset/train/subject_train.txt")
    
    #Read in variable labels and activity labels
    varLabels <- read.table("UCI HAR Dataset/features.txt")
    actLabels <- read.table("UCI HAR Dataset/activity_labels.txt")
    
    #Add column names to the data sets
    colnames(testData) <- varLabels[,2]
    colnames(trainData) <- varLabels[,2]
    
    #Add activity data to data sets
    testData <- cbind(activity = testActLabels[,1],testData)
    trainData <- cbind(activity = trainActLabels[,1],trainData)

    #Add subject labels to data sets
    testData <- cbind(subject = testSubLabels[,1],testData)
    trainData <- cbind(subject = trainSubLabels[,1],trainData)
    
    #Merge data sets
    mergeData <- rbind(testData, trainData)
    
    #Extract measurements on mean and standard deviation
    meanstdData <- mergeData[,grepl("mean\\(\\)|std\\(\\)|activity|subject",colnames(mergeData))]
    
    #Calculate average of each variable by subject and activity
    avgData <- ddply(meanstdData,.(subject,activity),colMeans)
    
    #Give activity variable descriptive names
    avgData$activity <- as.factor(avgData$activity)
    levels(avgData$activity) <- actLabels[,2]
    
    #Write data to a table
    write.table(avgData, file = "AvgHARData.txt", row.names = FALSE, quote = FALSE)
    
}