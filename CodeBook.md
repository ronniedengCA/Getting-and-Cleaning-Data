# Code book for run_analysis.R written on Oct 26, 2014 #
##This code book describes the variables, the data, and any transformations or work that I performed to clean up the data ##

###### Dataset uploaded as a txt file: *avrSubjectActivity.txt* with header but without row names for course project #######
Dataset is a tidy data set with the average of each variable for each activity (total 6 activitities) and each subject (total 30 subject).
* dataset has total 563 variables with subject :family:, activity :walking: :running: :couple: and 561 features
* dataset has total 180 records capture average measurement for combination of 6 activities and 30 subjects 

###### Steps of program ######
###### Step 1: load and merge dataset ######
DataSet:
* test
	1. **testSubjectData**: dataset loaded from *subject_test.txt* with 1 variable and 2947 rows without header; I defined subject variable as **subjectID**
	2. **testXData**: dataset loaded from *X_test.txt* with 561 variables and 2947 rows without header; 
	3. **testYData**: dataset loaded from *Y_test.txt* with 1 varialbe and 2947 rows without header; I defined activity variable as **activityID**
	4. **testData**: cbind dataset **testSubjectData**, **testXData**, and **testYData**, and get 563 variables and 2947 rows
* train
	1. **trainSubjectData**: dataset loaded from *subject_train.txt* with 1 varialbe and 7352 rows without header; I defined subject variable as **subjectID** as well
	2. **trainXData**: dataset loaded from *X_train.txt* with 561 variables and 7352 rows without header;
	3. **trainYData**: dataset loaded from *Y_train.txt* with 1 variable and 7352 rows without header; I defined activity variable as **activityID**
	4. **trainData**: cbind dataset **trainSubjectData**, **trainXData**, and **trainYData**, and get 563 varialbes and 7352 rows
	
* Combined test and train dataset
	1. **totalData**: rbind datset **testData** and **trainData**, and get 563 variables and 10299 rows with 561 features variable followed by subjectID and activityID	

###### Step 2: extract subset of dataset with only those measurement for mean and standard deviation ######	
DataSet:
* feature name dataset
	1. **feature**: dataset loaded from *features.txt* with 2 varialbes and 561 rows.
* mean and standard measurement dataset
	1. **meanStdData**: subset of **tatalData** with 66 variables and 10299 records
	
Variables:
* Related with dataset dimensions
	1. **numFeature**: integer, total 561 features 
	2. **featureNames**: factors, with total 477 levels. I am expecting 561 levels. Interesting thing is that some feature names are same. They are fBodyAcc-bandsEnergy()-xx,xx; fBodyAccJerk-bandsEnergy()-xx,xx and fBodyGyro-bandsEnergy()-xx,xx; each has 3 sets. But when random check the data, data are different.  I am guessing they should have X, Y and Z indicator.
	3. **meanFeatures**: Extract feature names have "mean()", which has 46 features found; Found by using grep(), it also extract meanFreq. later on meanFreq features will be removed, with 33 mean features only
	4. **meanfreqFeatures**: Extract feature names have "meanFreq", which has 13 features found.
	5. **stdFeatures**: Extract feature names have "std()", which has 33 features found
	6. **meanStdFeatures**: combined mean and std features

###### Step 3: Uses descriptive activity names to name the activities in the data set ######
DataSet:
* activityLabel dataset
	1. **activityLabels**: dataset loaded from *activity_labels.txt* with 2 varialbes and 6 rows
Variables:
* related with adding descriptive activity names
	1. **activityNames**: Character 
		*WALKING 			
		*WALKING_UPSTAIRS
		*WALKING_DOWNSTAIRS
		*SITTING
		*STANDING
		*LAYING
	2. **nrowTotalData**: 10299 rows of totalData dataset
	3. **ncolTotalData**: 563 column of totalData dataset
	
###### Step 4: Appropriately labels the data set with descriptive variable names ######	
Assign first 561 varialbes with features' names

###### Step 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.  ######
Use *aggregate()* function to get the average of each variable for each activity and each subject


 
