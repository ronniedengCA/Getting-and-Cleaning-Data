# The following dataset is used for Coursera "Getting and Cleaning Data" course project only
#==================================================================
#Human Activity Recognition Using Smartphones Dataset
#Version 1.0
#==================================================================
#Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
#Smartlab - Non Linear Complex Systems Laboratory
#DITEN - Universit‡ degli Studi di Genova.
#Via Opera Pia 11A, I-16145, Genoa, Italy.
#activityrecognition@smartlab.ws
#www.smartlab.ws
==================================================================
#Acknowledge of use of this dataset in publications by referencing the following publication [1]

#[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

#This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

#Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
##################################################################################
#setwd("/Users/runhongdeng/Desktop/CourseraHomework/GettingCleaningData/")
# Program name: run_analysis.R

###########  Step 1: Merges the training and the test sets to create one data set. ######### 
#- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
#- Triaxial Angular velocity from the gyroscope. 
#- A 561-feature vector with time and frequency domain variables. ----- features.txt (33x17=561)
#- Its activity label. ----- activity_labels.txt
#- An identifier of the subject who carried out the experiment. ----- subject_test.txt (test-2947)

########## test dataset - 2947 ##########
##### combine all test data #####
testSubjectData <- read.table("./UCI HAR Dataset/test/subject_test.txt")
#head(testSubjectData)
#nrow(testSubjectData)
#ncol(testSubjectData)
#unique(testSubjectData)
names(testSubjectData)[1] <- "subjectID"
#tail(testSubjectData)

testXData <- read.table("./UCI HAR Dataset/test/X_test.txt")
#head(testXData)
#nrow(testXData)
#ncol(testXData)

testYData <- read.table("./UCI HAR Dataset/test/Y_test.txt")
#head(testYData)
#nrow(testYData)
#ncol(testYData)
#unique(testYData)
names(testYData)[1] <- "activityID"

testData <- cbind(testXData, testSubjectData, testYData)
#nrow(testData)
#ncol(testData)
#head(testData)

########## train dataset - 7352 ##########
##### combine all train data #####
trainSubjectData <- read.table("./UCI HAR Dataset/train/subject_train.txt")
#head(trainSubjectData)
#nrow(trainSubjectData)
#unique(trainSubjectData)
names(trainSubjectData)[1] <- "subjectID"
#tail(trainSubjectData)

trainXData <- read.table("./UCI HAR Dataset/train/X_train.txt")
#head(trainXData, 1)
#nrow(trainXData)
numFeature <- ncol(trainXData)

trainYData <- read.table("./UCI HAR Dataset/train/Y_train.txt")
#head(trainYData)
#nrow(trainYData)
#unique(trainYData)
names(trainYData)[1] <- "activityID"

trainData <- cbind(trainXData, trainSubjectData, trainYData)
#nrow(trainData)
#ncol(trainData)
#head(trainData)

##### combine all test and train data #####
totalData <- rbind(testData, trainData)
#nrow(totalData)
#ncol(totalData)

###########  Step 2: Extracts only the measurements on the mean and standard deviation for each measurement. ########## 
feature <- read.table("./UCI HAR Dataset/features.txt")
head(feature)
featureNames <- feature[,2]
head(featureNames)

# get all mean Features
meanFeatures <- grep("mean()",featureNames)  # for some reason, it also select meanf
meanFeatures
# get all meanFreq Features
meanfreqFeatures <- grep("meanFreq", featureNames)
meanfreqFeatures
# remove meanFreq features
meanFeatures <- meanFeatures [! meanFeatures %in% meanfreqFeatures]
meanFeatures 

# get all standard Features
stdFeatures <- grep("std()",featureNames)
stdFeatures

# get combined mean and standard features
meanStdFeatures <- c(meanFeatures,stdFeatures)
meanStdFeatures <- sort(meanStdFeatures) 
meanStdFeatures

myMeanStdVars <- paste("V", meanStdFeatures, sep="")
myMeanStdVars

# uncomment the following two lines if want to display subjectID and activity ID as well
#myMeanStdVars <- c(myMeanStdVars,"subjectID","activityID")
#myMeanStdVars

meanStdData <- totalData[,myMeanStdVars]
head(meanStdData)

###########  Step 3: Uses descriptive activity names to name the activities in the data set ########## 
activityLabels <- read.table("./UCI HAR Dataset/activity_labels.txt")
head(activityLabels)

activityNames <- as.character(activityLabels[,2])

nrowTotalData <- nrow(totalData)
ncolTotalData <- ncol(totalData)

#test <- as.character(activityLabels[1,2])
#test
head(activityNames,2)
#activityNames[2]
nrowTotalData
ncolTotalData

head(totalData,1)

for (m in 1:nrowTotalData)
{
    mActivityID <- totalData$activityID[m]
    mActivityName <- activityNames[as.numeric(mActivityID)]
    totalData$activityID[m] <- mActivityName
}

head(totalData,1)

###########  Step 4: Appropriately labels the data set with descriptive variable names. ########## 
#names(totalData)[1] <- as.character(feature[1,2])

for (n in 1:numFeature)
{
    names(totalData)[n] <- as.character(feature[n,2])
}

head(totalData,1)


###########  Step 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.  ########## 

#numFeature

avrSubjectActivity <-aggregate(totalData[,1:numFeature], by=list(subject=totalData$subjectID,activity=totalData$activityID),FUN=mean, na.rm=TRUE)
#print(aggdata)
tail(avrSubjectActivity)

###########  write dataset to a text file  ########### 
write.table(avrSubjectActivity,file="avrSubjectActivity.txt",sep="\t", row.names = F)
